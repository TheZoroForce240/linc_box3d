package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.FlxCamera;
import flixel.graphics.FlxGraphic;
import flixel.system.FlxAssets;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.util.FlxGradient;
import openfl.geom.Rectangle;
import openfl.utils.Assets;
import openfl.geom.Vector3D;

import foxlite.FoxScene;
import foxlite.FoxCache;
import foxlite.FoxModel;
import foxlite.extras.FoxFPSCamera;
import foxlite.renderer.FoxRenderer;
import foxlite.loaders.FoxLoaderUtil;
import foxlite.loaders.FoxGLTFLoader;
import foxlite.FoxShader;
import foxlite.mesh.FoxQuadMesh;
import foxlite.mesh.FoxCubeMesh;
import foxlite.material.FoxMaterial;
import foxlite.texture.FoxTexture;
import foxlite.math.FoxMathUtil;
import foxlite.flixel.FoxRenderMetrics;
import foxlite.FoxInstancedModel;
import foxlite.instancing.FoxInstanceUpdateMode;
import foxlite.mesh.buffer.FoxVertexBufferType;
import lime.utils.Float32Array;
import lime.utils.UInt16Array;

import box3d.Box3D;
using box3d.Box3DUtil;

using StringTools;

class PlayState extends FlxState
{
	var scene:FoxScene;
	var cam:FoxFPSCamera;
	var camOther = new FlxCamera();

	var worldId:B3WorldId;
	var physicsObjectIds:Array<B3BodyId> = [];
	var cubeCount:Int = 10000;
	var useInstancing:Bool = true;
	var physicsObjects:Array<FoxModel> = [];
	var cubeInstanced:FoxInstancedModel;
	var useUserDataForNonInstanced:Bool = true;

	override public function create()
	{
		super.create();

		var worldDef:B3WorldDef = Box3D.defaultWorldDef();
		worldDef.gravity.y = -10;
		//worldDef.frictionCallback = cpp.Function.fromStaticFunction(PlayState.frictionCallback);
		worldDef.workerCount = 1;
		worldId = Box3D.createWorld(worldDef);

		

		FoxRenderer.initLibs();
		FoxRenderer.preserveGLBufferData = true;
		scene = new FoxScene(FlxG.width, FlxG.height);
		scene.scrollFactor.set(0, 0);
		cam = new FoxFPSCamera();
		scene.foxCameras.push(cam);

		cam.enableControls = true;
		cam.bgColor = 0xFF8CE9DB;

		var unshader = FoxShader.fromAsset("foxlite/minimal");
		var floorBitmap = Assets.getBitmapData("assets/images/image-6.png");
		var floorTexture = FoxTexture.wrap(floorBitmap);
		var floorMat = FoxMaterial.create(unshader, ["bitmap" => floorTexture]);

		{
			var mesh = new FoxCubeMesh(20, 1, 20, floorMat);

			var floor = new FoxModel();
			floor.addMesh(mesh);
			floor.position.y -= 3;
			scene.add(floor);

			var groundBodyDef:B3BodyDef = Box3D.defaultBodyDef();
			groundBodyDef.position.x = floor.position.x;
			groundBodyDef.position.y = floor.position.y;
			groundBodyDef.position.z = floor.position.z;

			var groundId:B3BodyId = Box3D.createBody(worldId, groundBodyDef);

			var groundBox:B3BoxHull = Box3D.makeBoxHull(10, 0.5, 10); //half size
			var groundShapeDef:B3ShapeDef = Box3D.defaultShapeDef();
			Box3D.createHullShape(groundId, groundShapeDef, groundBox.base.toPointer());
		}

		{
			var data = FoxGLTFLoader.loadBinary("models/test.glb");
			for (d in data.scenes) {
				scene.add(d);
				for (o in d.members) {
					var model:FoxModel = cast o;
					if (model == null) continue;
					for (mesh in model.meshes) {
						var vb = mesh.buffers[FoxVertexBufferType.VERTICES];
						var ib = mesh.buffers[FoxVertexBufferType.INDICES];
						var vertices:Float32Array = vb.data;
						var indices:UInt16Array = ib.data;
						//trace(vertices.length, indices.length);

						var vertCount = Std.int(vertices.length / 3);
						var triCount = Std.int(indices.length / 3);
						var vertexArr = B3Vec3.allocNativeArray(vertCount); //box3d creates a copy right after, and these are allocated with gc so shouldnt worry about deleting them?
						var indexArr = Box3DUtil.allocNativeIntArray(indices.length);
						for (i in 0...vertCount) {
							var index = i * 3;
							vertexArr[i].x = vertices[index + 0];
							vertexArr[i].y = vertices[index + 1];
							vertexArr[i].z = vertices[index + 2];
						}
						for (i in 0...indices.length) {
							indexArr[i] = indices[i];
						}

						var def = new B3MeshDef();
						def.vertices = cast vertexArr;
						def.vertexCount = vertCount;
						def.indices = cast indexArr;
						def.triangleCount = triCount;
						def.weldVertices  = true;
						def.identifyEdges = true;

						//ideally should store this for later to use destroyMesh, but I think destroyWorld auto handles this for now?
						var meshData:cpp.RawPointer<B3MeshDataNative> = Box3D.createMesh(def, null, 0);
						if (meshData == null) {
							trace("failed to create box3d mesh");
							continue;
						}

						var bodyDef:B3BodyDef = Box3D.defaultBodyDef();
						bodyDef.position.x = model.position.x;
						bodyDef.position.y = model.position.y;
						bodyDef.position.z = model.position.z;
						var scale = new B3Vec3();
						scale.x = model.scale.x;
						scale.y = model.scale.y;
						scale.z = model.scale.z;

						var bodyId:B3BodyId = Box3D.createBody(worldId, bodyDef);
						var shapeDef:B3ShapeDef = Box3D.defaultShapeDef();
						var shapeId = Box3D.createMeshShape(bodyId, shapeDef, meshData, scale);
					}
				}
			}
		}

		if (useInstancing)
		{
			var mesh = new FoxCubeMesh(1, 1, 1, floorMat);
			cubeInstanced = new FoxInstancedModel(cubeCount);
			cubeInstanced.addMesh(mesh);
			cubeInstanced.updateMode = FoxInstanceUpdateMode.ALL;
			scene.add(cubeInstanced);

			var bodyDef:B3BodyDef = Box3D.defaultBodyDef();
			bodyDef.type = B3BodyType.dynamicBody;

			var dynamicBox:B3BoxHull = Box3D.makeCubeHull(0.5); //half size
			var shapeDef:B3ShapeDef = Box3D.defaultShapeDef();
			shapeDef.density = 1.0;
			shapeDef.baseMaterial.friction = 0.3;

			for (i in 0...cubeCount) {
				var pos = new Vector3D(FlxG.random.float(-8, 8), i+30, FlxG.random.float(-8, 8));
				cubeInstanced.setInstanceTransformSeparate(i, pos, new Vector3D(0, 0, 0), new Vector3D(1, 1, 1));

				
				bodyDef.position.x = pos.x;
				bodyDef.position.y = pos.y;
				bodyDef.position.z = pos.z;
				var bodyId:B3BodyId = Box3D.createBody(worldId, bodyDef);
				physicsObjectIds.push(bodyId);

				Box3D.createHullShape(bodyId, shapeDef, dynamicBox.base.toPointer());
			}
		}

		if (!useInstancing) {
			function createCube(x, y, z) {
				var mesh = new FoxCubeMesh(1, 1, 1, floorMat);

				var cube = new FoxModel();
				cube.addMesh(mesh);
				cube.position.x = x;
				cube.position.y = y;
				cube.position.z = z;
				scene.add(cube);
				physicsObjects.push(cube);

				var bodyDef:B3BodyDef = Box3D.defaultBodyDef();
				bodyDef.type = B3BodyType.dynamicBody;
				bodyDef.position.x = cube.position.x;
				bodyDef.position.y = cube.position.y;
				bodyDef.position.z = cube.position.z;
				if (useUserDataForNonInstanced) {
					bodyDef.userData = cube.toHxVoidPointer(); //from Box3DUtil, attach a pointer of the foxmodel into user data to get later
				}
				var bodyId:B3BodyId = Box3D.createBody(worldId, bodyDef);
				physicsObjectIds.push(bodyId);

				var dynamicBox:B3BoxHull = Box3D.makeCubeHull(0.5);
				var shapeDef:B3ShapeDef = Box3D.defaultShapeDef();
				shapeDef.density = 1.0;
				shapeDef.baseMaterial.friction = 0.3;
				Box3D.createHullShape(bodyId, shapeDef, dynamicBox.base.toPointer());
			}
			for (i in 0...cubeCount) {
				createCube(FlxG.random.float(-8, 8), i+30, FlxG.random.float(-8, 8));
			}
		}


		add(scene);

		camOther.width = FlxG.width;
		camOther.height = FlxG.height;
		camOther.bgColor = 0x0;
		FlxG.cameras.add(camOther, false);

		var met = new FoxRenderMetrics();
		met.y = 360;
		met.camera = camOther;
		add(met);

		var vec:B3Vec3 = new B3Vec3();
		vec.x = 5;
		trace(vec.x, vec.y);

	}

	override public function update(elapsed:Float) {
		super.update(elapsed);
		Box3D.world_Step(worldId, 1 / 60, 2);

		if (!useInstancing) {
			for (i in 0...physicsObjectIds.length) {
				var bodyId = physicsObjectIds[i];
				if (Box3D.body_GetType(bodyId) == B3BodyType.dynamicBody) {

					var model = physicsObjects[i];
					if (useUserDataForNonInstanced) {
						var modelRawPtr:cpp.RawPointer<Void> = Box3D.body_GetUserData(bodyId);
						if (modelRawPtr != null) {
							model = cast modelRawPtr.toHxDynamic(); //from Box3DUtil
						}
					}
					if (model == null) {
						continue;
					}

					var position = Box3D.body_GetPosition(bodyId);
					var rotation = Box3D.body_GetRotation(bodyId);
					model.position.x = position.x;
					model.position.y = position.y;
					model.position.z = position.z;

					var quat = new Vector3D(rotation.v.x, rotation.v.y, rotation.v.z, rotation.s);
					model.rotation = FoxMathUtil.eulerFromQuaternion(quat);
				}
			}
		} else {
			for (i in 0...physicsObjectIds.length) {
				var bodyId = physicsObjectIds[i];
				var position = Box3D.body_GetPosition(bodyId);
				var rotation = Box3D.body_GetRotation(bodyId);

				var quat = new Vector3D(rotation.v.x, rotation.v.y, rotation.v.z, -rotation.s);
				cubeInstanced.setInstanceTransformSeparate(i, new Vector3D(position.x, position.y, position.z), FoxMathUtil.eulerFromQuaternion(quat), new Vector3D(1, 1, 1));			
			}
		}

		if (FlxG.keys.justPressed.F5) FlxG.resetState();
	}

	override public function destroy()
	{
		FoxCache.instance.freeResources();
		Box3D.destroyWorld(worldId);
		super.destroy();
	}

	public static function frictionCallback(frictionA:cpp.Float32, materialA:cpp.UInt64, frictionB:cpp.Float32, materialB:cpp.UInt64):cpp.Float32 {
		//trace("yea");
		return Math.sqrt(frictionA * frictionB); //should be same as original, just to show it works
	}
}
