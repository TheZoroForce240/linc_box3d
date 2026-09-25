package box3d;

/*

Some type quirks:

//You should always specifiy the type if possible, B3WorldDef is an abstract and will auto cast when needed
//It can also be stored in arrays like this (due to casting to being a B3WorldDefStruct/cpp.struct<b3WorldDef> underneath)
var worldDef:B3WorldDef = Box3D.defaultWorldDef();
worldDef.gravity.y = -10;
worldId = Box3D.createWorld(worldDef);

//if you did this worldDef will be B3WorldDefNative and can't auto cast or be stored in arrays, this can sometimes be useful for temp variables as they will be stack allocated
var worldDef = Box3D.defaultWorldDef();
worldDef.gravity.y = -10;
worldId = Box3D.createWorld(worldDef.toPointer()); //you also need to manually cast into a pointer using this function whenever needed

//theres a few cases where you may still need to manually cast due to a members still being native
Box3D.createHullShape(bodyId, shapeDef, boxHull.base.toPointer());

//Callbacks can only be created using cpp.Function.fromStaticFunction and only work on static functions
worldDef.frictionCallback = cpp.Function.fromStaticFunction(PlayState.frictionCallback);

*/

@:keep @:structAccess @:include("linc_box3d.h") @:native("b3Vec3")
extern class B3Vec3Native {
	public var x:cpp.Float32;
	public var y:cpp.Float32;
	public var z:cpp.Float32;
	public inline function toPointer():cpp.RawPointer<B3Vec3Native> {
		return cpp.RawPointer.addressOf(cast this);
	}
}
@:keep @:include("linc_box3d.h") @:native("cpp.Reference<b3Vec3>")
extern class B3Vec3Ref extends B3Vec3Native {}
@:keep @:include("linc_box3d.h") @:native("cpp.Struct<b3Vec3>")
extern class B3Vec3Struct extends B3Vec3Ref {}

@:forward() @:transitive
abstract B3Vec3(B3Vec3Struct) from B3Vec3Struct to B3Vec3Struct {
	overload extern public inline function new() { this = untyped __cpp__("b3Vec3()"); }
	overload extern public inline function new(v:B3Vec3Struct) { this = v; }
	overload extern public inline function new(v:B3Vec3Native) { this = cast v; }

	@:from @:noCompletion public static inline function fromNative(v:B3Vec3Native):B3Vec3 { return new B3Vec3(v); }
	@:to @:noCompletion public static inline function toNative(v:B3Vec3):B3Vec3Native { return cast v; }
	@:from @:noCompletion public static inline function fromStruct(v:B3Vec3Struct):B3Vec3 { return new B3Vec3(v); }
	@:to @:noCompletion public static inline function toStruct(v:B3Vec3):B3Vec3Struct { return cast v; }
	@:to @:noCompletion public static inline function autoToPointer(v:B3Vec3):cpp.RawPointer<B3Vec3Native> { return v.toPointer(); }

	public static inline function allocNativeArray(size:Int):cpp.Pointer<B3Vec3Native> {
		return size > 0 ? cast cpp.NativeGc.allocGcBytes(cpp.Stdlib.sizeof(B3Vec3Native) * size) : null;
	}
}


@:keep @:structAccess @:include("linc_box3d.h") @:native("b3Transform")
extern class B3TransformNative {
	public var p:B3PosNative;
	public var q:B3QuatNative;
	public inline function toPointer():cpp.RawPointer<B3TransformNative> {
		return cpp.RawPointer.addressOf(cast this);
	}
}
@:keep @:include("linc_box3d.h") @:native("cpp.Reference<b3Transform>")
extern class B3TransformRef extends B3TransformNative {}
@:keep @:include("linc_box3d.h") @:native("cpp.Struct<b3Transform>")
extern class B3TransformStruct extends B3TransformRef {}

@:forward() @:transitive
abstract B3Transform(B3TransformStruct) from B3TransformStruct to B3TransformStruct {
	overload extern public inline function new() { this = untyped __cpp__("b3Transform()"); }
	overload extern public inline function new(v:B3TransformStruct) { this = v; }
	overload extern public inline function new(v:B3TransformNative) { this = cast v; }

	@:from @:noCompletion public static inline function fromNative(v:B3TransformNative):B3Transform { return new B3Transform(v); }
	@:to @:noCompletion public static inline function toNative(v:B3Transform):B3TransformNative { return cast v; }
	@:from @:noCompletion public static inline function fromStruct(v:B3TransformStruct):B3Transform { return new B3Transform(v); }
	@:to @:noCompletion public static inline function toStruct(v:B3Transform):B3TransformStruct { return cast v; }
	@:to @:noCompletion public static inline function autoToPointer(v:B3Transform):cpp.RawPointer<B3TransformNative> { return v.toPointer(); }

	public static inline function allocNativeArray(size:Int):cpp.Pointer<B3TransformNative> {
		return size > 0 ? cast cpp.NativeGc.allocGcBytes(cpp.Stdlib.sizeof(B3TransformNative) * size) : null;
	}
}


@:keep @:structAccess @:include("linc_box3d.h") @:native("b3Pos")
extern class B3PosNative {
	public var x:cpp.Float32;
	public var y:cpp.Float32;
	public var z:cpp.Float32;
	public inline function toPointer():cpp.RawPointer<B3PosNative> {
		return cpp.RawPointer.addressOf(cast this);
	}
}
@:keep @:include("linc_box3d.h") @:native("cpp.Reference<b3Pos>")
extern class B3PosRef extends B3PosNative {}
@:keep @:include("linc_box3d.h") @:native("cpp.Struct<b3Pos>")
extern class B3PosStruct extends B3PosRef {}

@:forward() @:transitive
abstract B3Pos(B3PosStruct) from B3PosStruct to B3PosStruct {
	overload extern public inline function new() { this = untyped __cpp__("b3Pos()"); }
	overload extern public inline function new(v:B3PosStruct) { this = v; }
	overload extern public inline function new(v:B3PosNative) { this = cast v; }

	@:from @:noCompletion public static inline function fromNative(v:B3PosNative):B3Pos { return new B3Pos(v); }
	@:to @:noCompletion public static inline function toNative(v:B3Pos):B3PosNative { return cast v; }
	@:from @:noCompletion public static inline function fromStruct(v:B3PosStruct):B3Pos { return new B3Pos(v); }
	@:to @:noCompletion public static inline function toStruct(v:B3Pos):B3PosStruct { return cast v; }
	@:to @:noCompletion public static inline function autoToPointer(v:B3Pos):cpp.RawPointer<B3PosNative> { return v.toPointer(); }

	public static inline function allocNativeArray(size:Int):cpp.Pointer<B3PosNative> {
		return size > 0 ? cast cpp.NativeGc.allocGcBytes(cpp.Stdlib.sizeof(B3PosNative) * size) : null;
	}
}


@:keep @:structAccess @:include("linc_box3d.h") @:native("b3WorldTransform")
extern class B3WorldTransformNative {
	public var p:B3PosNative;
	public var q:B3QuatNative;
	public inline function toPointer():cpp.RawPointer<B3WorldTransformNative> {
		return cpp.RawPointer.addressOf(cast this);
	}
}
@:keep @:include("linc_box3d.h") @:native("cpp.Reference<b3WorldTransform>")
extern class B3WorldTransformRef extends B3WorldTransformNative {}
@:keep @:include("linc_box3d.h") @:native("cpp.Struct<b3WorldTransform>")
extern class B3WorldTransformStruct extends B3WorldTransformRef {}

@:forward() @:transitive
abstract B3WorldTransform(B3WorldTransformStruct) from B3WorldTransformStruct to B3WorldTransformStruct {
	overload extern public inline function new() { this = untyped __cpp__("b3WorldTransform()"); }
	overload extern public inline function new(v:B3WorldTransformStruct) { this = v; }
	overload extern public inline function new(v:B3WorldTransformNative) { this = cast v; }

	@:from @:noCompletion public static inline function fromNative(v:B3WorldTransformNative):B3WorldTransform { return new B3WorldTransform(v); }
	@:to @:noCompletion public static inline function toNative(v:B3WorldTransform):B3WorldTransformNative { return cast v; }
	@:from @:noCompletion public static inline function fromStruct(v:B3WorldTransformStruct):B3WorldTransform { return new B3WorldTransform(v); }
	@:to @:noCompletion public static inline function toStruct(v:B3WorldTransform):B3WorldTransformStruct { return cast v; }
	@:to @:noCompletion public static inline function autoToPointer(v:B3WorldTransform):cpp.RawPointer<B3WorldTransformNative> { return v.toPointer(); }

	public static inline function allocNativeArray(size:Int):cpp.Pointer<B3WorldTransformNative> {
		return size > 0 ? cast cpp.NativeGc.allocGcBytes(cpp.Stdlib.sizeof(B3WorldTransformNative) * size) : null;
	}
}


@:keep @:structAccess @:include("linc_box3d.h") @:native("b3Matrix3")
extern class B3Matrix3Native {
	public var cx:B3Vec3Native;
	public var cy:B3Vec3Native;
	public var cz:B3Vec3Native;
	public inline function toPointer():cpp.RawPointer<B3Matrix3Native> {
		return cpp.RawPointer.addressOf(cast this);
	}
}
@:keep @:include("linc_box3d.h") @:native("cpp.Reference<b3Matrix3>")
extern class B3Matrix3Ref extends B3Matrix3Native {}
@:keep @:include("linc_box3d.h") @:native("cpp.Struct<b3Matrix3>")
extern class B3Matrix3Struct extends B3Matrix3Ref {}

@:forward() @:transitive
abstract B3Matrix3(B3Matrix3Struct) from B3Matrix3Struct to B3Matrix3Struct {
	overload extern public inline function new() { this = untyped __cpp__("b3Matrix3()"); }
	overload extern public inline function new(v:B3Matrix3Struct) { this = v; }
	overload extern public inline function new(v:B3Matrix3Native) { this = cast v; }

	@:from @:noCompletion public static inline function fromNative(v:B3Matrix3Native):B3Matrix3 { return new B3Matrix3(v); }
	@:to @:noCompletion public static inline function toNative(v:B3Matrix3):B3Matrix3Native { return cast v; }
	@:from @:noCompletion public static inline function fromStruct(v:B3Matrix3Struct):B3Matrix3 { return new B3Matrix3(v); }
	@:to @:noCompletion public static inline function toStruct(v:B3Matrix3):B3Matrix3Struct { return cast v; }
	@:to @:noCompletion public static inline function autoToPointer(v:B3Matrix3):cpp.RawPointer<B3Matrix3Native> { return v.toPointer(); }

	public static inline function allocNativeArray(size:Int):cpp.Pointer<B3Matrix3Native> {
		return size > 0 ? cast cpp.NativeGc.allocGcBytes(cpp.Stdlib.sizeof(B3Matrix3Native) * size) : null;
	}
}


@:keep @:structAccess @:include("linc_box3d.h") @:native("b3WorldCastOutput")
extern class B3WorldCastOutputNative {
	public var normal:B3Vec3Native;
	public var point:B3Vec3Native;
	public var fraction:cpp.Float32;
	public var iterations:Int;
	public var triangleIndex:Int;
	public var childIndex:Int;
	public var materialIndex:Int;
	public var hit:Bool;
	public inline function toPointer():cpp.RawPointer<B3WorldCastOutputNative> {
		return cpp.RawPointer.addressOf(cast this);
	}
}
@:keep @:include("linc_box3d.h") @:native("cpp.Reference<b3WorldCastOutput>")
extern class B3WorldCastOutputRef extends B3WorldCastOutputNative {}
@:keep @:include("linc_box3d.h") @:native("cpp.Struct<b3WorldCastOutput>")
extern class B3WorldCastOutputStruct extends B3WorldCastOutputRef {}

@:forward() @:transitive
abstract B3WorldCastOutput(B3WorldCastOutputStruct) from B3WorldCastOutputStruct to B3WorldCastOutputStruct {
	overload extern public inline function new() { this = untyped __cpp__("b3WorldCastOutput()"); }
	overload extern public inline function new(v:B3WorldCastOutputStruct) { this = v; }
	overload extern public inline function new(v:B3WorldCastOutputNative) { this = cast v; }

	@:from @:noCompletion public static inline function fromNative(v:B3WorldCastOutputNative):B3WorldCastOutput { return new B3WorldCastOutput(v); }
	@:to @:noCompletion public static inline function toNative(v:B3WorldCastOutput):B3WorldCastOutputNative { return cast v; }
	@:from @:noCompletion public static inline function fromStruct(v:B3WorldCastOutputStruct):B3WorldCastOutput { return new B3WorldCastOutput(v); }
	@:to @:noCompletion public static inline function toStruct(v:B3WorldCastOutput):B3WorldCastOutputStruct { return cast v; }
	@:to @:noCompletion public static inline function autoToPointer(v:B3WorldCastOutput):cpp.RawPointer<B3WorldCastOutputNative> { return v.toPointer(); }

	public static inline function allocNativeArray(size:Int):cpp.Pointer<B3WorldCastOutputNative> {
		return size > 0 ? cast cpp.NativeGc.allocGcBytes(cpp.Stdlib.sizeof(B3WorldCastOutputNative) * size) : null;
	}
}


@:keep @:structAccess @:include("linc_box3d.h") @:native("b3CastOutput")
extern class B3CastOutputNative {
	public var normal:B3Vec3Native;
	public var point:B3Vec3Native;
	public var fraction:cpp.Float32;
	public var iterations:Int;
	public var triangleIndex:Int;
	public var childIndex:Int;
	public var materialIndex:Int;
	public var hit:Bool;
	public inline function toPointer():cpp.RawPointer<B3CastOutputNative> {
		return cpp.RawPointer.addressOf(cast this);
	}
}
@:keep @:include("linc_box3d.h") @:native("cpp.Reference<b3CastOutput>")
extern class B3CastOutputRef extends B3CastOutputNative {}
@:keep @:include("linc_box3d.h") @:native("cpp.Struct<b3CastOutput>")
extern class B3CastOutputStruct extends B3CastOutputRef {}

@:forward() @:transitive
abstract B3CastOutput(B3CastOutputStruct) from B3CastOutputStruct to B3CastOutputStruct {
	overload extern public inline function new() { this = untyped __cpp__("b3CastOutput()"); }
	overload extern public inline function new(v:B3CastOutputStruct) { this = v; }
	overload extern public inline function new(v:B3CastOutputNative) { this = cast v; }

	@:from @:noCompletion public static inline function fromNative(v:B3CastOutputNative):B3CastOutput { return new B3CastOutput(v); }
	@:to @:noCompletion public static inline function toNative(v:B3CastOutput):B3CastOutputNative { return cast v; }
	@:from @:noCompletion public static inline function fromStruct(v:B3CastOutputStruct):B3CastOutput { return new B3CastOutput(v); }
	@:to @:noCompletion public static inline function toStruct(v:B3CastOutput):B3CastOutputStruct { return cast v; }
	@:to @:noCompletion public static inline function autoToPointer(v:B3CastOutput):cpp.RawPointer<B3CastOutputNative> { return v.toPointer(); }

	public static inline function allocNativeArray(size:Int):cpp.Pointer<B3CastOutputNative> {
		return size > 0 ? cast cpp.NativeGc.allocGcBytes(cpp.Stdlib.sizeof(B3CastOutputNative) * size) : null;
	}
}


@:keep @:structAccess @:include("linc_box3d.h") @:native("b3DebugDraw")
extern class B3DebugDrawNative {
	public var DrawShapeFcn:B3DebugDrawDrawShapeFcn;
	public var DrawSegmentFcn:B3DebugDrawDrawSegmentFcn;
	public var DrawTransformFcn:B3DebugDrawDrawTransformFcn;
	public var DrawPointFcn:B3DebugDrawDrawPointFcn;
	public var DrawSphereFcn:B3DebugDrawDrawSphereFcn;
	public var DrawCapsuleFcn:B3DebugDrawDrawCapsuleFcn;
	public var DrawBoundsFcn:B3DebugDrawDrawBoundsFcn;
	public var DrawBoxFcn:B3DebugDrawDrawBoxFcn;
	public var DrawStringFcn:B3DebugDrawDrawStringFcn;
	public var drawingBounds:B3AABBNative;
	public var forceScale:cpp.Float32;
	public var jointScale:cpp.Float32;
	public var drawShapes:Bool;
	public var drawJoints:Bool;
	public var drawJointExtras:Bool;
	public var drawBounds:Bool;
	public var drawMass:Bool;
	public var drawSleep:Bool;
	public var drawBodyNames:Bool;
	public var drawContacts:Bool;
	public var drawAnchorA:Bool;
	public var drawGraphColors:Bool;
	public var drawContactFeatures:Bool;
	public var drawContactNormals:Bool;
	public var drawContactForces:Bool;
	public var drawIslands:Bool;
	public var context:cpp.RawPointer<Void>;
	public inline function toPointer():cpp.RawPointer<B3DebugDrawNative> {
		return cpp.RawPointer.addressOf(cast this);
	}
}
@:keep @:include("linc_box3d.h") @:native("cpp.Reference<b3DebugDraw>")
extern class B3DebugDrawRef extends B3DebugDrawNative {}
@:keep @:include("linc_box3d.h") @:native("cpp.Struct<b3DebugDraw>")
extern class B3DebugDrawStruct extends B3DebugDrawRef {}

@:forward() @:transitive
abstract B3DebugDraw(B3DebugDrawStruct) from B3DebugDrawStruct to B3DebugDrawStruct {
	overload extern public inline function new() { this = untyped __cpp__("b3DebugDraw()"); }
	overload extern public inline function new(v:B3DebugDrawStruct) { this = v; }
	overload extern public inline function new(v:B3DebugDrawNative) { this = cast v; }

	@:from @:noCompletion public static inline function fromNative(v:B3DebugDrawNative):B3DebugDraw { return new B3DebugDraw(v); }
	@:to @:noCompletion public static inline function toNative(v:B3DebugDraw):B3DebugDrawNative { return cast v; }
	@:from @:noCompletion public static inline function fromStruct(v:B3DebugDrawStruct):B3DebugDraw { return new B3DebugDraw(v); }
	@:to @:noCompletion public static inline function toStruct(v:B3DebugDraw):B3DebugDrawStruct { return cast v; }
	@:to @:noCompletion public static inline function autoToPointer(v:B3DebugDraw):cpp.RawPointer<B3DebugDrawNative> { return v.toPointer(); }

	public static inline function allocNativeArray(size:Int):cpp.Pointer<B3DebugDrawNative> {
		return size > 0 ? cast cpp.NativeGc.allocGcBytes(cpp.Stdlib.sizeof(B3DebugDrawNative) * size) : null;
	}
}


@:keep @:structAccess @:include("linc_box3d.h") @:native("b3Version")
extern class B3VersionNative {
	public var major:Int;
	public var minor:Int;
	public var revision:Int;
	public inline function toPointer():cpp.RawPointer<B3VersionNative> {
		return cpp.RawPointer.addressOf(cast this);
	}
}
@:keep @:include("linc_box3d.h") @:native("cpp.Reference<b3Version>")
extern class B3VersionRef extends B3VersionNative {}
@:keep @:include("linc_box3d.h") @:native("cpp.Struct<b3Version>")
extern class B3VersionStruct extends B3VersionRef {}

@:forward() @:transitive
abstract B3Version(B3VersionStruct) from B3VersionStruct to B3VersionStruct {
	overload extern public inline function new() { this = untyped __cpp__("b3Version()"); }
	overload extern public inline function new(v:B3VersionStruct) { this = v; }
	overload extern public inline function new(v:B3VersionNative) { this = cast v; }

	@:from @:noCompletion public static inline function fromNative(v:B3VersionNative):B3Version { return new B3Version(v); }
	@:to @:noCompletion public static inline function toNative(v:B3Version):B3VersionNative { return cast v; }
	@:from @:noCompletion public static inline function fromStruct(v:B3VersionStruct):B3Version { return new B3Version(v); }
	@:to @:noCompletion public static inline function toStruct(v:B3Version):B3VersionStruct { return cast v; }
	@:to @:noCompletion public static inline function autoToPointer(v:B3Version):cpp.RawPointer<B3VersionNative> { return v.toPointer(); }

	public static inline function allocNativeArray(size:Int):cpp.Pointer<B3VersionNative> {
		return size > 0 ? cast cpp.NativeGc.allocGcBytes(cpp.Stdlib.sizeof(B3VersionNative) * size) : null;
	}
}


@:keep @:structAccess @:include("linc_box3d.h") @:native("b3Capacity")
extern class B3CapacityNative {
	public var staticShapeCount:Int;
	public var dynamicShapeCount:Int;
	public var staticBodyCount:Int;
	public var dynamicBodyCount:Int;
	public var contactCount:Int;
	public inline function toPointer():cpp.RawPointer<B3CapacityNative> {
		return cpp.RawPointer.addressOf(cast this);
	}
}
@:keep @:include("linc_box3d.h") @:native("cpp.Reference<b3Capacity>")
extern class B3CapacityRef extends B3CapacityNative {}
@:keep @:include("linc_box3d.h") @:native("cpp.Struct<b3Capacity>")
extern class B3CapacityStruct extends B3CapacityRef {}

@:forward() @:transitive
abstract B3Capacity(B3CapacityStruct) from B3CapacityStruct to B3CapacityStruct {
	overload extern public inline function new() { this = untyped __cpp__("b3Capacity()"); }
	overload extern public inline function new(v:B3CapacityStruct) { this = v; }
	overload extern public inline function new(v:B3CapacityNative) { this = cast v; }

	@:from @:noCompletion public static inline function fromNative(v:B3CapacityNative):B3Capacity { return new B3Capacity(v); }
	@:to @:noCompletion public static inline function toNative(v:B3Capacity):B3CapacityNative { return cast v; }
	@:from @:noCompletion public static inline function fromStruct(v:B3CapacityStruct):B3Capacity { return new B3Capacity(v); }
	@:to @:noCompletion public static inline function toStruct(v:B3Capacity):B3CapacityStruct { return cast v; }
	@:to @:noCompletion public static inline function autoToPointer(v:B3Capacity):cpp.RawPointer<B3CapacityNative> { return v.toPointer(); }

	public static inline function allocNativeArray(size:Int):cpp.Pointer<B3CapacityNative> {
		return size > 0 ? cast cpp.NativeGc.allocGcBytes(cpp.Stdlib.sizeof(B3CapacityNative) * size) : null;
	}
}


@:keep @:structAccess @:include("linc_box3d.h") @:native("b3WorldDef")
extern class B3WorldDefNative {
	public var gravity:B3Vec3Native;
	public var restitutionThreshold:cpp.Float32;
	public var hitEventThreshold:cpp.Float32;
	public var contactHertz:cpp.Float32;
	public var contactDampingRatio:cpp.Float32;
	public var contactSpeed:cpp.Float32;
	public var maximumLinearSpeed:cpp.Float32;
	public var frictionCallback:B3FrictionCallback;
	public var restitutionCallback:B3RestitutionCallback;
	public var enableSleep:Bool;
	public var enableContinuous:Bool;
	public var workerCount:cpp.UInt32;
	public var enqueueTask:B3EnqueueTaskCallback;
	public var finishTask:B3FinishTaskCallback;
	public var userTaskContext:cpp.RawPointer<Void>;
	public var userData:cpp.RawPointer<Void>;
	public var createDebugShape:B3CreateDebugShapeCallback;
	public var destroyDebugShape:B3DestroyDebugShapeCallback;
	public var userDebugShapeContext:cpp.RawPointer<Void>;
	public var capacity:B3CapacityNative;
	public var internalValue:Int;
	public inline function toPointer():cpp.RawPointer<B3WorldDefNative> {
		return cpp.RawPointer.addressOf(cast this);
	}
}
@:keep @:include("linc_box3d.h") @:native("cpp.Reference<b3WorldDef>")
extern class B3WorldDefRef extends B3WorldDefNative {}
@:keep @:include("linc_box3d.h") @:native("cpp.Struct<b3WorldDef>")
extern class B3WorldDefStruct extends B3WorldDefRef {}

@:forward() @:transitive
abstract B3WorldDef(B3WorldDefStruct) from B3WorldDefStruct to B3WorldDefStruct {
	overload extern public inline function new() { this = untyped __cpp__("b3WorldDef()"); }
	overload extern public inline function new(v:B3WorldDefStruct) { this = v; }
	overload extern public inline function new(v:B3WorldDefNative) { this = cast v; }

	@:from @:noCompletion public static inline function fromNative(v:B3WorldDefNative):B3WorldDef { return new B3WorldDef(v); }
	@:to @:noCompletion public static inline function toNative(v:B3WorldDef):B3WorldDefNative { return cast v; }
	@:from @:noCompletion public static inline function fromStruct(v:B3WorldDefStruct):B3WorldDef { return new B3WorldDef(v); }
	@:to @:noCompletion public static inline function toStruct(v:B3WorldDef):B3WorldDefStruct { return cast v; }
	@:to @:noCompletion public static inline function autoToPointer(v:B3WorldDef):cpp.RawPointer<B3WorldDefNative> { return v.toPointer(); }

	public static inline function allocNativeArray(size:Int):cpp.Pointer<B3WorldDefNative> {
		return size > 0 ? cast cpp.NativeGc.allocGcBytes(cpp.Stdlib.sizeof(B3WorldDefNative) * size) : null;
	}
}


@:keep @:structAccess @:include("linc_box3d.h") @:native("b3MotionLocks")
extern class B3MotionLocksNative {
	public var linearX:Bool;
	public var linearY:Bool;
	public var linearZ:Bool;
	public var angularX:Bool;
	public var angularY:Bool;
	public var angularZ:Bool;
	public inline function toPointer():cpp.RawPointer<B3MotionLocksNative> {
		return cpp.RawPointer.addressOf(cast this);
	}
}
@:keep @:include("linc_box3d.h") @:native("cpp.Reference<b3MotionLocks>")
extern class B3MotionLocksRef extends B3MotionLocksNative {}
@:keep @:include("linc_box3d.h") @:native("cpp.Struct<b3MotionLocks>")
extern class B3MotionLocksStruct extends B3MotionLocksRef {}

@:forward() @:transitive
abstract B3MotionLocks(B3MotionLocksStruct) from B3MotionLocksStruct to B3MotionLocksStruct {
	overload extern public inline function new() { this = untyped __cpp__("b3MotionLocks()"); }
	overload extern public inline function new(v:B3MotionLocksStruct) { this = v; }
	overload extern public inline function new(v:B3MotionLocksNative) { this = cast v; }

	@:from @:noCompletion public static inline function fromNative(v:B3MotionLocksNative):B3MotionLocks { return new B3MotionLocks(v); }
	@:to @:noCompletion public static inline function toNative(v:B3MotionLocks):B3MotionLocksNative { return cast v; }
	@:from @:noCompletion public static inline function fromStruct(v:B3MotionLocksStruct):B3MotionLocks { return new B3MotionLocks(v); }
	@:to @:noCompletion public static inline function toStruct(v:B3MotionLocks):B3MotionLocksStruct { return cast v; }
	@:to @:noCompletion public static inline function autoToPointer(v:B3MotionLocks):cpp.RawPointer<B3MotionLocksNative> { return v.toPointer(); }

	public static inline function allocNativeArray(size:Int):cpp.Pointer<B3MotionLocksNative> {
		return size > 0 ? cast cpp.NativeGc.allocGcBytes(cpp.Stdlib.sizeof(B3MotionLocksNative) * size) : null;
	}
}


@:keep @:structAccess @:include("linc_box3d.h") @:native("b3BodyDef")
extern class B3BodyDefNative {
	public var type:B3BodyType;
	public var position:B3PosNative;
	public var rotation:B3QuatNative;
	public var linearVelocity:B3Vec3Native;
	public var angularVelocity:B3Vec3Native;
	public var linearDamping:cpp.Float32;
	public var angularDamping:cpp.Float32;
	public var gravityScale:cpp.Float32;
	public var sleepThreshold:cpp.Float32;
	public var name:cpp.ConstCharStar;
	public var userData:cpp.RawPointer<Void>;
	public var motionLocks:B3MotionLocksNative;
	public var enableSleep:Bool;
	public var isAwake:Bool;
	public var isBullet:Bool;
	public var isEnabled:Bool;
	public var allowFastRotation:Bool;
	public var enableContactRecycling:Bool;
	public var internalValue:Int;
	public inline function toPointer():cpp.RawPointer<B3BodyDefNative> {
		return cpp.RawPointer.addressOf(cast this);
	}
}
@:keep @:include("linc_box3d.h") @:native("cpp.Reference<b3BodyDef>")
extern class B3BodyDefRef extends B3BodyDefNative {}
@:keep @:include("linc_box3d.h") @:native("cpp.Struct<b3BodyDef>")
extern class B3BodyDefStruct extends B3BodyDefRef {}

@:forward() @:transitive
abstract B3BodyDef(B3BodyDefStruct) from B3BodyDefStruct to B3BodyDefStruct {
	overload extern public inline function new() { this = untyped __cpp__("b3BodyDef()"); }
	overload extern public inline function new(v:B3BodyDefStruct) { this = v; }
	overload extern public inline function new(v:B3BodyDefNative) { this = cast v; }

	@:from @:noCompletion public static inline function fromNative(v:B3BodyDefNative):B3BodyDef { return new B3BodyDef(v); }
	@:to @:noCompletion public static inline function toNative(v:B3BodyDef):B3BodyDefNative { return cast v; }
	@:from @:noCompletion public static inline function fromStruct(v:B3BodyDefStruct):B3BodyDef { return new B3BodyDef(v); }
	@:to @:noCompletion public static inline function toStruct(v:B3BodyDef):B3BodyDefStruct { return cast v; }
	@:to @:noCompletion public static inline function autoToPointer(v:B3BodyDef):cpp.RawPointer<B3BodyDefNative> { return v.toPointer(); }

	public static inline function allocNativeArray(size:Int):cpp.Pointer<B3BodyDefNative> {
		return size > 0 ? cast cpp.NativeGc.allocGcBytes(cpp.Stdlib.sizeof(B3BodyDefNative) * size) : null;
	}
}


@:keep @:structAccess @:include("linc_box3d.h") @:native("b3Filter")
extern class B3FilterNative {
	public var categoryBits:cpp.UInt64;
	public var maskBits:cpp.UInt64;
	public var groupIndex:Int;
	public inline function toPointer():cpp.RawPointer<B3FilterNative> {
		return cpp.RawPointer.addressOf(cast this);
	}
}
@:keep @:include("linc_box3d.h") @:native("cpp.Reference<b3Filter>")
extern class B3FilterRef extends B3FilterNative {}
@:keep @:include("linc_box3d.h") @:native("cpp.Struct<b3Filter>")
extern class B3FilterStruct extends B3FilterRef {}

@:forward() @:transitive
abstract B3Filter(B3FilterStruct) from B3FilterStruct to B3FilterStruct {
	overload extern public inline function new() { this = untyped __cpp__("b3Filter()"); }
	overload extern public inline function new(v:B3FilterStruct) { this = v; }
	overload extern public inline function new(v:B3FilterNative) { this = cast v; }

	@:from @:noCompletion public static inline function fromNative(v:B3FilterNative):B3Filter { return new B3Filter(v); }
	@:to @:noCompletion public static inline function toNative(v:B3Filter):B3FilterNative { return cast v; }
	@:from @:noCompletion public static inline function fromStruct(v:B3FilterStruct):B3Filter { return new B3Filter(v); }
	@:to @:noCompletion public static inline function toStruct(v:B3Filter):B3FilterStruct { return cast v; }
	@:to @:noCompletion public static inline function autoToPointer(v:B3Filter):cpp.RawPointer<B3FilterNative> { return v.toPointer(); }

	public static inline function allocNativeArray(size:Int):cpp.Pointer<B3FilterNative> {
		return size > 0 ? cast cpp.NativeGc.allocGcBytes(cpp.Stdlib.sizeof(B3FilterNative) * size) : null;
	}
}


@:keep @:structAccess @:include("linc_box3d.h") @:native("b3SurfaceMaterial")
extern class B3SurfaceMaterialNative {
	public var friction:cpp.Float32;
	public var restitution:cpp.Float32;
	public var rollingResistance:cpp.Float32;
	public var tangentVelocity:B3Vec3Native;
	public var userMaterialId:cpp.UInt64;
	public var customColor:cpp.UInt32;
	public var padding:cpp.UInt32;
	public inline function toPointer():cpp.RawPointer<B3SurfaceMaterialNative> {
		return cpp.RawPointer.addressOf(cast this);
	}
}
@:keep @:include("linc_box3d.h") @:native("cpp.Reference<b3SurfaceMaterial>")
extern class B3SurfaceMaterialRef extends B3SurfaceMaterialNative {}
@:keep @:include("linc_box3d.h") @:native("cpp.Struct<b3SurfaceMaterial>")
extern class B3SurfaceMaterialStruct extends B3SurfaceMaterialRef {}

@:forward() @:transitive
abstract B3SurfaceMaterial(B3SurfaceMaterialStruct) from B3SurfaceMaterialStruct to B3SurfaceMaterialStruct {
	overload extern public inline function new() { this = untyped __cpp__("b3SurfaceMaterial()"); }
	overload extern public inline function new(v:B3SurfaceMaterialStruct) { this = v; }
	overload extern public inline function new(v:B3SurfaceMaterialNative) { this = cast v; }

	@:from @:noCompletion public static inline function fromNative(v:B3SurfaceMaterialNative):B3SurfaceMaterial { return new B3SurfaceMaterial(v); }
	@:to @:noCompletion public static inline function toNative(v:B3SurfaceMaterial):B3SurfaceMaterialNative { return cast v; }
	@:from @:noCompletion public static inline function fromStruct(v:B3SurfaceMaterialStruct):B3SurfaceMaterial { return new B3SurfaceMaterial(v); }
	@:to @:noCompletion public static inline function toStruct(v:B3SurfaceMaterial):B3SurfaceMaterialStruct { return cast v; }
	@:to @:noCompletion public static inline function autoToPointer(v:B3SurfaceMaterial):cpp.RawPointer<B3SurfaceMaterialNative> { return v.toPointer(); }

	public static inline function allocNativeArray(size:Int):cpp.Pointer<B3SurfaceMaterialNative> {
		return size > 0 ? cast cpp.NativeGc.allocGcBytes(cpp.Stdlib.sizeof(B3SurfaceMaterialNative) * size) : null;
	}
}


@:keep @:structAccess @:include("linc_box3d.h") @:native("b3ShapeDef")
extern class B3ShapeDefNative {
	public var name:cpp.ConstCharStar;
	public var userData:cpp.RawPointer<Void>;
	public var materials:cpp.RawPointer<B3SurfaceMaterialNative>;
	public var materialCount:Int;
	public var baseMaterial:B3SurfaceMaterialNative;
	public var density:cpp.Float32;
	public var explosionScale:cpp.Float32;
	public var filter:B3FilterNative;
	public var enableCustomFiltering:Bool;
	public var isSensor:Bool;
	public var enableSensorEvents:Bool;
	public var enableContactEvents:Bool;
	public var enableHitEvents:Bool;
	public var enablePreSolveEvents:Bool;
	public var invokeContactCreation:Bool;
	public var updateBodyMass:Bool;
	public var enableSpeculativeContact:Bool;
	public var internalValue:Int;
	public inline function toPointer():cpp.RawPointer<B3ShapeDefNative> {
		return cpp.RawPointer.addressOf(cast this);
	}
}
@:keep @:include("linc_box3d.h") @:native("cpp.Reference<b3ShapeDef>")
extern class B3ShapeDefRef extends B3ShapeDefNative {}
@:keep @:include("linc_box3d.h") @:native("cpp.Struct<b3ShapeDef>")
extern class B3ShapeDefStruct extends B3ShapeDefRef {}

@:forward() @:transitive
abstract B3ShapeDef(B3ShapeDefStruct) from B3ShapeDefStruct to B3ShapeDefStruct {
	overload extern public inline function new() { this = untyped __cpp__("b3ShapeDef()"); }
	overload extern public inline function new(v:B3ShapeDefStruct) { this = v; }
	overload extern public inline function new(v:B3ShapeDefNative) { this = cast v; }

	@:from @:noCompletion public static inline function fromNative(v:B3ShapeDefNative):B3ShapeDef { return new B3ShapeDef(v); }
	@:to @:noCompletion public static inline function toNative(v:B3ShapeDef):B3ShapeDefNative { return cast v; }
	@:from @:noCompletion public static inline function fromStruct(v:B3ShapeDefStruct):B3ShapeDef { return new B3ShapeDef(v); }
	@:to @:noCompletion public static inline function toStruct(v:B3ShapeDef):B3ShapeDefStruct { return cast v; }
	@:to @:noCompletion public static inline function autoToPointer(v:B3ShapeDef):cpp.RawPointer<B3ShapeDefNative> { return v.toPointer(); }

	public static inline function allocNativeArray(size:Int):cpp.Pointer<B3ShapeDefNative> {
		return size > 0 ? cast cpp.NativeGc.allocGcBytes(cpp.Stdlib.sizeof(B3ShapeDefNative) * size) : null;
	}
}


@:keep @:structAccess @:include("linc_box3d.h") @:native("b3Profile")
extern class B3ProfileNative {
	public var step:cpp.Float32;
	public var pairs:cpp.Float32;
	public var collide:cpp.Float32;
	public var solve:cpp.Float32;
	public var solverSetup:cpp.Float32;
	public var constraints:cpp.Float32;
	public var prepareConstraints:cpp.Float32;
	public var integrateVelocities:cpp.Float32;
	public var warmStart:cpp.Float32;
	public var solveImpulses:cpp.Float32;
	public var integratePositions:cpp.Float32;
	public var relaxImpulses:cpp.Float32;
	public var applyRestitution:cpp.Float32;
	public var storeImpulses:cpp.Float32;
	public var splitIslands:cpp.Float32;
	public var transforms:cpp.Float32;
	public var sensorHits:cpp.Float32;
	public var jointEvents:cpp.Float32;
	public var hitEvents:cpp.Float32;
	public var refit:cpp.Float32;
	public var bullets:cpp.Float32;
	public var sleepIslands:cpp.Float32;
	public var sensors:cpp.Float32;
	public inline function toPointer():cpp.RawPointer<B3ProfileNative> {
		return cpp.RawPointer.addressOf(cast this);
	}
}
@:keep @:include("linc_box3d.h") @:native("cpp.Reference<b3Profile>")
extern class B3ProfileRef extends B3ProfileNative {}
@:keep @:include("linc_box3d.h") @:native("cpp.Struct<b3Profile>")
extern class B3ProfileStruct extends B3ProfileRef {}

@:forward() @:transitive
abstract B3Profile(B3ProfileStruct) from B3ProfileStruct to B3ProfileStruct {
	overload extern public inline function new() { this = untyped __cpp__("b3Profile()"); }
	overload extern public inline function new(v:B3ProfileStruct) { this = v; }
	overload extern public inline function new(v:B3ProfileNative) { this = cast v; }

	@:from @:noCompletion public static inline function fromNative(v:B3ProfileNative):B3Profile { return new B3Profile(v); }
	@:to @:noCompletion public static inline function toNative(v:B3Profile):B3ProfileNative { return cast v; }
	@:from @:noCompletion public static inline function fromStruct(v:B3ProfileStruct):B3Profile { return new B3Profile(v); }
	@:to @:noCompletion public static inline function toStruct(v:B3Profile):B3ProfileStruct { return cast v; }
	@:to @:noCompletion public static inline function autoToPointer(v:B3Profile):cpp.RawPointer<B3ProfileNative> { return v.toPointer(); }

	public static inline function allocNativeArray(size:Int):cpp.Pointer<B3ProfileNative> {
		return size > 0 ? cast cpp.NativeGc.allocGcBytes(cpp.Stdlib.sizeof(B3ProfileNative) * size) : null;
	}
}


@:keep @:structAccess @:include("linc_box3d.h") @:native("b3Counters")
extern class B3CountersNative {
	public var bodyCount:Int;
	public var shapeCount:Int;
	public var contactCount:Int;
	public var jointCount:Int;
	public var islandCount:Int;
	public var stackUsed:Int;
	public var arenaCapacity:Int;
	public var staticTreeHeight:Int;
	public var treeHeight:Int;
	public var satCallCount:Int;
	public var satCacheHitCount:Int;
	public var byteCount:Int;
	public var taskCount:Int;
	public var colorCounts:cpp.RawPointer<Int>;
	public var manifoldCounts:cpp.RawPointer<Int>;
	public var awakeContactCount:Int;
	public var recycledContactCount:Int;
	public var distanceIterations:Int;
	public var pushBackIterations:Int;
	public var rootIterations:Int;
	public inline function toPointer():cpp.RawPointer<B3CountersNative> {
		return cpp.RawPointer.addressOf(cast this);
	}
}
@:keep @:include("linc_box3d.h") @:native("cpp.Reference<b3Counters>")
extern class B3CountersRef extends B3CountersNative {}
@:keep @:include("linc_box3d.h") @:native("cpp.Struct<b3Counters>")
extern class B3CountersStruct extends B3CountersRef {}

@:forward() @:transitive
abstract B3Counters(B3CountersStruct) from B3CountersStruct to B3CountersStruct {
	overload extern public inline function new() { this = untyped __cpp__("b3Counters()"); }
	overload extern public inline function new(v:B3CountersStruct) { this = v; }
	overload extern public inline function new(v:B3CountersNative) { this = cast v; }

	@:from @:noCompletion public static inline function fromNative(v:B3CountersNative):B3Counters { return new B3Counters(v); }
	@:to @:noCompletion public static inline function toNative(v:B3Counters):B3CountersNative { return cast v; }
	@:from @:noCompletion public static inline function fromStruct(v:B3CountersStruct):B3Counters { return new B3Counters(v); }
	@:to @:noCompletion public static inline function toStruct(v:B3Counters):B3CountersStruct { return cast v; }
	@:to @:noCompletion public static inline function autoToPointer(v:B3Counters):cpp.RawPointer<B3CountersNative> { return v.toPointer(); }

	public static inline function allocNativeArray(size:Int):cpp.Pointer<B3CountersNative> {
		return size > 0 ? cast cpp.NativeGc.allocGcBytes(cpp.Stdlib.sizeof(B3CountersNative) * size) : null;
	}
}


@:keep @:structAccess @:include("linc_box3d.h") @:native("b3JointDef")
extern class B3JointDefNative {
	public var userData:cpp.RawPointer<Void>;
	public var bodyIdA:B3BodyIdNative;
	public var bodyIdB:B3BodyIdNative;
	public var localFrameA:B3TransformNative;
	public var localFrameB:B3TransformNative;
	public var forceThreshold:cpp.Float32;
	public var torqueThreshold:cpp.Float32;
	public var constraintHertz:cpp.Float32;
	public var constraintDampingRatio:cpp.Float32;
	public var drawScale:cpp.Float32;
	public var collideConnected:Bool;
	public var internalValue:Int;
	public inline function toPointer():cpp.RawPointer<B3JointDefNative> {
		return cpp.RawPointer.addressOf(cast this);
	}
}
@:keep @:include("linc_box3d.h") @:native("cpp.Reference<b3JointDef>")
extern class B3JointDefRef extends B3JointDefNative {}
@:keep @:include("linc_box3d.h") @:native("cpp.Struct<b3JointDef>")
extern class B3JointDefStruct extends B3JointDefRef {}

@:forward() @:transitive
abstract B3JointDef(B3JointDefStruct) from B3JointDefStruct to B3JointDefStruct {
	overload extern public inline function new() { this = untyped __cpp__("b3JointDef()"); }
	overload extern public inline function new(v:B3JointDefStruct) { this = v; }
	overload extern public inline function new(v:B3JointDefNative) { this = cast v; }

	@:from @:noCompletion public static inline function fromNative(v:B3JointDefNative):B3JointDef { return new B3JointDef(v); }
	@:to @:noCompletion public static inline function toNative(v:B3JointDef):B3JointDefNative { return cast v; }
	@:from @:noCompletion public static inline function fromStruct(v:B3JointDefStruct):B3JointDef { return new B3JointDef(v); }
	@:to @:noCompletion public static inline function toStruct(v:B3JointDef):B3JointDefStruct { return cast v; }
	@:to @:noCompletion public static inline function autoToPointer(v:B3JointDef):cpp.RawPointer<B3JointDefNative> { return v.toPointer(); }

	public static inline function allocNativeArray(size:Int):cpp.Pointer<B3JointDefNative> {
		return size > 0 ? cast cpp.NativeGc.allocGcBytes(cpp.Stdlib.sizeof(B3JointDefNative) * size) : null;
	}
}


@:keep @:structAccess @:include("linc_box3d.h") @:native("b3DistanceJointDef")
extern class B3DistanceJointDefNative {
	public var base:B3JointDefNative;
	public var length:cpp.Float32;
	public var enableSpring:Bool;
	public var lowerSpringForce:cpp.Float32;
	public var upperSpringForce:cpp.Float32;
	public var hertz:cpp.Float32;
	public var dampingRatio:cpp.Float32;
	public var enableLimit:Bool;
	public var minLength:cpp.Float32;
	public var maxLength:cpp.Float32;
	public var enableMotor:Bool;
	public var maxMotorForce:cpp.Float32;
	public var motorSpeed:cpp.Float32;
	public inline function toPointer():cpp.RawPointer<B3DistanceJointDefNative> {
		return cpp.RawPointer.addressOf(cast this);
	}
}
@:keep @:include("linc_box3d.h") @:native("cpp.Reference<b3DistanceJointDef>")
extern class B3DistanceJointDefRef extends B3DistanceJointDefNative {}
@:keep @:include("linc_box3d.h") @:native("cpp.Struct<b3DistanceJointDef>")
extern class B3DistanceJointDefStruct extends B3DistanceJointDefRef {}

@:forward() @:transitive
abstract B3DistanceJointDef(B3DistanceJointDefStruct) from B3DistanceJointDefStruct to B3DistanceJointDefStruct {
	overload extern public inline function new() { this = untyped __cpp__("b3DistanceJointDef()"); }
	overload extern public inline function new(v:B3DistanceJointDefStruct) { this = v; }
	overload extern public inline function new(v:B3DistanceJointDefNative) { this = cast v; }

	@:from @:noCompletion public static inline function fromNative(v:B3DistanceJointDefNative):B3DistanceJointDef { return new B3DistanceJointDef(v); }
	@:to @:noCompletion public static inline function toNative(v:B3DistanceJointDef):B3DistanceJointDefNative { return cast v; }
	@:from @:noCompletion public static inline function fromStruct(v:B3DistanceJointDefStruct):B3DistanceJointDef { return new B3DistanceJointDef(v); }
	@:to @:noCompletion public static inline function toStruct(v:B3DistanceJointDef):B3DistanceJointDefStruct { return cast v; }
	@:to @:noCompletion public static inline function autoToPointer(v:B3DistanceJointDef):cpp.RawPointer<B3DistanceJointDefNative> { return v.toPointer(); }

	public static inline function allocNativeArray(size:Int):cpp.Pointer<B3DistanceJointDefNative> {
		return size > 0 ? cast cpp.NativeGc.allocGcBytes(cpp.Stdlib.sizeof(B3DistanceJointDefNative) * size) : null;
	}
}


@:keep @:structAccess @:include("linc_box3d.h") @:native("b3MotorJointDef")
extern class B3MotorJointDefNative {
	public var base:B3JointDefNative;
	public var linearVelocity:B3Vec3Native;
	public var maxVelocityForce:cpp.Float32;
	public var angularVelocity:B3Vec3Native;
	public var maxVelocityTorque:cpp.Float32;
	public var linearHertz:cpp.Float32;
	public var linearDampingRatio:cpp.Float32;
	public var maxSpringForce:cpp.Float32;
	public var angularHertz:cpp.Float32;
	public var angularDampingRatio:cpp.Float32;
	public var maxSpringTorque:cpp.Float32;
	public inline function toPointer():cpp.RawPointer<B3MotorJointDefNative> {
		return cpp.RawPointer.addressOf(cast this);
	}
}
@:keep @:include("linc_box3d.h") @:native("cpp.Reference<b3MotorJointDef>")
extern class B3MotorJointDefRef extends B3MotorJointDefNative {}
@:keep @:include("linc_box3d.h") @:native("cpp.Struct<b3MotorJointDef>")
extern class B3MotorJointDefStruct extends B3MotorJointDefRef {}

@:forward() @:transitive
abstract B3MotorJointDef(B3MotorJointDefStruct) from B3MotorJointDefStruct to B3MotorJointDefStruct {
	overload extern public inline function new() { this = untyped __cpp__("b3MotorJointDef()"); }
	overload extern public inline function new(v:B3MotorJointDefStruct) { this = v; }
	overload extern public inline function new(v:B3MotorJointDefNative) { this = cast v; }

	@:from @:noCompletion public static inline function fromNative(v:B3MotorJointDefNative):B3MotorJointDef { return new B3MotorJointDef(v); }
	@:to @:noCompletion public static inline function toNative(v:B3MotorJointDef):B3MotorJointDefNative { return cast v; }
	@:from @:noCompletion public static inline function fromStruct(v:B3MotorJointDefStruct):B3MotorJointDef { return new B3MotorJointDef(v); }
	@:to @:noCompletion public static inline function toStruct(v:B3MotorJointDef):B3MotorJointDefStruct { return cast v; }
	@:to @:noCompletion public static inline function autoToPointer(v:B3MotorJointDef):cpp.RawPointer<B3MotorJointDefNative> { return v.toPointer(); }

	public static inline function allocNativeArray(size:Int):cpp.Pointer<B3MotorJointDefNative> {
		return size > 0 ? cast cpp.NativeGc.allocGcBytes(cpp.Stdlib.sizeof(B3MotorJointDefNative) * size) : null;
	}
}


@:keep @:structAccess @:include("linc_box3d.h") @:native("b3FilterJointDef")
extern class B3FilterJointDefNative {
	public var base:B3JointDefNative;
	public inline function toPointer():cpp.RawPointer<B3FilterJointDefNative> {
		return cpp.RawPointer.addressOf(cast this);
	}
}
@:keep @:include("linc_box3d.h") @:native("cpp.Reference<b3FilterJointDef>")
extern class B3FilterJointDefRef extends B3FilterJointDefNative {}
@:keep @:include("linc_box3d.h") @:native("cpp.Struct<b3FilterJointDef>")
extern class B3FilterJointDefStruct extends B3FilterJointDefRef {}

@:forward() @:transitive
abstract B3FilterJointDef(B3FilterJointDefStruct) from B3FilterJointDefStruct to B3FilterJointDefStruct {
	overload extern public inline function new() { this = untyped __cpp__("b3FilterJointDef()"); }
	overload extern public inline function new(v:B3FilterJointDefStruct) { this = v; }
	overload extern public inline function new(v:B3FilterJointDefNative) { this = cast v; }

	@:from @:noCompletion public static inline function fromNative(v:B3FilterJointDefNative):B3FilterJointDef { return new B3FilterJointDef(v); }
	@:to @:noCompletion public static inline function toNative(v:B3FilterJointDef):B3FilterJointDefNative { return cast v; }
	@:from @:noCompletion public static inline function fromStruct(v:B3FilterJointDefStruct):B3FilterJointDef { return new B3FilterJointDef(v); }
	@:to @:noCompletion public static inline function toStruct(v:B3FilterJointDef):B3FilterJointDefStruct { return cast v; }
	@:to @:noCompletion public static inline function autoToPointer(v:B3FilterJointDef):cpp.RawPointer<B3FilterJointDefNative> { return v.toPointer(); }

	public static inline function allocNativeArray(size:Int):cpp.Pointer<B3FilterJointDefNative> {
		return size > 0 ? cast cpp.NativeGc.allocGcBytes(cpp.Stdlib.sizeof(B3FilterJointDefNative) * size) : null;
	}
}


@:keep @:structAccess @:include("linc_box3d.h") @:native("b3ParallelJointDef")
extern class B3ParallelJointDefNative {
	public var base:B3JointDefNative;
	public var hertz:cpp.Float32;
	public var dampingRatio:cpp.Float32;
	public var maxTorque:cpp.Float32;
	public inline function toPointer():cpp.RawPointer<B3ParallelJointDefNative> {
		return cpp.RawPointer.addressOf(cast this);
	}
}
@:keep @:include("linc_box3d.h") @:native("cpp.Reference<b3ParallelJointDef>")
extern class B3ParallelJointDefRef extends B3ParallelJointDefNative {}
@:keep @:include("linc_box3d.h") @:native("cpp.Struct<b3ParallelJointDef>")
extern class B3ParallelJointDefStruct extends B3ParallelJointDefRef {}

@:forward() @:transitive
abstract B3ParallelJointDef(B3ParallelJointDefStruct) from B3ParallelJointDefStruct to B3ParallelJointDefStruct {
	overload extern public inline function new() { this = untyped __cpp__("b3ParallelJointDef()"); }
	overload extern public inline function new(v:B3ParallelJointDefStruct) { this = v; }
	overload extern public inline function new(v:B3ParallelJointDefNative) { this = cast v; }

	@:from @:noCompletion public static inline function fromNative(v:B3ParallelJointDefNative):B3ParallelJointDef { return new B3ParallelJointDef(v); }
	@:to @:noCompletion public static inline function toNative(v:B3ParallelJointDef):B3ParallelJointDefNative { return cast v; }
	@:from @:noCompletion public static inline function fromStruct(v:B3ParallelJointDefStruct):B3ParallelJointDef { return new B3ParallelJointDef(v); }
	@:to @:noCompletion public static inline function toStruct(v:B3ParallelJointDef):B3ParallelJointDefStruct { return cast v; }
	@:to @:noCompletion public static inline function autoToPointer(v:B3ParallelJointDef):cpp.RawPointer<B3ParallelJointDefNative> { return v.toPointer(); }

	public static inline function allocNativeArray(size:Int):cpp.Pointer<B3ParallelJointDefNative> {
		return size > 0 ? cast cpp.NativeGc.allocGcBytes(cpp.Stdlib.sizeof(B3ParallelJointDefNative) * size) : null;
	}
}


@:keep @:structAccess @:include("linc_box3d.h") @:native("b3PrismaticJointDef")
extern class B3PrismaticJointDefNative {
	public var base:B3JointDefNative;
	public var enableSpring:Bool;
	public var hertz:cpp.Float32;
	public var dampingRatio:cpp.Float32;
	public var targetTranslation:cpp.Float32;
	public var enableLimit:Bool;
	public var lowerTranslation:cpp.Float32;
	public var upperTranslation:cpp.Float32;
	public var enableMotor:Bool;
	public var maxMotorForce:cpp.Float32;
	public var motorSpeed:cpp.Float32;
	public inline function toPointer():cpp.RawPointer<B3PrismaticJointDefNative> {
		return cpp.RawPointer.addressOf(cast this);
	}
}
@:keep @:include("linc_box3d.h") @:native("cpp.Reference<b3PrismaticJointDef>")
extern class B3PrismaticJointDefRef extends B3PrismaticJointDefNative {}
@:keep @:include("linc_box3d.h") @:native("cpp.Struct<b3PrismaticJointDef>")
extern class B3PrismaticJointDefStruct extends B3PrismaticJointDefRef {}

@:forward() @:transitive
abstract B3PrismaticJointDef(B3PrismaticJointDefStruct) from B3PrismaticJointDefStruct to B3PrismaticJointDefStruct {
	overload extern public inline function new() { this = untyped __cpp__("b3PrismaticJointDef()"); }
	overload extern public inline function new(v:B3PrismaticJointDefStruct) { this = v; }
	overload extern public inline function new(v:B3PrismaticJointDefNative) { this = cast v; }

	@:from @:noCompletion public static inline function fromNative(v:B3PrismaticJointDefNative):B3PrismaticJointDef { return new B3PrismaticJointDef(v); }
	@:to @:noCompletion public static inline function toNative(v:B3PrismaticJointDef):B3PrismaticJointDefNative { return cast v; }
	@:from @:noCompletion public static inline function fromStruct(v:B3PrismaticJointDefStruct):B3PrismaticJointDef { return new B3PrismaticJointDef(v); }
	@:to @:noCompletion public static inline function toStruct(v:B3PrismaticJointDef):B3PrismaticJointDefStruct { return cast v; }
	@:to @:noCompletion public static inline function autoToPointer(v:B3PrismaticJointDef):cpp.RawPointer<B3PrismaticJointDefNative> { return v.toPointer(); }

	public static inline function allocNativeArray(size:Int):cpp.Pointer<B3PrismaticJointDefNative> {
		return size > 0 ? cast cpp.NativeGc.allocGcBytes(cpp.Stdlib.sizeof(B3PrismaticJointDefNative) * size) : null;
	}
}


@:keep @:structAccess @:include("linc_box3d.h") @:native("b3RevoluteJointDef")
extern class B3RevoluteJointDefNative {
	public var base:B3JointDefNative;
	public var targetAngle:cpp.Float32;
	public var enableSpring:Bool;
	public var hertz:cpp.Float32;
	public var dampingRatio:cpp.Float32;
	public var enableLimit:Bool;
	public var lowerAngle:cpp.Float32;
	public var upperAngle:cpp.Float32;
	public var enableMotor:Bool;
	public var maxMotorTorque:cpp.Float32;
	public var motorSpeed:cpp.Float32;
	public inline function toPointer():cpp.RawPointer<B3RevoluteJointDefNative> {
		return cpp.RawPointer.addressOf(cast this);
	}
}
@:keep @:include("linc_box3d.h") @:native("cpp.Reference<b3RevoluteJointDef>")
extern class B3RevoluteJointDefRef extends B3RevoluteJointDefNative {}
@:keep @:include("linc_box3d.h") @:native("cpp.Struct<b3RevoluteJointDef>")
extern class B3RevoluteJointDefStruct extends B3RevoluteJointDefRef {}

@:forward() @:transitive
abstract B3RevoluteJointDef(B3RevoluteJointDefStruct) from B3RevoluteJointDefStruct to B3RevoluteJointDefStruct {
	overload extern public inline function new() { this = untyped __cpp__("b3RevoluteJointDef()"); }
	overload extern public inline function new(v:B3RevoluteJointDefStruct) { this = v; }
	overload extern public inline function new(v:B3RevoluteJointDefNative) { this = cast v; }

	@:from @:noCompletion public static inline function fromNative(v:B3RevoluteJointDefNative):B3RevoluteJointDef { return new B3RevoluteJointDef(v); }
	@:to @:noCompletion public static inline function toNative(v:B3RevoluteJointDef):B3RevoluteJointDefNative { return cast v; }
	@:from @:noCompletion public static inline function fromStruct(v:B3RevoluteJointDefStruct):B3RevoluteJointDef { return new B3RevoluteJointDef(v); }
	@:to @:noCompletion public static inline function toStruct(v:B3RevoluteJointDef):B3RevoluteJointDefStruct { return cast v; }
	@:to @:noCompletion public static inline function autoToPointer(v:B3RevoluteJointDef):cpp.RawPointer<B3RevoluteJointDefNative> { return v.toPointer(); }

	public static inline function allocNativeArray(size:Int):cpp.Pointer<B3RevoluteJointDefNative> {
		return size > 0 ? cast cpp.NativeGc.allocGcBytes(cpp.Stdlib.sizeof(B3RevoluteJointDefNative) * size) : null;
	}
}


@:keep @:structAccess @:include("linc_box3d.h") @:native("b3SphericalJointDef")
extern class B3SphericalJointDefNative {
	public var base:B3JointDefNative;
	public var enableSpring:Bool;
	public var hertz:cpp.Float32;
	public var dampingRatio:cpp.Float32;
	public var targetRotation:B3QuatNative;
	public var enableConeLimit:Bool;
	public var coneAngle:cpp.Float32;
	public var enableTwistLimit:Bool;
	public var lowerTwistAngle:cpp.Float32;
	public var upperTwistAngle:cpp.Float32;
	public var enableMotor:Bool;
	public var maxMotorTorque:cpp.Float32;
	public var motorVelocity:B3Vec3Native;
	public inline function toPointer():cpp.RawPointer<B3SphericalJointDefNative> {
		return cpp.RawPointer.addressOf(cast this);
	}
}
@:keep @:include("linc_box3d.h") @:native("cpp.Reference<b3SphericalJointDef>")
extern class B3SphericalJointDefRef extends B3SphericalJointDefNative {}
@:keep @:include("linc_box3d.h") @:native("cpp.Struct<b3SphericalJointDef>")
extern class B3SphericalJointDefStruct extends B3SphericalJointDefRef {}

@:forward() @:transitive
abstract B3SphericalJointDef(B3SphericalJointDefStruct) from B3SphericalJointDefStruct to B3SphericalJointDefStruct {
	overload extern public inline function new() { this = untyped __cpp__("b3SphericalJointDef()"); }
	overload extern public inline function new(v:B3SphericalJointDefStruct) { this = v; }
	overload extern public inline function new(v:B3SphericalJointDefNative) { this = cast v; }

	@:from @:noCompletion public static inline function fromNative(v:B3SphericalJointDefNative):B3SphericalJointDef { return new B3SphericalJointDef(v); }
	@:to @:noCompletion public static inline function toNative(v:B3SphericalJointDef):B3SphericalJointDefNative { return cast v; }
	@:from @:noCompletion public static inline function fromStruct(v:B3SphericalJointDefStruct):B3SphericalJointDef { return new B3SphericalJointDef(v); }
	@:to @:noCompletion public static inline function toStruct(v:B3SphericalJointDef):B3SphericalJointDefStruct { return cast v; }
	@:to @:noCompletion public static inline function autoToPointer(v:B3SphericalJointDef):cpp.RawPointer<B3SphericalJointDefNative> { return v.toPointer(); }

	public static inline function allocNativeArray(size:Int):cpp.Pointer<B3SphericalJointDefNative> {
		return size > 0 ? cast cpp.NativeGc.allocGcBytes(cpp.Stdlib.sizeof(B3SphericalJointDefNative) * size) : null;
	}
}


@:keep @:structAccess @:include("linc_box3d.h") @:native("b3WeldJointDef")
extern class B3WeldJointDefNative {
	public var base:B3JointDefNative;
	public var linearHertz:cpp.Float32;
	public var angularHertz:cpp.Float32;
	public var linearDampingRatio:cpp.Float32;
	public var angularDampingRatio:cpp.Float32;
	public inline function toPointer():cpp.RawPointer<B3WeldJointDefNative> {
		return cpp.RawPointer.addressOf(cast this);
	}
}
@:keep @:include("linc_box3d.h") @:native("cpp.Reference<b3WeldJointDef>")
extern class B3WeldJointDefRef extends B3WeldJointDefNative {}
@:keep @:include("linc_box3d.h") @:native("cpp.Struct<b3WeldJointDef>")
extern class B3WeldJointDefStruct extends B3WeldJointDefRef {}

@:forward() @:transitive
abstract B3WeldJointDef(B3WeldJointDefStruct) from B3WeldJointDefStruct to B3WeldJointDefStruct {
	overload extern public inline function new() { this = untyped __cpp__("b3WeldJointDef()"); }
	overload extern public inline function new(v:B3WeldJointDefStruct) { this = v; }
	overload extern public inline function new(v:B3WeldJointDefNative) { this = cast v; }

	@:from @:noCompletion public static inline function fromNative(v:B3WeldJointDefNative):B3WeldJointDef { return new B3WeldJointDef(v); }
	@:to @:noCompletion public static inline function toNative(v:B3WeldJointDef):B3WeldJointDefNative { return cast v; }
	@:from @:noCompletion public static inline function fromStruct(v:B3WeldJointDefStruct):B3WeldJointDef { return new B3WeldJointDef(v); }
	@:to @:noCompletion public static inline function toStruct(v:B3WeldJointDef):B3WeldJointDefStruct { return cast v; }
	@:to @:noCompletion public static inline function autoToPointer(v:B3WeldJointDef):cpp.RawPointer<B3WeldJointDefNative> { return v.toPointer(); }

	public static inline function allocNativeArray(size:Int):cpp.Pointer<B3WeldJointDefNative> {
		return size > 0 ? cast cpp.NativeGc.allocGcBytes(cpp.Stdlib.sizeof(B3WeldJointDefNative) * size) : null;
	}
}


@:keep @:structAccess @:include("linc_box3d.h") @:native("b3WheelJointDef")
extern class B3WheelJointDefNative {
	public var base:B3JointDefNative;
	public var enableSuspensionSpring:Bool;
	public var suspensionHertz:cpp.Float32;
	public var suspensionDampingRatio:cpp.Float32;
	public var enableSuspensionLimit:Bool;
	public var lowerSuspensionLimit:cpp.Float32;
	public var upperSuspensionLimit:cpp.Float32;
	public var enableSpinMotor:Bool;
	public var maxSpinTorque:cpp.Float32;
	public var spinSpeed:cpp.Float32;
	public var enableSteering:Bool;
	public var steeringHertz:cpp.Float32;
	public var steeringDampingRatio:cpp.Float32;
	public var targetSteeringAngle:cpp.Float32;
	public var maxSteeringTorque:cpp.Float32;
	public var enableSteeringLimit:Bool;
	public var lowerSteeringLimit:cpp.Float32;
	public var upperSteeringLimit:cpp.Float32;
	public inline function toPointer():cpp.RawPointer<B3WheelJointDefNative> {
		return cpp.RawPointer.addressOf(cast this);
	}
}
@:keep @:include("linc_box3d.h") @:native("cpp.Reference<b3WheelJointDef>")
extern class B3WheelJointDefRef extends B3WheelJointDefNative {}
@:keep @:include("linc_box3d.h") @:native("cpp.Struct<b3WheelJointDef>")
extern class B3WheelJointDefStruct extends B3WheelJointDefRef {}

@:forward() @:transitive
abstract B3WheelJointDef(B3WheelJointDefStruct) from B3WheelJointDefStruct to B3WheelJointDefStruct {
	overload extern public inline function new() { this = untyped __cpp__("b3WheelJointDef()"); }
	overload extern public inline function new(v:B3WheelJointDefStruct) { this = v; }
	overload extern public inline function new(v:B3WheelJointDefNative) { this = cast v; }

	@:from @:noCompletion public static inline function fromNative(v:B3WheelJointDefNative):B3WheelJointDef { return new B3WheelJointDef(v); }
	@:to @:noCompletion public static inline function toNative(v:B3WheelJointDef):B3WheelJointDefNative { return cast v; }
	@:from @:noCompletion public static inline function fromStruct(v:B3WheelJointDefStruct):B3WheelJointDef { return new B3WheelJointDef(v); }
	@:to @:noCompletion public static inline function toStruct(v:B3WheelJointDef):B3WheelJointDefStruct { return cast v; }
	@:to @:noCompletion public static inline function autoToPointer(v:B3WheelJointDef):cpp.RawPointer<B3WheelJointDefNative> { return v.toPointer(); }

	public static inline function allocNativeArray(size:Int):cpp.Pointer<B3WheelJointDefNative> {
		return size > 0 ? cast cpp.NativeGc.allocGcBytes(cpp.Stdlib.sizeof(B3WheelJointDefNative) * size) : null;
	}
}


@:keep @:structAccess @:include("linc_box3d.h") @:native("b3ExplosionDef")
extern class B3ExplosionDefNative {
	public var maskBits:cpp.UInt64;
	public var position:B3PosNative;
	public var radius:cpp.Float32;
	public var falloff:cpp.Float32;
	public var impulsePerArea:cpp.Float32;
	public inline function toPointer():cpp.RawPointer<B3ExplosionDefNative> {
		return cpp.RawPointer.addressOf(cast this);
	}
}
@:keep @:include("linc_box3d.h") @:native("cpp.Reference<b3ExplosionDef>")
extern class B3ExplosionDefRef extends B3ExplosionDefNative {}
@:keep @:include("linc_box3d.h") @:native("cpp.Struct<b3ExplosionDef>")
extern class B3ExplosionDefStruct extends B3ExplosionDefRef {}

@:forward() @:transitive
abstract B3ExplosionDef(B3ExplosionDefStruct) from B3ExplosionDefStruct to B3ExplosionDefStruct {
	overload extern public inline function new() { this = untyped __cpp__("b3ExplosionDef()"); }
	overload extern public inline function new(v:B3ExplosionDefStruct) { this = v; }
	overload extern public inline function new(v:B3ExplosionDefNative) { this = cast v; }

	@:from @:noCompletion public static inline function fromNative(v:B3ExplosionDefNative):B3ExplosionDef { return new B3ExplosionDef(v); }
	@:to @:noCompletion public static inline function toNative(v:B3ExplosionDef):B3ExplosionDefNative { return cast v; }
	@:from @:noCompletion public static inline function fromStruct(v:B3ExplosionDefStruct):B3ExplosionDef { return new B3ExplosionDef(v); }
	@:to @:noCompletion public static inline function toStruct(v:B3ExplosionDef):B3ExplosionDefStruct { return cast v; }
	@:to @:noCompletion public static inline function autoToPointer(v:B3ExplosionDef):cpp.RawPointer<B3ExplosionDefNative> { return v.toPointer(); }

	public static inline function allocNativeArray(size:Int):cpp.Pointer<B3ExplosionDefNative> {
		return size > 0 ? cast cpp.NativeGc.allocGcBytes(cpp.Stdlib.sizeof(B3ExplosionDefNative) * size) : null;
	}
}


@:keep @:structAccess @:include("linc_box3d.h") @:native("b3SensorBeginTouchEvent")
extern class B3SensorBeginTouchEventNative {
	public var sensorShapeId:B3ShapeIdNative;
	public var visitorShapeId:B3ShapeIdNative;
	public inline function toPointer():cpp.RawPointer<B3SensorBeginTouchEventNative> {
		return cpp.RawPointer.addressOf(cast this);
	}
}
@:keep @:include("linc_box3d.h") @:native("cpp.Reference<b3SensorBeginTouchEvent>")
extern class B3SensorBeginTouchEventRef extends B3SensorBeginTouchEventNative {}
@:keep @:include("linc_box3d.h") @:native("cpp.Struct<b3SensorBeginTouchEvent>")
extern class B3SensorBeginTouchEventStruct extends B3SensorBeginTouchEventRef {}

@:forward() @:transitive
abstract B3SensorBeginTouchEvent(B3SensorBeginTouchEventStruct) from B3SensorBeginTouchEventStruct to B3SensorBeginTouchEventStruct {
	overload extern public inline function new() { this = untyped __cpp__("b3SensorBeginTouchEvent()"); }
	overload extern public inline function new(v:B3SensorBeginTouchEventStruct) { this = v; }
	overload extern public inline function new(v:B3SensorBeginTouchEventNative) { this = cast v; }

	@:from @:noCompletion public static inline function fromNative(v:B3SensorBeginTouchEventNative):B3SensorBeginTouchEvent { return new B3SensorBeginTouchEvent(v); }
	@:to @:noCompletion public static inline function toNative(v:B3SensorBeginTouchEvent):B3SensorBeginTouchEventNative { return cast v; }
	@:from @:noCompletion public static inline function fromStruct(v:B3SensorBeginTouchEventStruct):B3SensorBeginTouchEvent { return new B3SensorBeginTouchEvent(v); }
	@:to @:noCompletion public static inline function toStruct(v:B3SensorBeginTouchEvent):B3SensorBeginTouchEventStruct { return cast v; }
	@:to @:noCompletion public static inline function autoToPointer(v:B3SensorBeginTouchEvent):cpp.RawPointer<B3SensorBeginTouchEventNative> { return v.toPointer(); }

	public static inline function allocNativeArray(size:Int):cpp.Pointer<B3SensorBeginTouchEventNative> {
		return size > 0 ? cast cpp.NativeGc.allocGcBytes(cpp.Stdlib.sizeof(B3SensorBeginTouchEventNative) * size) : null;
	}
}


@:keep @:structAccess @:include("linc_box3d.h") @:native("b3SensorEndTouchEvent")
extern class B3SensorEndTouchEventNative {
	public var sensorShapeId:B3ShapeIdNative;
	public var visitorShapeId:B3ShapeIdNative;
	public inline function toPointer():cpp.RawPointer<B3SensorEndTouchEventNative> {
		return cpp.RawPointer.addressOf(cast this);
	}
}
@:keep @:include("linc_box3d.h") @:native("cpp.Reference<b3SensorEndTouchEvent>")
extern class B3SensorEndTouchEventRef extends B3SensorEndTouchEventNative {}
@:keep @:include("linc_box3d.h") @:native("cpp.Struct<b3SensorEndTouchEvent>")
extern class B3SensorEndTouchEventStruct extends B3SensorEndTouchEventRef {}

@:forward() @:transitive
abstract B3SensorEndTouchEvent(B3SensorEndTouchEventStruct) from B3SensorEndTouchEventStruct to B3SensorEndTouchEventStruct {
	overload extern public inline function new() { this = untyped __cpp__("b3SensorEndTouchEvent()"); }
	overload extern public inline function new(v:B3SensorEndTouchEventStruct) { this = v; }
	overload extern public inline function new(v:B3SensorEndTouchEventNative) { this = cast v; }

	@:from @:noCompletion public static inline function fromNative(v:B3SensorEndTouchEventNative):B3SensorEndTouchEvent { return new B3SensorEndTouchEvent(v); }
	@:to @:noCompletion public static inline function toNative(v:B3SensorEndTouchEvent):B3SensorEndTouchEventNative { return cast v; }
	@:from @:noCompletion public static inline function fromStruct(v:B3SensorEndTouchEventStruct):B3SensorEndTouchEvent { return new B3SensorEndTouchEvent(v); }
	@:to @:noCompletion public static inline function toStruct(v:B3SensorEndTouchEvent):B3SensorEndTouchEventStruct { return cast v; }
	@:to @:noCompletion public static inline function autoToPointer(v:B3SensorEndTouchEvent):cpp.RawPointer<B3SensorEndTouchEventNative> { return v.toPointer(); }

	public static inline function allocNativeArray(size:Int):cpp.Pointer<B3SensorEndTouchEventNative> {
		return size > 0 ? cast cpp.NativeGc.allocGcBytes(cpp.Stdlib.sizeof(B3SensorEndTouchEventNative) * size) : null;
	}
}


@:keep @:structAccess @:include("linc_box3d.h") @:native("b3SensorEvents")
extern class B3SensorEventsNative {
	public var beginEvents:cpp.RawPointer<B3SensorBeginTouchEventNative>;
	public var endEvents:cpp.RawPointer<B3SensorEndTouchEventNative>;
	public var beginCount:Int;
	public var endCount:Int;
	public inline function toPointer():cpp.RawPointer<B3SensorEventsNative> {
		return cpp.RawPointer.addressOf(cast this);
	}
}
@:keep @:include("linc_box3d.h") @:native("cpp.Reference<b3SensorEvents>")
extern class B3SensorEventsRef extends B3SensorEventsNative {}
@:keep @:include("linc_box3d.h") @:native("cpp.Struct<b3SensorEvents>")
extern class B3SensorEventsStruct extends B3SensorEventsRef {}

@:forward() @:transitive
abstract B3SensorEvents(B3SensorEventsStruct) from B3SensorEventsStruct to B3SensorEventsStruct {
	overload extern public inline function new() { this = untyped __cpp__("b3SensorEvents()"); }
	overload extern public inline function new(v:B3SensorEventsStruct) { this = v; }
	overload extern public inline function new(v:B3SensorEventsNative) { this = cast v; }

	@:from @:noCompletion public static inline function fromNative(v:B3SensorEventsNative):B3SensorEvents { return new B3SensorEvents(v); }
	@:to @:noCompletion public static inline function toNative(v:B3SensorEvents):B3SensorEventsNative { return cast v; }
	@:from @:noCompletion public static inline function fromStruct(v:B3SensorEventsStruct):B3SensorEvents { return new B3SensorEvents(v); }
	@:to @:noCompletion public static inline function toStruct(v:B3SensorEvents):B3SensorEventsStruct { return cast v; }
	@:to @:noCompletion public static inline function autoToPointer(v:B3SensorEvents):cpp.RawPointer<B3SensorEventsNative> { return v.toPointer(); }

	public static inline function allocNativeArray(size:Int):cpp.Pointer<B3SensorEventsNative> {
		return size > 0 ? cast cpp.NativeGc.allocGcBytes(cpp.Stdlib.sizeof(B3SensorEventsNative) * size) : null;
	}
}


@:keep @:structAccess @:include("linc_box3d.h") @:native("b3ContactBeginTouchEvent")
extern class B3ContactBeginTouchEventNative {
	public var shapeIdA:B3ShapeIdNative;
	public var shapeIdB:B3ShapeIdNative;
	public var contactId:B3ContactIdNative;
	public inline function toPointer():cpp.RawPointer<B3ContactBeginTouchEventNative> {
		return cpp.RawPointer.addressOf(cast this);
	}
}
@:keep @:include("linc_box3d.h") @:native("cpp.Reference<b3ContactBeginTouchEvent>")
extern class B3ContactBeginTouchEventRef extends B3ContactBeginTouchEventNative {}
@:keep @:include("linc_box3d.h") @:native("cpp.Struct<b3ContactBeginTouchEvent>")
extern class B3ContactBeginTouchEventStruct extends B3ContactBeginTouchEventRef {}

@:forward() @:transitive
abstract B3ContactBeginTouchEvent(B3ContactBeginTouchEventStruct) from B3ContactBeginTouchEventStruct to B3ContactBeginTouchEventStruct {
	overload extern public inline function new() { this = untyped __cpp__("b3ContactBeginTouchEvent()"); }
	overload extern public inline function new(v:B3ContactBeginTouchEventStruct) { this = v; }
	overload extern public inline function new(v:B3ContactBeginTouchEventNative) { this = cast v; }

	@:from @:noCompletion public static inline function fromNative(v:B3ContactBeginTouchEventNative):B3ContactBeginTouchEvent { return new B3ContactBeginTouchEvent(v); }
	@:to @:noCompletion public static inline function toNative(v:B3ContactBeginTouchEvent):B3ContactBeginTouchEventNative { return cast v; }
	@:from @:noCompletion public static inline function fromStruct(v:B3ContactBeginTouchEventStruct):B3ContactBeginTouchEvent { return new B3ContactBeginTouchEvent(v); }
	@:to @:noCompletion public static inline function toStruct(v:B3ContactBeginTouchEvent):B3ContactBeginTouchEventStruct { return cast v; }
	@:to @:noCompletion public static inline function autoToPointer(v:B3ContactBeginTouchEvent):cpp.RawPointer<B3ContactBeginTouchEventNative> { return v.toPointer(); }

	public static inline function allocNativeArray(size:Int):cpp.Pointer<B3ContactBeginTouchEventNative> {
		return size > 0 ? cast cpp.NativeGc.allocGcBytes(cpp.Stdlib.sizeof(B3ContactBeginTouchEventNative) * size) : null;
	}
}


@:keep @:structAccess @:include("linc_box3d.h") @:native("b3ContactEndTouchEvent")
extern class B3ContactEndTouchEventNative {
	public var shapeIdA:B3ShapeIdNative;
	public var shapeIdB:B3ShapeIdNative;
	public var contactId:B3ContactIdNative;
	public inline function toPointer():cpp.RawPointer<B3ContactEndTouchEventNative> {
		return cpp.RawPointer.addressOf(cast this);
	}
}
@:keep @:include("linc_box3d.h") @:native("cpp.Reference<b3ContactEndTouchEvent>")
extern class B3ContactEndTouchEventRef extends B3ContactEndTouchEventNative {}
@:keep @:include("linc_box3d.h") @:native("cpp.Struct<b3ContactEndTouchEvent>")
extern class B3ContactEndTouchEventStruct extends B3ContactEndTouchEventRef {}

@:forward() @:transitive
abstract B3ContactEndTouchEvent(B3ContactEndTouchEventStruct) from B3ContactEndTouchEventStruct to B3ContactEndTouchEventStruct {
	overload extern public inline function new() { this = untyped __cpp__("b3ContactEndTouchEvent()"); }
	overload extern public inline function new(v:B3ContactEndTouchEventStruct) { this = v; }
	overload extern public inline function new(v:B3ContactEndTouchEventNative) { this = cast v; }

	@:from @:noCompletion public static inline function fromNative(v:B3ContactEndTouchEventNative):B3ContactEndTouchEvent { return new B3ContactEndTouchEvent(v); }
	@:to @:noCompletion public static inline function toNative(v:B3ContactEndTouchEvent):B3ContactEndTouchEventNative { return cast v; }
	@:from @:noCompletion public static inline function fromStruct(v:B3ContactEndTouchEventStruct):B3ContactEndTouchEvent { return new B3ContactEndTouchEvent(v); }
	@:to @:noCompletion public static inline function toStruct(v:B3ContactEndTouchEvent):B3ContactEndTouchEventStruct { return cast v; }
	@:to @:noCompletion public static inline function autoToPointer(v:B3ContactEndTouchEvent):cpp.RawPointer<B3ContactEndTouchEventNative> { return v.toPointer(); }

	public static inline function allocNativeArray(size:Int):cpp.Pointer<B3ContactEndTouchEventNative> {
		return size > 0 ? cast cpp.NativeGc.allocGcBytes(cpp.Stdlib.sizeof(B3ContactEndTouchEventNative) * size) : null;
	}
}


@:keep @:structAccess @:include("linc_box3d.h") @:native("b3ContactHitEvent")
extern class B3ContactHitEventNative {
	public var shapeIdA:B3ShapeIdNative;
	public var shapeIdB:B3ShapeIdNative;
	public var contactId:B3ContactIdNative;
	public var point:B3PosNative;
	public var normal:B3Vec3Native;
	public var approachSpeed:cpp.Float32;
	public var userMaterialIdA:cpp.UInt64;
	public var userMaterialIdB:cpp.UInt64;
	public inline function toPointer():cpp.RawPointer<B3ContactHitEventNative> {
		return cpp.RawPointer.addressOf(cast this);
	}
}
@:keep @:include("linc_box3d.h") @:native("cpp.Reference<b3ContactHitEvent>")
extern class B3ContactHitEventRef extends B3ContactHitEventNative {}
@:keep @:include("linc_box3d.h") @:native("cpp.Struct<b3ContactHitEvent>")
extern class B3ContactHitEventStruct extends B3ContactHitEventRef {}

@:forward() @:transitive
abstract B3ContactHitEvent(B3ContactHitEventStruct) from B3ContactHitEventStruct to B3ContactHitEventStruct {
	overload extern public inline function new() { this = untyped __cpp__("b3ContactHitEvent()"); }
	overload extern public inline function new(v:B3ContactHitEventStruct) { this = v; }
	overload extern public inline function new(v:B3ContactHitEventNative) { this = cast v; }

	@:from @:noCompletion public static inline function fromNative(v:B3ContactHitEventNative):B3ContactHitEvent { return new B3ContactHitEvent(v); }
	@:to @:noCompletion public static inline function toNative(v:B3ContactHitEvent):B3ContactHitEventNative { return cast v; }
	@:from @:noCompletion public static inline function fromStruct(v:B3ContactHitEventStruct):B3ContactHitEvent { return new B3ContactHitEvent(v); }
	@:to @:noCompletion public static inline function toStruct(v:B3ContactHitEvent):B3ContactHitEventStruct { return cast v; }
	@:to @:noCompletion public static inline function autoToPointer(v:B3ContactHitEvent):cpp.RawPointer<B3ContactHitEventNative> { return v.toPointer(); }

	public static inline function allocNativeArray(size:Int):cpp.Pointer<B3ContactHitEventNative> {
		return size > 0 ? cast cpp.NativeGc.allocGcBytes(cpp.Stdlib.sizeof(B3ContactHitEventNative) * size) : null;
	}
}


@:keep @:structAccess @:include("linc_box3d.h") @:native("b3ContactEvents")
extern class B3ContactEventsNative {
	public var beginEvents:cpp.RawPointer<B3ContactBeginTouchEventNative>;
	public var endEvents:cpp.RawPointer<B3ContactEndTouchEventNative>;
	public var hitEvents:cpp.RawPointer<B3ContactHitEventNative>;
	public var beginCount:Int;
	public var endCount:Int;
	public var hitCount:Int;
	public inline function toPointer():cpp.RawPointer<B3ContactEventsNative> {
		return cpp.RawPointer.addressOf(cast this);
	}
}
@:keep @:include("linc_box3d.h") @:native("cpp.Reference<b3ContactEvents>")
extern class B3ContactEventsRef extends B3ContactEventsNative {}
@:keep @:include("linc_box3d.h") @:native("cpp.Struct<b3ContactEvents>")
extern class B3ContactEventsStruct extends B3ContactEventsRef {}

@:forward() @:transitive
abstract B3ContactEvents(B3ContactEventsStruct) from B3ContactEventsStruct to B3ContactEventsStruct {
	overload extern public inline function new() { this = untyped __cpp__("b3ContactEvents()"); }
	overload extern public inline function new(v:B3ContactEventsStruct) { this = v; }
	overload extern public inline function new(v:B3ContactEventsNative) { this = cast v; }

	@:from @:noCompletion public static inline function fromNative(v:B3ContactEventsNative):B3ContactEvents { return new B3ContactEvents(v); }
	@:to @:noCompletion public static inline function toNative(v:B3ContactEvents):B3ContactEventsNative { return cast v; }
	@:from @:noCompletion public static inline function fromStruct(v:B3ContactEventsStruct):B3ContactEvents { return new B3ContactEvents(v); }
	@:to @:noCompletion public static inline function toStruct(v:B3ContactEvents):B3ContactEventsStruct { return cast v; }
	@:to @:noCompletion public static inline function autoToPointer(v:B3ContactEvents):cpp.RawPointer<B3ContactEventsNative> { return v.toPointer(); }

	public static inline function allocNativeArray(size:Int):cpp.Pointer<B3ContactEventsNative> {
		return size > 0 ? cast cpp.NativeGc.allocGcBytes(cpp.Stdlib.sizeof(B3ContactEventsNative) * size) : null;
	}
}


@:keep @:structAccess @:include("linc_box3d.h") @:native("b3BodyMoveEvent")
extern class B3BodyMoveEventNative {
	public var userData:cpp.RawPointer<Void>;
	public var transform:B3WorldTransformNative;
	public var bodyId:B3BodyIdNative;
	public var fellAsleep:Bool;
	public inline function toPointer():cpp.RawPointer<B3BodyMoveEventNative> {
		return cpp.RawPointer.addressOf(cast this);
	}
}
@:keep @:include("linc_box3d.h") @:native("cpp.Reference<b3BodyMoveEvent>")
extern class B3BodyMoveEventRef extends B3BodyMoveEventNative {}
@:keep @:include("linc_box3d.h") @:native("cpp.Struct<b3BodyMoveEvent>")
extern class B3BodyMoveEventStruct extends B3BodyMoveEventRef {}

@:forward() @:transitive
abstract B3BodyMoveEvent(B3BodyMoveEventStruct) from B3BodyMoveEventStruct to B3BodyMoveEventStruct {
	overload extern public inline function new() { this = untyped __cpp__("b3BodyMoveEvent()"); }
	overload extern public inline function new(v:B3BodyMoveEventStruct) { this = v; }
	overload extern public inline function new(v:B3BodyMoveEventNative) { this = cast v; }

	@:from @:noCompletion public static inline function fromNative(v:B3BodyMoveEventNative):B3BodyMoveEvent { return new B3BodyMoveEvent(v); }
	@:to @:noCompletion public static inline function toNative(v:B3BodyMoveEvent):B3BodyMoveEventNative { return cast v; }
	@:from @:noCompletion public static inline function fromStruct(v:B3BodyMoveEventStruct):B3BodyMoveEvent { return new B3BodyMoveEvent(v); }
	@:to @:noCompletion public static inline function toStruct(v:B3BodyMoveEvent):B3BodyMoveEventStruct { return cast v; }
	@:to @:noCompletion public static inline function autoToPointer(v:B3BodyMoveEvent):cpp.RawPointer<B3BodyMoveEventNative> { return v.toPointer(); }

	public static inline function allocNativeArray(size:Int):cpp.Pointer<B3BodyMoveEventNative> {
		return size > 0 ? cast cpp.NativeGc.allocGcBytes(cpp.Stdlib.sizeof(B3BodyMoveEventNative) * size) : null;
	}
}


@:keep @:structAccess @:include("linc_box3d.h") @:native("b3BodyEvents")
extern class B3BodyEventsNative {
	public var moveEvents:cpp.RawPointer<B3BodyMoveEventNative>;
	public var moveCount:Int;
	public inline function toPointer():cpp.RawPointer<B3BodyEventsNative> {
		return cpp.RawPointer.addressOf(cast this);
	}
}
@:keep @:include("linc_box3d.h") @:native("cpp.Reference<b3BodyEvents>")
extern class B3BodyEventsRef extends B3BodyEventsNative {}
@:keep @:include("linc_box3d.h") @:native("cpp.Struct<b3BodyEvents>")
extern class B3BodyEventsStruct extends B3BodyEventsRef {}

@:forward() @:transitive
abstract B3BodyEvents(B3BodyEventsStruct) from B3BodyEventsStruct to B3BodyEventsStruct {
	overload extern public inline function new() { this = untyped __cpp__("b3BodyEvents()"); }
	overload extern public inline function new(v:B3BodyEventsStruct) { this = v; }
	overload extern public inline function new(v:B3BodyEventsNative) { this = cast v; }

	@:from @:noCompletion public static inline function fromNative(v:B3BodyEventsNative):B3BodyEvents { return new B3BodyEvents(v); }
	@:to @:noCompletion public static inline function toNative(v:B3BodyEvents):B3BodyEventsNative { return cast v; }
	@:from @:noCompletion public static inline function fromStruct(v:B3BodyEventsStruct):B3BodyEvents { return new B3BodyEvents(v); }
	@:to @:noCompletion public static inline function toStruct(v:B3BodyEvents):B3BodyEventsStruct { return cast v; }
	@:to @:noCompletion public static inline function autoToPointer(v:B3BodyEvents):cpp.RawPointer<B3BodyEventsNative> { return v.toPointer(); }

	public static inline function allocNativeArray(size:Int):cpp.Pointer<B3BodyEventsNative> {
		return size > 0 ? cast cpp.NativeGc.allocGcBytes(cpp.Stdlib.sizeof(B3BodyEventsNative) * size) : null;
	}
}


@:keep @:structAccess @:include("linc_box3d.h") @:native("b3JointEvent")
extern class B3JointEventNative {
	public var jointId:B3JointIdNative;
	public var userData:cpp.RawPointer<Void>;
	public inline function toPointer():cpp.RawPointer<B3JointEventNative> {
		return cpp.RawPointer.addressOf(cast this);
	}
}
@:keep @:include("linc_box3d.h") @:native("cpp.Reference<b3JointEvent>")
extern class B3JointEventRef extends B3JointEventNative {}
@:keep @:include("linc_box3d.h") @:native("cpp.Struct<b3JointEvent>")
extern class B3JointEventStruct extends B3JointEventRef {}

@:forward() @:transitive
abstract B3JointEvent(B3JointEventStruct) from B3JointEventStruct to B3JointEventStruct {
	overload extern public inline function new() { this = untyped __cpp__("b3JointEvent()"); }
	overload extern public inline function new(v:B3JointEventStruct) { this = v; }
	overload extern public inline function new(v:B3JointEventNative) { this = cast v; }

	@:from @:noCompletion public static inline function fromNative(v:B3JointEventNative):B3JointEvent { return new B3JointEvent(v); }
	@:to @:noCompletion public static inline function toNative(v:B3JointEvent):B3JointEventNative { return cast v; }
	@:from @:noCompletion public static inline function fromStruct(v:B3JointEventStruct):B3JointEvent { return new B3JointEvent(v); }
	@:to @:noCompletion public static inline function toStruct(v:B3JointEvent):B3JointEventStruct { return cast v; }
	@:to @:noCompletion public static inline function autoToPointer(v:B3JointEvent):cpp.RawPointer<B3JointEventNative> { return v.toPointer(); }

	public static inline function allocNativeArray(size:Int):cpp.Pointer<B3JointEventNative> {
		return size > 0 ? cast cpp.NativeGc.allocGcBytes(cpp.Stdlib.sizeof(B3JointEventNative) * size) : null;
	}
}


@:keep @:structAccess @:include("linc_box3d.h") @:native("b3JointEvents")
extern class B3JointEventsNative {
	public var jointEvents:cpp.RawPointer<B3JointEventNative>;
	public var count:Int;
	public inline function toPointer():cpp.RawPointer<B3JointEventsNative> {
		return cpp.RawPointer.addressOf(cast this);
	}
}
@:keep @:include("linc_box3d.h") @:native("cpp.Reference<b3JointEvents>")
extern class B3JointEventsRef extends B3JointEventsNative {}
@:keep @:include("linc_box3d.h") @:native("cpp.Struct<b3JointEvents>")
extern class B3JointEventsStruct extends B3JointEventsRef {}

@:forward() @:transitive
abstract B3JointEvents(B3JointEventsStruct) from B3JointEventsStruct to B3JointEventsStruct {
	overload extern public inline function new() { this = untyped __cpp__("b3JointEvents()"); }
	overload extern public inline function new(v:B3JointEventsStruct) { this = v; }
	overload extern public inline function new(v:B3JointEventsNative) { this = cast v; }

	@:from @:noCompletion public static inline function fromNative(v:B3JointEventsNative):B3JointEvents { return new B3JointEvents(v); }
	@:to @:noCompletion public static inline function toNative(v:B3JointEvents):B3JointEventsNative { return cast v; }
	@:from @:noCompletion public static inline function fromStruct(v:B3JointEventsStruct):B3JointEvents { return new B3JointEvents(v); }
	@:to @:noCompletion public static inline function toStruct(v:B3JointEvents):B3JointEventsStruct { return cast v; }
	@:to @:noCompletion public static inline function autoToPointer(v:B3JointEvents):cpp.RawPointer<B3JointEventsNative> { return v.toPointer(); }

	public static inline function allocNativeArray(size:Int):cpp.Pointer<B3JointEventsNative> {
		return size > 0 ? cast cpp.NativeGc.allocGcBytes(cpp.Stdlib.sizeof(B3JointEventsNative) * size) : null;
	}
}


@:keep @:structAccess @:include("linc_box3d.h") @:native("b3ContactData")
extern class B3ContactDataNative {
	public var contactId:B3ContactIdNative;
	public var shapeIdA:B3ShapeIdNative;
	public var shapeIdB:B3ShapeIdNative;
	public var manifolds:cpp.RawConstPointer<B3ManifoldNative>;
	public var manifoldCount:Int;
	public inline function toPointer():cpp.RawPointer<B3ContactDataNative> {
		return cpp.RawPointer.addressOf(cast this);
	}
}
@:keep @:include("linc_box3d.h") @:native("cpp.Reference<b3ContactData>")
extern class B3ContactDataRef extends B3ContactDataNative {}
@:keep @:include("linc_box3d.h") @:native("cpp.Struct<b3ContactData>")
extern class B3ContactDataStruct extends B3ContactDataRef {}

@:forward() @:transitive
abstract B3ContactData(B3ContactDataStruct) from B3ContactDataStruct to B3ContactDataStruct {
	overload extern public inline function new() { this = untyped __cpp__("b3ContactData()"); }
	overload extern public inline function new(v:B3ContactDataStruct) { this = v; }
	overload extern public inline function new(v:B3ContactDataNative) { this = cast v; }

	@:from @:noCompletion public static inline function fromNative(v:B3ContactDataNative):B3ContactData { return new B3ContactData(v); }
	@:to @:noCompletion public static inline function toNative(v:B3ContactData):B3ContactDataNative { return cast v; }
	@:from @:noCompletion public static inline function fromStruct(v:B3ContactDataStruct):B3ContactData { return new B3ContactData(v); }
	@:to @:noCompletion public static inline function toStruct(v:B3ContactData):B3ContactDataStruct { return cast v; }
	@:to @:noCompletion public static inline function autoToPointer(v:B3ContactData):cpp.RawPointer<B3ContactDataNative> { return v.toPointer(); }

	public static inline function allocNativeArray(size:Int):cpp.Pointer<B3ContactDataNative> {
		return size > 0 ? cast cpp.NativeGc.allocGcBytes(cpp.Stdlib.sizeof(B3ContactDataNative) * size) : null;
	}
}


@:keep @:structAccess @:include("linc_box3d.h") @:native("b3QueryFilter")
extern class B3QueryFilterNative {
	public var categoryBits:cpp.UInt64;
	public var maskBits:cpp.UInt64;
	public var id:cpp.UInt64;
	public var name:cpp.ConstCharStar;
	public inline function toPointer():cpp.RawPointer<B3QueryFilterNative> {
		return cpp.RawPointer.addressOf(cast this);
	}
}
@:keep @:include("linc_box3d.h") @:native("cpp.Reference<b3QueryFilter>")
extern class B3QueryFilterRef extends B3QueryFilterNative {}
@:keep @:include("linc_box3d.h") @:native("cpp.Struct<b3QueryFilter>")
extern class B3QueryFilterStruct extends B3QueryFilterRef {}

@:forward() @:transitive
abstract B3QueryFilter(B3QueryFilterStruct) from B3QueryFilterStruct to B3QueryFilterStruct {
	overload extern public inline function new() { this = untyped __cpp__("b3QueryFilter()"); }
	overload extern public inline function new(v:B3QueryFilterStruct) { this = v; }
	overload extern public inline function new(v:B3QueryFilterNative) { this = cast v; }

	@:from @:noCompletion public static inline function fromNative(v:B3QueryFilterNative):B3QueryFilter { return new B3QueryFilter(v); }
	@:to @:noCompletion public static inline function toNative(v:B3QueryFilter):B3QueryFilterNative { return cast v; }
	@:from @:noCompletion public static inline function fromStruct(v:B3QueryFilterStruct):B3QueryFilter { return new B3QueryFilter(v); }
	@:to @:noCompletion public static inline function toStruct(v:B3QueryFilter):B3QueryFilterStruct { return cast v; }
	@:to @:noCompletion public static inline function autoToPointer(v:B3QueryFilter):cpp.RawPointer<B3QueryFilterNative> { return v.toPointer(); }

	public static inline function allocNativeArray(size:Int):cpp.Pointer<B3QueryFilterNative> {
		return size > 0 ? cast cpp.NativeGc.allocGcBytes(cpp.Stdlib.sizeof(B3QueryFilterNative) * size) : null;
	}
}


@:keep @:structAccess @:include("linc_box3d.h") @:native("b3RayCastInput")
extern class B3RayCastInputNative {
	public var origin:B3Vec3Native;
	public var translation:B3Vec3Native;
	public var maxFraction:cpp.Float32;
	public inline function toPointer():cpp.RawPointer<B3RayCastInputNative> {
		return cpp.RawPointer.addressOf(cast this);
	}
}
@:keep @:include("linc_box3d.h") @:native("cpp.Reference<b3RayCastInput>")
extern class B3RayCastInputRef extends B3RayCastInputNative {}
@:keep @:include("linc_box3d.h") @:native("cpp.Struct<b3RayCastInput>")
extern class B3RayCastInputStruct extends B3RayCastInputRef {}

@:forward() @:transitive
abstract B3RayCastInput(B3RayCastInputStruct) from B3RayCastInputStruct to B3RayCastInputStruct {
	overload extern public inline function new() { this = untyped __cpp__("b3RayCastInput()"); }
	overload extern public inline function new(v:B3RayCastInputStruct) { this = v; }
	overload extern public inline function new(v:B3RayCastInputNative) { this = cast v; }

	@:from @:noCompletion public static inline function fromNative(v:B3RayCastInputNative):B3RayCastInput { return new B3RayCastInput(v); }
	@:to @:noCompletion public static inline function toNative(v:B3RayCastInput):B3RayCastInputNative { return cast v; }
	@:from @:noCompletion public static inline function fromStruct(v:B3RayCastInputStruct):B3RayCastInput { return new B3RayCastInput(v); }
	@:to @:noCompletion public static inline function toStruct(v:B3RayCastInput):B3RayCastInputStruct { return cast v; }
	@:to @:noCompletion public static inline function autoToPointer(v:B3RayCastInput):cpp.RawPointer<B3RayCastInputNative> { return v.toPointer(); }

	public static inline function allocNativeArray(size:Int):cpp.Pointer<B3RayCastInputNative> {
		return size > 0 ? cast cpp.NativeGc.allocGcBytes(cpp.Stdlib.sizeof(B3RayCastInputNative) * size) : null;
	}
}


@:keep @:structAccess @:include("linc_box3d.h") @:native("b3RayResult")
extern class B3RayResultNative {
	public var shapeId:B3ShapeIdNative;
	public var point:B3PosNative;
	public var normal:B3Vec3Native;
	public var userMaterialId:cpp.UInt64;
	public var fraction:cpp.Float32;
	public var triangleIndex:Int;
	public var childIndex:Int;
	public var nodeVisits:Int;
	public var leafVisits:Int;
	public var hit:Bool;
	public inline function toPointer():cpp.RawPointer<B3RayResultNative> {
		return cpp.RawPointer.addressOf(cast this);
	}
}
@:keep @:include("linc_box3d.h") @:native("cpp.Reference<b3RayResult>")
extern class B3RayResultRef extends B3RayResultNative {}
@:keep @:include("linc_box3d.h") @:native("cpp.Struct<b3RayResult>")
extern class B3RayResultStruct extends B3RayResultRef {}

@:forward() @:transitive
abstract B3RayResult(B3RayResultStruct) from B3RayResultStruct to B3RayResultStruct {
	overload extern public inline function new() { this = untyped __cpp__("b3RayResult()"); }
	overload extern public inline function new(v:B3RayResultStruct) { this = v; }
	overload extern public inline function new(v:B3RayResultNative) { this = cast v; }

	@:from @:noCompletion public static inline function fromNative(v:B3RayResultNative):B3RayResult { return new B3RayResult(v); }
	@:to @:noCompletion public static inline function toNative(v:B3RayResult):B3RayResultNative { return cast v; }
	@:from @:noCompletion public static inline function fromStruct(v:B3RayResultStruct):B3RayResult { return new B3RayResult(v); }
	@:to @:noCompletion public static inline function toStruct(v:B3RayResult):B3RayResultStruct { return cast v; }
	@:to @:noCompletion public static inline function autoToPointer(v:B3RayResult):cpp.RawPointer<B3RayResultNative> { return v.toPointer(); }

	public static inline function allocNativeArray(size:Int):cpp.Pointer<B3RayResultNative> {
		return size > 0 ? cast cpp.NativeGc.allocGcBytes(cpp.Stdlib.sizeof(B3RayResultNative) * size) : null;
	}
}


@:keep @:structAccess @:include("linc_box3d.h") @:native("b3ShapeProxy")
extern class B3ShapeProxyNative {
	public var points:cpp.RawConstPointer<B3Vec3Native>;
	public var count:Int;
	public var radius:cpp.Float32;
	public inline function toPointer():cpp.RawPointer<B3ShapeProxyNative> {
		return cpp.RawPointer.addressOf(cast this);
	}
}
@:keep @:include("linc_box3d.h") @:native("cpp.Reference<b3ShapeProxy>")
extern class B3ShapeProxyRef extends B3ShapeProxyNative {}
@:keep @:include("linc_box3d.h") @:native("cpp.Struct<b3ShapeProxy>")
extern class B3ShapeProxyStruct extends B3ShapeProxyRef {}

@:forward() @:transitive
abstract B3ShapeProxy(B3ShapeProxyStruct) from B3ShapeProxyStruct to B3ShapeProxyStruct {
	overload extern public inline function new() { this = untyped __cpp__("b3ShapeProxy()"); }
	overload extern public inline function new(v:B3ShapeProxyStruct) { this = v; }
	overload extern public inline function new(v:B3ShapeProxyNative) { this = cast v; }

	@:from @:noCompletion public static inline function fromNative(v:B3ShapeProxyNative):B3ShapeProxy { return new B3ShapeProxy(v); }
	@:to @:noCompletion public static inline function toNative(v:B3ShapeProxy):B3ShapeProxyNative { return cast v; }
	@:from @:noCompletion public static inline function fromStruct(v:B3ShapeProxyStruct):B3ShapeProxy { return new B3ShapeProxy(v); }
	@:to @:noCompletion public static inline function toStruct(v:B3ShapeProxy):B3ShapeProxyStruct { return cast v; }
	@:to @:noCompletion public static inline function autoToPointer(v:B3ShapeProxy):cpp.RawPointer<B3ShapeProxyNative> { return v.toPointer(); }

	public static inline function allocNativeArray(size:Int):cpp.Pointer<B3ShapeProxyNative> {
		return size > 0 ? cast cpp.NativeGc.allocGcBytes(cpp.Stdlib.sizeof(B3ShapeProxyNative) * size) : null;
	}
}


@:keep @:structAccess @:include("linc_box3d.h") @:native("b3ShapeCastInput")
extern class B3ShapeCastInputNative {
	public var proxy:B3ShapeProxyNative;
	public var translation:B3Vec3Native;
	public var maxFraction:cpp.Float32;
	public var canEncroach:Bool;
	public inline function toPointer():cpp.RawPointer<B3ShapeCastInputNative> {
		return cpp.RawPointer.addressOf(cast this);
	}
}
@:keep @:include("linc_box3d.h") @:native("cpp.Reference<b3ShapeCastInput>")
extern class B3ShapeCastInputRef extends B3ShapeCastInputNative {}
@:keep @:include("linc_box3d.h") @:native("cpp.Struct<b3ShapeCastInput>")
extern class B3ShapeCastInputStruct extends B3ShapeCastInputRef {}

@:forward() @:transitive
abstract B3ShapeCastInput(B3ShapeCastInputStruct) from B3ShapeCastInputStruct to B3ShapeCastInputStruct {
	overload extern public inline function new() { this = untyped __cpp__("b3ShapeCastInput()"); }
	overload extern public inline function new(v:B3ShapeCastInputStruct) { this = v; }
	overload extern public inline function new(v:B3ShapeCastInputNative) { this = cast v; }

	@:from @:noCompletion public static inline function fromNative(v:B3ShapeCastInputNative):B3ShapeCastInput { return new B3ShapeCastInput(v); }
	@:to @:noCompletion public static inline function toNative(v:B3ShapeCastInput):B3ShapeCastInputNative { return cast v; }
	@:from @:noCompletion public static inline function fromStruct(v:B3ShapeCastInputStruct):B3ShapeCastInput { return new B3ShapeCastInput(v); }
	@:to @:noCompletion public static inline function toStruct(v:B3ShapeCastInput):B3ShapeCastInputStruct { return cast v; }
	@:to @:noCompletion public static inline function autoToPointer(v:B3ShapeCastInput):cpp.RawPointer<B3ShapeCastInputNative> { return v.toPointer(); }

	public static inline function allocNativeArray(size:Int):cpp.Pointer<B3ShapeCastInputNative> {
		return size > 0 ? cast cpp.NativeGc.allocGcBytes(cpp.Stdlib.sizeof(B3ShapeCastInputNative) * size) : null;
	}
}


@:keep @:structAccess @:include("linc_box3d.h") @:native("b3BoxCastInput")
extern class B3BoxCastInputNative {
	public var box:B3AABBNative;
	public var translation:B3Vec3Native;
	public var maxFraction:cpp.Float32;
	public inline function toPointer():cpp.RawPointer<B3BoxCastInputNative> {
		return cpp.RawPointer.addressOf(cast this);
	}
}
@:keep @:include("linc_box3d.h") @:native("cpp.Reference<b3BoxCastInput>")
extern class B3BoxCastInputRef extends B3BoxCastInputNative {}
@:keep @:include("linc_box3d.h") @:native("cpp.Struct<b3BoxCastInput>")
extern class B3BoxCastInputStruct extends B3BoxCastInputRef {}

@:forward() @:transitive
abstract B3BoxCastInput(B3BoxCastInputStruct) from B3BoxCastInputStruct to B3BoxCastInputStruct {
	overload extern public inline function new() { this = untyped __cpp__("b3BoxCastInput()"); }
	overload extern public inline function new(v:B3BoxCastInputStruct) { this = v; }
	overload extern public inline function new(v:B3BoxCastInputNative) { this = cast v; }

	@:from @:noCompletion public static inline function fromNative(v:B3BoxCastInputNative):B3BoxCastInput { return new B3BoxCastInput(v); }
	@:to @:noCompletion public static inline function toNative(v:B3BoxCastInput):B3BoxCastInputNative { return cast v; }
	@:from @:noCompletion public static inline function fromStruct(v:B3BoxCastInputStruct):B3BoxCastInput { return new B3BoxCastInput(v); }
	@:to @:noCompletion public static inline function toStruct(v:B3BoxCastInput):B3BoxCastInputStruct { return cast v; }
	@:to @:noCompletion public static inline function autoToPointer(v:B3BoxCastInput):cpp.RawPointer<B3BoxCastInputNative> { return v.toPointer(); }

	public static inline function allocNativeArray(size:Int):cpp.Pointer<B3BoxCastInputNative> {
		return size > 0 ? cast cpp.NativeGc.allocGcBytes(cpp.Stdlib.sizeof(B3BoxCastInputNative) * size) : null;
	}
}


@:keep @:structAccess @:include("linc_box3d.h") @:native("b3BodyCastResult")
extern class B3BodyCastResultNative {
	public var shapeId:B3ShapeIdNative;
	public var point:B3PosNative;
	public var normal:B3Vec3Native;
	public var fraction:cpp.Float32;
	public var triangleIndex:Int;
	public var userMaterialId:cpp.UInt64;
	public var iterations:Int;
	public var hit:Bool;
	public inline function toPointer():cpp.RawPointer<B3BodyCastResultNative> {
		return cpp.RawPointer.addressOf(cast this);
	}
}
@:keep @:include("linc_box3d.h") @:native("cpp.Reference<b3BodyCastResult>")
extern class B3BodyCastResultRef extends B3BodyCastResultNative {}
@:keep @:include("linc_box3d.h") @:native("cpp.Struct<b3BodyCastResult>")
extern class B3BodyCastResultStruct extends B3BodyCastResultRef {}

@:forward() @:transitive
abstract B3BodyCastResult(B3BodyCastResultStruct) from B3BodyCastResultStruct to B3BodyCastResultStruct {
	overload extern public inline function new() { this = untyped __cpp__("b3BodyCastResult()"); }
	overload extern public inline function new(v:B3BodyCastResultStruct) { this = v; }
	overload extern public inline function new(v:B3BodyCastResultNative) { this = cast v; }

	@:from @:noCompletion public static inline function fromNative(v:B3BodyCastResultNative):B3BodyCastResult { return new B3BodyCastResult(v); }
	@:to @:noCompletion public static inline function toNative(v:B3BodyCastResult):B3BodyCastResultNative { return cast v; }
	@:from @:noCompletion public static inline function fromStruct(v:B3BodyCastResultStruct):B3BodyCastResult { return new B3BodyCastResult(v); }
	@:to @:noCompletion public static inline function toStruct(v:B3BodyCastResult):B3BodyCastResultStruct { return cast v; }
	@:to @:noCompletion public static inline function autoToPointer(v:B3BodyCastResult):cpp.RawPointer<B3BodyCastResultNative> { return v.toPointer(); }

	public static inline function allocNativeArray(size:Int):cpp.Pointer<B3BodyCastResultNative> {
		return size > 0 ? cast cpp.NativeGc.allocGcBytes(cpp.Stdlib.sizeof(B3BodyCastResultNative) * size) : null;
	}
}


@:keep @:structAccess @:include("linc_box3d.h") @:native("b3SimplexCache")
extern class B3SimplexCacheNative {
	public var metric:cpp.Float32;
	public var count:cpp.UInt16;
	public var indexA:cpp.RawPointer<cpp.UInt8>;
	public var indexB:cpp.RawPointer<cpp.UInt8>;
	public inline function toPointer():cpp.RawPointer<B3SimplexCacheNative> {
		return cpp.RawPointer.addressOf(cast this);
	}
}
@:keep @:include("linc_box3d.h") @:native("cpp.Reference<b3SimplexCache>")
extern class B3SimplexCacheRef extends B3SimplexCacheNative {}
@:keep @:include("linc_box3d.h") @:native("cpp.Struct<b3SimplexCache>")
extern class B3SimplexCacheStruct extends B3SimplexCacheRef {}

@:forward() @:transitive
abstract B3SimplexCache(B3SimplexCacheStruct) from B3SimplexCacheStruct to B3SimplexCacheStruct {
	overload extern public inline function new() { this = untyped __cpp__("b3SimplexCache()"); }
	overload extern public inline function new(v:B3SimplexCacheStruct) { this = v; }
	overload extern public inline function new(v:B3SimplexCacheNative) { this = cast v; }

	@:from @:noCompletion public static inline function fromNative(v:B3SimplexCacheNative):B3SimplexCache { return new B3SimplexCache(v); }
	@:to @:noCompletion public static inline function toNative(v:B3SimplexCache):B3SimplexCacheNative { return cast v; }
	@:from @:noCompletion public static inline function fromStruct(v:B3SimplexCacheStruct):B3SimplexCache { return new B3SimplexCache(v); }
	@:to @:noCompletion public static inline function toStruct(v:B3SimplexCache):B3SimplexCacheStruct { return cast v; }
	@:to @:noCompletion public static inline function autoToPointer(v:B3SimplexCache):cpp.RawPointer<B3SimplexCacheNative> { return v.toPointer(); }

	public static inline function allocNativeArray(size:Int):cpp.Pointer<B3SimplexCacheNative> {
		return size > 0 ? cast cpp.NativeGc.allocGcBytes(cpp.Stdlib.sizeof(B3SimplexCacheNative) * size) : null;
	}
}


@:keep @:structAccess @:include("linc_box3d.h") @:native("b3ShapeCastPairInput")
extern class B3ShapeCastPairInputNative {
	public var proxyA:B3ShapeProxyNative;
	public var proxyB:B3ShapeProxyNative;
	public var transform:B3TransformNative;
	public var translationB:B3Vec3Native;
	public var maxFraction:cpp.Float32;
	public var canEncroach:Bool;
	public inline function toPointer():cpp.RawPointer<B3ShapeCastPairInputNative> {
		return cpp.RawPointer.addressOf(cast this);
	}
}
@:keep @:include("linc_box3d.h") @:native("cpp.Reference<b3ShapeCastPairInput>")
extern class B3ShapeCastPairInputRef extends B3ShapeCastPairInputNative {}
@:keep @:include("linc_box3d.h") @:native("cpp.Struct<b3ShapeCastPairInput>")
extern class B3ShapeCastPairInputStruct extends B3ShapeCastPairInputRef {}

@:forward() @:transitive
abstract B3ShapeCastPairInput(B3ShapeCastPairInputStruct) from B3ShapeCastPairInputStruct to B3ShapeCastPairInputStruct {
	overload extern public inline function new() { this = untyped __cpp__("b3ShapeCastPairInput()"); }
	overload extern public inline function new(v:B3ShapeCastPairInputStruct) { this = v; }
	overload extern public inline function new(v:B3ShapeCastPairInputNative) { this = cast v; }

	@:from @:noCompletion public static inline function fromNative(v:B3ShapeCastPairInputNative):B3ShapeCastPairInput { return new B3ShapeCastPairInput(v); }
	@:to @:noCompletion public static inline function toNative(v:B3ShapeCastPairInput):B3ShapeCastPairInputNative { return cast v; }
	@:from @:noCompletion public static inline function fromStruct(v:B3ShapeCastPairInputStruct):B3ShapeCastPairInput { return new B3ShapeCastPairInput(v); }
	@:to @:noCompletion public static inline function toStruct(v:B3ShapeCastPairInput):B3ShapeCastPairInputStruct { return cast v; }
	@:to @:noCompletion public static inline function autoToPointer(v:B3ShapeCastPairInput):cpp.RawPointer<B3ShapeCastPairInputNative> { return v.toPointer(); }

	public static inline function allocNativeArray(size:Int):cpp.Pointer<B3ShapeCastPairInputNative> {
		return size > 0 ? cast cpp.NativeGc.allocGcBytes(cpp.Stdlib.sizeof(B3ShapeCastPairInputNative) * size) : null;
	}
}


@:keep @:structAccess @:include("linc_box3d.h") @:native("b3DistanceInput")
extern class B3DistanceInputNative {
	public var proxyA:B3ShapeProxyNative;
	public var proxyB:B3ShapeProxyNative;
	public var transform:B3TransformNative;
	public var useRadii:Bool;
	public inline function toPointer():cpp.RawPointer<B3DistanceInputNative> {
		return cpp.RawPointer.addressOf(cast this);
	}
}
@:keep @:include("linc_box3d.h") @:native("cpp.Reference<b3DistanceInput>")
extern class B3DistanceInputRef extends B3DistanceInputNative {}
@:keep @:include("linc_box3d.h") @:native("cpp.Struct<b3DistanceInput>")
extern class B3DistanceInputStruct extends B3DistanceInputRef {}

@:forward() @:transitive
abstract B3DistanceInput(B3DistanceInputStruct) from B3DistanceInputStruct to B3DistanceInputStruct {
	overload extern public inline function new() { this = untyped __cpp__("b3DistanceInput()"); }
	overload extern public inline function new(v:B3DistanceInputStruct) { this = v; }
	overload extern public inline function new(v:B3DistanceInputNative) { this = cast v; }

	@:from @:noCompletion public static inline function fromNative(v:B3DistanceInputNative):B3DistanceInput { return new B3DistanceInput(v); }
	@:to @:noCompletion public static inline function toNative(v:B3DistanceInput):B3DistanceInputNative { return cast v; }
	@:from @:noCompletion public static inline function fromStruct(v:B3DistanceInputStruct):B3DistanceInput { return new B3DistanceInput(v); }
	@:to @:noCompletion public static inline function toStruct(v:B3DistanceInput):B3DistanceInputStruct { return cast v; }
	@:to @:noCompletion public static inline function autoToPointer(v:B3DistanceInput):cpp.RawPointer<B3DistanceInputNative> { return v.toPointer(); }

	public static inline function allocNativeArray(size:Int):cpp.Pointer<B3DistanceInputNative> {
		return size > 0 ? cast cpp.NativeGc.allocGcBytes(cpp.Stdlib.sizeof(B3DistanceInputNative) * size) : null;
	}
}


@:keep @:structAccess @:include("linc_box3d.h") @:native("b3DistanceOutput")
extern class B3DistanceOutputNative {
	public var pointA:B3Vec3Native;
	public var pointB:B3Vec3Native;
	public var normal:B3Vec3Native;
	public var distance:cpp.Float32;
	public var iterations:Int;
	public var simplexCount:Int;
	public inline function toPointer():cpp.RawPointer<B3DistanceOutputNative> {
		return cpp.RawPointer.addressOf(cast this);
	}
}
@:keep @:include("linc_box3d.h") @:native("cpp.Reference<b3DistanceOutput>")
extern class B3DistanceOutputRef extends B3DistanceOutputNative {}
@:keep @:include("linc_box3d.h") @:native("cpp.Struct<b3DistanceOutput>")
extern class B3DistanceOutputStruct extends B3DistanceOutputRef {}

@:forward() @:transitive
abstract B3DistanceOutput(B3DistanceOutputStruct) from B3DistanceOutputStruct to B3DistanceOutputStruct {
	overload extern public inline function new() { this = untyped __cpp__("b3DistanceOutput()"); }
	overload extern public inline function new(v:B3DistanceOutputStruct) { this = v; }
	overload extern public inline function new(v:B3DistanceOutputNative) { this = cast v; }

	@:from @:noCompletion public static inline function fromNative(v:B3DistanceOutputNative):B3DistanceOutput { return new B3DistanceOutput(v); }
	@:to @:noCompletion public static inline function toNative(v:B3DistanceOutput):B3DistanceOutputNative { return cast v; }
	@:from @:noCompletion public static inline function fromStruct(v:B3DistanceOutputStruct):B3DistanceOutput { return new B3DistanceOutput(v); }
	@:to @:noCompletion public static inline function toStruct(v:B3DistanceOutput):B3DistanceOutputStruct { return cast v; }
	@:to @:noCompletion public static inline function autoToPointer(v:B3DistanceOutput):cpp.RawPointer<B3DistanceOutputNative> { return v.toPointer(); }

	public static inline function allocNativeArray(size:Int):cpp.Pointer<B3DistanceOutputNative> {
		return size > 0 ? cast cpp.NativeGc.allocGcBytes(cpp.Stdlib.sizeof(B3DistanceOutputNative) * size) : null;
	}
}


@:keep @:structAccess @:include("linc_box3d.h") @:native("b3SimplexVertex")
extern class B3SimplexVertexNative {
	public var wA:B3Vec3Native;
	public var wB:B3Vec3Native;
	public var w:B3Vec3Native;
	public var a:cpp.Float32;
	public var indexA:Int;
	public var indexB:Int;
	public inline function toPointer():cpp.RawPointer<B3SimplexVertexNative> {
		return cpp.RawPointer.addressOf(cast this);
	}
}
@:keep @:include("linc_box3d.h") @:native("cpp.Reference<b3SimplexVertex>")
extern class B3SimplexVertexRef extends B3SimplexVertexNative {}
@:keep @:include("linc_box3d.h") @:native("cpp.Struct<b3SimplexVertex>")
extern class B3SimplexVertexStruct extends B3SimplexVertexRef {}

@:forward() @:transitive
abstract B3SimplexVertex(B3SimplexVertexStruct) from B3SimplexVertexStruct to B3SimplexVertexStruct {
	overload extern public inline function new() { this = untyped __cpp__("b3SimplexVertex()"); }
	overload extern public inline function new(v:B3SimplexVertexStruct) { this = v; }
	overload extern public inline function new(v:B3SimplexVertexNative) { this = cast v; }

	@:from @:noCompletion public static inline function fromNative(v:B3SimplexVertexNative):B3SimplexVertex { return new B3SimplexVertex(v); }
	@:to @:noCompletion public static inline function toNative(v:B3SimplexVertex):B3SimplexVertexNative { return cast v; }
	@:from @:noCompletion public static inline function fromStruct(v:B3SimplexVertexStruct):B3SimplexVertex { return new B3SimplexVertex(v); }
	@:to @:noCompletion public static inline function toStruct(v:B3SimplexVertex):B3SimplexVertexStruct { return cast v; }
	@:to @:noCompletion public static inline function autoToPointer(v:B3SimplexVertex):cpp.RawPointer<B3SimplexVertexNative> { return v.toPointer(); }

	public static inline function allocNativeArray(size:Int):cpp.Pointer<B3SimplexVertexNative> {
		return size > 0 ? cast cpp.NativeGc.allocGcBytes(cpp.Stdlib.sizeof(B3SimplexVertexNative) * size) : null;
	}
}


@:keep @:structAccess @:include("linc_box3d.h") @:native("b3Simplex")
extern class B3SimplexNative {
	public var vertices:cpp.RawPointer<B3SimplexVertexNative>;
	public var count:Int;
	public inline function toPointer():cpp.RawPointer<B3SimplexNative> {
		return cpp.RawPointer.addressOf(cast this);
	}
}
@:keep @:include("linc_box3d.h") @:native("cpp.Reference<b3Simplex>")
extern class B3SimplexRef extends B3SimplexNative {}
@:keep @:include("linc_box3d.h") @:native("cpp.Struct<b3Simplex>")
extern class B3SimplexStruct extends B3SimplexRef {}

@:forward() @:transitive
abstract B3Simplex(B3SimplexStruct) from B3SimplexStruct to B3SimplexStruct {
	overload extern public inline function new() { this = untyped __cpp__("b3Simplex()"); }
	overload extern public inline function new(v:B3SimplexStruct) { this = v; }
	overload extern public inline function new(v:B3SimplexNative) { this = cast v; }

	@:from @:noCompletion public static inline function fromNative(v:B3SimplexNative):B3Simplex { return new B3Simplex(v); }
	@:to @:noCompletion public static inline function toNative(v:B3Simplex):B3SimplexNative { return cast v; }
	@:from @:noCompletion public static inline function fromStruct(v:B3SimplexStruct):B3Simplex { return new B3Simplex(v); }
	@:to @:noCompletion public static inline function toStruct(v:B3Simplex):B3SimplexStruct { return cast v; }
	@:to @:noCompletion public static inline function autoToPointer(v:B3Simplex):cpp.RawPointer<B3SimplexNative> { return v.toPointer(); }

	public static inline function allocNativeArray(size:Int):cpp.Pointer<B3SimplexNative> {
		return size > 0 ? cast cpp.NativeGc.allocGcBytes(cpp.Stdlib.sizeof(B3SimplexNative) * size) : null;
	}
}


@:keep @:structAccess @:include("linc_box3d.h") @:native("b3Sweep")
extern class B3SweepNative {
	public var localCenter:B3Vec3Native;
	public var c1:B3Vec3Native;
	public var c2:B3Vec3Native;
	public var q1:B3QuatNative;
	public var q2:B3QuatNative;
	public inline function toPointer():cpp.RawPointer<B3SweepNative> {
		return cpp.RawPointer.addressOf(cast this);
	}
}
@:keep @:include("linc_box3d.h") @:native("cpp.Reference<b3Sweep>")
extern class B3SweepRef extends B3SweepNative {}
@:keep @:include("linc_box3d.h") @:native("cpp.Struct<b3Sweep>")
extern class B3SweepStruct extends B3SweepRef {}

@:forward() @:transitive
abstract B3Sweep(B3SweepStruct) from B3SweepStruct to B3SweepStruct {
	overload extern public inline function new() { this = untyped __cpp__("b3Sweep()"); }
	overload extern public inline function new(v:B3SweepStruct) { this = v; }
	overload extern public inline function new(v:B3SweepNative) { this = cast v; }

	@:from @:noCompletion public static inline function fromNative(v:B3SweepNative):B3Sweep { return new B3Sweep(v); }
	@:to @:noCompletion public static inline function toNative(v:B3Sweep):B3SweepNative { return cast v; }
	@:from @:noCompletion public static inline function fromStruct(v:B3SweepStruct):B3Sweep { return new B3Sweep(v); }
	@:to @:noCompletion public static inline function toStruct(v:B3Sweep):B3SweepStruct { return cast v; }
	@:to @:noCompletion public static inline function autoToPointer(v:B3Sweep):cpp.RawPointer<B3SweepNative> { return v.toPointer(); }

	public static inline function allocNativeArray(size:Int):cpp.Pointer<B3SweepNative> {
		return size > 0 ? cast cpp.NativeGc.allocGcBytes(cpp.Stdlib.sizeof(B3SweepNative) * size) : null;
	}
}


@:keep @:structAccess @:include("linc_box3d.h") @:native("b3TOIInput")
extern class B3TOIInputNative {
	public var proxyA:B3ShapeProxyNative;
	public var proxyB:B3ShapeProxyNative;
	public var sweepA:B3SweepNative;
	public var sweepB:B3SweepNative;
	public var maxFraction:cpp.Float32;
	public inline function toPointer():cpp.RawPointer<B3TOIInputNative> {
		return cpp.RawPointer.addressOf(cast this);
	}
}
@:keep @:include("linc_box3d.h") @:native("cpp.Reference<b3TOIInput>")
extern class B3TOIInputRef extends B3TOIInputNative {}
@:keep @:include("linc_box3d.h") @:native("cpp.Struct<b3TOIInput>")
extern class B3TOIInputStruct extends B3TOIInputRef {}

@:forward() @:transitive
abstract B3TOIInput(B3TOIInputStruct) from B3TOIInputStruct to B3TOIInputStruct {
	overload extern public inline function new() { this = untyped __cpp__("b3TOIInput()"); }
	overload extern public inline function new(v:B3TOIInputStruct) { this = v; }
	overload extern public inline function new(v:B3TOIInputNative) { this = cast v; }

	@:from @:noCompletion public static inline function fromNative(v:B3TOIInputNative):B3TOIInput { return new B3TOIInput(v); }
	@:to @:noCompletion public static inline function toNative(v:B3TOIInput):B3TOIInputNative { return cast v; }
	@:from @:noCompletion public static inline function fromStruct(v:B3TOIInputStruct):B3TOIInput { return new B3TOIInput(v); }
	@:to @:noCompletion public static inline function toStruct(v:B3TOIInput):B3TOIInputStruct { return cast v; }
	@:to @:noCompletion public static inline function autoToPointer(v:B3TOIInput):cpp.RawPointer<B3TOIInputNative> { return v.toPointer(); }

	public static inline function allocNativeArray(size:Int):cpp.Pointer<B3TOIInputNative> {
		return size > 0 ? cast cpp.NativeGc.allocGcBytes(cpp.Stdlib.sizeof(B3TOIInputNative) * size) : null;
	}
}


@:keep @:structAccess @:include("linc_box3d.h") @:native("b3TOIOutput")
extern class B3TOIOutputNative {
	public var state:B3TOIState;
	public var point:B3Vec3Native;
	public var normal:B3Vec3Native;
	public var fraction:cpp.Float32;
	public var distance:cpp.Float32;
	public var distanceIterations:Int;
	public var pushBackIterations:Int;
	public var rootIterations:Int;
	public var usedFallback:Bool;
	public inline function toPointer():cpp.RawPointer<B3TOIOutputNative> {
		return cpp.RawPointer.addressOf(cast this);
	}
}
@:keep @:include("linc_box3d.h") @:native("cpp.Reference<b3TOIOutput>")
extern class B3TOIOutputRef extends B3TOIOutputNative {}
@:keep @:include("linc_box3d.h") @:native("cpp.Struct<b3TOIOutput>")
extern class B3TOIOutputStruct extends B3TOIOutputRef {}

@:forward() @:transitive
abstract B3TOIOutput(B3TOIOutputStruct) from B3TOIOutputStruct to B3TOIOutputStruct {
	overload extern public inline function new() { this = untyped __cpp__("b3TOIOutput()"); }
	overload extern public inline function new(v:B3TOIOutputStruct) { this = v; }
	overload extern public inline function new(v:B3TOIOutputNative) { this = cast v; }

	@:from @:noCompletion public static inline function fromNative(v:B3TOIOutputNative):B3TOIOutput { return new B3TOIOutput(v); }
	@:to @:noCompletion public static inline function toNative(v:B3TOIOutput):B3TOIOutputNative { return cast v; }
	@:from @:noCompletion public static inline function fromStruct(v:B3TOIOutputStruct):B3TOIOutput { return new B3TOIOutput(v); }
	@:to @:noCompletion public static inline function toStruct(v:B3TOIOutput):B3TOIOutputStruct { return cast v; }
	@:to @:noCompletion public static inline function autoToPointer(v:B3TOIOutput):cpp.RawPointer<B3TOIOutputNative> { return v.toPointer(); }

	public static inline function allocNativeArray(size:Int):cpp.Pointer<B3TOIOutputNative> {
		return size > 0 ? cast cpp.NativeGc.allocGcBytes(cpp.Stdlib.sizeof(B3TOIOutputNative) * size) : null;
	}
}


@:keep @:structAccess @:include("linc_box3d.h") @:native("b3TreeNodeChildren")
extern class B3TreeNodeChildrenNative {
	public var child1:Int;
	public var child2:Int;
	public inline function toPointer():cpp.RawPointer<B3TreeNodeChildrenNative> {
		return cpp.RawPointer.addressOf(cast this);
	}
}
@:keep @:include("linc_box3d.h") @:native("cpp.Reference<b3TreeNodeChildren>")
extern class B3TreeNodeChildrenRef extends B3TreeNodeChildrenNative {}
@:keep @:include("linc_box3d.h") @:native("cpp.Struct<b3TreeNodeChildren>")
extern class B3TreeNodeChildrenStruct extends B3TreeNodeChildrenRef {}

@:forward() @:transitive
abstract B3TreeNodeChildren(B3TreeNodeChildrenStruct) from B3TreeNodeChildrenStruct to B3TreeNodeChildrenStruct {
	overload extern public inline function new() { this = untyped __cpp__("b3TreeNodeChildren()"); }
	overload extern public inline function new(v:B3TreeNodeChildrenStruct) { this = v; }
	overload extern public inline function new(v:B3TreeNodeChildrenNative) { this = cast v; }

	@:from @:noCompletion public static inline function fromNative(v:B3TreeNodeChildrenNative):B3TreeNodeChildren { return new B3TreeNodeChildren(v); }
	@:to @:noCompletion public static inline function toNative(v:B3TreeNodeChildren):B3TreeNodeChildrenNative { return cast v; }
	@:from @:noCompletion public static inline function fromStruct(v:B3TreeNodeChildrenStruct):B3TreeNodeChildren { return new B3TreeNodeChildren(v); }
	@:to @:noCompletion public static inline function toStruct(v:B3TreeNodeChildren):B3TreeNodeChildrenStruct { return cast v; }
	@:to @:noCompletion public static inline function autoToPointer(v:B3TreeNodeChildren):cpp.RawPointer<B3TreeNodeChildrenNative> { return v.toPointer(); }

	public static inline function allocNativeArray(size:Int):cpp.Pointer<B3TreeNodeChildrenNative> {
		return size > 0 ? cast cpp.NativeGc.allocGcBytes(cpp.Stdlib.sizeof(B3TreeNodeChildrenNative) * size) : null;
	}
}


@:keep @:structAccess @:include("linc_box3d.h") @:native("b3TreeNode")
extern class B3TreeNodeNative {
	public var aabb:B3AABBNative;
	public var categoryBits:cpp.UInt64;
	public var children:B3TreeNodeChildrenNative;
	public var userData:cpp.UInt64;
	public var parent:Int;
	public var next:Int;
	public var height:cpp.UInt16;
	public var flags:cpp.UInt16;
	public inline function toPointer():cpp.RawPointer<B3TreeNodeNative> {
		return cpp.RawPointer.addressOf(cast this);
	}
}
@:keep @:include("linc_box3d.h") @:native("cpp.Reference<b3TreeNode>")
extern class B3TreeNodeRef extends B3TreeNodeNative {}
@:keep @:include("linc_box3d.h") @:native("cpp.Struct<b3TreeNode>")
extern class B3TreeNodeStruct extends B3TreeNodeRef {}

@:forward() @:transitive
abstract B3TreeNode(B3TreeNodeStruct) from B3TreeNodeStruct to B3TreeNodeStruct {
	overload extern public inline function new() { this = untyped __cpp__("b3TreeNode()"); }
	overload extern public inline function new(v:B3TreeNodeStruct) { this = v; }
	overload extern public inline function new(v:B3TreeNodeNative) { this = cast v; }

	@:from @:noCompletion public static inline function fromNative(v:B3TreeNodeNative):B3TreeNode { return new B3TreeNode(v); }
	@:to @:noCompletion public static inline function toNative(v:B3TreeNode):B3TreeNodeNative { return cast v; }
	@:from @:noCompletion public static inline function fromStruct(v:B3TreeNodeStruct):B3TreeNode { return new B3TreeNode(v); }
	@:to @:noCompletion public static inline function toStruct(v:B3TreeNode):B3TreeNodeStruct { return cast v; }
	@:to @:noCompletion public static inline function autoToPointer(v:B3TreeNode):cpp.RawPointer<B3TreeNodeNative> { return v.toPointer(); }

	public static inline function allocNativeArray(size:Int):cpp.Pointer<B3TreeNodeNative> {
		return size > 0 ? cast cpp.NativeGc.allocGcBytes(cpp.Stdlib.sizeof(B3TreeNodeNative) * size) : null;
	}
}


@:keep @:structAccess @:include("linc_box3d.h") @:native("b3DynamicTree")
extern class B3DynamicTreeNative {
	public var version:cpp.UInt64;
	public var nodes:cpp.RawPointer<B3TreeNodeNative>;
	public var root:Int;
	public var nodeCount:Int;
	public var nodeCapacity:Int;
	public var proxyCount:Int;
	public var freeList:Int;
	public var leafIndices:cpp.RawPointer<Int>;
	public var leafBoxes:cpp.RawPointer<B3AABBNative>;
	public var leafCenters:cpp.RawPointer<B3Vec3Native>;
	public var binIndices:cpp.RawPointer<Int>;
	public var rebuildCapacity:Int;
	public inline function toPointer():cpp.RawPointer<B3DynamicTreeNative> {
		return cpp.RawPointer.addressOf(cast this);
	}
}
@:keep @:include("linc_box3d.h") @:native("cpp.Reference<b3DynamicTree>")
extern class B3DynamicTreeRef extends B3DynamicTreeNative {}
@:keep @:include("linc_box3d.h") @:native("cpp.Struct<b3DynamicTree>")
extern class B3DynamicTreeStruct extends B3DynamicTreeRef {}

@:forward() @:transitive
abstract B3DynamicTree(B3DynamicTreeStruct) from B3DynamicTreeStruct to B3DynamicTreeStruct {
	overload extern public inline function new() { this = untyped __cpp__("b3DynamicTree()"); }
	overload extern public inline function new(v:B3DynamicTreeStruct) { this = v; }
	overload extern public inline function new(v:B3DynamicTreeNative) { this = cast v; }

	@:from @:noCompletion public static inline function fromNative(v:B3DynamicTreeNative):B3DynamicTree { return new B3DynamicTree(v); }
	@:to @:noCompletion public static inline function toNative(v:B3DynamicTree):B3DynamicTreeNative { return cast v; }
	@:from @:noCompletion public static inline function fromStruct(v:B3DynamicTreeStruct):B3DynamicTree { return new B3DynamicTree(v); }
	@:to @:noCompletion public static inline function toStruct(v:B3DynamicTree):B3DynamicTreeStruct { return cast v; }
	@:to @:noCompletion public static inline function autoToPointer(v:B3DynamicTree):cpp.RawPointer<B3DynamicTreeNative> { return v.toPointer(); }

	public static inline function allocNativeArray(size:Int):cpp.Pointer<B3DynamicTreeNative> {
		return size > 0 ? cast cpp.NativeGc.allocGcBytes(cpp.Stdlib.sizeof(B3DynamicTreeNative) * size) : null;
	}
}


@:keep @:structAccess @:include("linc_box3d.h") @:native("b3TreeStats")
extern class B3TreeStatsNative {
	public var nodeVisits:Int;
	public var leafVisits:Int;
	public inline function toPointer():cpp.RawPointer<B3TreeStatsNative> {
		return cpp.RawPointer.addressOf(cast this);
	}
}
@:keep @:include("linc_box3d.h") @:native("cpp.Reference<b3TreeStats>")
extern class B3TreeStatsRef extends B3TreeStatsNative {}
@:keep @:include("linc_box3d.h") @:native("cpp.Struct<b3TreeStats>")
extern class B3TreeStatsStruct extends B3TreeStatsRef {}

@:forward() @:transitive
abstract B3TreeStats(B3TreeStatsStruct) from B3TreeStatsStruct to B3TreeStatsStruct {
	overload extern public inline function new() { this = untyped __cpp__("b3TreeStats()"); }
	overload extern public inline function new(v:B3TreeStatsStruct) { this = v; }
	overload extern public inline function new(v:B3TreeStatsNative) { this = cast v; }

	@:from @:noCompletion public static inline function fromNative(v:B3TreeStatsNative):B3TreeStats { return new B3TreeStats(v); }
	@:to @:noCompletion public static inline function toNative(v:B3TreeStats):B3TreeStatsNative { return cast v; }
	@:from @:noCompletion public static inline function fromStruct(v:B3TreeStatsStruct):B3TreeStats { return new B3TreeStats(v); }
	@:to @:noCompletion public static inline function toStruct(v:B3TreeStats):B3TreeStatsStruct { return cast v; }
	@:to @:noCompletion public static inline function autoToPointer(v:B3TreeStats):cpp.RawPointer<B3TreeStatsNative> { return v.toPointer(); }

	public static inline function allocNativeArray(size:Int):cpp.Pointer<B3TreeStatsNative> {
		return size > 0 ? cast cpp.NativeGc.allocGcBytes(cpp.Stdlib.sizeof(B3TreeStatsNative) * size) : null;
	}
}


@:keep @:structAccess @:include("linc_box3d.h") @:native("b3PlaneResult")
extern class B3PlaneResultNative {
	public var plane:B3PlaneNative;
	public var point:B3Vec3Native;
	public var triangleIndex:Int;
	public var childIndex:Int;
	public var materialIndex:Int;
	public inline function toPointer():cpp.RawPointer<B3PlaneResultNative> {
		return cpp.RawPointer.addressOf(cast this);
	}
}
@:keep @:include("linc_box3d.h") @:native("cpp.Reference<b3PlaneResult>")
extern class B3PlaneResultRef extends B3PlaneResultNative {}
@:keep @:include("linc_box3d.h") @:native("cpp.Struct<b3PlaneResult>")
extern class B3PlaneResultStruct extends B3PlaneResultRef {}

@:forward() @:transitive
abstract B3PlaneResult(B3PlaneResultStruct) from B3PlaneResultStruct to B3PlaneResultStruct {
	overload extern public inline function new() { this = untyped __cpp__("b3PlaneResult()"); }
	overload extern public inline function new(v:B3PlaneResultStruct) { this = v; }
	overload extern public inline function new(v:B3PlaneResultNative) { this = cast v; }

	@:from @:noCompletion public static inline function fromNative(v:B3PlaneResultNative):B3PlaneResult { return new B3PlaneResult(v); }
	@:to @:noCompletion public static inline function toNative(v:B3PlaneResult):B3PlaneResultNative { return cast v; }
	@:from @:noCompletion public static inline function fromStruct(v:B3PlaneResultStruct):B3PlaneResult { return new B3PlaneResult(v); }
	@:to @:noCompletion public static inline function toStruct(v:B3PlaneResult):B3PlaneResultStruct { return cast v; }
	@:to @:noCompletion public static inline function autoToPointer(v:B3PlaneResult):cpp.RawPointer<B3PlaneResultNative> { return v.toPointer(); }

	public static inline function allocNativeArray(size:Int):cpp.Pointer<B3PlaneResultNative> {
		return size > 0 ? cast cpp.NativeGc.allocGcBytes(cpp.Stdlib.sizeof(B3PlaneResultNative) * size) : null;
	}
}


@:keep @:structAccess @:include("linc_box3d.h") @:native("b3CollisionPlane")
extern class B3CollisionPlaneNative {
	public var plane:B3PlaneNative;
	public var pushLimit:cpp.Float32;
	public var push:cpp.Float32;
	public var clipVelocity:Bool;
	public inline function toPointer():cpp.RawPointer<B3CollisionPlaneNative> {
		return cpp.RawPointer.addressOf(cast this);
	}
}
@:keep @:include("linc_box3d.h") @:native("cpp.Reference<b3CollisionPlane>")
extern class B3CollisionPlaneRef extends B3CollisionPlaneNative {}
@:keep @:include("linc_box3d.h") @:native("cpp.Struct<b3CollisionPlane>")
extern class B3CollisionPlaneStruct extends B3CollisionPlaneRef {}

@:forward() @:transitive
abstract B3CollisionPlane(B3CollisionPlaneStruct) from B3CollisionPlaneStruct to B3CollisionPlaneStruct {
	overload extern public inline function new() { this = untyped __cpp__("b3CollisionPlane()"); }
	overload extern public inline function new(v:B3CollisionPlaneStruct) { this = v; }
	overload extern public inline function new(v:B3CollisionPlaneNative) { this = cast v; }

	@:from @:noCompletion public static inline function fromNative(v:B3CollisionPlaneNative):B3CollisionPlane { return new B3CollisionPlane(v); }
	@:to @:noCompletion public static inline function toNative(v:B3CollisionPlane):B3CollisionPlaneNative { return cast v; }
	@:from @:noCompletion public static inline function fromStruct(v:B3CollisionPlaneStruct):B3CollisionPlane { return new B3CollisionPlane(v); }
	@:to @:noCompletion public static inline function toStruct(v:B3CollisionPlane):B3CollisionPlaneStruct { return cast v; }
	@:to @:noCompletion public static inline function autoToPointer(v:B3CollisionPlane):cpp.RawPointer<B3CollisionPlaneNative> { return v.toPointer(); }

	public static inline function allocNativeArray(size:Int):cpp.Pointer<B3CollisionPlaneNative> {
		return size > 0 ? cast cpp.NativeGc.allocGcBytes(cpp.Stdlib.sizeof(B3CollisionPlaneNative) * size) : null;
	}
}


@:keep @:structAccess @:include("linc_box3d.h") @:native("b3PlaneSolverResult")
extern class B3PlaneSolverResultNative {
	public var delta:B3Vec3Native;
	public var iterationCount:Int;
	public inline function toPointer():cpp.RawPointer<B3PlaneSolverResultNative> {
		return cpp.RawPointer.addressOf(cast this);
	}
}
@:keep @:include("linc_box3d.h") @:native("cpp.Reference<b3PlaneSolverResult>")
extern class B3PlaneSolverResultRef extends B3PlaneSolverResultNative {}
@:keep @:include("linc_box3d.h") @:native("cpp.Struct<b3PlaneSolverResult>")
extern class B3PlaneSolverResultStruct extends B3PlaneSolverResultRef {}

@:forward() @:transitive
abstract B3PlaneSolverResult(B3PlaneSolverResultStruct) from B3PlaneSolverResultStruct to B3PlaneSolverResultStruct {
	overload extern public inline function new() { this = untyped __cpp__("b3PlaneSolverResult()"); }
	overload extern public inline function new(v:B3PlaneSolverResultStruct) { this = v; }
	overload extern public inline function new(v:B3PlaneSolverResultNative) { this = cast v; }

	@:from @:noCompletion public static inline function fromNative(v:B3PlaneSolverResultNative):B3PlaneSolverResult { return new B3PlaneSolverResult(v); }
	@:to @:noCompletion public static inline function toNative(v:B3PlaneSolverResult):B3PlaneSolverResultNative { return cast v; }
	@:from @:noCompletion public static inline function fromStruct(v:B3PlaneSolverResultStruct):B3PlaneSolverResult { return new B3PlaneSolverResult(v); }
	@:to @:noCompletion public static inline function toStruct(v:B3PlaneSolverResult):B3PlaneSolverResultStruct { return cast v; }
	@:to @:noCompletion public static inline function autoToPointer(v:B3PlaneSolverResult):cpp.RawPointer<B3PlaneSolverResultNative> { return v.toPointer(); }

	public static inline function allocNativeArray(size:Int):cpp.Pointer<B3PlaneSolverResultNative> {
		return size > 0 ? cast cpp.NativeGc.allocGcBytes(cpp.Stdlib.sizeof(B3PlaneSolverResultNative) * size) : null;
	}
}


@:keep @:structAccess @:include("linc_box3d.h") @:native("b3BodyPlaneResult")
extern class B3BodyPlaneResultNative {
	public var shapeId:B3ShapeIdNative;
	public var result:B3PlaneResultNative;
	public inline function toPointer():cpp.RawPointer<B3BodyPlaneResultNative> {
		return cpp.RawPointer.addressOf(cast this);
	}
}
@:keep @:include("linc_box3d.h") @:native("cpp.Reference<b3BodyPlaneResult>")
extern class B3BodyPlaneResultRef extends B3BodyPlaneResultNative {}
@:keep @:include("linc_box3d.h") @:native("cpp.Struct<b3BodyPlaneResult>")
extern class B3BodyPlaneResultStruct extends B3BodyPlaneResultRef {}

@:forward() @:transitive
abstract B3BodyPlaneResult(B3BodyPlaneResultStruct) from B3BodyPlaneResultStruct to B3BodyPlaneResultStruct {
	overload extern public inline function new() { this = untyped __cpp__("b3BodyPlaneResult()"); }
	overload extern public inline function new(v:B3BodyPlaneResultStruct) { this = v; }
	overload extern public inline function new(v:B3BodyPlaneResultNative) { this = cast v; }

	@:from @:noCompletion public static inline function fromNative(v:B3BodyPlaneResultNative):B3BodyPlaneResult { return new B3BodyPlaneResult(v); }
	@:to @:noCompletion public static inline function toNative(v:B3BodyPlaneResult):B3BodyPlaneResultNative { return cast v; }
	@:from @:noCompletion public static inline function fromStruct(v:B3BodyPlaneResultStruct):B3BodyPlaneResult { return new B3BodyPlaneResult(v); }
	@:to @:noCompletion public static inline function toStruct(v:B3BodyPlaneResult):B3BodyPlaneResultStruct { return cast v; }
	@:to @:noCompletion public static inline function autoToPointer(v:B3BodyPlaneResult):cpp.RawPointer<B3BodyPlaneResultNative> { return v.toPointer(); }

	public static inline function allocNativeArray(size:Int):cpp.Pointer<B3BodyPlaneResultNative> {
		return size > 0 ? cast cpp.NativeGc.allocGcBytes(cpp.Stdlib.sizeof(B3BodyPlaneResultNative) * size) : null;
	}
}


@:keep @:structAccess @:include("linc_box3d.h") @:native("b3BodyTOIResult")
extern class B3BodyTOIResultNative {
	public var point:B3PosNative;
	public var normal:B3Vec3Native;
	public var fraction:cpp.Float32;
	public var shapeId:B3ShapeIdNative;
	public inline function toPointer():cpp.RawPointer<B3BodyTOIResultNative> {
		return cpp.RawPointer.addressOf(cast this);
	}
}
@:keep @:include("linc_box3d.h") @:native("cpp.Reference<b3BodyTOIResult>")
extern class B3BodyTOIResultRef extends B3BodyTOIResultNative {}
@:keep @:include("linc_box3d.h") @:native("cpp.Struct<b3BodyTOIResult>")
extern class B3BodyTOIResultStruct extends B3BodyTOIResultRef {}

@:forward() @:transitive
abstract B3BodyTOIResult(B3BodyTOIResultStruct) from B3BodyTOIResultStruct to B3BodyTOIResultStruct {
	overload extern public inline function new() { this = untyped __cpp__("b3BodyTOIResult()"); }
	overload extern public inline function new(v:B3BodyTOIResultStruct) { this = v; }
	overload extern public inline function new(v:B3BodyTOIResultNative) { this = cast v; }

	@:from @:noCompletion public static inline function fromNative(v:B3BodyTOIResultNative):B3BodyTOIResult { return new B3BodyTOIResult(v); }
	@:to @:noCompletion public static inline function toNative(v:B3BodyTOIResult):B3BodyTOIResultNative { return cast v; }
	@:from @:noCompletion public static inline function fromStruct(v:B3BodyTOIResultStruct):B3BodyTOIResult { return new B3BodyTOIResult(v); }
	@:to @:noCompletion public static inline function toStruct(v:B3BodyTOIResult):B3BodyTOIResultStruct { return cast v; }
	@:to @:noCompletion public static inline function autoToPointer(v:B3BodyTOIResult):cpp.RawPointer<B3BodyTOIResultNative> { return v.toPointer(); }

	public static inline function allocNativeArray(size:Int):cpp.Pointer<B3BodyTOIResultNative> {
		return size > 0 ? cast cpp.NativeGc.allocGcBytes(cpp.Stdlib.sizeof(B3BodyTOIResultNative) * size) : null;
	}
}


@:keep @:structAccess @:include("linc_box3d.h") @:native("b3MassData")
extern class B3MassDataNative {
	public var mass:cpp.Float32;
	public var center:B3Vec3Native;
	public var inertia:B3Matrix3Native;
	public inline function toPointer():cpp.RawPointer<B3MassDataNative> {
		return cpp.RawPointer.addressOf(cast this);
	}
}
@:keep @:include("linc_box3d.h") @:native("cpp.Reference<b3MassData>")
extern class B3MassDataRef extends B3MassDataNative {}
@:keep @:include("linc_box3d.h") @:native("cpp.Struct<b3MassData>")
extern class B3MassDataStruct extends B3MassDataRef {}

@:forward() @:transitive
abstract B3MassData(B3MassDataStruct) from B3MassDataStruct to B3MassDataStruct {
	overload extern public inline function new() { this = untyped __cpp__("b3MassData()"); }
	overload extern public inline function new(v:B3MassDataStruct) { this = v; }
	overload extern public inline function new(v:B3MassDataNative) { this = cast v; }

	@:from @:noCompletion public static inline function fromNative(v:B3MassDataNative):B3MassData { return new B3MassData(v); }
	@:to @:noCompletion public static inline function toNative(v:B3MassData):B3MassDataNative { return cast v; }
	@:from @:noCompletion public static inline function fromStruct(v:B3MassDataStruct):B3MassData { return new B3MassData(v); }
	@:to @:noCompletion public static inline function toStruct(v:B3MassData):B3MassDataStruct { return cast v; }
	@:to @:noCompletion public static inline function autoToPointer(v:B3MassData):cpp.RawPointer<B3MassDataNative> { return v.toPointer(); }

	public static inline function allocNativeArray(size:Int):cpp.Pointer<B3MassDataNative> {
		return size > 0 ? cast cpp.NativeGc.allocGcBytes(cpp.Stdlib.sizeof(B3MassDataNative) * size) : null;
	}
}


@:keep @:structAccess @:include("linc_box3d.h") @:native("b3Sphere")
extern class B3SphereNative {
	public var center:B3Vec3Native;
	public var radius:cpp.Float32;
	public inline function toPointer():cpp.RawPointer<B3SphereNative> {
		return cpp.RawPointer.addressOf(cast this);
	}
}
@:keep @:include("linc_box3d.h") @:native("cpp.Reference<b3Sphere>")
extern class B3SphereRef extends B3SphereNative {}
@:keep @:include("linc_box3d.h") @:native("cpp.Struct<b3Sphere>")
extern class B3SphereStruct extends B3SphereRef {}

@:forward() @:transitive
abstract B3Sphere(B3SphereStruct) from B3SphereStruct to B3SphereStruct {
	overload extern public inline function new() { this = untyped __cpp__("b3Sphere()"); }
	overload extern public inline function new(v:B3SphereStruct) { this = v; }
	overload extern public inline function new(v:B3SphereNative) { this = cast v; }

	@:from @:noCompletion public static inline function fromNative(v:B3SphereNative):B3Sphere { return new B3Sphere(v); }
	@:to @:noCompletion public static inline function toNative(v:B3Sphere):B3SphereNative { return cast v; }
	@:from @:noCompletion public static inline function fromStruct(v:B3SphereStruct):B3Sphere { return new B3Sphere(v); }
	@:to @:noCompletion public static inline function toStruct(v:B3Sphere):B3SphereStruct { return cast v; }
	@:to @:noCompletion public static inline function autoToPointer(v:B3Sphere):cpp.RawPointer<B3SphereNative> { return v.toPointer(); }

	public static inline function allocNativeArray(size:Int):cpp.Pointer<B3SphereNative> {
		return size > 0 ? cast cpp.NativeGc.allocGcBytes(cpp.Stdlib.sizeof(B3SphereNative) * size) : null;
	}
}


@:keep @:structAccess @:include("linc_box3d.h") @:native("b3Capsule")
extern class B3CapsuleNative {
	public var center1:B3Vec3Native;
	public var center2:B3Vec3Native;
	public var radius:cpp.Float32;
	public inline function toPointer():cpp.RawPointer<B3CapsuleNative> {
		return cpp.RawPointer.addressOf(cast this);
	}
}
@:keep @:include("linc_box3d.h") @:native("cpp.Reference<b3Capsule>")
extern class B3CapsuleRef extends B3CapsuleNative {}
@:keep @:include("linc_box3d.h") @:native("cpp.Struct<b3Capsule>")
extern class B3CapsuleStruct extends B3CapsuleRef {}

@:forward() @:transitive
abstract B3Capsule(B3CapsuleStruct) from B3CapsuleStruct to B3CapsuleStruct {
	overload extern public inline function new() { this = untyped __cpp__("b3Capsule()"); }
	overload extern public inline function new(v:B3CapsuleStruct) { this = v; }
	overload extern public inline function new(v:B3CapsuleNative) { this = cast v; }

	@:from @:noCompletion public static inline function fromNative(v:B3CapsuleNative):B3Capsule { return new B3Capsule(v); }
	@:to @:noCompletion public static inline function toNative(v:B3Capsule):B3CapsuleNative { return cast v; }
	@:from @:noCompletion public static inline function fromStruct(v:B3CapsuleStruct):B3Capsule { return new B3Capsule(v); }
	@:to @:noCompletion public static inline function toStruct(v:B3Capsule):B3CapsuleStruct { return cast v; }
	@:to @:noCompletion public static inline function autoToPointer(v:B3Capsule):cpp.RawPointer<B3CapsuleNative> { return v.toPointer(); }

	public static inline function allocNativeArray(size:Int):cpp.Pointer<B3CapsuleNative> {
		return size > 0 ? cast cpp.NativeGc.allocGcBytes(cpp.Stdlib.sizeof(B3CapsuleNative) * size) : null;
	}
}


@:keep @:structAccess @:include("linc_box3d.h") @:native("b3HullVertex")
extern class B3HullVertexNative {
	public var edge:cpp.UInt8;
	public inline function toPointer():cpp.RawPointer<B3HullVertexNative> {
		return cpp.RawPointer.addressOf(cast this);
	}
}
@:keep @:include("linc_box3d.h") @:native("cpp.Reference<b3HullVertex>")
extern class B3HullVertexRef extends B3HullVertexNative {}
@:keep @:include("linc_box3d.h") @:native("cpp.Struct<b3HullVertex>")
extern class B3HullVertexStruct extends B3HullVertexRef {}

@:forward() @:transitive
abstract B3HullVertex(B3HullVertexStruct) from B3HullVertexStruct to B3HullVertexStruct {
	overload extern public inline function new() { this = untyped __cpp__("b3HullVertex()"); }
	overload extern public inline function new(v:B3HullVertexStruct) { this = v; }
	overload extern public inline function new(v:B3HullVertexNative) { this = cast v; }

	@:from @:noCompletion public static inline function fromNative(v:B3HullVertexNative):B3HullVertex { return new B3HullVertex(v); }
	@:to @:noCompletion public static inline function toNative(v:B3HullVertex):B3HullVertexNative { return cast v; }
	@:from @:noCompletion public static inline function fromStruct(v:B3HullVertexStruct):B3HullVertex { return new B3HullVertex(v); }
	@:to @:noCompletion public static inline function toStruct(v:B3HullVertex):B3HullVertexStruct { return cast v; }
	@:to @:noCompletion public static inline function autoToPointer(v:B3HullVertex):cpp.RawPointer<B3HullVertexNative> { return v.toPointer(); }

	public static inline function allocNativeArray(size:Int):cpp.Pointer<B3HullVertexNative> {
		return size > 0 ? cast cpp.NativeGc.allocGcBytes(cpp.Stdlib.sizeof(B3HullVertexNative) * size) : null;
	}
}


@:keep @:structAccess @:include("linc_box3d.h") @:native("b3HullHalfEdge")
extern class B3HullHalfEdgeNative {
	public var next:cpp.UInt8;
	public var twin:cpp.UInt8;
	public var origin:cpp.UInt8;
	public var face:cpp.UInt8;
	public inline function toPointer():cpp.RawPointer<B3HullHalfEdgeNative> {
		return cpp.RawPointer.addressOf(cast this);
	}
}
@:keep @:include("linc_box3d.h") @:native("cpp.Reference<b3HullHalfEdge>")
extern class B3HullHalfEdgeRef extends B3HullHalfEdgeNative {}
@:keep @:include("linc_box3d.h") @:native("cpp.Struct<b3HullHalfEdge>")
extern class B3HullHalfEdgeStruct extends B3HullHalfEdgeRef {}

@:forward() @:transitive
abstract B3HullHalfEdge(B3HullHalfEdgeStruct) from B3HullHalfEdgeStruct to B3HullHalfEdgeStruct {
	overload extern public inline function new() { this = untyped __cpp__("b3HullHalfEdge()"); }
	overload extern public inline function new(v:B3HullHalfEdgeStruct) { this = v; }
	overload extern public inline function new(v:B3HullHalfEdgeNative) { this = cast v; }

	@:from @:noCompletion public static inline function fromNative(v:B3HullHalfEdgeNative):B3HullHalfEdge { return new B3HullHalfEdge(v); }
	@:to @:noCompletion public static inline function toNative(v:B3HullHalfEdge):B3HullHalfEdgeNative { return cast v; }
	@:from @:noCompletion public static inline function fromStruct(v:B3HullHalfEdgeStruct):B3HullHalfEdge { return new B3HullHalfEdge(v); }
	@:to @:noCompletion public static inline function toStruct(v:B3HullHalfEdge):B3HullHalfEdgeStruct { return cast v; }
	@:to @:noCompletion public static inline function autoToPointer(v:B3HullHalfEdge):cpp.RawPointer<B3HullHalfEdgeNative> { return v.toPointer(); }

	public static inline function allocNativeArray(size:Int):cpp.Pointer<B3HullHalfEdgeNative> {
		return size > 0 ? cast cpp.NativeGc.allocGcBytes(cpp.Stdlib.sizeof(B3HullHalfEdgeNative) * size) : null;
	}
}


@:keep @:structAccess @:include("linc_box3d.h") @:native("b3HullFace")
extern class B3HullFaceNative {
	public var edge:cpp.UInt8;
	public inline function toPointer():cpp.RawPointer<B3HullFaceNative> {
		return cpp.RawPointer.addressOf(cast this);
	}
}
@:keep @:include("linc_box3d.h") @:native("cpp.Reference<b3HullFace>")
extern class B3HullFaceRef extends B3HullFaceNative {}
@:keep @:include("linc_box3d.h") @:native("cpp.Struct<b3HullFace>")
extern class B3HullFaceStruct extends B3HullFaceRef {}

@:forward() @:transitive
abstract B3HullFace(B3HullFaceStruct) from B3HullFaceStruct to B3HullFaceStruct {
	overload extern public inline function new() { this = untyped __cpp__("b3HullFace()"); }
	overload extern public inline function new(v:B3HullFaceStruct) { this = v; }
	overload extern public inline function new(v:B3HullFaceNative) { this = cast v; }

	@:from @:noCompletion public static inline function fromNative(v:B3HullFaceNative):B3HullFace { return new B3HullFace(v); }
	@:to @:noCompletion public static inline function toNative(v:B3HullFace):B3HullFaceNative { return cast v; }
	@:from @:noCompletion public static inline function fromStruct(v:B3HullFaceStruct):B3HullFace { return new B3HullFace(v); }
	@:to @:noCompletion public static inline function toStruct(v:B3HullFace):B3HullFaceStruct { return cast v; }
	@:to @:noCompletion public static inline function autoToPointer(v:B3HullFace):cpp.RawPointer<B3HullFaceNative> { return v.toPointer(); }

	public static inline function allocNativeArray(size:Int):cpp.Pointer<B3HullFaceNative> {
		return size > 0 ? cast cpp.NativeGc.allocGcBytes(cpp.Stdlib.sizeof(B3HullFaceNative) * size) : null;
	}
}


@:keep @:structAccess @:include("linc_box3d.h") @:native("b3HullData")
extern class B3HullDataNative {
	public var version:cpp.UInt64;
	public var hash:cpp.UInt64;
	public var aabb:B3AABBNative;
	public var surfaceArea:cpp.Float32;
	public var volume:cpp.Float32;
	public var innerRadius:cpp.Float32;
	public var center:B3Vec3Native;
	public var centralInertia:B3Matrix3Native;
	public var vertexCount:Int;
	public var vertexOffset:Int;
	public var pointOffset:Int;
	public var edgeCount:Int;
	public var edgeOffset:Int;
	public var faceCount:Int;
	public var planeOffset:Int;
	public var faceOffset:Int;
	public var soaVertexOffset:Int;
	public var soaNormalOffset:Int;
	public var byteCount:Int;
	public inline function toPointer():cpp.RawPointer<B3HullDataNative> {
		return cpp.RawPointer.addressOf(cast this);
	}
}
@:keep @:include("linc_box3d.h") @:native("cpp.Reference<b3HullData>")
extern class B3HullDataRef extends B3HullDataNative {}
@:keep @:include("linc_box3d.h") @:native("cpp.Struct<b3HullData>")
extern class B3HullDataStruct extends B3HullDataRef {}

@:forward() @:transitive
abstract B3HullData(B3HullDataStruct) from B3HullDataStruct to B3HullDataStruct {
	overload extern public inline function new() { this = untyped __cpp__("b3HullData()"); }
	overload extern public inline function new(v:B3HullDataStruct) { this = v; }
	overload extern public inline function new(v:B3HullDataNative) { this = cast v; }

	@:from @:noCompletion public static inline function fromNative(v:B3HullDataNative):B3HullData { return new B3HullData(v); }
	@:to @:noCompletion public static inline function toNative(v:B3HullData):B3HullDataNative { return cast v; }
	@:from @:noCompletion public static inline function fromStruct(v:B3HullDataStruct):B3HullData { return new B3HullData(v); }
	@:to @:noCompletion public static inline function toStruct(v:B3HullData):B3HullDataStruct { return cast v; }
	@:to @:noCompletion public static inline function autoToPointer(v:B3HullData):cpp.RawPointer<B3HullDataNative> { return v.toPointer(); }

	public static inline function allocNativeArray(size:Int):cpp.Pointer<B3HullDataNative> {
		return size > 0 ? cast cpp.NativeGc.allocGcBytes(cpp.Stdlib.sizeof(B3HullDataNative) * size) : null;
	}
}


@:keep @:structAccess @:include("linc_box3d.h") @:native("b3BoxHull")
extern class B3BoxHullNative {
	public var base:B3HullDataNative;
	public var boxVertices:cpp.RawPointer<B3HullVertexNative>;
	public var boxPoints:cpp.RawPointer<B3Vec3Native>;
	public var boxEdges:cpp.RawPointer<B3HullHalfEdgeNative>;
	public var boxPlanes:cpp.RawPointer<B3PlaneNative>;
	public var boxFaces:cpp.RawPointer<B3HullFaceNative>;
	public var padding:cpp.RawPointer<cpp.UInt8>;
	public var vx:cpp.RawPointer<cpp.Float32>;
	public var vy:cpp.RawPointer<cpp.Float32>;
	public var vz:cpp.RawPointer<cpp.Float32>;
	public var nx:cpp.RawPointer<cpp.Float32>;
	public var ny:cpp.RawPointer<cpp.Float32>;
	public var nz:cpp.RawPointer<cpp.Float32>;
	public inline function toPointer():cpp.RawPointer<B3BoxHullNative> {
		return cpp.RawPointer.addressOf(cast this);
	}
}
@:keep @:include("linc_box3d.h") @:native("cpp.Reference<b3BoxHull>")
extern class B3BoxHullRef extends B3BoxHullNative {}
@:keep @:include("linc_box3d.h") @:native("cpp.Struct<b3BoxHull>")
extern class B3BoxHullStruct extends B3BoxHullRef {}

@:forward() @:transitive
abstract B3BoxHull(B3BoxHullStruct) from B3BoxHullStruct to B3BoxHullStruct {
	overload extern public inline function new() { this = untyped __cpp__("b3BoxHull()"); }
	overload extern public inline function new(v:B3BoxHullStruct) { this = v; }
	overload extern public inline function new(v:B3BoxHullNative) { this = cast v; }

	@:from @:noCompletion public static inline function fromNative(v:B3BoxHullNative):B3BoxHull { return new B3BoxHull(v); }
	@:to @:noCompletion public static inline function toNative(v:B3BoxHull):B3BoxHullNative { return cast v; }
	@:from @:noCompletion public static inline function fromStruct(v:B3BoxHullStruct):B3BoxHull { return new B3BoxHull(v); }
	@:to @:noCompletion public static inline function toStruct(v:B3BoxHull):B3BoxHullStruct { return cast v; }
	@:to @:noCompletion public static inline function autoToPointer(v:B3BoxHull):cpp.RawPointer<B3BoxHullNative> { return v.toPointer(); }

	public static inline function allocNativeArray(size:Int):cpp.Pointer<B3BoxHullNative> {
		return size > 0 ? cast cpp.NativeGc.allocGcBytes(cpp.Stdlib.sizeof(B3BoxHullNative) * size) : null;
	}
}


@:keep @:structAccess @:include("linc_box3d.h") @:native("b3MeshDef")
extern class B3MeshDefNative {
	public var vertices:cpp.RawPointer<B3Vec3Native>;
	public var stride:cpp.Int64;
	public var indices:cpp.RawPointer<Int>;
	public var materialIndices:cpp.RawPointer<cpp.UInt8>;
	public var weldTolerance:cpp.Float32;
	public var vertexCount:Int;
	public var triangleCount:Int;
	public var weldVertices:Bool;
	public var useMedianSplit:Bool;
	public var identifyEdges:Bool;
	public var clockWiseWinding:Bool;
	public inline function toPointer():cpp.RawPointer<B3MeshDefNative> {
		return cpp.RawPointer.addressOf(cast this);
	}
}
@:keep @:include("linc_box3d.h") @:native("cpp.Reference<b3MeshDef>")
extern class B3MeshDefRef extends B3MeshDefNative {}
@:keep @:include("linc_box3d.h") @:native("cpp.Struct<b3MeshDef>")
extern class B3MeshDefStruct extends B3MeshDefRef {}

@:forward() @:transitive
abstract B3MeshDef(B3MeshDefStruct) from B3MeshDefStruct to B3MeshDefStruct {
	overload extern public inline function new() { this = untyped __cpp__("b3MeshDef()"); }
	overload extern public inline function new(v:B3MeshDefStruct) { this = v; }
	overload extern public inline function new(v:B3MeshDefNative) { this = cast v; }

	@:from @:noCompletion public static inline function fromNative(v:B3MeshDefNative):B3MeshDef { return new B3MeshDef(v); }
	@:to @:noCompletion public static inline function toNative(v:B3MeshDef):B3MeshDefNative { return cast v; }
	@:from @:noCompletion public static inline function fromStruct(v:B3MeshDefStruct):B3MeshDef { return new B3MeshDef(v); }
	@:to @:noCompletion public static inline function toStruct(v:B3MeshDef):B3MeshDefStruct { return cast v; }
	@:to @:noCompletion public static inline function autoToPointer(v:B3MeshDef):cpp.RawPointer<B3MeshDefNative> { return v.toPointer(); }

	public static inline function allocNativeArray(size:Int):cpp.Pointer<B3MeshDefNative> {
		return size > 0 ? cast cpp.NativeGc.allocGcBytes(cpp.Stdlib.sizeof(B3MeshDefNative) * size) : null;
	}
}


@:keep @:structAccess @:include("linc_box3d.h") @:native("b3MeshTriangle")
extern class B3MeshTriangleNative {
	public var index1:Int;
	public var index2:Int;
	public var index3:Int;
	public inline function toPointer():cpp.RawPointer<B3MeshTriangleNative> {
		return cpp.RawPointer.addressOf(cast this);
	}
}
@:keep @:include("linc_box3d.h") @:native("cpp.Reference<b3MeshTriangle>")
extern class B3MeshTriangleRef extends B3MeshTriangleNative {}
@:keep @:include("linc_box3d.h") @:native("cpp.Struct<b3MeshTriangle>")
extern class B3MeshTriangleStruct extends B3MeshTriangleRef {}

@:forward() @:transitive
abstract B3MeshTriangle(B3MeshTriangleStruct) from B3MeshTriangleStruct to B3MeshTriangleStruct {
	overload extern public inline function new() { this = untyped __cpp__("b3MeshTriangle()"); }
	overload extern public inline function new(v:B3MeshTriangleStruct) { this = v; }
	overload extern public inline function new(v:B3MeshTriangleNative) { this = cast v; }

	@:from @:noCompletion public static inline function fromNative(v:B3MeshTriangleNative):B3MeshTriangle { return new B3MeshTriangle(v); }
	@:to @:noCompletion public static inline function toNative(v:B3MeshTriangle):B3MeshTriangleNative { return cast v; }
	@:from @:noCompletion public static inline function fromStruct(v:B3MeshTriangleStruct):B3MeshTriangle { return new B3MeshTriangle(v); }
	@:to @:noCompletion public static inline function toStruct(v:B3MeshTriangle):B3MeshTriangleStruct { return cast v; }
	@:to @:noCompletion public static inline function autoToPointer(v:B3MeshTriangle):cpp.RawPointer<B3MeshTriangleNative> { return v.toPointer(); }

	public static inline function allocNativeArray(size:Int):cpp.Pointer<B3MeshTriangleNative> {
		return size > 0 ? cast cpp.NativeGc.allocGcBytes(cpp.Stdlib.sizeof(B3MeshTriangleNative) * size) : null;
	}
}


@:keep @:structAccess @:include("linc_box3d.h") @:native("b3MeshData")
extern class B3MeshDataNative {
	public var version:cpp.UInt64;
	public var hash:cpp.UInt64;
	public var byteCount:Int;
	public var bounds:B3AABBNative;
	public var surfaceArea:cpp.Float32;
	public var treeHeight:Int;
	public var degenerateCount:Int;
	public var nodeOffset:Int;
	public var nodeCount:Int;
	public var vertexOffset:Int;
	public var vertexCount:Int;
	public var triangleOffset:Int;
	public var triangleCount:Int;
	public var materialOffset:Int;
	public var materialCount:Int;
	public var flagsOffset:Int;
	public var padding:Int;
	public inline function toPointer():cpp.RawPointer<B3MeshDataNative> {
		return cpp.RawPointer.addressOf(cast this);
	}
}
@:keep @:include("linc_box3d.h") @:native("cpp.Reference<b3MeshData>")
extern class B3MeshDataRef extends B3MeshDataNative {}
@:keep @:include("linc_box3d.h") @:native("cpp.Struct<b3MeshData>")
extern class B3MeshDataStruct extends B3MeshDataRef {}

@:forward() @:transitive
abstract B3MeshData(B3MeshDataStruct) from B3MeshDataStruct to B3MeshDataStruct {
	overload extern public inline function new() { this = untyped __cpp__("b3MeshData()"); }
	overload extern public inline function new(v:B3MeshDataStruct) { this = v; }
	overload extern public inline function new(v:B3MeshDataNative) { this = cast v; }

	@:from @:noCompletion public static inline function fromNative(v:B3MeshDataNative):B3MeshData { return new B3MeshData(v); }
	@:to @:noCompletion public static inline function toNative(v:B3MeshData):B3MeshDataNative { return cast v; }
	@:from @:noCompletion public static inline function fromStruct(v:B3MeshDataStruct):B3MeshData { return new B3MeshData(v); }
	@:to @:noCompletion public static inline function toStruct(v:B3MeshData):B3MeshDataStruct { return cast v; }
	@:to @:noCompletion public static inline function autoToPointer(v:B3MeshData):cpp.RawPointer<B3MeshDataNative> { return v.toPointer(); }

	public static inline function allocNativeArray(size:Int):cpp.Pointer<B3MeshDataNative> {
		return size > 0 ? cast cpp.NativeGc.allocGcBytes(cpp.Stdlib.sizeof(B3MeshDataNative) * size) : null;
	}
}


@:keep @:structAccess @:include("linc_box3d.h") @:native("b3Mesh")
extern class B3MeshNative {
	public var data:cpp.RawConstPointer<B3MeshDataNative>;
	public var scale:B3Vec3Native;
	public inline function toPointer():cpp.RawPointer<B3MeshNative> {
		return cpp.RawPointer.addressOf(cast this);
	}
}
@:keep @:include("linc_box3d.h") @:native("cpp.Reference<b3Mesh>")
extern class B3MeshRef extends B3MeshNative {}
@:keep @:include("linc_box3d.h") @:native("cpp.Struct<b3Mesh>")
extern class B3MeshStruct extends B3MeshRef {}

@:forward() @:transitive
abstract B3Mesh(B3MeshStruct) from B3MeshStruct to B3MeshStruct {
	overload extern public inline function new() { this = untyped __cpp__("b3Mesh()"); }
	overload extern public inline function new(v:B3MeshStruct) { this = v; }
	overload extern public inline function new(v:B3MeshNative) { this = cast v; }

	@:from @:noCompletion public static inline function fromNative(v:B3MeshNative):B3Mesh { return new B3Mesh(v); }
	@:to @:noCompletion public static inline function toNative(v:B3Mesh):B3MeshNative { return cast v; }
	@:from @:noCompletion public static inline function fromStruct(v:B3MeshStruct):B3Mesh { return new B3Mesh(v); }
	@:to @:noCompletion public static inline function toStruct(v:B3Mesh):B3MeshStruct { return cast v; }
	@:to @:noCompletion public static inline function autoToPointer(v:B3Mesh):cpp.RawPointer<B3MeshNative> { return v.toPointer(); }

	public static inline function allocNativeArray(size:Int):cpp.Pointer<B3MeshNative> {
		return size > 0 ? cast cpp.NativeGc.allocGcBytes(cpp.Stdlib.sizeof(B3MeshNative) * size) : null;
	}
}


@:keep @:structAccess @:include("linc_box3d.h") @:native("b3HeightFieldDef")
extern class B3HeightFieldDefNative {
	public var heights:cpp.RawPointer<cpp.Float32>;
	public var materialIndices:cpp.RawPointer<cpp.UInt8>;
	public var scale:B3Vec3Native;
	public var countX:Int;
	public var countZ:Int;
	public var globalMinimumHeight:cpp.Float32;
	public var globalMaximumHeight:cpp.Float32;
	public var clockwiseWinding:Bool;
	public inline function toPointer():cpp.RawPointer<B3HeightFieldDefNative> {
		return cpp.RawPointer.addressOf(cast this);
	}
}
@:keep @:include("linc_box3d.h") @:native("cpp.Reference<b3HeightFieldDef>")
extern class B3HeightFieldDefRef extends B3HeightFieldDefNative {}
@:keep @:include("linc_box3d.h") @:native("cpp.Struct<b3HeightFieldDef>")
extern class B3HeightFieldDefStruct extends B3HeightFieldDefRef {}

@:forward() @:transitive
abstract B3HeightFieldDef(B3HeightFieldDefStruct) from B3HeightFieldDefStruct to B3HeightFieldDefStruct {
	overload extern public inline function new() { this = untyped __cpp__("b3HeightFieldDef()"); }
	overload extern public inline function new(v:B3HeightFieldDefStruct) { this = v; }
	overload extern public inline function new(v:B3HeightFieldDefNative) { this = cast v; }

	@:from @:noCompletion public static inline function fromNative(v:B3HeightFieldDefNative):B3HeightFieldDef { return new B3HeightFieldDef(v); }
	@:to @:noCompletion public static inline function toNative(v:B3HeightFieldDef):B3HeightFieldDefNative { return cast v; }
	@:from @:noCompletion public static inline function fromStruct(v:B3HeightFieldDefStruct):B3HeightFieldDef { return new B3HeightFieldDef(v); }
	@:to @:noCompletion public static inline function toStruct(v:B3HeightFieldDef):B3HeightFieldDefStruct { return cast v; }
	@:to @:noCompletion public static inline function autoToPointer(v:B3HeightFieldDef):cpp.RawPointer<B3HeightFieldDefNative> { return v.toPointer(); }

	public static inline function allocNativeArray(size:Int):cpp.Pointer<B3HeightFieldDefNative> {
		return size > 0 ? cast cpp.NativeGc.allocGcBytes(cpp.Stdlib.sizeof(B3HeightFieldDefNative) * size) : null;
	}
}


@:keep @:structAccess @:include("linc_box3d.h") @:native("b3HeightFieldData")
extern class B3HeightFieldDataNative {
	public var version:cpp.UInt64;
	public var hash:cpp.UInt64;
	public var byteCount:Int;
	public var aabb:B3AABBNative;
	public var minHeight:cpp.Float32;
	public var maxHeight:cpp.Float32;
	public var heightScale:cpp.Float32;
	public var scale:B3Vec3Native;
	public var columnCount:Int;
	public var rowCount:Int;
	public var heightsOffset:Int;
	public var materialOffset:Int;
	public var flagsOffset:Int;
	public var clockwise:cpp.UInt8;
	public var padding:cpp.RawPointer<cpp.UInt8>;
	public inline function toPointer():cpp.RawPointer<B3HeightFieldDataNative> {
		return cpp.RawPointer.addressOf(cast this);
	}
}
@:keep @:include("linc_box3d.h") @:native("cpp.Reference<b3HeightFieldData>")
extern class B3HeightFieldDataRef extends B3HeightFieldDataNative {}
@:keep @:include("linc_box3d.h") @:native("cpp.Struct<b3HeightFieldData>")
extern class B3HeightFieldDataStruct extends B3HeightFieldDataRef {}

@:forward() @:transitive
abstract B3HeightFieldData(B3HeightFieldDataStruct) from B3HeightFieldDataStruct to B3HeightFieldDataStruct {
	overload extern public inline function new() { this = untyped __cpp__("b3HeightFieldData()"); }
	overload extern public inline function new(v:B3HeightFieldDataStruct) { this = v; }
	overload extern public inline function new(v:B3HeightFieldDataNative) { this = cast v; }

	@:from @:noCompletion public static inline function fromNative(v:B3HeightFieldDataNative):B3HeightFieldData { return new B3HeightFieldData(v); }
	@:to @:noCompletion public static inline function toNative(v:B3HeightFieldData):B3HeightFieldDataNative { return cast v; }
	@:from @:noCompletion public static inline function fromStruct(v:B3HeightFieldDataStruct):B3HeightFieldData { return new B3HeightFieldData(v); }
	@:to @:noCompletion public static inline function toStruct(v:B3HeightFieldData):B3HeightFieldDataStruct { return cast v; }
	@:to @:noCompletion public static inline function autoToPointer(v:B3HeightFieldData):cpp.RawPointer<B3HeightFieldDataNative> { return v.toPointer(); }

	public static inline function allocNativeArray(size:Int):cpp.Pointer<B3HeightFieldDataNative> {
		return size > 0 ? cast cpp.NativeGc.allocGcBytes(cpp.Stdlib.sizeof(B3HeightFieldDataNative) * size) : null;
	}
}


@:keep @:structAccess @:include("linc_box3d.h") @:native("b3CompoundCapsuleDef")
extern class B3CompoundCapsuleDefNative {
	public var capsule:B3CapsuleNative;
	public var material:B3SurfaceMaterialNative;
	public inline function toPointer():cpp.RawPointer<B3CompoundCapsuleDefNative> {
		return cpp.RawPointer.addressOf(cast this);
	}
}
@:keep @:include("linc_box3d.h") @:native("cpp.Reference<b3CompoundCapsuleDef>")
extern class B3CompoundCapsuleDefRef extends B3CompoundCapsuleDefNative {}
@:keep @:include("linc_box3d.h") @:native("cpp.Struct<b3CompoundCapsuleDef>")
extern class B3CompoundCapsuleDefStruct extends B3CompoundCapsuleDefRef {}

@:forward() @:transitive
abstract B3CompoundCapsuleDef(B3CompoundCapsuleDefStruct) from B3CompoundCapsuleDefStruct to B3CompoundCapsuleDefStruct {
	overload extern public inline function new() { this = untyped __cpp__("b3CompoundCapsuleDef()"); }
	overload extern public inline function new(v:B3CompoundCapsuleDefStruct) { this = v; }
	overload extern public inline function new(v:B3CompoundCapsuleDefNative) { this = cast v; }

	@:from @:noCompletion public static inline function fromNative(v:B3CompoundCapsuleDefNative):B3CompoundCapsuleDef { return new B3CompoundCapsuleDef(v); }
	@:to @:noCompletion public static inline function toNative(v:B3CompoundCapsuleDef):B3CompoundCapsuleDefNative { return cast v; }
	@:from @:noCompletion public static inline function fromStruct(v:B3CompoundCapsuleDefStruct):B3CompoundCapsuleDef { return new B3CompoundCapsuleDef(v); }
	@:to @:noCompletion public static inline function toStruct(v:B3CompoundCapsuleDef):B3CompoundCapsuleDefStruct { return cast v; }
	@:to @:noCompletion public static inline function autoToPointer(v:B3CompoundCapsuleDef):cpp.RawPointer<B3CompoundCapsuleDefNative> { return v.toPointer(); }

	public static inline function allocNativeArray(size:Int):cpp.Pointer<B3CompoundCapsuleDefNative> {
		return size > 0 ? cast cpp.NativeGc.allocGcBytes(cpp.Stdlib.sizeof(B3CompoundCapsuleDefNative) * size) : null;
	}
}


@:keep @:structAccess @:include("linc_box3d.h") @:native("b3CompoundHullDef")
extern class B3CompoundHullDefNative {
	public var hull:cpp.RawConstPointer<B3HullDataNative>;
	public var transform:B3TransformNative;
	public var material:B3SurfaceMaterialNative;
	public inline function toPointer():cpp.RawPointer<B3CompoundHullDefNative> {
		return cpp.RawPointer.addressOf(cast this);
	}
}
@:keep @:include("linc_box3d.h") @:native("cpp.Reference<b3CompoundHullDef>")
extern class B3CompoundHullDefRef extends B3CompoundHullDefNative {}
@:keep @:include("linc_box3d.h") @:native("cpp.Struct<b3CompoundHullDef>")
extern class B3CompoundHullDefStruct extends B3CompoundHullDefRef {}

@:forward() @:transitive
abstract B3CompoundHullDef(B3CompoundHullDefStruct) from B3CompoundHullDefStruct to B3CompoundHullDefStruct {
	overload extern public inline function new() { this = untyped __cpp__("b3CompoundHullDef()"); }
	overload extern public inline function new(v:B3CompoundHullDefStruct) { this = v; }
	overload extern public inline function new(v:B3CompoundHullDefNative) { this = cast v; }

	@:from @:noCompletion public static inline function fromNative(v:B3CompoundHullDefNative):B3CompoundHullDef { return new B3CompoundHullDef(v); }
	@:to @:noCompletion public static inline function toNative(v:B3CompoundHullDef):B3CompoundHullDefNative { return cast v; }
	@:from @:noCompletion public static inline function fromStruct(v:B3CompoundHullDefStruct):B3CompoundHullDef { return new B3CompoundHullDef(v); }
	@:to @:noCompletion public static inline function toStruct(v:B3CompoundHullDef):B3CompoundHullDefStruct { return cast v; }
	@:to @:noCompletion public static inline function autoToPointer(v:B3CompoundHullDef):cpp.RawPointer<B3CompoundHullDefNative> { return v.toPointer(); }

	public static inline function allocNativeArray(size:Int):cpp.Pointer<B3CompoundHullDefNative> {
		return size > 0 ? cast cpp.NativeGc.allocGcBytes(cpp.Stdlib.sizeof(B3CompoundHullDefNative) * size) : null;
	}
}


@:keep @:structAccess @:include("linc_box3d.h") @:native("b3CompoundMeshDef")
extern class B3CompoundMeshDefNative {
	public var meshData:cpp.RawConstPointer<B3MeshDataNative>;
	public var transform:B3TransformNative;
	public var scale:B3Vec3Native;
	public var materials:cpp.RawConstPointer<B3SurfaceMaterialNative>;
	public var materialCount:Int;
	public inline function toPointer():cpp.RawPointer<B3CompoundMeshDefNative> {
		return cpp.RawPointer.addressOf(cast this);
	}
}
@:keep @:include("linc_box3d.h") @:native("cpp.Reference<b3CompoundMeshDef>")
extern class B3CompoundMeshDefRef extends B3CompoundMeshDefNative {}
@:keep @:include("linc_box3d.h") @:native("cpp.Struct<b3CompoundMeshDef>")
extern class B3CompoundMeshDefStruct extends B3CompoundMeshDefRef {}

@:forward() @:transitive
abstract B3CompoundMeshDef(B3CompoundMeshDefStruct) from B3CompoundMeshDefStruct to B3CompoundMeshDefStruct {
	overload extern public inline function new() { this = untyped __cpp__("b3CompoundMeshDef()"); }
	overload extern public inline function new(v:B3CompoundMeshDefStruct) { this = v; }
	overload extern public inline function new(v:B3CompoundMeshDefNative) { this = cast v; }

	@:from @:noCompletion public static inline function fromNative(v:B3CompoundMeshDefNative):B3CompoundMeshDef { return new B3CompoundMeshDef(v); }
	@:to @:noCompletion public static inline function toNative(v:B3CompoundMeshDef):B3CompoundMeshDefNative { return cast v; }
	@:from @:noCompletion public static inline function fromStruct(v:B3CompoundMeshDefStruct):B3CompoundMeshDef { return new B3CompoundMeshDef(v); }
	@:to @:noCompletion public static inline function toStruct(v:B3CompoundMeshDef):B3CompoundMeshDefStruct { return cast v; }
	@:to @:noCompletion public static inline function autoToPointer(v:B3CompoundMeshDef):cpp.RawPointer<B3CompoundMeshDefNative> { return v.toPointer(); }

	public static inline function allocNativeArray(size:Int):cpp.Pointer<B3CompoundMeshDefNative> {
		return size > 0 ? cast cpp.NativeGc.allocGcBytes(cpp.Stdlib.sizeof(B3CompoundMeshDefNative) * size) : null;
	}
}


@:keep @:structAccess @:include("linc_box3d.h") @:native("b3CompoundSphereDef")
extern class B3CompoundSphereDefNative {
	public var sphere:B3SphereNative;
	public var material:B3SurfaceMaterialNative;
	public inline function toPointer():cpp.RawPointer<B3CompoundSphereDefNative> {
		return cpp.RawPointer.addressOf(cast this);
	}
}
@:keep @:include("linc_box3d.h") @:native("cpp.Reference<b3CompoundSphereDef>")
extern class B3CompoundSphereDefRef extends B3CompoundSphereDefNative {}
@:keep @:include("linc_box3d.h") @:native("cpp.Struct<b3CompoundSphereDef>")
extern class B3CompoundSphereDefStruct extends B3CompoundSphereDefRef {}

@:forward() @:transitive
abstract B3CompoundSphereDef(B3CompoundSphereDefStruct) from B3CompoundSphereDefStruct to B3CompoundSphereDefStruct {
	overload extern public inline function new() { this = untyped __cpp__("b3CompoundSphereDef()"); }
	overload extern public inline function new(v:B3CompoundSphereDefStruct) { this = v; }
	overload extern public inline function new(v:B3CompoundSphereDefNative) { this = cast v; }

	@:from @:noCompletion public static inline function fromNative(v:B3CompoundSphereDefNative):B3CompoundSphereDef { return new B3CompoundSphereDef(v); }
	@:to @:noCompletion public static inline function toNative(v:B3CompoundSphereDef):B3CompoundSphereDefNative { return cast v; }
	@:from @:noCompletion public static inline function fromStruct(v:B3CompoundSphereDefStruct):B3CompoundSphereDef { return new B3CompoundSphereDef(v); }
	@:to @:noCompletion public static inline function toStruct(v:B3CompoundSphereDef):B3CompoundSphereDefStruct { return cast v; }
	@:to @:noCompletion public static inline function autoToPointer(v:B3CompoundSphereDef):cpp.RawPointer<B3CompoundSphereDefNative> { return v.toPointer(); }

	public static inline function allocNativeArray(size:Int):cpp.Pointer<B3CompoundSphereDefNative> {
		return size > 0 ? cast cpp.NativeGc.allocGcBytes(cpp.Stdlib.sizeof(B3CompoundSphereDefNative) * size) : null;
	}
}


@:keep @:structAccess @:include("linc_box3d.h") @:native("b3CompoundDef")
extern class B3CompoundDefNative {
	public var capsules:cpp.RawPointer<B3CompoundCapsuleDefNative>;
	public var capsuleCount:Int;
	public var hulls:cpp.RawPointer<B3CompoundHullDefNative>;
	public var hullCount:Int;
	public var meshes:cpp.RawPointer<B3CompoundMeshDefNative>;
	public var meshCount:Int;
	public var spheres:cpp.RawPointer<B3CompoundSphereDefNative>;
	public var sphereCount:Int;
	public inline function toPointer():cpp.RawPointer<B3CompoundDefNative> {
		return cpp.RawPointer.addressOf(cast this);
	}
}
@:keep @:include("linc_box3d.h") @:native("cpp.Reference<b3CompoundDef>")
extern class B3CompoundDefRef extends B3CompoundDefNative {}
@:keep @:include("linc_box3d.h") @:native("cpp.Struct<b3CompoundDef>")
extern class B3CompoundDefStruct extends B3CompoundDefRef {}

@:forward() @:transitive
abstract B3CompoundDef(B3CompoundDefStruct) from B3CompoundDefStruct to B3CompoundDefStruct {
	overload extern public inline function new() { this = untyped __cpp__("b3CompoundDef()"); }
	overload extern public inline function new(v:B3CompoundDefStruct) { this = v; }
	overload extern public inline function new(v:B3CompoundDefNative) { this = cast v; }

	@:from @:noCompletion public static inline function fromNative(v:B3CompoundDefNative):B3CompoundDef { return new B3CompoundDef(v); }
	@:to @:noCompletion public static inline function toNative(v:B3CompoundDef):B3CompoundDefNative { return cast v; }
	@:from @:noCompletion public static inline function fromStruct(v:B3CompoundDefStruct):B3CompoundDef { return new B3CompoundDef(v); }
	@:to @:noCompletion public static inline function toStruct(v:B3CompoundDef):B3CompoundDefStruct { return cast v; }
	@:to @:noCompletion public static inline function autoToPointer(v:B3CompoundDef):cpp.RawPointer<B3CompoundDefNative> { return v.toPointer(); }

	public static inline function allocNativeArray(size:Int):cpp.Pointer<B3CompoundDefNative> {
		return size > 0 ? cast cpp.NativeGc.allocGcBytes(cpp.Stdlib.sizeof(B3CompoundDefNative) * size) : null;
	}
}


@:keep @:structAccess @:include("linc_box3d.h") @:native("b3CompoundData")
extern class B3CompoundDataNative {
	public var version:cpp.UInt64;
	public var byteCount:Int;
	public var nodeOffset:Int;
	public var tree:B3DynamicTreeNative;
	public var materialOffset:Int;
	public var materialCount:Int;
	public var capsuleOffset:Int;
	public var capsuleCount:Int;
	public var hullOffset:Int;
	public var hullCount:Int;
	public var sharedHullCount:Int;
	public var meshOffset:Int;
	public var meshCount:Int;
	public var sharedMeshCount:Int;
	public var sphereOffset:Int;
	public var sphereCount:Int;
	public inline function toPointer():cpp.RawPointer<B3CompoundDataNative> {
		return cpp.RawPointer.addressOf(cast this);
	}
}
@:keep @:include("linc_box3d.h") @:native("cpp.Reference<b3CompoundData>")
extern class B3CompoundDataRef extends B3CompoundDataNative {}
@:keep @:include("linc_box3d.h") @:native("cpp.Struct<b3CompoundData>")
extern class B3CompoundDataStruct extends B3CompoundDataRef {}

@:forward() @:transitive
abstract B3CompoundData(B3CompoundDataStruct) from B3CompoundDataStruct to B3CompoundDataStruct {
	overload extern public inline function new() { this = untyped __cpp__("b3CompoundData()"); }
	overload extern public inline function new(v:B3CompoundDataStruct) { this = v; }
	overload extern public inline function new(v:B3CompoundDataNative) { this = cast v; }

	@:from @:noCompletion public static inline function fromNative(v:B3CompoundDataNative):B3CompoundData { return new B3CompoundData(v); }
	@:to @:noCompletion public static inline function toNative(v:B3CompoundData):B3CompoundDataNative { return cast v; }
	@:from @:noCompletion public static inline function fromStruct(v:B3CompoundDataStruct):B3CompoundData { return new B3CompoundData(v); }
	@:to @:noCompletion public static inline function toStruct(v:B3CompoundData):B3CompoundDataStruct { return cast v; }
	@:to @:noCompletion public static inline function autoToPointer(v:B3CompoundData):cpp.RawPointer<B3CompoundDataNative> { return v.toPointer(); }

	public static inline function allocNativeArray(size:Int):cpp.Pointer<B3CompoundDataNative> {
		return size > 0 ? cast cpp.NativeGc.allocGcBytes(cpp.Stdlib.sizeof(B3CompoundDataNative) * size) : null;
	}
}


@:keep @:structAccess @:include("linc_box3d.h") @:native("b3CompoundCapsule")
extern class B3CompoundCapsuleNative {
	public var capsule:B3CapsuleNative;
	public var materialIndex:Int;
	public inline function toPointer():cpp.RawPointer<B3CompoundCapsuleNative> {
		return cpp.RawPointer.addressOf(cast this);
	}
}
@:keep @:include("linc_box3d.h") @:native("cpp.Reference<b3CompoundCapsule>")
extern class B3CompoundCapsuleRef extends B3CompoundCapsuleNative {}
@:keep @:include("linc_box3d.h") @:native("cpp.Struct<b3CompoundCapsule>")
extern class B3CompoundCapsuleStruct extends B3CompoundCapsuleRef {}

@:forward() @:transitive
abstract B3CompoundCapsule(B3CompoundCapsuleStruct) from B3CompoundCapsuleStruct to B3CompoundCapsuleStruct {
	overload extern public inline function new() { this = untyped __cpp__("b3CompoundCapsule()"); }
	overload extern public inline function new(v:B3CompoundCapsuleStruct) { this = v; }
	overload extern public inline function new(v:B3CompoundCapsuleNative) { this = cast v; }

	@:from @:noCompletion public static inline function fromNative(v:B3CompoundCapsuleNative):B3CompoundCapsule { return new B3CompoundCapsule(v); }
	@:to @:noCompletion public static inline function toNative(v:B3CompoundCapsule):B3CompoundCapsuleNative { return cast v; }
	@:from @:noCompletion public static inline function fromStruct(v:B3CompoundCapsuleStruct):B3CompoundCapsule { return new B3CompoundCapsule(v); }
	@:to @:noCompletion public static inline function toStruct(v:B3CompoundCapsule):B3CompoundCapsuleStruct { return cast v; }
	@:to @:noCompletion public static inline function autoToPointer(v:B3CompoundCapsule):cpp.RawPointer<B3CompoundCapsuleNative> { return v.toPointer(); }

	public static inline function allocNativeArray(size:Int):cpp.Pointer<B3CompoundCapsuleNative> {
		return size > 0 ? cast cpp.NativeGc.allocGcBytes(cpp.Stdlib.sizeof(B3CompoundCapsuleNative) * size) : null;
	}
}


@:keep @:structAccess @:include("linc_box3d.h") @:native("b3CompoundHull")
extern class B3CompoundHullNative {
	public var hull:cpp.RawConstPointer<B3HullDataNative>;
	public var transform:B3TransformNative;
	public var materialIndex:Int;
	public inline function toPointer():cpp.RawPointer<B3CompoundHullNative> {
		return cpp.RawPointer.addressOf(cast this);
	}
}
@:keep @:include("linc_box3d.h") @:native("cpp.Reference<b3CompoundHull>")
extern class B3CompoundHullRef extends B3CompoundHullNative {}
@:keep @:include("linc_box3d.h") @:native("cpp.Struct<b3CompoundHull>")
extern class B3CompoundHullStruct extends B3CompoundHullRef {}

@:forward() @:transitive
abstract B3CompoundHull(B3CompoundHullStruct) from B3CompoundHullStruct to B3CompoundHullStruct {
	overload extern public inline function new() { this = untyped __cpp__("b3CompoundHull()"); }
	overload extern public inline function new(v:B3CompoundHullStruct) { this = v; }
	overload extern public inline function new(v:B3CompoundHullNative) { this = cast v; }

	@:from @:noCompletion public static inline function fromNative(v:B3CompoundHullNative):B3CompoundHull { return new B3CompoundHull(v); }
	@:to @:noCompletion public static inline function toNative(v:B3CompoundHull):B3CompoundHullNative { return cast v; }
	@:from @:noCompletion public static inline function fromStruct(v:B3CompoundHullStruct):B3CompoundHull { return new B3CompoundHull(v); }
	@:to @:noCompletion public static inline function toStruct(v:B3CompoundHull):B3CompoundHullStruct { return cast v; }
	@:to @:noCompletion public static inline function autoToPointer(v:B3CompoundHull):cpp.RawPointer<B3CompoundHullNative> { return v.toPointer(); }

	public static inline function allocNativeArray(size:Int):cpp.Pointer<B3CompoundHullNative> {
		return size > 0 ? cast cpp.NativeGc.allocGcBytes(cpp.Stdlib.sizeof(B3CompoundHullNative) * size) : null;
	}
}


@:keep @:structAccess @:include("linc_box3d.h") @:native("b3CompoundMesh")
extern class B3CompoundMeshNative {
	public var meshData:cpp.RawConstPointer<B3MeshDataNative>;
	public var transform:B3TransformNative;
	public var scale:B3Vec3Native;
	public var materialIndices:cpp.RawPointer<Int>;
	public inline function toPointer():cpp.RawPointer<B3CompoundMeshNative> {
		return cpp.RawPointer.addressOf(cast this);
	}
}
@:keep @:include("linc_box3d.h") @:native("cpp.Reference<b3CompoundMesh>")
extern class B3CompoundMeshRef extends B3CompoundMeshNative {}
@:keep @:include("linc_box3d.h") @:native("cpp.Struct<b3CompoundMesh>")
extern class B3CompoundMeshStruct extends B3CompoundMeshRef {}

@:forward() @:transitive
abstract B3CompoundMesh(B3CompoundMeshStruct) from B3CompoundMeshStruct to B3CompoundMeshStruct {
	overload extern public inline function new() { this = untyped __cpp__("b3CompoundMesh()"); }
	overload extern public inline function new(v:B3CompoundMeshStruct) { this = v; }
	overload extern public inline function new(v:B3CompoundMeshNative) { this = cast v; }

	@:from @:noCompletion public static inline function fromNative(v:B3CompoundMeshNative):B3CompoundMesh { return new B3CompoundMesh(v); }
	@:to @:noCompletion public static inline function toNative(v:B3CompoundMesh):B3CompoundMeshNative { return cast v; }
	@:from @:noCompletion public static inline function fromStruct(v:B3CompoundMeshStruct):B3CompoundMesh { return new B3CompoundMesh(v); }
	@:to @:noCompletion public static inline function toStruct(v:B3CompoundMesh):B3CompoundMeshStruct { return cast v; }
	@:to @:noCompletion public static inline function autoToPointer(v:B3CompoundMesh):cpp.RawPointer<B3CompoundMeshNative> { return v.toPointer(); }

	public static inline function allocNativeArray(size:Int):cpp.Pointer<B3CompoundMeshNative> {
		return size > 0 ? cast cpp.NativeGc.allocGcBytes(cpp.Stdlib.sizeof(B3CompoundMeshNative) * size) : null;
	}
}


@:keep @:structAccess @:include("linc_box3d.h") @:native("b3CompoundSphere")
extern class B3CompoundSphereNative {
	public var sphere:B3SphereNative;
	public var materialIndex:Int;
	public inline function toPointer():cpp.RawPointer<B3CompoundSphereNative> {
		return cpp.RawPointer.addressOf(cast this);
	}
}
@:keep @:include("linc_box3d.h") @:native("cpp.Reference<b3CompoundSphere>")
extern class B3CompoundSphereRef extends B3CompoundSphereNative {}
@:keep @:include("linc_box3d.h") @:native("cpp.Struct<b3CompoundSphere>")
extern class B3CompoundSphereStruct extends B3CompoundSphereRef {}

@:forward() @:transitive
abstract B3CompoundSphere(B3CompoundSphereStruct) from B3CompoundSphereStruct to B3CompoundSphereStruct {
	overload extern public inline function new() { this = untyped __cpp__("b3CompoundSphere()"); }
	overload extern public inline function new(v:B3CompoundSphereStruct) { this = v; }
	overload extern public inline function new(v:B3CompoundSphereNative) { this = cast v; }

	@:from @:noCompletion public static inline function fromNative(v:B3CompoundSphereNative):B3CompoundSphere { return new B3CompoundSphere(v); }
	@:to @:noCompletion public static inline function toNative(v:B3CompoundSphere):B3CompoundSphereNative { return cast v; }
	@:from @:noCompletion public static inline function fromStruct(v:B3CompoundSphereStruct):B3CompoundSphere { return new B3CompoundSphere(v); }
	@:to @:noCompletion public static inline function toStruct(v:B3CompoundSphere):B3CompoundSphereStruct { return cast v; }
	@:to @:noCompletion public static inline function autoToPointer(v:B3CompoundSphere):cpp.RawPointer<B3CompoundSphereNative> { return v.toPointer(); }

	public static inline function allocNativeArray(size:Int):cpp.Pointer<B3CompoundSphereNative> {
		return size > 0 ? cast cpp.NativeGc.allocGcBytes(cpp.Stdlib.sizeof(B3CompoundSphereNative) * size) : null;
	}
}


@:keep @:structAccess @:include("linc_box3d.h") @:native("b3ChildShape")
extern class B3ChildShapeNative {
	public var capsule:B3CapsuleNative;
	public var hull:cpp.RawConstPointer<B3HullDataNative>;
	public var mesh:B3MeshNative;
	public var sphere:B3SphereNative;
	public var transform:B3TransformNative;
	public var materialIndices:cpp.RawPointer<Int>;
	public var type:B3ShapeType;
	public inline function toPointer():cpp.RawPointer<B3ChildShapeNative> {
		return cpp.RawPointer.addressOf(cast this);
	}
}
@:keep @:include("linc_box3d.h") @:native("cpp.Reference<b3ChildShape>")
extern class B3ChildShapeRef extends B3ChildShapeNative {}
@:keep @:include("linc_box3d.h") @:native("cpp.Struct<b3ChildShape>")
extern class B3ChildShapeStruct extends B3ChildShapeRef {}

@:forward() @:transitive
abstract B3ChildShape(B3ChildShapeStruct) from B3ChildShapeStruct to B3ChildShapeStruct {
	overload extern public inline function new() { this = untyped __cpp__("b3ChildShape()"); }
	overload extern public inline function new(v:B3ChildShapeStruct) { this = v; }
	overload extern public inline function new(v:B3ChildShapeNative) { this = cast v; }

	@:from @:noCompletion public static inline function fromNative(v:B3ChildShapeNative):B3ChildShape { return new B3ChildShape(v); }
	@:to @:noCompletion public static inline function toNative(v:B3ChildShape):B3ChildShapeNative { return cast v; }
	@:from @:noCompletion public static inline function fromStruct(v:B3ChildShapeStruct):B3ChildShape { return new B3ChildShape(v); }
	@:to @:noCompletion public static inline function toStruct(v:B3ChildShape):B3ChildShapeStruct { return cast v; }
	@:to @:noCompletion public static inline function autoToPointer(v:B3ChildShape):cpp.RawPointer<B3ChildShapeNative> { return v.toPointer(); }

	public static inline function allocNativeArray(size:Int):cpp.Pointer<B3ChildShapeNative> {
		return size > 0 ? cast cpp.NativeGc.allocGcBytes(cpp.Stdlib.sizeof(B3ChildShapeNative) * size) : null;
	}
}


@:keep @:structAccess @:include("linc_box3d.h") @:native("b3ManifoldPoint")
extern class B3ManifoldPointNative {
	public var anchorA:B3Vec3Native;
	public var anchorB:B3Vec3Native;
	public var separation:cpp.Float32;
	public var baseSeparation:cpp.Float32;
	public var normalImpulse:cpp.Float32;
	public var totalNormalImpulse:cpp.Float32;
	public var normalVelocity:cpp.Float32;
	public var featureId:cpp.UInt32;
	public var triangleIndex:Int;
	public var persisted:Bool;
	public inline function toPointer():cpp.RawPointer<B3ManifoldPointNative> {
		return cpp.RawPointer.addressOf(cast this);
	}
}
@:keep @:include("linc_box3d.h") @:native("cpp.Reference<b3ManifoldPoint>")
extern class B3ManifoldPointRef extends B3ManifoldPointNative {}
@:keep @:include("linc_box3d.h") @:native("cpp.Struct<b3ManifoldPoint>")
extern class B3ManifoldPointStruct extends B3ManifoldPointRef {}

@:forward() @:transitive
abstract B3ManifoldPoint(B3ManifoldPointStruct) from B3ManifoldPointStruct to B3ManifoldPointStruct {
	overload extern public inline function new() { this = untyped __cpp__("b3ManifoldPoint()"); }
	overload extern public inline function new(v:B3ManifoldPointStruct) { this = v; }
	overload extern public inline function new(v:B3ManifoldPointNative) { this = cast v; }

	@:from @:noCompletion public static inline function fromNative(v:B3ManifoldPointNative):B3ManifoldPoint { return new B3ManifoldPoint(v); }
	@:to @:noCompletion public static inline function toNative(v:B3ManifoldPoint):B3ManifoldPointNative { return cast v; }
	@:from @:noCompletion public static inline function fromStruct(v:B3ManifoldPointStruct):B3ManifoldPoint { return new B3ManifoldPoint(v); }
	@:to @:noCompletion public static inline function toStruct(v:B3ManifoldPoint):B3ManifoldPointStruct { return cast v; }
	@:to @:noCompletion public static inline function autoToPointer(v:B3ManifoldPoint):cpp.RawPointer<B3ManifoldPointNative> { return v.toPointer(); }

	public static inline function allocNativeArray(size:Int):cpp.Pointer<B3ManifoldPointNative> {
		return size > 0 ? cast cpp.NativeGc.allocGcBytes(cpp.Stdlib.sizeof(B3ManifoldPointNative) * size) : null;
	}
}


@:keep @:structAccess @:include("linc_box3d.h") @:native("b3Manifold")
extern class B3ManifoldNative {
	public var points:cpp.RawPointer<B3ManifoldPointNative>;
	public var normal:B3Vec3Native;
	public var twistImpulse:cpp.Float32;
	public var frictionImpulse:B3Vec3Native;
	public var rollingImpulse:B3Vec3Native;
	public var pointCount:Int;
	public inline function toPointer():cpp.RawPointer<B3ManifoldNative> {
		return cpp.RawPointer.addressOf(cast this);
	}
}
@:keep @:include("linc_box3d.h") @:native("cpp.Reference<b3Manifold>")
extern class B3ManifoldRef extends B3ManifoldNative {}
@:keep @:include("linc_box3d.h") @:native("cpp.Struct<b3Manifold>")
extern class B3ManifoldStruct extends B3ManifoldRef {}

@:forward() @:transitive
abstract B3Manifold(B3ManifoldStruct) from B3ManifoldStruct to B3ManifoldStruct {
	overload extern public inline function new() { this = untyped __cpp__("b3Manifold()"); }
	overload extern public inline function new(v:B3ManifoldStruct) { this = v; }
	overload extern public inline function new(v:B3ManifoldNative) { this = cast v; }

	@:from @:noCompletion public static inline function fromNative(v:B3ManifoldNative):B3Manifold { return new B3Manifold(v); }
	@:to @:noCompletion public static inline function toNative(v:B3Manifold):B3ManifoldNative { return cast v; }
	@:from @:noCompletion public static inline function fromStruct(v:B3ManifoldStruct):B3Manifold { return new B3Manifold(v); }
	@:to @:noCompletion public static inline function toStruct(v:B3Manifold):B3ManifoldStruct { return cast v; }
	@:to @:noCompletion public static inline function autoToPointer(v:B3Manifold):cpp.RawPointer<B3ManifoldNative> { return v.toPointer(); }

	public static inline function allocNativeArray(size:Int):cpp.Pointer<B3ManifoldNative> {
		return size > 0 ? cast cpp.NativeGc.allocGcBytes(cpp.Stdlib.sizeof(B3ManifoldNative) * size) : null;
	}
}


@:keep @:structAccess @:include("linc_box3d.h") @:native("b3SATCache")
extern class B3SATCacheNative {
	public var separation:cpp.Float32;
	public var type:cpp.UInt8;
	public var indexA:cpp.UInt8;
	public var indexB:cpp.UInt8;
	public var hit:cpp.UInt8;
	public inline function toPointer():cpp.RawPointer<B3SATCacheNative> {
		return cpp.RawPointer.addressOf(cast this);
	}
}
@:keep @:include("linc_box3d.h") @:native("cpp.Reference<b3SATCache>")
extern class B3SATCacheRef extends B3SATCacheNative {}
@:keep @:include("linc_box3d.h") @:native("cpp.Struct<b3SATCache>")
extern class B3SATCacheStruct extends B3SATCacheRef {}

@:forward() @:transitive
abstract B3SATCache(B3SATCacheStruct) from B3SATCacheStruct to B3SATCacheStruct {
	overload extern public inline function new() { this = untyped __cpp__("b3SATCache()"); }
	overload extern public inline function new(v:B3SATCacheStruct) { this = v; }
	overload extern public inline function new(v:B3SATCacheNative) { this = cast v; }

	@:from @:noCompletion public static inline function fromNative(v:B3SATCacheNative):B3SATCache { return new B3SATCache(v); }
	@:to @:noCompletion public static inline function toNative(v:B3SATCache):B3SATCacheNative { return cast v; }
	@:from @:noCompletion public static inline function fromStruct(v:B3SATCacheStruct):B3SATCache { return new B3SATCache(v); }
	@:to @:noCompletion public static inline function toStruct(v:B3SATCache):B3SATCacheStruct { return cast v; }
	@:to @:noCompletion public static inline function autoToPointer(v:B3SATCache):cpp.RawPointer<B3SATCacheNative> { return v.toPointer(); }

	public static inline function allocNativeArray(size:Int):cpp.Pointer<B3SATCacheNative> {
		return size > 0 ? cast cpp.NativeGc.allocGcBytes(cpp.Stdlib.sizeof(B3SATCacheNative) * size) : null;
	}
}


@:keep @:structAccess @:include("linc_box3d.h") @:native("b3FeaturePair")
extern class B3FeaturePairNative {
	public var owner1:cpp.UInt8;
	public var index1:cpp.UInt8;
	public var owner2:cpp.UInt8;
	public var index2:cpp.UInt8;
	public inline function toPointer():cpp.RawPointer<B3FeaturePairNative> {
		return cpp.RawPointer.addressOf(cast this);
	}
}
@:keep @:include("linc_box3d.h") @:native("cpp.Reference<b3FeaturePair>")
extern class B3FeaturePairRef extends B3FeaturePairNative {}
@:keep @:include("linc_box3d.h") @:native("cpp.Struct<b3FeaturePair>")
extern class B3FeaturePairStruct extends B3FeaturePairRef {}

@:forward() @:transitive
abstract B3FeaturePair(B3FeaturePairStruct) from B3FeaturePairStruct to B3FeaturePairStruct {
	overload extern public inline function new() { this = untyped __cpp__("b3FeaturePair()"); }
	overload extern public inline function new(v:B3FeaturePairStruct) { this = v; }
	overload extern public inline function new(v:B3FeaturePairNative) { this = cast v; }

	@:from @:noCompletion public static inline function fromNative(v:B3FeaturePairNative):B3FeaturePair { return new B3FeaturePair(v); }
	@:to @:noCompletion public static inline function toNative(v:B3FeaturePair):B3FeaturePairNative { return cast v; }
	@:from @:noCompletion public static inline function fromStruct(v:B3FeaturePairStruct):B3FeaturePair { return new B3FeaturePair(v); }
	@:to @:noCompletion public static inline function toStruct(v:B3FeaturePair):B3FeaturePairStruct { return cast v; }
	@:to @:noCompletion public static inline function autoToPointer(v:B3FeaturePair):cpp.RawPointer<B3FeaturePairNative> { return v.toPointer(); }

	public static inline function allocNativeArray(size:Int):cpp.Pointer<B3FeaturePairNative> {
		return size > 0 ? cast cpp.NativeGc.allocGcBytes(cpp.Stdlib.sizeof(B3FeaturePairNative) * size) : null;
	}
}


@:keep @:structAccess @:include("linc_box3d.h") @:native("b3LocalManifoldPoint")
extern class B3LocalManifoldPointNative {
	public var point:B3Vec3Native;
	public var separation:cpp.Float32;
	public var pair:B3FeaturePairNative;
	public var triangleIndex:Int;
	public inline function toPointer():cpp.RawPointer<B3LocalManifoldPointNative> {
		return cpp.RawPointer.addressOf(cast this);
	}
}
@:keep @:include("linc_box3d.h") @:native("cpp.Reference<b3LocalManifoldPoint>")
extern class B3LocalManifoldPointRef extends B3LocalManifoldPointNative {}
@:keep @:include("linc_box3d.h") @:native("cpp.Struct<b3LocalManifoldPoint>")
extern class B3LocalManifoldPointStruct extends B3LocalManifoldPointRef {}

@:forward() @:transitive
abstract B3LocalManifoldPoint(B3LocalManifoldPointStruct) from B3LocalManifoldPointStruct to B3LocalManifoldPointStruct {
	overload extern public inline function new() { this = untyped __cpp__("b3LocalManifoldPoint()"); }
	overload extern public inline function new(v:B3LocalManifoldPointStruct) { this = v; }
	overload extern public inline function new(v:B3LocalManifoldPointNative) { this = cast v; }

	@:from @:noCompletion public static inline function fromNative(v:B3LocalManifoldPointNative):B3LocalManifoldPoint { return new B3LocalManifoldPoint(v); }
	@:to @:noCompletion public static inline function toNative(v:B3LocalManifoldPoint):B3LocalManifoldPointNative { return cast v; }
	@:from @:noCompletion public static inline function fromStruct(v:B3LocalManifoldPointStruct):B3LocalManifoldPoint { return new B3LocalManifoldPoint(v); }
	@:to @:noCompletion public static inline function toStruct(v:B3LocalManifoldPoint):B3LocalManifoldPointStruct { return cast v; }
	@:to @:noCompletion public static inline function autoToPointer(v:B3LocalManifoldPoint):cpp.RawPointer<B3LocalManifoldPointNative> { return v.toPointer(); }

	public static inline function allocNativeArray(size:Int):cpp.Pointer<B3LocalManifoldPointNative> {
		return size > 0 ? cast cpp.NativeGc.allocGcBytes(cpp.Stdlib.sizeof(B3LocalManifoldPointNative) * size) : null;
	}
}


@:keep @:structAccess @:include("linc_box3d.h") @:native("b3LocalManifold")
extern class B3LocalManifoldNative {
	public var normal:B3Vec3Native;
	public var triangleNormal:B3Vec3Native;
	public var points:cpp.RawPointer<B3LocalManifoldPointNative>;
	public var pointCount:Int;
	public var triangleIndex:Int;
	public var i1:Int;
	public var i2:Int;
	public var i3:Int;
	public var squaredDistance:cpp.Float32;
	public var feature:B3TriangleFeature;
	public var triangleFlags:Int;
	public inline function toPointer():cpp.RawPointer<B3LocalManifoldNative> {
		return cpp.RawPointer.addressOf(cast this);
	}
}
@:keep @:include("linc_box3d.h") @:native("cpp.Reference<b3LocalManifold>")
extern class B3LocalManifoldRef extends B3LocalManifoldNative {}
@:keep @:include("linc_box3d.h") @:native("cpp.Struct<b3LocalManifold>")
extern class B3LocalManifoldStruct extends B3LocalManifoldRef {}

@:forward() @:transitive
abstract B3LocalManifold(B3LocalManifoldStruct) from B3LocalManifoldStruct to B3LocalManifoldStruct {
	overload extern public inline function new() { this = untyped __cpp__("b3LocalManifold()"); }
	overload extern public inline function new(v:B3LocalManifoldStruct) { this = v; }
	overload extern public inline function new(v:B3LocalManifoldNative) { this = cast v; }

	@:from @:noCompletion public static inline function fromNative(v:B3LocalManifoldNative):B3LocalManifold { return new B3LocalManifold(v); }
	@:to @:noCompletion public static inline function toNative(v:B3LocalManifold):B3LocalManifoldNative { return cast v; }
	@:from @:noCompletion public static inline function fromStruct(v:B3LocalManifoldStruct):B3LocalManifold { return new B3LocalManifold(v); }
	@:to @:noCompletion public static inline function toStruct(v:B3LocalManifold):B3LocalManifoldStruct { return cast v; }
	@:to @:noCompletion public static inline function autoToPointer(v:B3LocalManifold):cpp.RawPointer<B3LocalManifoldNative> { return v.toPointer(); }

	public static inline function allocNativeArray(size:Int):cpp.Pointer<B3LocalManifoldNative> {
		return size > 0 ? cast cpp.NativeGc.allocGcBytes(cpp.Stdlib.sizeof(B3LocalManifoldNative) * size) : null;
	}
}


@:keep @:structAccess @:include("linc_box3d.h") @:native("b3DebugShape")
extern class B3DebugShapeNative {
	public var shapeId:B3ShapeIdNative;
	public var type:B3ShapeType;
	public var capsule:cpp.RawConstPointer<B3CapsuleNative>;
	public var compound:cpp.RawConstPointer<B3CompoundDataNative>;
	public var heightField:cpp.RawConstPointer<B3HeightFieldDataNative>;
	public var hull:cpp.RawConstPointer<B3HullDataNative>;
	public var mesh:cpp.RawConstPointer<B3MeshNative>;
	public var sphere:cpp.RawConstPointer<B3SphereNative>;
	public inline function toPointer():cpp.RawPointer<B3DebugShapeNative> {
		return cpp.RawPointer.addressOf(cast this);
	}
}
@:keep @:include("linc_box3d.h") @:native("cpp.Reference<b3DebugShape>")
extern class B3DebugShapeRef extends B3DebugShapeNative {}
@:keep @:include("linc_box3d.h") @:native("cpp.Struct<b3DebugShape>")
extern class B3DebugShapeStruct extends B3DebugShapeRef {}

@:forward() @:transitive
abstract B3DebugShape(B3DebugShapeStruct) from B3DebugShapeStruct to B3DebugShapeStruct {
	overload extern public inline function new() { this = untyped __cpp__("b3DebugShape()"); }
	overload extern public inline function new(v:B3DebugShapeStruct) { this = v; }
	overload extern public inline function new(v:B3DebugShapeNative) { this = cast v; }

	@:from @:noCompletion public static inline function fromNative(v:B3DebugShapeNative):B3DebugShape { return new B3DebugShape(v); }
	@:to @:noCompletion public static inline function toNative(v:B3DebugShape):B3DebugShapeNative { return cast v; }
	@:from @:noCompletion public static inline function fromStruct(v:B3DebugShapeStruct):B3DebugShape { return new B3DebugShape(v); }
	@:to @:noCompletion public static inline function toStruct(v:B3DebugShape):B3DebugShapeStruct { return cast v; }
	@:to @:noCompletion public static inline function autoToPointer(v:B3DebugShape):cpp.RawPointer<B3DebugShapeNative> { return v.toPointer(); }

	public static inline function allocNativeArray(size:Int):cpp.Pointer<B3DebugShapeNative> {
		return size > 0 ? cast cpp.NativeGc.allocGcBytes(cpp.Stdlib.sizeof(B3DebugShapeNative) * size) : null;
	}
}


@:keep @:structAccess @:include("linc_box3d.h") @:native("b3WorldId")
extern class B3WorldIdNative {
	public var index1:cpp.UInt16;
	public var generation:cpp.UInt16;
	public inline function toPointer():cpp.RawPointer<B3WorldIdNative> {
		return cpp.RawPointer.addressOf(cast this);
	}
}
@:keep @:include("linc_box3d.h") @:native("cpp.Reference<b3WorldId>")
extern class B3WorldIdRef extends B3WorldIdNative {}
@:keep @:include("linc_box3d.h") @:native("cpp.Struct<b3WorldId>")
extern class B3WorldIdStruct extends B3WorldIdRef {}

@:forward() @:transitive
abstract B3WorldId(B3WorldIdStruct) from B3WorldIdStruct to B3WorldIdStruct {
	overload extern public inline function new() { this = untyped __cpp__("b3WorldId()"); }
	overload extern public inline function new(v:B3WorldIdStruct) { this = v; }
	overload extern public inline function new(v:B3WorldIdNative) { this = cast v; }

	@:from @:noCompletion public static inline function fromNative(v:B3WorldIdNative):B3WorldId { return new B3WorldId(v); }
	@:to @:noCompletion public static inline function toNative(v:B3WorldId):B3WorldIdNative { return cast v; }
	@:from @:noCompletion public static inline function fromStruct(v:B3WorldIdStruct):B3WorldId { return new B3WorldId(v); }
	@:to @:noCompletion public static inline function toStruct(v:B3WorldId):B3WorldIdStruct { return cast v; }
	@:to @:noCompletion public static inline function autoToPointer(v:B3WorldId):cpp.RawPointer<B3WorldIdNative> { return v.toPointer(); }

	public static inline function allocNativeArray(size:Int):cpp.Pointer<B3WorldIdNative> {
		return size > 0 ? cast cpp.NativeGc.allocGcBytes(cpp.Stdlib.sizeof(B3WorldIdNative) * size) : null;
	}
}


@:keep @:structAccess @:include("linc_box3d.h") @:native("b3BodyId")
extern class B3BodyIdNative {
	public var index1:Int;
	public var world0:cpp.UInt16;
	public var generation:cpp.UInt16;
	public inline function toPointer():cpp.RawPointer<B3BodyIdNative> {
		return cpp.RawPointer.addressOf(cast this);
	}
}
@:keep @:include("linc_box3d.h") @:native("cpp.Reference<b3BodyId>")
extern class B3BodyIdRef extends B3BodyIdNative {}
@:keep @:include("linc_box3d.h") @:native("cpp.Struct<b3BodyId>")
extern class B3BodyIdStruct extends B3BodyIdRef {}

@:forward() @:transitive
abstract B3BodyId(B3BodyIdStruct) from B3BodyIdStruct to B3BodyIdStruct {
	overload extern public inline function new() { this = untyped __cpp__("b3BodyId()"); }
	overload extern public inline function new(v:B3BodyIdStruct) { this = v; }
	overload extern public inline function new(v:B3BodyIdNative) { this = cast v; }

	@:from @:noCompletion public static inline function fromNative(v:B3BodyIdNative):B3BodyId { return new B3BodyId(v); }
	@:to @:noCompletion public static inline function toNative(v:B3BodyId):B3BodyIdNative { return cast v; }
	@:from @:noCompletion public static inline function fromStruct(v:B3BodyIdStruct):B3BodyId { return new B3BodyId(v); }
	@:to @:noCompletion public static inline function toStruct(v:B3BodyId):B3BodyIdStruct { return cast v; }
	@:to @:noCompletion public static inline function autoToPointer(v:B3BodyId):cpp.RawPointer<B3BodyIdNative> { return v.toPointer(); }

	public static inline function allocNativeArray(size:Int):cpp.Pointer<B3BodyIdNative> {
		return size > 0 ? cast cpp.NativeGc.allocGcBytes(cpp.Stdlib.sizeof(B3BodyIdNative) * size) : null;
	}
}


@:keep @:structAccess @:include("linc_box3d.h") @:native("b3ShapeId")
extern class B3ShapeIdNative {
	public var index1:Int;
	public var world0:cpp.UInt16;
	public var generation:cpp.UInt16;
	public inline function toPointer():cpp.RawPointer<B3ShapeIdNative> {
		return cpp.RawPointer.addressOf(cast this);
	}
}
@:keep @:include("linc_box3d.h") @:native("cpp.Reference<b3ShapeId>")
extern class B3ShapeIdRef extends B3ShapeIdNative {}
@:keep @:include("linc_box3d.h") @:native("cpp.Struct<b3ShapeId>")
extern class B3ShapeIdStruct extends B3ShapeIdRef {}

@:forward() @:transitive
abstract B3ShapeId(B3ShapeIdStruct) from B3ShapeIdStruct to B3ShapeIdStruct {
	overload extern public inline function new() { this = untyped __cpp__("b3ShapeId()"); }
	overload extern public inline function new(v:B3ShapeIdStruct) { this = v; }
	overload extern public inline function new(v:B3ShapeIdNative) { this = cast v; }

	@:from @:noCompletion public static inline function fromNative(v:B3ShapeIdNative):B3ShapeId { return new B3ShapeId(v); }
	@:to @:noCompletion public static inline function toNative(v:B3ShapeId):B3ShapeIdNative { return cast v; }
	@:from @:noCompletion public static inline function fromStruct(v:B3ShapeIdStruct):B3ShapeId { return new B3ShapeId(v); }
	@:to @:noCompletion public static inline function toStruct(v:B3ShapeId):B3ShapeIdStruct { return cast v; }
	@:to @:noCompletion public static inline function autoToPointer(v:B3ShapeId):cpp.RawPointer<B3ShapeIdNative> { return v.toPointer(); }

	public static inline function allocNativeArray(size:Int):cpp.Pointer<B3ShapeIdNative> {
		return size > 0 ? cast cpp.NativeGc.allocGcBytes(cpp.Stdlib.sizeof(B3ShapeIdNative) * size) : null;
	}
}


@:keep @:structAccess @:include("linc_box3d.h") @:native("b3JointId")
extern class B3JointIdNative {
	public var index1:Int;
	public var world0:cpp.UInt16;
	public var generation:cpp.UInt16;
	public inline function toPointer():cpp.RawPointer<B3JointIdNative> {
		return cpp.RawPointer.addressOf(cast this);
	}
}
@:keep @:include("linc_box3d.h") @:native("cpp.Reference<b3JointId>")
extern class B3JointIdRef extends B3JointIdNative {}
@:keep @:include("linc_box3d.h") @:native("cpp.Struct<b3JointId>")
extern class B3JointIdStruct extends B3JointIdRef {}

@:forward() @:transitive
abstract B3JointId(B3JointIdStruct) from B3JointIdStruct to B3JointIdStruct {
	overload extern public inline function new() { this = untyped __cpp__("b3JointId()"); }
	overload extern public inline function new(v:B3JointIdStruct) { this = v; }
	overload extern public inline function new(v:B3JointIdNative) { this = cast v; }

	@:from @:noCompletion public static inline function fromNative(v:B3JointIdNative):B3JointId { return new B3JointId(v); }
	@:to @:noCompletion public static inline function toNative(v:B3JointId):B3JointIdNative { return cast v; }
	@:from @:noCompletion public static inline function fromStruct(v:B3JointIdStruct):B3JointId { return new B3JointId(v); }
	@:to @:noCompletion public static inline function toStruct(v:B3JointId):B3JointIdStruct { return cast v; }
	@:to @:noCompletion public static inline function autoToPointer(v:B3JointId):cpp.RawPointer<B3JointIdNative> { return v.toPointer(); }

	public static inline function allocNativeArray(size:Int):cpp.Pointer<B3JointIdNative> {
		return size > 0 ? cast cpp.NativeGc.allocGcBytes(cpp.Stdlib.sizeof(B3JointIdNative) * size) : null;
	}
}


@:keep @:structAccess @:include("linc_box3d.h") @:native("b3ContactId")
extern class B3ContactIdNative {
	public var index1:Int;
	public var world0:cpp.UInt16;
	public var padding:cpp.Int16;
	public var generation:cpp.UInt32;
	public inline function toPointer():cpp.RawPointer<B3ContactIdNative> {
		return cpp.RawPointer.addressOf(cast this);
	}
}
@:keep @:include("linc_box3d.h") @:native("cpp.Reference<b3ContactId>")
extern class B3ContactIdRef extends B3ContactIdNative {}
@:keep @:include("linc_box3d.h") @:native("cpp.Struct<b3ContactId>")
extern class B3ContactIdStruct extends B3ContactIdRef {}

@:forward() @:transitive
abstract B3ContactId(B3ContactIdStruct) from B3ContactIdStruct to B3ContactIdStruct {
	overload extern public inline function new() { this = untyped __cpp__("b3ContactId()"); }
	overload extern public inline function new(v:B3ContactIdStruct) { this = v; }
	overload extern public inline function new(v:B3ContactIdNative) { this = cast v; }

	@:from @:noCompletion public static inline function fromNative(v:B3ContactIdNative):B3ContactId { return new B3ContactId(v); }
	@:to @:noCompletion public static inline function toNative(v:B3ContactId):B3ContactIdNative { return cast v; }
	@:from @:noCompletion public static inline function fromStruct(v:B3ContactIdStruct):B3ContactId { return new B3ContactId(v); }
	@:to @:noCompletion public static inline function toStruct(v:B3ContactId):B3ContactIdStruct { return cast v; }
	@:to @:noCompletion public static inline function autoToPointer(v:B3ContactId):cpp.RawPointer<B3ContactIdNative> { return v.toPointer(); }

	public static inline function allocNativeArray(size:Int):cpp.Pointer<B3ContactIdNative> {
		return size > 0 ? cast cpp.NativeGc.allocGcBytes(cpp.Stdlib.sizeof(B3ContactIdNative) * size) : null;
	}
}


@:keep @:structAccess @:include("linc_box3d.h") @:native("b3RecPlayerInfo")
extern class B3RecPlayerInfoNative {
	public var frameCount:Int;
	public var workerCount:Int;
	public var timeStep:cpp.Float32;
	public var subStepCount:Int;
	public var lengthScale:cpp.Float32;
	public var bounds:B3AABBNative;
	public inline function toPointer():cpp.RawPointer<B3RecPlayerInfoNative> {
		return cpp.RawPointer.addressOf(cast this);
	}
}
@:keep @:include("linc_box3d.h") @:native("cpp.Reference<b3RecPlayerInfo>")
extern class B3RecPlayerInfoRef extends B3RecPlayerInfoNative {}
@:keep @:include("linc_box3d.h") @:native("cpp.Struct<b3RecPlayerInfo>")
extern class B3RecPlayerInfoStruct extends B3RecPlayerInfoRef {}

@:forward() @:transitive
abstract B3RecPlayerInfo(B3RecPlayerInfoStruct) from B3RecPlayerInfoStruct to B3RecPlayerInfoStruct {
	overload extern public inline function new() { this = untyped __cpp__("b3RecPlayerInfo()"); }
	overload extern public inline function new(v:B3RecPlayerInfoStruct) { this = v; }
	overload extern public inline function new(v:B3RecPlayerInfoNative) { this = cast v; }

	@:from @:noCompletion public static inline function fromNative(v:B3RecPlayerInfoNative):B3RecPlayerInfo { return new B3RecPlayerInfo(v); }
	@:to @:noCompletion public static inline function toNative(v:B3RecPlayerInfo):B3RecPlayerInfoNative { return cast v; }
	@:from @:noCompletion public static inline function fromStruct(v:B3RecPlayerInfoStruct):B3RecPlayerInfo { return new B3RecPlayerInfo(v); }
	@:to @:noCompletion public static inline function toStruct(v:B3RecPlayerInfo):B3RecPlayerInfoStruct { return cast v; }
	@:to @:noCompletion public static inline function autoToPointer(v:B3RecPlayerInfo):cpp.RawPointer<B3RecPlayerInfoNative> { return v.toPointer(); }

	public static inline function allocNativeArray(size:Int):cpp.Pointer<B3RecPlayerInfoNative> {
		return size > 0 ? cast cpp.NativeGc.allocGcBytes(cpp.Stdlib.sizeof(B3RecPlayerInfoNative) * size) : null;
	}
}


@:keep @:structAccess @:include("linc_box3d.h") @:native("b3RecQueryInfo")
extern class B3RecQueryInfoNative {
	public var type:B3RecQueryType;
	public var filter:B3QueryFilterNative;
	public var aabb:B3AABBNative;
	public var origin:B3PosNative;
	public var translation:B3Vec3Native;
	public var hitCount:Int;
	public var key:cpp.UInt64;
	public var id:cpp.UInt64;
	public var name:cpp.ConstCharStar;
	public inline function toPointer():cpp.RawPointer<B3RecQueryInfoNative> {
		return cpp.RawPointer.addressOf(cast this);
	}
}
@:keep @:include("linc_box3d.h") @:native("cpp.Reference<b3RecQueryInfo>")
extern class B3RecQueryInfoRef extends B3RecQueryInfoNative {}
@:keep @:include("linc_box3d.h") @:native("cpp.Struct<b3RecQueryInfo>")
extern class B3RecQueryInfoStruct extends B3RecQueryInfoRef {}

@:forward() @:transitive
abstract B3RecQueryInfo(B3RecQueryInfoStruct) from B3RecQueryInfoStruct to B3RecQueryInfoStruct {
	overload extern public inline function new() { this = untyped __cpp__("b3RecQueryInfo()"); }
	overload extern public inline function new(v:B3RecQueryInfoStruct) { this = v; }
	overload extern public inline function new(v:B3RecQueryInfoNative) { this = cast v; }

	@:from @:noCompletion public static inline function fromNative(v:B3RecQueryInfoNative):B3RecQueryInfo { return new B3RecQueryInfo(v); }
	@:to @:noCompletion public static inline function toNative(v:B3RecQueryInfo):B3RecQueryInfoNative { return cast v; }
	@:from @:noCompletion public static inline function fromStruct(v:B3RecQueryInfoStruct):B3RecQueryInfo { return new B3RecQueryInfo(v); }
	@:to @:noCompletion public static inline function toStruct(v:B3RecQueryInfo):B3RecQueryInfoStruct { return cast v; }
	@:to @:noCompletion public static inline function autoToPointer(v:B3RecQueryInfo):cpp.RawPointer<B3RecQueryInfoNative> { return v.toPointer(); }

	public static inline function allocNativeArray(size:Int):cpp.Pointer<B3RecQueryInfoNative> {
		return size > 0 ? cast cpp.NativeGc.allocGcBytes(cpp.Stdlib.sizeof(B3RecQueryInfoNative) * size) : null;
	}
}


@:keep @:structAccess @:include("linc_box3d.h") @:native("b3RecQueryHit")
extern class B3RecQueryHitNative {
	public var shape:B3ShapeIdNative;
	public var point:B3PosNative;
	public var normal:B3Vec3Native;
	public var fraction:cpp.Float32;
	public inline function toPointer():cpp.RawPointer<B3RecQueryHitNative> {
		return cpp.RawPointer.addressOf(cast this);
	}
}
@:keep @:include("linc_box3d.h") @:native("cpp.Reference<b3RecQueryHit>")
extern class B3RecQueryHitRef extends B3RecQueryHitNative {}
@:keep @:include("linc_box3d.h") @:native("cpp.Struct<b3RecQueryHit>")
extern class B3RecQueryHitStruct extends B3RecQueryHitRef {}

@:forward() @:transitive
abstract B3RecQueryHit(B3RecQueryHitStruct) from B3RecQueryHitStruct to B3RecQueryHitStruct {
	overload extern public inline function new() { this = untyped __cpp__("b3RecQueryHit()"); }
	overload extern public inline function new(v:B3RecQueryHitStruct) { this = v; }
	overload extern public inline function new(v:B3RecQueryHitNative) { this = cast v; }

	@:from @:noCompletion public static inline function fromNative(v:B3RecQueryHitNative):B3RecQueryHit { return new B3RecQueryHit(v); }
	@:to @:noCompletion public static inline function toNative(v:B3RecQueryHit):B3RecQueryHitNative { return cast v; }
	@:from @:noCompletion public static inline function fromStruct(v:B3RecQueryHitStruct):B3RecQueryHit { return new B3RecQueryHit(v); }
	@:to @:noCompletion public static inline function toStruct(v:B3RecQueryHit):B3RecQueryHitStruct { return cast v; }
	@:to @:noCompletion public static inline function autoToPointer(v:B3RecQueryHit):cpp.RawPointer<B3RecQueryHitNative> { return v.toPointer(); }

	public static inline function allocNativeArray(size:Int):cpp.Pointer<B3RecQueryHitNative> {
		return size > 0 ? cast cpp.NativeGc.allocGcBytes(cpp.Stdlib.sizeof(B3RecQueryHitNative) * size) : null;
	}
}


@:keep @:structAccess @:include("linc_box3d.h") @:native("b3Vec2")
extern class B3Vec2Native {
	public var x:cpp.Float32;
	public var y:cpp.Float32;
	public inline function toPointer():cpp.RawPointer<B3Vec2Native> {
		return cpp.RawPointer.addressOf(cast this);
	}
}
@:keep @:include("linc_box3d.h") @:native("cpp.Reference<b3Vec2>")
extern class B3Vec2Ref extends B3Vec2Native {}
@:keep @:include("linc_box3d.h") @:native("cpp.Struct<b3Vec2>")
extern class B3Vec2Struct extends B3Vec2Ref {}

@:forward() @:transitive
abstract B3Vec2(B3Vec2Struct) from B3Vec2Struct to B3Vec2Struct {
	overload extern public inline function new() { this = untyped __cpp__("b3Vec2()"); }
	overload extern public inline function new(v:B3Vec2Struct) { this = v; }
	overload extern public inline function new(v:B3Vec2Native) { this = cast v; }

	@:from @:noCompletion public static inline function fromNative(v:B3Vec2Native):B3Vec2 { return new B3Vec2(v); }
	@:to @:noCompletion public static inline function toNative(v:B3Vec2):B3Vec2Native { return cast v; }
	@:from @:noCompletion public static inline function fromStruct(v:B3Vec2Struct):B3Vec2 { return new B3Vec2(v); }
	@:to @:noCompletion public static inline function toStruct(v:B3Vec2):B3Vec2Struct { return cast v; }
	@:to @:noCompletion public static inline function autoToPointer(v:B3Vec2):cpp.RawPointer<B3Vec2Native> { return v.toPointer(); }

	public static inline function allocNativeArray(size:Int):cpp.Pointer<B3Vec2Native> {
		return size > 0 ? cast cpp.NativeGc.allocGcBytes(cpp.Stdlib.sizeof(B3Vec2Native) * size) : null;
	}
}


@:keep @:structAccess @:include("linc_box3d.h") @:native("b3CosSin")
extern class B3CosSinNative {
	public var cosine:cpp.Float32;
	public var sine:cpp.Float32;
	public inline function toPointer():cpp.RawPointer<B3CosSinNative> {
		return cpp.RawPointer.addressOf(cast this);
	}
}
@:keep @:include("linc_box3d.h") @:native("cpp.Reference<b3CosSin>")
extern class B3CosSinRef extends B3CosSinNative {}
@:keep @:include("linc_box3d.h") @:native("cpp.Struct<b3CosSin>")
extern class B3CosSinStruct extends B3CosSinRef {}

@:forward() @:transitive
abstract B3CosSin(B3CosSinStruct) from B3CosSinStruct to B3CosSinStruct {
	overload extern public inline function new() { this = untyped __cpp__("b3CosSin()"); }
	overload extern public inline function new(v:B3CosSinStruct) { this = v; }
	overload extern public inline function new(v:B3CosSinNative) { this = cast v; }

	@:from @:noCompletion public static inline function fromNative(v:B3CosSinNative):B3CosSin { return new B3CosSin(v); }
	@:to @:noCompletion public static inline function toNative(v:B3CosSin):B3CosSinNative { return cast v; }
	@:from @:noCompletion public static inline function fromStruct(v:B3CosSinStruct):B3CosSin { return new B3CosSin(v); }
	@:to @:noCompletion public static inline function toStruct(v:B3CosSin):B3CosSinStruct { return cast v; }
	@:to @:noCompletion public static inline function autoToPointer(v:B3CosSin):cpp.RawPointer<B3CosSinNative> { return v.toPointer(); }

	public static inline function allocNativeArray(size:Int):cpp.Pointer<B3CosSinNative> {
		return size > 0 ? cast cpp.NativeGc.allocGcBytes(cpp.Stdlib.sizeof(B3CosSinNative) * size) : null;
	}
}


@:keep @:structAccess @:include("linc_box3d.h") @:native("b3Quat")
extern class B3QuatNative {
	public var v:B3Vec3Native;
	public var s:cpp.Float32;
	public inline function toPointer():cpp.RawPointer<B3QuatNative> {
		return cpp.RawPointer.addressOf(cast this);
	}
}
@:keep @:include("linc_box3d.h") @:native("cpp.Reference<b3Quat>")
extern class B3QuatRef extends B3QuatNative {}
@:keep @:include("linc_box3d.h") @:native("cpp.Struct<b3Quat>")
extern class B3QuatStruct extends B3QuatRef {}

@:forward() @:transitive
abstract B3Quat(B3QuatStruct) from B3QuatStruct to B3QuatStruct {
	overload extern public inline function new() { this = untyped __cpp__("b3Quat()"); }
	overload extern public inline function new(v:B3QuatStruct) { this = v; }
	overload extern public inline function new(v:B3QuatNative) { this = cast v; }

	@:from @:noCompletion public static inline function fromNative(v:B3QuatNative):B3Quat { return new B3Quat(v); }
	@:to @:noCompletion public static inline function toNative(v:B3Quat):B3QuatNative { return cast v; }
	@:from @:noCompletion public static inline function fromStruct(v:B3QuatStruct):B3Quat { return new B3Quat(v); }
	@:to @:noCompletion public static inline function toStruct(v:B3Quat):B3QuatStruct { return cast v; }
	@:to @:noCompletion public static inline function autoToPointer(v:B3Quat):cpp.RawPointer<B3QuatNative> { return v.toPointer(); }

	public static inline function allocNativeArray(size:Int):cpp.Pointer<B3QuatNative> {
		return size > 0 ? cast cpp.NativeGc.allocGcBytes(cpp.Stdlib.sizeof(B3QuatNative) * size) : null;
	}
}


@:keep @:structAccess @:include("linc_box3d.h") @:native("b3AABB")
extern class B3AABBNative {
	public var lowerBound:B3Vec3Native;
	public var upperBound:B3Vec3Native;
	public inline function toPointer():cpp.RawPointer<B3AABBNative> {
		return cpp.RawPointer.addressOf(cast this);
	}
}
@:keep @:include("linc_box3d.h") @:native("cpp.Reference<b3AABB>")
extern class B3AABBRef extends B3AABBNative {}
@:keep @:include("linc_box3d.h") @:native("cpp.Struct<b3AABB>")
extern class B3AABBStruct extends B3AABBRef {}

@:forward() @:transitive
abstract B3AABB(B3AABBStruct) from B3AABBStruct to B3AABBStruct {
	overload extern public inline function new() { this = untyped __cpp__("b3AABB()"); }
	overload extern public inline function new(v:B3AABBStruct) { this = v; }
	overload extern public inline function new(v:B3AABBNative) { this = cast v; }

	@:from @:noCompletion public static inline function fromNative(v:B3AABBNative):B3AABB { return new B3AABB(v); }
	@:to @:noCompletion public static inline function toNative(v:B3AABB):B3AABBNative { return cast v; }
	@:from @:noCompletion public static inline function fromStruct(v:B3AABBStruct):B3AABB { return new B3AABB(v); }
	@:to @:noCompletion public static inline function toStruct(v:B3AABB):B3AABBStruct { return cast v; }
	@:to @:noCompletion public static inline function autoToPointer(v:B3AABB):cpp.RawPointer<B3AABBNative> { return v.toPointer(); }

	public static inline function allocNativeArray(size:Int):cpp.Pointer<B3AABBNative> {
		return size > 0 ? cast cpp.NativeGc.allocGcBytes(cpp.Stdlib.sizeof(B3AABBNative) * size) : null;
	}
}


@:keep @:structAccess @:include("linc_box3d.h") @:native("b3Plane")
extern class B3PlaneNative {
	public var normal:B3Vec3Native;
	public var offset:cpp.Float32;
	public inline function toPointer():cpp.RawPointer<B3PlaneNative> {
		return cpp.RawPointer.addressOf(cast this);
	}
}
@:keep @:include("linc_box3d.h") @:native("cpp.Reference<b3Plane>")
extern class B3PlaneRef extends B3PlaneNative {}
@:keep @:include("linc_box3d.h") @:native("cpp.Struct<b3Plane>")
extern class B3PlaneStruct extends B3PlaneRef {}

@:forward() @:transitive
abstract B3Plane(B3PlaneStruct) from B3PlaneStruct to B3PlaneStruct {
	overload extern public inline function new() { this = untyped __cpp__("b3Plane()"); }
	overload extern public inline function new(v:B3PlaneStruct) { this = v; }
	overload extern public inline function new(v:B3PlaneNative) { this = cast v; }

	@:from @:noCompletion public static inline function fromNative(v:B3PlaneNative):B3Plane { return new B3Plane(v); }
	@:to @:noCompletion public static inline function toNative(v:B3Plane):B3PlaneNative { return cast v; }
	@:from @:noCompletion public static inline function fromStruct(v:B3PlaneStruct):B3Plane { return new B3Plane(v); }
	@:to @:noCompletion public static inline function toStruct(v:B3Plane):B3PlaneStruct { return cast v; }
	@:to @:noCompletion public static inline function autoToPointer(v:B3Plane):cpp.RawPointer<B3PlaneNative> { return v.toPointer(); }

	public static inline function allocNativeArray(size:Int):cpp.Pointer<B3PlaneNative> {
		return size > 0 ? cast cpp.NativeGc.allocGcBytes(cpp.Stdlib.sizeof(B3PlaneNative) * size) : null;
	}
}


@:keep @:structAccess @:include("linc_box3d.h") @:native("b3SegmentDistanceResult")
extern class B3SegmentDistanceResultNative {
	public var point1:B3Vec3Native;
	public var fraction1:cpp.Float32;
	public var point2:B3Vec3Native;
	public var fraction2:cpp.Float32;
	public inline function toPointer():cpp.RawPointer<B3SegmentDistanceResultNative> {
		return cpp.RawPointer.addressOf(cast this);
	}
}
@:keep @:include("linc_box3d.h") @:native("cpp.Reference<b3SegmentDistanceResult>")
extern class B3SegmentDistanceResultRef extends B3SegmentDistanceResultNative {}
@:keep @:include("linc_box3d.h") @:native("cpp.Struct<b3SegmentDistanceResult>")
extern class B3SegmentDistanceResultStruct extends B3SegmentDistanceResultRef {}

@:forward() @:transitive
abstract B3SegmentDistanceResult(B3SegmentDistanceResultStruct) from B3SegmentDistanceResultStruct to B3SegmentDistanceResultStruct {
	overload extern public inline function new() { this = untyped __cpp__("b3SegmentDistanceResult()"); }
	overload extern public inline function new(v:B3SegmentDistanceResultStruct) { this = v; }
	overload extern public inline function new(v:B3SegmentDistanceResultNative) { this = cast v; }

	@:from @:noCompletion public static inline function fromNative(v:B3SegmentDistanceResultNative):B3SegmentDistanceResult { return new B3SegmentDistanceResult(v); }
	@:to @:noCompletion public static inline function toNative(v:B3SegmentDistanceResult):B3SegmentDistanceResultNative { return cast v; }
	@:from @:noCompletion public static inline function fromStruct(v:B3SegmentDistanceResultStruct):B3SegmentDistanceResult { return new B3SegmentDistanceResult(v); }
	@:to @:noCompletion public static inline function toStruct(v:B3SegmentDistanceResult):B3SegmentDistanceResultStruct { return cast v; }
	@:to @:noCompletion public static inline function autoToPointer(v:B3SegmentDistanceResult):cpp.RawPointer<B3SegmentDistanceResultNative> { return v.toPointer(); }

	public static inline function allocNativeArray(size:Int):cpp.Pointer<B3SegmentDistanceResultNative> {
		return size > 0 ? cast cpp.NativeGc.allocGcBytes(cpp.Stdlib.sizeof(B3SegmentDistanceResultNative) * size) : null;
	}
}


@:keep @:include("linc_box3d.h")
extern enum abstract B3BodyType(Int) from Int to Int {
	@:native("b3_staticBody") public static var staticBody:Int;
	@:native("b3_kinematicBody") public static var kinematicBody:Int;
	@:native("b3_dynamicBody") public static var dynamicBody:Int;
	@:native("b3_bodyTypeCount") public static var bodyTypeCount:Int;
}

@:keep @:include("linc_box3d.h")
extern enum abstract B3ShapeType(Int) from Int to Int {
	@:native("b3_capsuleShape") public static var capsuleShape:Int;
	@:native("b3_compoundShape") public static var compoundShape:Int;
	@:native("b3_heightShape") public static var heightShape:Int;
	@:native("b3_hullShape") public static var hullShape:Int;
	@:native("b3_meshShape") public static var meshShape:Int;
	@:native("b3_sphereShape") public static var sphereShape:Int;
	@:native("b3_shapeTypeCount") public static var shapeTypeCount:Int;
}

@:keep @:include("linc_box3d.h")
extern enum abstract B3JointType(Int) from Int to Int {
	@:native("b3_parallelJoint") public static var parallelJoint:Int;
	@:native("b3_distanceJoint") public static var distanceJoint:Int;
	@:native("b3_filterJoint") public static var filterJoint:Int;
	@:native("b3_motorJoint") public static var motorJoint:Int;
	@:native("b3_prismaticJoint") public static var prismaticJoint:Int;
	@:native("b3_revoluteJoint") public static var revoluteJoint:Int;
	@:native("b3_sphericalJoint") public static var sphericalJoint:Int;
	@:native("b3_weldJoint") public static var weldJoint:Int;
	@:native("b3_wheelJoint") public static var wheelJoint:Int;
}

@:keep @:include("linc_box3d.h")
extern enum abstract B3TOIState(Int) from Int to Int {
	@:native("b3_toiStateUnknown") public static var toiStateUnknown:Int;
	@:native("b3_toiStateFailed") public static var toiStateFailed:Int;
	@:native("b3_toiStateOverlapped") public static var toiStateOverlapped:Int;
	@:native("b3_toiStateHit") public static var toiStateHit:Int;
	@:native("b3_toiStateSeparated") public static var toiStateSeparated:Int;
}

@:keep @:include("linc_box3d.h")
extern enum abstract B3TreeNodeFlags(Int) from Int to Int {
	@:native("b3_allocatedNode") public static var allocatedNode:Int;
	@:native("b3_enlargedNode") public static var enlargedNode:Int;
	@:native("b3_leafNode") public static var leafNode:Int;
}

@:keep @:include("linc_box3d.h")
extern enum abstract B3MeshEdgeFlags(Int) from Int to Int {
	@:native("b3_concaveEdge1") public static var concaveEdge1:Int;
	@:native("b3_concaveEdge2") public static var concaveEdge2:Int;
	@:native("b3_concaveEdge3") public static var concaveEdge3:Int;
	@:native("b3_inverseConcaveEdge1") public static var inverseConcaveEdge1:Int;
	@:native("b3_inverseConcaveEdge2") public static var inverseConcaveEdge2:Int;
	@:native("b3_inverseConcaveEdge3") public static var inverseConcaveEdge3:Int;
	@:native("b3_allConcaveEdges") public static var allConcaveEdges:Int;
	@:native("b3_flatEdge1") public static var flatEdge1:Int;
	@:native("b3_flatEdge2") public static var flatEdge2:Int;
	@:native("b3_flatEdge3") public static var flatEdge3:Int;
	@:native("b3_allFlatEdges") public static var allFlatEdges:Int;
}

@:keep @:include("linc_box3d.h")
extern enum abstract B3SeparatingFeature(Int) from Int to Int {
	@:native("b3_invalidAxis") public static var invalidAxis:Int;
	@:native("b3_backsideAxis") public static var backsideAxis:Int;
	@:native("b3_faceAxisA") public static var faceAxisA:Int;
	@:native("b3_faceAxisB") public static var faceAxisB:Int;
	@:native("b3_edgePairAxis") public static var edgePairAxis:Int;
	@:native("b3_closestPointsAxis") public static var closestPointsAxis:Int;
	@:native("b3_manualFaceAxisA") public static var manualFaceAxisA:Int;
	@:native("b3_manualFaceAxisB") public static var manualFaceAxisB:Int;
	@:native("b3_manualEdgePairAxis") public static var manualEdgePairAxis:Int;
}

@:keep @:include("linc_box3d.h")
extern enum abstract B3TriangleFeature(Int) from Int to Int {
	@:native("b3_featureNone") public static var featureNone:Int;
	@:native("b3_featureTriangleFace") public static var featureTriangleFace:Int;
	@:native("b3_featureHullFace") public static var featureHullFace:Int;
	@:native("b3_featureEdge1") public static var featureEdge1:Int;
	@:native("b3_featureEdge2") public static var featureEdge2:Int;
	@:native("b3_featureEdge3") public static var featureEdge3:Int;
	@:native("b3_featureVertex1") public static var featureVertex1:Int;
	@:native("b3_featureVertex2") public static var featureVertex2:Int;
	@:native("b3_featureVertex3") public static var featureVertex3:Int;
}

@:keep @:include("linc_box3d.h")
extern enum abstract B3HexColor(Int) from Int to Int {
	@:native("b3_colorAliceBlue") public static var colorAliceBlue:Int;
	@:native("b3_colorAntiqueWhite") public static var colorAntiqueWhite:Int;
	@:native("b3_colorAqua") public static var colorAqua:Int;
	@:native("b3_colorAquamarine") public static var colorAquamarine:Int;
	@:native("b3_colorAzure") public static var colorAzure:Int;
	@:native("b3_colorBeige") public static var colorBeige:Int;
	@:native("b3_colorBisque") public static var colorBisque:Int;
	@:native("b3_colorBlack") public static var colorBlack:Int;
	@:native("b3_colorBlanchedAlmond") public static var colorBlanchedAlmond:Int;
	@:native("b3_colorBlue") public static var colorBlue:Int;
	@:native("b3_colorBlueViolet") public static var colorBlueViolet:Int;
	@:native("b3_colorBrown") public static var colorBrown:Int;
	@:native("b3_colorBurlywood") public static var colorBurlywood:Int;
	@:native("b3_colorCadetBlue") public static var colorCadetBlue:Int;
	@:native("b3_colorChartreuse") public static var colorChartreuse:Int;
	@:native("b3_colorChocolate") public static var colorChocolate:Int;
	@:native("b3_colorCoral") public static var colorCoral:Int;
	@:native("b3_colorCornflowerBlue") public static var colorCornflowerBlue:Int;
	@:native("b3_colorCornsilk") public static var colorCornsilk:Int;
	@:native("b3_colorCrimson") public static var colorCrimson:Int;
	@:native("b3_colorCyan") public static var colorCyan:Int;
	@:native("b3_colorDarkBlue") public static var colorDarkBlue:Int;
	@:native("b3_colorDarkCyan") public static var colorDarkCyan:Int;
	@:native("b3_colorDarkGoldenRod") public static var colorDarkGoldenRod:Int;
	@:native("b3_colorDarkGray") public static var colorDarkGray:Int;
	@:native("b3_colorDarkGreen") public static var colorDarkGreen:Int;
	@:native("b3_colorDarkKhaki") public static var colorDarkKhaki:Int;
	@:native("b3_colorDarkMagenta") public static var colorDarkMagenta:Int;
	@:native("b3_colorDarkOliveGreen") public static var colorDarkOliveGreen:Int;
	@:native("b3_colorDarkOrange") public static var colorDarkOrange:Int;
	@:native("b3_colorDarkOrchid") public static var colorDarkOrchid:Int;
	@:native("b3_colorDarkRed") public static var colorDarkRed:Int;
	@:native("b3_colorDarkSalmon") public static var colorDarkSalmon:Int;
	@:native("b3_colorDarkSeaGreen") public static var colorDarkSeaGreen:Int;
	@:native("b3_colorDarkSlateBlue") public static var colorDarkSlateBlue:Int;
	@:native("b3_colorDarkSlateGray") public static var colorDarkSlateGray:Int;
	@:native("b3_colorDarkTurquoise") public static var colorDarkTurquoise:Int;
	@:native("b3_colorDarkViolet") public static var colorDarkViolet:Int;
	@:native("b3_colorDeepPink") public static var colorDeepPink:Int;
	@:native("b3_colorDeepSkyBlue") public static var colorDeepSkyBlue:Int;
	@:native("b3_colorDimGray") public static var colorDimGray:Int;
	@:native("b3_colorDodgerBlue") public static var colorDodgerBlue:Int;
	@:native("b3_colorFireBrick") public static var colorFireBrick:Int;
	@:native("b3_colorFloralWhite") public static var colorFloralWhite:Int;
	@:native("b3_colorForestGreen") public static var colorForestGreen:Int;
	@:native("b3_colorFuchsia") public static var colorFuchsia:Int;
	@:native("b3_colorGainsboro") public static var colorGainsboro:Int;
	@:native("b3_colorGhostWhite") public static var colorGhostWhite:Int;
	@:native("b3_colorGold") public static var colorGold:Int;
	@:native("b3_colorGoldenRod") public static var colorGoldenRod:Int;
	@:native("b3_colorGray") public static var colorGray:Int;
	@:native("b3_colorGreen") public static var colorGreen:Int;
	@:native("b3_colorGreenYellow") public static var colorGreenYellow:Int;
	@:native("b3_colorHoneyDew") public static var colorHoneyDew:Int;
	@:native("b3_colorHotPink") public static var colorHotPink:Int;
	@:native("b3_colorIndianRed") public static var colorIndianRed:Int;
	@:native("b3_colorIndigo") public static var colorIndigo:Int;
	@:native("b3_colorIvory") public static var colorIvory:Int;
	@:native("b3_colorKhaki") public static var colorKhaki:Int;
	@:native("b3_colorLavender") public static var colorLavender:Int;
	@:native("b3_colorLavenderBlush") public static var colorLavenderBlush:Int;
	@:native("b3_colorLawnGreen") public static var colorLawnGreen:Int;
	@:native("b3_colorLemonChiffon") public static var colorLemonChiffon:Int;
	@:native("b3_colorLightBlue") public static var colorLightBlue:Int;
	@:native("b3_colorLightCoral") public static var colorLightCoral:Int;
	@:native("b3_colorLightCyan") public static var colorLightCyan:Int;
	@:native("b3_colorLightGoldenRodYellow") public static var colorLightGoldenRodYellow:Int;
	@:native("b3_colorLightGray") public static var colorLightGray:Int;
	@:native("b3_colorLightGreen") public static var colorLightGreen:Int;
	@:native("b3_colorLightPink") public static var colorLightPink:Int;
	@:native("b3_colorLightSalmon") public static var colorLightSalmon:Int;
	@:native("b3_colorLightSeaGreen") public static var colorLightSeaGreen:Int;
	@:native("b3_colorLightSkyBlue") public static var colorLightSkyBlue:Int;
	@:native("b3_colorLightSlateGray") public static var colorLightSlateGray:Int;
	@:native("b3_colorLightSteelBlue") public static var colorLightSteelBlue:Int;
	@:native("b3_colorLightYellow") public static var colorLightYellow:Int;
	@:native("b3_colorLime") public static var colorLime:Int;
	@:native("b3_colorLimeGreen") public static var colorLimeGreen:Int;
	@:native("b3_colorLinen") public static var colorLinen:Int;
	@:native("b3_colorMagenta") public static var colorMagenta:Int;
	@:native("b3_colorMaroon") public static var colorMaroon:Int;
	@:native("b3_colorMediumAquaMarine") public static var colorMediumAquaMarine:Int;
	@:native("b3_colorMediumBlue") public static var colorMediumBlue:Int;
	@:native("b3_colorMediumOrchid") public static var colorMediumOrchid:Int;
	@:native("b3_colorMediumPurple") public static var colorMediumPurple:Int;
	@:native("b3_colorMediumSeaGreen") public static var colorMediumSeaGreen:Int;
	@:native("b3_colorMediumSlateBlue") public static var colorMediumSlateBlue:Int;
	@:native("b3_colorMediumSpringGreen") public static var colorMediumSpringGreen:Int;
	@:native("b3_colorMediumTurquoise") public static var colorMediumTurquoise:Int;
	@:native("b3_colorMediumVioletRed") public static var colorMediumVioletRed:Int;
	@:native("b3_colorMidnightBlue") public static var colorMidnightBlue:Int;
	@:native("b3_colorMintCream") public static var colorMintCream:Int;
	@:native("b3_colorMistyRose") public static var colorMistyRose:Int;
	@:native("b3_colorMoccasin") public static var colorMoccasin:Int;
	@:native("b3_colorNavajoWhite") public static var colorNavajoWhite:Int;
	@:native("b3_colorNavy") public static var colorNavy:Int;
	@:native("b3_colorOldLace") public static var colorOldLace:Int;
	@:native("b3_colorOlive") public static var colorOlive:Int;
	@:native("b3_colorOliveDrab") public static var colorOliveDrab:Int;
	@:native("b3_colorOrange") public static var colorOrange:Int;
	@:native("b3_colorOrangeRed") public static var colorOrangeRed:Int;
	@:native("b3_colorOrchid") public static var colorOrchid:Int;
	@:native("b3_colorPaleGoldenRod") public static var colorPaleGoldenRod:Int;
	@:native("b3_colorPaleGreen") public static var colorPaleGreen:Int;
	@:native("b3_colorPaleTurquoise") public static var colorPaleTurquoise:Int;
	@:native("b3_colorPaleVioletRed") public static var colorPaleVioletRed:Int;
	@:native("b3_colorPapayaWhip") public static var colorPapayaWhip:Int;
	@:native("b3_colorPeachPuff") public static var colorPeachPuff:Int;
	@:native("b3_colorPeru") public static var colorPeru:Int;
	@:native("b3_colorPink") public static var colorPink:Int;
	@:native("b3_colorPlum") public static var colorPlum:Int;
	@:native("b3_colorPowderBlue") public static var colorPowderBlue:Int;
	@:native("b3_colorPurple") public static var colorPurple:Int;
	@:native("b3_colorRebeccaPurple") public static var colorRebeccaPurple:Int;
	@:native("b3_colorRed") public static var colorRed:Int;
	@:native("b3_colorRosyBrown") public static var colorRosyBrown:Int;
	@:native("b3_colorRoyalBlue") public static var colorRoyalBlue:Int;
	@:native("b3_colorSaddleBrown") public static var colorSaddleBrown:Int;
	@:native("b3_colorSalmon") public static var colorSalmon:Int;
	@:native("b3_colorSandyBrown") public static var colorSandyBrown:Int;
	@:native("b3_colorSeaGreen") public static var colorSeaGreen:Int;
	@:native("b3_colorSeaShell") public static var colorSeaShell:Int;
	@:native("b3_colorSienna") public static var colorSienna:Int;
	@:native("b3_colorSilver") public static var colorSilver:Int;
	@:native("b3_colorSkyBlue") public static var colorSkyBlue:Int;
	@:native("b3_colorSlateBlue") public static var colorSlateBlue:Int;
	@:native("b3_colorSlateGray") public static var colorSlateGray:Int;
	@:native("b3_colorSnow") public static var colorSnow:Int;
	@:native("b3_colorSpringGreen") public static var colorSpringGreen:Int;
	@:native("b3_colorSteelBlue") public static var colorSteelBlue:Int;
	@:native("b3_colorTan") public static var colorTan:Int;
	@:native("b3_colorTeal") public static var colorTeal:Int;
	@:native("b3_colorThistle") public static var colorThistle:Int;
	@:native("b3_colorTomato") public static var colorTomato:Int;
	@:native("b3_colorTurquoise") public static var colorTurquoise:Int;
	@:native("b3_colorViolet") public static var colorViolet:Int;
	@:native("b3_colorWheat") public static var colorWheat:Int;
	@:native("b3_colorWhite") public static var colorWhite:Int;
	@:native("b3_colorWhiteSmoke") public static var colorWhiteSmoke:Int;
	@:native("b3_colorYellow") public static var colorYellow:Int;
	@:native("b3_colorYellowGreen") public static var colorYellowGreen:Int;
	@:native("b3_colorBox2DRed") public static var colorBox2DRed:Int;
	@:native("b3_colorBox2DBlue") public static var colorBox2DBlue:Int;
	@:native("b3_colorBox2DGreen") public static var colorBox2DGreen:Int;
	@:native("b3_colorBox2DYellow") public static var colorBox2DYellow:Int;
}

@:keep @:include("linc_box3d.h")
extern enum abstract B3DebugMaterial(Int) from Int to Int {
	@:native("b3_debugMaterialDefault") public static var debugMaterialDefault:Int;
	@:native("b3_debugMaterialMatte") public static var debugMaterialMatte:Int;
	@:native("b3_debugMaterialSoft") public static var debugMaterialSoft:Int;
	@:native("b3_debugMaterialDead") public static var debugMaterialDead:Int;
	@:native("b3_debugMaterialGlossy") public static var debugMaterialGlossy:Int;
	@:native("b3_debugMaterialMetallic") public static var debugMaterialMetallic:Int;
}

@:keep @:include("linc_box3d.h")
extern enum abstract B3RecQueryType(Int) from Int to Int {
	@:native("b3_recQueryOverlapAABB") public static var recQueryOverlapAABB:Int;
	@:native("b3_recQueryOverlapShape") public static var recQueryOverlapShape:Int;
	@:native("b3_recQueryCastRay") public static var recQueryCastRay:Int;
	@:native("b3_recQueryCastShape") public static var recQueryCastShape:Int;
	@:native("b3_recQueryCastRayClosest") public static var recQueryCastRayClosest:Int;
	@:native("b3_recQueryCastMover") public static var recQueryCastMover:Int;
	@:native("b3_recQueryCollideMover") public static var recQueryCollideMover:Int;
}
typedef B3DebugDrawDrawBoxFcnFunc = B3Vec3Native -> B3WorldTransformNative -> B3HexColor -> cpp.RawPointer<Void> -> Void;
typedef B3DebugDrawDrawBoxFcn = cpp.Callable<B3DebugDrawDrawBoxFcnFunc>;
typedef B3FrictionCallbackFunc = cpp.Float32 -> cpp.UInt64 -> cpp.Float32 -> cpp.UInt64 -> cpp.Float32;
typedef B3FrictionCallback = cpp.Callable<B3FrictionCallbackFunc>;
typedef B3CreateDebugShapeCallbackFunc = cpp.RawConstPointer<B3DebugShapeNative> -> cpp.RawPointer<Void> -> cpp.RawPointer<Void>;
typedef B3CreateDebugShapeCallback = cpp.Callable<B3CreateDebugShapeCallbackFunc>;
typedef B3TreeBoxCastCallbackFcnFunc = cpp.RawConstPointer<B3BoxCastInputNative> -> Int -> cpp.UInt64 -> cpp.RawPointer<Void> -> cpp.Float32;
typedef B3TreeBoxCastCallbackFcn = cpp.Callable<B3TreeBoxCastCallbackFcnFunc>;
typedef B3EnqueueTaskCallbackFunc = B3TaskCallback -> cpp.RawPointer<Void> -> cpp.RawPointer<Void> -> cpp.ConstCharStar -> cpp.RawPointer<Void>;
typedef B3EnqueueTaskCallback = cpp.Callable<B3EnqueueTaskCallbackFunc>;
typedef B3DebugDrawDrawBoundsFcnFunc = B3AABBNative -> B3HexColor -> cpp.RawPointer<Void> -> Void;
typedef B3DebugDrawDrawBoundsFcn = cpp.Callable<B3DebugDrawDrawBoundsFcnFunc>;
typedef B3TreeRayCastCallbackFcnFunc = cpp.RawConstPointer<B3RayCastInputNative> -> Int -> cpp.UInt64 -> cpp.RawPointer<Void> -> cpp.Float32;
typedef B3TreeRayCastCallbackFcn = cpp.Callable<B3TreeRayCastCallbackFcnFunc>;
typedef B3TreeQueryCallbackFcnFunc = Int -> cpp.UInt64 -> cpp.RawPointer<Void> -> Bool;
typedef B3TreeQueryCallbackFcn = cpp.Callable<B3TreeQueryCallbackFcnFunc>;
typedef B3CastResultFcnFunc = B3ShapeIdNative -> B3PosNative -> B3Vec3Native -> cpp.Float32 -> cpp.UInt64 -> Int -> Int -> cpp.RawPointer<Void> -> cpp.Float32;
typedef B3CastResultFcn = cpp.Callable<B3CastResultFcnFunc>;
typedef B3PreSolveFcnFunc = B3ShapeIdNative -> B3ShapeIdNative -> B3PosNative -> B3Vec3Native -> cpp.RawPointer<Void> -> Bool;
typedef B3PreSolveFcn = cpp.Callable<B3PreSolveFcnFunc>;
typedef B3CompoundQueryFcnFunc = cpp.RawConstPointer<B3CompoundDataNative> -> Int -> cpp.RawPointer<Void> -> Bool;
typedef B3CompoundQueryFcn = cpp.Callable<B3CompoundQueryFcnFunc>;
typedef B3DebugDrawDrawStringFcnFunc = B3PosNative -> cpp.ConstCharStar -> B3HexColor -> cpp.RawPointer<Void> -> Void;
typedef B3DebugDrawDrawStringFcn = cpp.Callable<B3DebugDrawDrawStringFcnFunc>;
typedef B3MeshQueryFcnFunc = B3Vec3Native -> B3Vec3Native -> B3Vec3Native -> Int -> cpp.RawPointer<Void> -> Bool;
typedef B3MeshQueryFcn = cpp.Callable<B3MeshQueryFcnFunc>;
typedef B3CustomFilterFcnFunc = B3ShapeIdNative -> B3ShapeIdNative -> cpp.RawPointer<Void> -> Bool;
typedef B3CustomFilterFcn = cpp.Callable<B3CustomFilterFcnFunc>;
typedef B3DebugDrawDrawSegmentFcnFunc = B3PosNative -> B3PosNative -> B3HexColor -> cpp.RawPointer<Void> -> Void;
typedef B3DebugDrawDrawSegmentFcn = cpp.Callable<B3DebugDrawDrawSegmentFcnFunc>;
typedef B3MoverFilterFcnFunc = B3ShapeIdNative -> cpp.RawPointer<Void> -> Bool;
typedef B3MoverFilterFcn = cpp.Callable<B3MoverFilterFcnFunc>;
typedef B3PlaneResultFcnFunc = B3ShapeIdNative -> cpp.RawConstPointer<B3PlaneResultNative> -> Int -> cpp.RawPointer<Void> -> Bool;
typedef B3PlaneResultFcn = cpp.Callable<B3PlaneResultFcnFunc>;
typedef B3DebugDrawDrawSphereFcnFunc = B3PosNative -> cpp.Float32 -> B3HexColor -> cpp.Float32 -> cpp.RawPointer<Void> -> Void;
typedef B3DebugDrawDrawSphereFcn = cpp.Callable<B3DebugDrawDrawSphereFcnFunc>;
typedef B3DebugDrawDrawShapeFcnFunc = cpp.RawPointer<Void> -> B3WorldTransformNative -> B3HexColor -> cpp.RawPointer<Void> -> Void;
typedef B3DebugDrawDrawShapeFcn = cpp.Callable<B3DebugDrawDrawShapeFcnFunc>;
typedef B3DebugDrawDrawPointFcnFunc = B3PosNative -> cpp.Float32 -> B3HexColor -> cpp.RawPointer<Void> -> Void;
typedef B3DebugDrawDrawPointFcn = cpp.Callable<B3DebugDrawDrawPointFcnFunc>;
typedef B3TaskCallbackFunc = cpp.RawPointer<Void> -> Void;
typedef B3TaskCallback = cpp.Callable<B3TaskCallbackFunc>;
typedef B3DestroyDebugShapeCallbackFunc = cpp.RawPointer<Void> -> cpp.RawPointer<Void> -> Void;
typedef B3DestroyDebugShapeCallback = cpp.Callable<B3DestroyDebugShapeCallbackFunc>;
typedef B3TreeQueryClosestCallbackFcnFunc = cpp.Float32 -> Int -> cpp.UInt64 -> cpp.RawPointer<Void> -> cpp.Float32;
typedef B3TreeQueryClosestCallbackFcn = cpp.Callable<B3TreeQueryClosestCallbackFcnFunc>;
typedef B3DebugDrawDrawCapsuleFcnFunc = B3PosNative -> B3PosNative -> cpp.Float32 -> B3HexColor -> cpp.Float32 -> cpp.RawPointer<Void> -> Void;
typedef B3DebugDrawDrawCapsuleFcn = cpp.Callable<B3DebugDrawDrawCapsuleFcnFunc>;
typedef B3RestitutionCallbackFunc = cpp.Float32 -> cpp.UInt64 -> cpp.Float32 -> cpp.UInt64 -> cpp.Float32;
typedef B3RestitutionCallback = cpp.Callable<B3RestitutionCallbackFunc>;
typedef B3FinishTaskCallbackFunc = cpp.RawPointer<Void> -> cpp.RawPointer<Void> -> Void;
typedef B3FinishTaskCallback = cpp.Callable<B3FinishTaskCallbackFunc>;
typedef B3OverlapResultFcnFunc = B3ShapeIdNative -> cpp.RawPointer<Void> -> Bool;
typedef B3OverlapResultFcn = cpp.Callable<B3OverlapResultFcnFunc>;
typedef B3DebugDrawDrawTransformFcnFunc = B3WorldTransformNative -> cpp.RawPointer<Void> -> Void;
typedef B3DebugDrawDrawTransformFcn = cpp.Callable<B3DebugDrawDrawTransformFcnFunc>;

@:keep @:include("linc_box3d.h") @:native("b3Recording")
extern class B3Recording {}

@:keep @:include("linc_box3d.h") @:native("b3RecPlayer")
extern class B3RecPlayer {}

@:keep
@:include("linc_box3d.h")
#if !display
@:build(linc.Linc.touch())
@:build(linc.Linc.xml("box3d"))
#end
extern class Box3D
{

	@:native("b3GetByteCount")
	public static function getByteCount():Int;
	@:native("b3GetVersion")
	public static function getVersion():B3VersionNative;
	@:native("b3IsDoublePrecision")
	public static function isDoublePrecision():Bool;
	@:native("b3GetTicks")
	public static function getTicks():cpp.UInt64;
	@:native("b3GetMilliseconds")
	public static function getMilliseconds(ticks:cpp.UInt64):cpp.Float32;
	@:native("b3GetMillisecondsAndReset")
	public static function getMillisecondsAndReset(ticks:cpp.RawPointer<cpp.UInt64>):cpp.Float32;
	@:native("b3Yield")
	public static function yield():Void;
	@:native("b3Sleep")
	public static function sleep(milliseconds:Int):Void;
	@:native("b3Hash")
	public static function hash(hash:cpp.UInt32, data:cpp.RawConstPointer<cpp.UInt8>, count:Int):cpp.UInt32;
	@:native("b3DefaultWorldDef")
	public static function defaultWorldDef():B3WorldDefNative;
	@:native("b3DefaultBodyDef")
	public static function defaultBodyDef():B3BodyDefNative;
	@:native("b3DefaultFilter")
	public static function defaultFilter():B3FilterNative;
	@:native("b3DefaultSurfaceMaterial")
	public static function defaultSurfaceMaterial():B3SurfaceMaterialNative;
	@:native("b3DefaultShapeDef")
	public static function defaultShapeDef():B3ShapeDefNative;
	@:native("b3DefaultDistanceJointDef")
	public static function defaultDistanceJointDef():B3DistanceJointDefNative;
	@:native("b3DefaultMotorJointDef")
	public static function defaultMotorJointDef():B3MotorJointDefNative;
	@:native("b3DefaultFilterJointDef")
	public static function defaultFilterJointDef():B3FilterJointDefNative;
	@:native("b3DefaultParallelJointDef")
	public static function defaultParallelJointDef():B3ParallelJointDefNative;
	@:native("b3DefaultPrismaticJointDef")
	public static function defaultPrismaticJointDef():B3PrismaticJointDefNative;
	@:native("b3DefaultRevoluteJointDef")
	public static function defaultRevoluteJointDef():B3RevoluteJointDefNative;
	@:native("b3DefaultSphericalJointDef")
	public static function defaultSphericalJointDef():B3SphericalJointDefNative;
	@:native("b3DefaultWeldJointDef")
	public static function defaultWeldJointDef():B3WeldJointDefNative;
	@:native("b3DefaultWheelJointDef")
	public static function defaultWheelJointDef():B3WheelJointDefNative;
	@:native("b3DefaultExplosionDef")
	public static function defaultExplosionDef():B3ExplosionDefNative;
	@:native("b3DefaultQueryFilter")
	public static function defaultQueryFilter():B3QueryFilterNative;
	@:native("b3GetGraphColor")
	public static function getGraphColor(index:Int):B3HexColor;
	@:native("b3DefaultDebugDraw")
	public static function defaultDebugDraw():B3DebugDrawNative;
	@:native("b3MakeDebugColor")
	public static function makeDebugColor(rgb:B3HexColor, material:B3DebugMaterial):cpp.UInt32;
	@:native("b3CreateWorld")
	public static function createWorld(def:cpp.RawConstPointer<B3WorldDefNative>):B3WorldIdNative;
	@:native("b3DestroyWorld")
	public static function destroyWorld(worldId:B3WorldIdNative):Void;
	@:native("b3GetWorldCount")
	public static function getWorldCount():Int;
	@:native("b3GetMaxWorldCount")
	public static function getMaxWorldCount():Int;
	@:native("b3World_IsValid")
	public static function world_IsValid(id:B3WorldIdNative):Bool;
	@:native("b3World_Step")
	public static function world_Step(worldId:B3WorldIdNative, timeStep:cpp.Float32, subStepCount:Int):Void;
	@:native("b3World_Draw")
	public static function world_Draw(worldId:B3WorldIdNative, draw:cpp.RawPointer<B3DebugDrawNative>, maskBits:cpp.UInt64):Void;
	@:native("b3World_GetBounds")
	public static function world_GetBounds(worldId:B3WorldIdNative):B3AABBNative;
	@:native("b3World_GetBodyEvents")
	public static function world_GetBodyEvents(worldId:B3WorldIdNative):B3BodyEventsNative;
	@:native("b3World_GetSensorEvents")
	public static function world_GetSensorEvents(worldId:B3WorldIdNative):B3SensorEventsNative;
	@:native("b3World_GetContactEvents")
	public static function world_GetContactEvents(worldId:B3WorldIdNative):B3ContactEventsNative;
	@:native("b3World_GetJointEvents")
	public static function world_GetJointEvents(worldId:B3WorldIdNative):B3JointEventsNative;
	@:native("b3World_OverlapAABB")
	public static function world_OverlapAABB(worldId:B3WorldIdNative, aabb:B3AABBNative, filter:B3QueryFilterNative, fcn:B3OverlapResultFcn, context:cpp.RawPointer<Void>):B3TreeStatsNative;
	@:native("b3World_OverlapShape")
	public static function world_OverlapShape(worldId:B3WorldIdNative, origin:B3PosNative, proxy:cpp.RawConstPointer<B3ShapeProxyNative>, filter:B3QueryFilterNative, fcn:B3OverlapResultFcn, context:cpp.RawPointer<Void>):B3TreeStatsNative;
	@:native("b3World_CastRay")
	public static function world_CastRay(worldId:B3WorldIdNative, origin:B3PosNative, translation:B3Vec3Native, filter:B3QueryFilterNative, fcn:B3CastResultFcn, context:cpp.RawPointer<Void>):B3TreeStatsNative;
	@:native("b3World_CastRayClosest")
	public static function world_CastRayClosest(worldId:B3WorldIdNative, origin:B3PosNative, translation:B3Vec3Native, filter:B3QueryFilterNative):B3RayResultNative;
	@:native("b3World_CastShape")
	public static function world_CastShape(worldId:B3WorldIdNative, origin:B3PosNative, proxy:cpp.RawConstPointer<B3ShapeProxyNative>, translation:B3Vec3Native, filter:B3QueryFilterNative, fcn:B3CastResultFcn, context:cpp.RawPointer<Void>):B3TreeStatsNative;
	@:native("b3World_CastMover")
	public static function world_CastMover(worldId:B3WorldIdNative, origin:B3PosNative, mover:cpp.RawConstPointer<B3CapsuleNative>, translation:B3Vec3Native, filter:B3QueryFilterNative, fcn:B3MoverFilterFcn, context:cpp.RawPointer<Void>):cpp.Float32;
	@:native("b3World_CollideMover")
	public static function world_CollideMover(worldId:B3WorldIdNative, origin:B3PosNative, mover:cpp.RawConstPointer<B3CapsuleNative>, filter:B3QueryFilterNative, fcn:B3PlaneResultFcn, context:cpp.RawPointer<Void>):Void;
	@:native("b3World_EnableSleeping")
	public static function world_EnableSleeping(worldId:B3WorldIdNative, flag:Bool):Void;
	@:native("b3World_IsSleepingEnabled")
	public static function world_IsSleepingEnabled(worldId:B3WorldIdNative):Bool;
	@:native("b3World_EnableContinuous")
	public static function world_EnableContinuous(worldId:B3WorldIdNative, flag:Bool):Void;
	@:native("b3World_IsContinuousEnabled")
	public static function world_IsContinuousEnabled(worldId:B3WorldIdNative):Bool;
	@:native("b3World_SetRestitutionThreshold")
	public static function world_SetRestitutionThreshold(worldId:B3WorldIdNative, value:cpp.Float32):Void;
	@:native("b3World_GetRestitutionThreshold")
	public static function world_GetRestitutionThreshold(worldId:B3WorldIdNative):cpp.Float32;
	@:native("b3World_SetHitEventThreshold")
	public static function world_SetHitEventThreshold(worldId:B3WorldIdNative, value:cpp.Float32):Void;
	@:native("b3World_GetHitEventThreshold")
	public static function world_GetHitEventThreshold(worldId:B3WorldIdNative):cpp.Float32;
	@:native("b3World_SetCustomFilterCallback")
	public static function world_SetCustomFilterCallback(worldId:B3WorldIdNative, fcn:B3CustomFilterFcn, context:cpp.RawPointer<Void>):Void;
	@:native("b3World_SetPreSolveCallback")
	public static function world_SetPreSolveCallback(worldId:B3WorldIdNative, fcn:B3PreSolveFcn, context:cpp.RawPointer<Void>):Void;
	@:native("b3World_SetGravity")
	public static function world_SetGravity(worldId:B3WorldIdNative, gravity:B3Vec3Native):Void;
	@:native("b3World_GetGravity")
	public static function world_GetGravity(worldId:B3WorldIdNative):B3Vec3Native;
	@:native("b3World_Explode")
	public static function world_Explode(worldId:B3WorldIdNative, explosionDef:cpp.RawConstPointer<B3ExplosionDefNative>):Void;
	@:native("b3World_SetContactTuning")
	public static function world_SetContactTuning(worldId:B3WorldIdNative, hertz:cpp.Float32, dampingRatio:cpp.Float32, contactSpeed:cpp.Float32):Void;
	@:native("b3World_SetContactRecycleDistance")
	public static function world_SetContactRecycleDistance(worldId:B3WorldIdNative, recycleDistance:cpp.Float32):Void;
	@:native("b3World_GetContactRecycleDistance")
	public static function world_GetContactRecycleDistance(worldId:B3WorldIdNative):cpp.Float32;
	@:native("b3World_SetMaximumLinearSpeed")
	public static function world_SetMaximumLinearSpeed(worldId:B3WorldIdNative, maximumLinearSpeed:cpp.Float32):Void;
	@:native("b3World_GetMaximumLinearSpeed")
	public static function world_GetMaximumLinearSpeed(worldId:B3WorldIdNative):cpp.Float32;
	@:native("b3World_EnableWarmStarting")
	public static function world_EnableWarmStarting(worldId:B3WorldIdNative, flag:Bool):Void;
	@:native("b3World_IsWarmStartingEnabled")
	public static function world_IsWarmStartingEnabled(worldId:B3WorldIdNative):Bool;
	@:native("b3World_GetAwakeBodyCount")
	public static function world_GetAwakeBodyCount(worldId:B3WorldIdNative):Int;
	@:native("b3World_GetProfile")
	public static function world_GetProfile(worldId:B3WorldIdNative):B3ProfileNative;
	@:native("b3World_GetCounters")
	public static function world_GetCounters(worldId:B3WorldIdNative):B3CountersNative;
	@:native("b3World_GetMaxCapacity")
	public static function world_GetMaxCapacity(worldId:B3WorldIdNative):B3CapacityNative;
	@:native("b3World_SetUserData")
	public static function world_SetUserData(worldId:B3WorldIdNative, userData:cpp.RawPointer<Void>):Void;
	@:native("b3World_GetUserData")
	public static function world_GetUserData(worldId:B3WorldIdNative):cpp.RawPointer<Void>;
	@:native("b3World_SetFrictionCallback")
	public static function world_SetFrictionCallback(worldId:B3WorldIdNative, callback:B3FrictionCallback):Void;
	@:native("b3World_SetRestitutionCallback")
	public static function world_SetRestitutionCallback(worldId:B3WorldIdNative, callback:B3RestitutionCallback):Void;
	@:native("b3World_SetWorkerCount")
	public static function world_SetWorkerCount(worldId:B3WorldIdNative, count:Int):Void;
	@:native("b3World_GetWorkerCount")
	public static function world_GetWorkerCount(worldId:B3WorldIdNative):Int;
	@:native("b3World_DumpMemoryStats")
	public static function world_DumpMemoryStats(worldId:B3WorldIdNative):Void;
	@:native("b3World_DumpShapeBounds")
	public static function world_DumpShapeBounds(worldId:B3WorldIdNative, type:B3BodyType):Void;
	@:native("b3World_RebuildStaticTree")
	public static function world_RebuildStaticTree(worldId:B3WorldIdNative):Void;
	@:native("b3World_EnableSpeculative")
	public static function world_EnableSpeculative(worldId:B3WorldIdNative, flag:Bool):Void;
	@:native("b3CreateRecording")
	public static function createRecording(byteCapacity:Int):cpp.RawPointer<B3Recording>;
	@:native("b3DestroyRecording")
	public static function destroyRecording(recording:cpp.RawPointer<B3Recording>):Void;
	@:native("b3Recording_GetData")
	public static function recording_GetData(recording:cpp.RawConstPointer<B3Recording>):cpp.RawConstPointer<cpp.UInt8>;
	@:native("b3Recording_GetSize")
	public static function recording_GetSize(recording:cpp.RawConstPointer<B3Recording>):Int;
	@:native("b3World_StartRecording")
	public static function world_StartRecording(worldId:B3WorldIdNative, recording:cpp.RawPointer<B3Recording>):Void;
	@:native("b3World_StopRecording")
	public static function world_StopRecording(worldId:B3WorldIdNative):Void;
	@:native("b3SaveRecordingToFile")
	public static function saveRecordingToFile(recording:cpp.RawConstPointer<B3Recording>, path:cpp.ConstCharStar):Bool;
	@:native("b3LoadRecordingFromFile")
	public static function loadRecordingFromFile(path:cpp.ConstCharStar):cpp.RawPointer<B3Recording>;
	@:native("b3ValidateReplay")
	public static function validateReplay(data:cpp.RawConstPointer<Void>, size:Int, workerCount:Int):Bool;
	@:native("b3CreatePlayer")
	public static function createPlayer(data:cpp.RawConstPointer<Void>, size:Int, workerCount:Int):cpp.RawPointer<B3RecPlayer>;
	@:native("b3DestroyPlayer")
	public static function destroyPlayer(player:cpp.RawPointer<B3RecPlayer>):Void;
	@:native("b3RecPlayer_StepFrame")
	public static function recPlayer_StepFrame(player:cpp.RawPointer<B3RecPlayer>):Bool;
	@:native("b3RecPlayer_SubStepFrame")
	public static function recPlayer_SubStepFrame(player:cpp.RawPointer<B3RecPlayer>):Void;
	@:native("b3RecPlayer_Restart")
	public static function recPlayer_Restart(player:cpp.RawPointer<B3RecPlayer>):Void;
	@:native("b3RecPlayer_SeekFrame")
	public static function recPlayer_SeekFrame(player:cpp.RawPointer<B3RecPlayer>, targetFrame:Int):Void;
	@:native("b3RecPlayer_GetWorldId")
	public static function recPlayer_GetWorldId(player:cpp.RawConstPointer<B3RecPlayer>):B3WorldIdNative;
	@:native("b3RecPlayer_GetFrame")
	public static function recPlayer_GetFrame(player:cpp.RawConstPointer<B3RecPlayer>):Int;
	@:native("b3RecPlayer_GetFrameCount")
	public static function recPlayer_GetFrameCount(player:cpp.RawConstPointer<B3RecPlayer>):Int;
	@:native("b3RecPlayer_IsAtEnd")
	public static function recPlayer_IsAtEnd(player:cpp.RawConstPointer<B3RecPlayer>):Bool;
	@:native("b3RecPlayer_IsAtPreStep")
	public static function recPlayer_IsAtPreStep(player:cpp.RawConstPointer<B3RecPlayer>):Bool;
	@:native("b3RecPlayer_HasDiverged")
	public static function recPlayer_HasDiverged(player:cpp.RawConstPointer<B3RecPlayer>):Bool;
	@:native("b3RecPlayer_GetInfo")
	public static function recPlayer_GetInfo(player:cpp.RawConstPointer<B3RecPlayer>):B3RecPlayerInfoNative;
	@:native("b3RecPlayer_GetDivergeFrame")
	public static function recPlayer_GetDivergeFrame(player:cpp.RawConstPointer<B3RecPlayer>):Int;
	@:native("b3RecPlayer_SetWorkerCount")
	public static function recPlayer_SetWorkerCount(player:cpp.RawPointer<B3RecPlayer>, count:Int):Void;
	@:native("b3RecPlayer_SetKeyframePolicy")
	public static function recPlayer_SetKeyframePolicy(player:cpp.RawPointer<B3RecPlayer>, budgetBytes:cpp.Int64, minIntervalFrames:Int):Void;
	@:native("b3RecPlayer_GetKeyframeBudget")
	public static function recPlayer_GetKeyframeBudget(player:cpp.RawConstPointer<B3RecPlayer>):cpp.Int64;
	@:native("b3RecPlayer_GetKeyframeMinInterval")
	public static function recPlayer_GetKeyframeMinInterval(player:cpp.RawConstPointer<B3RecPlayer>):Int;
	@:native("b3RecPlayer_GetKeyframeInterval")
	public static function recPlayer_GetKeyframeInterval(player:cpp.RawConstPointer<B3RecPlayer>):Int;
	@:native("b3RecPlayer_GetKeyframeBytes")
	public static function recPlayer_GetKeyframeBytes(player:cpp.RawConstPointer<B3RecPlayer>):cpp.Int64;
	@:native("b3RecPlayer_GetBodyCount")
	public static function recPlayer_GetBodyCount(player:cpp.RawConstPointer<B3RecPlayer>):Int;
	@:native("b3RecPlayer_GetBodyId")
	public static function recPlayer_GetBodyId(player:cpp.RawConstPointer<B3RecPlayer>, index:Int):B3BodyIdNative;
	@:native("b3RecPlayer_SetDebugShapeCallbacks")
	public static function recPlayer_SetDebugShapeCallbacks(player:cpp.RawPointer<B3RecPlayer>, createDebugShape:B3CreateDebugShapeCallback, destroyDebugShape:B3DestroyDebugShapeCallback, context:cpp.RawPointer<Void>):Void;
	@:native("b3RecPlayer_DrawFrameQueries")
	public static function recPlayer_DrawFrameQueries(player:cpp.RawPointer<B3RecPlayer>, draw:cpp.RawPointer<B3DebugDrawNative>, queryIndex:Int, selectedIndex:Int):Void;
	@:native("b3RecPlayer_GetFrameQueryCount")
	public static function recPlayer_GetFrameQueryCount(player:cpp.RawConstPointer<B3RecPlayer>):Int;
	@:native("b3RecPlayer_GetFrameQuery")
	public static function recPlayer_GetFrameQuery(player:cpp.RawConstPointer<B3RecPlayer>, index:Int):B3RecQueryInfoNative;
	@:native("b3RecPlayer_GetFrameQueryHit")
	public static function recPlayer_GetFrameQueryHit(player:cpp.RawConstPointer<B3RecPlayer>, queryIndex:Int, hitIndex:Int):B3RecQueryHitNative;
	@:native("b3CreateBody")
	public static function createBody(worldId:B3WorldIdNative, def:cpp.RawConstPointer<B3BodyDefNative>):B3BodyIdNative;
	@:native("b3DestroyBody")
	public static function destroyBody(bodyId:B3BodyIdNative):Void;
	@:native("b3Body_IsValid")
	public static function body_IsValid(id:B3BodyIdNative):Bool;
	@:native("b3Body_GetType")
	public static function body_GetType(bodyId:B3BodyIdNative):B3BodyType;
	@:native("b3Body_SetType")
	public static function body_SetType(bodyId:B3BodyIdNative, type:B3BodyType):Void;
	@:native("b3Body_SetName")
	public static function body_SetName(bodyId:B3BodyIdNative, name:cpp.ConstCharStar):Void;
	@:native("b3Body_GetName")
	public static function body_GetName(bodyId:B3BodyIdNative):cpp.ConstCharStar;
	@:native("b3Body_SetUserData")
	public static function body_SetUserData(bodyId:B3BodyIdNative, userData:cpp.RawPointer<Void>):Void;
	@:native("b3Body_GetUserData")
	public static function body_GetUserData(bodyId:B3BodyIdNative):cpp.RawPointer<Void>;
	@:native("b3Body_GetPosition")
	public static function body_GetPosition(bodyId:B3BodyIdNative):B3PosNative;
	@:native("b3Body_GetRotation")
	public static function body_GetRotation(bodyId:B3BodyIdNative):B3QuatNative;
	@:native("b3Body_GetTransform")
	public static function body_GetTransform(bodyId:B3BodyIdNative):B3WorldTransformNative;
	@:native("b3Body_SetTransform")
	public static function body_SetTransform(bodyId:B3BodyIdNative, position:B3PosNative, rotation:B3QuatNative):Void;
	@:native("b3Body_GetLocalPoint")
	public static function body_GetLocalPoint(bodyId:B3BodyIdNative, worldPoint:B3PosNative):B3Vec3Native;
	@:native("b3Body_GetWorldPoint")
	public static function body_GetWorldPoint(bodyId:B3BodyIdNative, localPoint:B3Vec3Native):B3PosNative;
	@:native("b3Body_GetLocalVector")
	public static function body_GetLocalVector(bodyId:B3BodyIdNative, worldVector:B3Vec3Native):B3Vec3Native;
	@:native("b3Body_GetWorldVector")
	public static function body_GetWorldVector(bodyId:B3BodyIdNative, localVector:B3Vec3Native):B3Vec3Native;
	@:native("b3Body_GetLinearVelocity")
	public static function body_GetLinearVelocity(bodyId:B3BodyIdNative):B3Vec3Native;
	@:native("b3Body_GetAngularVelocity")
	public static function body_GetAngularVelocity(bodyId:B3BodyIdNative):B3Vec3Native;
	@:native("b3Body_SetLinearVelocity")
	public static function body_SetLinearVelocity(bodyId:B3BodyIdNative, linearVelocity:B3Vec3Native):Void;
	@:native("b3Body_SetAngularVelocity")
	public static function body_SetAngularVelocity(bodyId:B3BodyIdNative, angularVelocity:B3Vec3Native):Void;
	@:native("b3Body_SetTargetTransform")
	public static function body_SetTargetTransform(bodyId:B3BodyIdNative, target:B3WorldTransformNative, timeStep:cpp.Float32, wake:Bool):Void;
	@:native("b3Body_GetLocalPointVelocity")
	public static function body_GetLocalPointVelocity(bodyId:B3BodyIdNative, localPoint:B3Vec3Native):B3Vec3Native;
	@:native("b3Body_GetWorldPointVelocity")
	public static function body_GetWorldPointVelocity(bodyId:B3BodyIdNative, worldPoint:B3PosNative):B3Vec3Native;
	@:native("b3Body_ApplyForce")
	public static function body_ApplyForce(bodyId:B3BodyIdNative, force:B3Vec3Native, point:B3PosNative, wake:Bool):Void;
	@:native("b3Body_ApplyForceToCenter")
	public static function body_ApplyForceToCenter(bodyId:B3BodyIdNative, force:B3Vec3Native, wake:Bool):Void;
	@:native("b3Body_ApplyTorque")
	public static function body_ApplyTorque(bodyId:B3BodyIdNative, torque:B3Vec3Native, wake:Bool):Void;
	@:native("b3Body_ApplyLinearImpulse")
	public static function body_ApplyLinearImpulse(bodyId:B3BodyIdNative, impulse:B3Vec3Native, point:B3PosNative, wake:Bool):Void;
	@:native("b3Body_ApplyLinearImpulseToCenter")
	public static function body_ApplyLinearImpulseToCenter(bodyId:B3BodyIdNative, impulse:B3Vec3Native, wake:Bool):Void;
	@:native("b3Body_ApplyAngularImpulse")
	public static function body_ApplyAngularImpulse(bodyId:B3BodyIdNative, impulse:B3Vec3Native, wake:Bool):Void;
	@:native("b3Body_GetMass")
	public static function body_GetMass(bodyId:B3BodyIdNative):cpp.Float32;
	@:native("b3Body_GetLocalRotationalInertia")
	public static function body_GetLocalRotationalInertia(bodyId:B3BodyIdNative):B3Matrix3Native;
	@:native("b3Body_GetInverseMass")
	public static function body_GetInverseMass(bodyId:B3BodyIdNative):cpp.Float32;
	@:native("b3Body_GetWorldInverseRotationalInertia")
	public static function body_GetWorldInverseRotationalInertia(bodyId:B3BodyIdNative):B3Matrix3Native;
	@:native("b3Body_GetLocalCenter")
	public static function body_GetLocalCenter(bodyId:B3BodyIdNative):B3Vec3Native;
	@:native("b3Body_GetWorldCenter")
	public static function body_GetWorldCenter(bodyId:B3BodyIdNative):B3PosNative;
	@:native("b3Body_SetMassData")
	public static function body_SetMassData(bodyId:B3BodyIdNative, massData:B3MassDataNative):Void;
	@:native("b3Body_GetMassData")
	public static function body_GetMassData(bodyId:B3BodyIdNative):B3MassDataNative;
	@:native("b3Body_ApplyMassFromShapes")
	public static function body_ApplyMassFromShapes(bodyId:B3BodyIdNative):Void;
	@:native("b3Body_SetLinearDamping")
	public static function body_SetLinearDamping(bodyId:B3BodyIdNative, linearDamping:cpp.Float32):Void;
	@:native("b3Body_GetLinearDamping")
	public static function body_GetLinearDamping(bodyId:B3BodyIdNative):cpp.Float32;
	@:native("b3Body_SetAngularDamping")
	public static function body_SetAngularDamping(bodyId:B3BodyIdNative, angularDamping:cpp.Float32):Void;
	@:native("b3Body_GetAngularDamping")
	public static function body_GetAngularDamping(bodyId:B3BodyIdNative):cpp.Float32;
	@:native("b3Body_SetGravityScale")
	public static function body_SetGravityScale(bodyId:B3BodyIdNative, gravityScale:cpp.Float32):Void;
	@:native("b3Body_GetGravityScale")
	public static function body_GetGravityScale(bodyId:B3BodyIdNative):cpp.Float32;
	@:native("b3Body_IsAwake")
	public static function body_IsAwake(bodyId:B3BodyIdNative):Bool;
	@:native("b3Body_SetAwake")
	public static function body_SetAwake(bodyId:B3BodyIdNative, awake:Bool):Void;
	@:native("b3Body_EnableSleep")
	public static function body_EnableSleep(bodyId:B3BodyIdNative, enableSleep:Bool):Void;
	@:native("b3Body_IsSleepEnabled")
	public static function body_IsSleepEnabled(bodyId:B3BodyIdNative):Bool;
	@:native("b3Body_SetSleepThreshold")
	public static function body_SetSleepThreshold(bodyId:B3BodyIdNative, sleepThreshold:cpp.Float32):Void;
	@:native("b3Body_GetSleepThreshold")
	public static function body_GetSleepThreshold(bodyId:B3BodyIdNative):cpp.Float32;
	@:native("b3Body_IsEnabled")
	public static function body_IsEnabled(bodyId:B3BodyIdNative):Bool;
	@:native("b3Body_Disable")
	public static function body_Disable(bodyId:B3BodyIdNative):Void;
	@:native("b3Body_Enable")
	public static function body_Enable(bodyId:B3BodyIdNative):Void;
	@:native("b3Body_SetMotionLocks")
	public static function body_SetMotionLocks(bodyId:B3BodyIdNative, locks:B3MotionLocksNative):Void;
	@:native("b3Body_GetMotionLocks")
	public static function body_GetMotionLocks(bodyId:B3BodyIdNative):B3MotionLocksNative;
	@:native("b3Body_SetBullet")
	public static function body_SetBullet(bodyId:B3BodyIdNative, flag:Bool):Void;
	@:native("b3Body_IsBullet")
	public static function body_IsBullet(bodyId:B3BodyIdNative):Bool;
	@:native("b3Body_AllowFastRotation")
	public static function body_AllowFastRotation(bodyId:B3BodyIdNative, flag:Bool):Void;
	@:native("b3Body_IsFastRotationAllowed")
	public static function body_IsFastRotationAllowed(bodyId:B3BodyIdNative):Bool;
	@:native("b3Body_EnableContactRecycling")
	public static function body_EnableContactRecycling(bodyId:B3BodyIdNative, flag:Bool):Void;
	@:native("b3Body_IsContactRecyclingEnabled")
	public static function body_IsContactRecyclingEnabled(bodyId:B3BodyIdNative):Bool;
	@:native("b3Body_EnableHitEvents")
	public static function body_EnableHitEvents(bodyId:B3BodyIdNative, flag:Bool):Void;
	@:native("b3Body_GetWorld")
	public static function body_GetWorld(bodyId:B3BodyIdNative):B3WorldIdNative;
	@:native("b3Body_GetShapeCount")
	public static function body_GetShapeCount(bodyId:B3BodyIdNative):Int;
	@:native("b3Body_GetShapes")
	public static function body_GetShapes(bodyId:B3BodyIdNative, shapeArray:cpp.RawPointer<B3ShapeIdNative>, capacity:Int):Int;
	@:native("b3Body_GetJointCount")
	public static function body_GetJointCount(bodyId:B3BodyIdNative):Int;
	@:native("b3Body_GetJoints")
	public static function body_GetJoints(bodyId:B3BodyIdNative, jointArray:cpp.RawPointer<B3JointIdNative>, capacity:Int):Int;
	@:native("b3Body_GetContactCapacity")
	public static function body_GetContactCapacity(bodyId:B3BodyIdNative):Int;
	@:native("b3Body_GetContactData")
	public static function body_GetContactData(bodyId:B3BodyIdNative, contactData:cpp.RawPointer<B3ContactDataNative>, capacity:Int):Int;
	@:native("b3Body_ComputeAABB")
	public static function body_ComputeAABB(bodyId:B3BodyIdNative):B3AABBNative;
	@:native("b3Body_GetMinExtent")
	public static function body_GetMinExtent(bodyId:B3BodyIdNative):cpp.Float32;
	@:native("b3Body_GetMaxExtent")
	public static function body_GetMaxExtent(bodyId:B3BodyIdNative):B3Vec3Native;
	@:native("b3Body_GetMaxExtentOrigin")
	public static function body_GetMaxExtentOrigin(bodyId:B3BodyIdNative):B3Vec3Native;
	@:native("b3Body_GetClosestPoint")
	public static function body_GetClosestPoint(bodyId:B3BodyIdNative, result:cpp.RawPointer<B3Vec3Native>, target:B3Vec3Native):cpp.Float32;
	@:native("b3Body_CastRay")
	public static function body_CastRay(bodyId:B3BodyIdNative, origin:B3PosNative, translation:B3Vec3Native, filter:B3QueryFilterNative, maxFraction:cpp.Float32, bodyTransform:B3WorldTransformNative):B3BodyCastResultNative;
	@:native("b3Body_CastShape")
	public static function body_CastShape(bodyId:B3BodyIdNative, origin:B3PosNative, proxy:cpp.RawConstPointer<B3ShapeProxyNative>, translation:B3Vec3Native, filter:B3QueryFilterNative, maxFraction:cpp.Float32, canEncroach:Bool, bodyTransform:B3WorldTransformNative):B3BodyCastResultNative;
	@:native("b3Body_OverlapShape")
	public static function body_OverlapShape(bodyId:B3BodyIdNative, origin:B3PosNative, proxy:cpp.RawConstPointer<B3ShapeProxyNative>, filter:B3QueryFilterNative, bodyTransform:B3WorldTransformNative):Bool;
	@:native("b3Body_CollideMover")
	public static function body_CollideMover(bodyId:B3BodyIdNative, bodyPlanes:cpp.RawPointer<B3BodyPlaneResultNative>, planeCapacity:Int, origin:B3PosNative, mover:cpp.RawConstPointer<B3CapsuleNative>, filter:B3QueryFilterNative, bodyTransform:B3WorldTransformNative):Int;
	@:native("b3Body_TimeOfImpactMover")
	public static function body_TimeOfImpactMover(bodyId:B3BodyIdNative, origin:B3PosNative, mover:cpp.RawConstPointer<B3CapsuleNative>, moverTranslation:B3Vec3Native, filter:B3QueryFilterNative, bodyTransform1:B3WorldTransformNative, bodyTransform2:B3WorldTransformNative):B3BodyTOIResultNative;
	@:native("b3CreateSphereShape")
	public static function createSphereShape(bodyId:B3BodyIdNative, def:cpp.RawConstPointer<B3ShapeDefNative>, sphere:cpp.RawConstPointer<B3SphereNative>):B3ShapeIdNative;
	@:native("b3CreateCapsuleShape")
	public static function createCapsuleShape(bodyId:B3BodyIdNative, def:cpp.RawConstPointer<B3ShapeDefNative>, capsule:cpp.RawConstPointer<B3CapsuleNative>):B3ShapeIdNative;
	@:native("b3CreateHullShape")
	public static function createHullShape(bodyId:B3BodyIdNative, def:cpp.RawConstPointer<B3ShapeDefNative>, hull:cpp.RawConstPointer<B3HullDataNative>):B3ShapeIdNative;
	@:native("b3CreateTransformedHullShape")
	public static function createTransformedHullShape(bodyId:B3BodyIdNative, def:cpp.RawConstPointer<B3ShapeDefNative>, hull:cpp.RawConstPointer<B3HullDataNative>, transform:B3TransformNative, scale:B3Vec3Native):B3ShapeIdNative;
	@:native("b3CreateMeshShape")
	public static function createMeshShape(bodyId:B3BodyIdNative, def:cpp.RawConstPointer<B3ShapeDefNative>, mesh:cpp.RawConstPointer<B3MeshDataNative>, scale:B3Vec3Native):B3ShapeIdNative;
	@:native("b3CreateHeightFieldShape")
	public static function createHeightFieldShape(bodyId:B3BodyIdNative, def:cpp.RawConstPointer<B3ShapeDefNative>, heightField:cpp.RawConstPointer<B3HeightFieldDataNative>):B3ShapeIdNative;
	@:native("b3CreateBakedCompoundShape")
	public static function createBakedCompoundShape(bodyId:B3BodyIdNative, def:cpp.RawPointer<B3ShapeDefNative>, compound:cpp.RawConstPointer<B3CompoundDataNative>):B3ShapeIdNative;
	@:native("b3DestroyShape")
	public static function destroyShape(shapeId:B3ShapeIdNative, updateBodyMass:Bool):Void;
	@:native("b3Shape_IsValid")
	public static function shape_IsValid(id:B3ShapeIdNative):Bool;
	@:native("b3Shape_GetType")
	public static function shape_GetType(shapeId:B3ShapeIdNative):B3ShapeType;
	@:native("b3Shape_GetBody")
	public static function shape_GetBody(shapeId:B3ShapeIdNative):B3BodyIdNative;
	@:native("b3Shape_GetWorld")
	public static function shape_GetWorld(shapeId:B3ShapeIdNative):B3WorldIdNative;
	@:native("b3Shape_IsSensor")
	public static function shape_IsSensor(shapeId:B3ShapeIdNative):Bool;
	@:native("b3Shape_SetName")
	public static function shape_SetName(shapeId:B3ShapeIdNative, name:cpp.ConstCharStar):Void;
	@:native("b3Shape_GetName")
	public static function shape_GetName(shapeId:B3ShapeIdNative):cpp.ConstCharStar;
	@:native("b3Shape_SetUserData")
	public static function shape_SetUserData(shapeId:B3ShapeIdNative, userData:cpp.RawPointer<Void>):Void;
	@:native("b3Shape_GetUserData")
	public static function shape_GetUserData(shapeId:B3ShapeIdNative):cpp.RawPointer<Void>;
	@:native("b3Shape_SetDensity")
	public static function shape_SetDensity(shapeId:B3ShapeIdNative, density:cpp.Float32, updateBodyMass:Bool):Void;
	@:native("b3Shape_GetDensity")
	public static function shape_GetDensity(shapeId:B3ShapeIdNative):cpp.Float32;
	@:native("b3Shape_SetFriction")
	public static function shape_SetFriction(shapeId:B3ShapeIdNative, friction:cpp.Float32):Void;
	@:native("b3Shape_GetFriction")
	public static function shape_GetFriction(shapeId:B3ShapeIdNative):cpp.Float32;
	@:native("b3Shape_SetRestitution")
	public static function shape_SetRestitution(shapeId:B3ShapeIdNative, restitution:cpp.Float32):Void;
	@:native("b3Shape_GetRestitution")
	public static function shape_GetRestitution(shapeId:B3ShapeIdNative):cpp.Float32;
	@:native("b3Shape_SetSurfaceMaterial")
	public static function shape_SetSurfaceMaterial(shapeId:B3ShapeIdNative, surfaceMaterial:B3SurfaceMaterialNative):Void;
	@:native("b3Shape_GetSurfaceMaterial")
	public static function shape_GetSurfaceMaterial(shapeId:B3ShapeIdNative):B3SurfaceMaterialNative;
	@:native("b3Shape_GetMeshMaterialCount")
	public static function shape_GetMeshMaterialCount(shapeId:B3ShapeIdNative):Int;
	@:native("b3Shape_SetMeshMaterial")
	public static function shape_SetMeshMaterial(shapeId:B3ShapeIdNative, surfaceMaterial:B3SurfaceMaterialNative, index:Int):Void;
	@:native("b3Shape_GetMeshSurfaceMaterial")
	public static function shape_GetMeshSurfaceMaterial(shapeId:B3ShapeIdNative, index:Int):B3SurfaceMaterialNative;
	@:native("b3Shape_GetFilter")
	public static function shape_GetFilter(shapeId:B3ShapeIdNative):B3FilterNative;
	@:native("b3Shape_SetFilter")
	public static function shape_SetFilter(shapeId:B3ShapeIdNative, filter:B3FilterNative, invokeContacts:Bool):Void;
	@:native("b3Shape_EnableSensorEvents")
	public static function shape_EnableSensorEvents(shapeId:B3ShapeIdNative, flag:Bool):Void;
	@:native("b3Shape_AreSensorEventsEnabled")
	public static function shape_AreSensorEventsEnabled(shapeId:B3ShapeIdNative):Bool;
	@:native("b3Shape_EnableContactEvents")
	public static function shape_EnableContactEvents(shapeId:B3ShapeIdNative, flag:Bool):Void;
	@:native("b3Shape_AreContactEventsEnabled")
	public static function shape_AreContactEventsEnabled(shapeId:B3ShapeIdNative):Bool;
	@:native("b3Shape_EnablePreSolveEvents")
	public static function shape_EnablePreSolveEvents(shapeId:B3ShapeIdNative, flag:Bool):Void;
	@:native("b3Shape_ArePreSolveEventsEnabled")
	public static function shape_ArePreSolveEventsEnabled(shapeId:B3ShapeIdNative):Bool;
	@:native("b3Shape_EnableHitEvents")
	public static function shape_EnableHitEvents(shapeId:B3ShapeIdNative, flag:Bool):Void;
	@:native("b3Shape_AreHitEventsEnabled")
	public static function shape_AreHitEventsEnabled(shapeId:B3ShapeIdNative):Bool;
	@:native("b3Shape_RayCast")
	public static function shape_RayCast(shapeId:B3ShapeIdNative, origin:B3PosNative, translation:B3Vec3Native):B3WorldCastOutputNative;
	@:native("b3Shape_GetSphere")
	public static function shape_GetSphere(shapeId:B3ShapeIdNative):B3SphereNative;
	@:native("b3Shape_GetCapsule")
	public static function shape_GetCapsule(shapeId:B3ShapeIdNative):B3CapsuleNative;
	@:native("b3Shape_GetHull")
	public static function shape_GetHull(shapeId:B3ShapeIdNative):cpp.RawConstPointer<B3HullDataNative>;
	@:native("b3Shape_GetMesh")
	public static function shape_GetMesh(shapeId:B3ShapeIdNative):B3MeshNative;
	@:native("b3Shape_GetHeightField")
	public static function shape_GetHeightField(shapeId:B3ShapeIdNative):cpp.RawConstPointer<B3HeightFieldDataNative>;
	@:native("b3Shape_SetSphere")
	public static function shape_SetSphere(shapeId:B3ShapeIdNative, sphere:cpp.RawConstPointer<B3SphereNative>):Void;
	@:native("b3Shape_SetCapsule")
	public static function shape_SetCapsule(shapeId:B3ShapeIdNative, capsule:cpp.RawConstPointer<B3CapsuleNative>):Void;
	@:native("b3Shape_SetHull")
	public static function shape_SetHull(shapeId:B3ShapeIdNative, hull:cpp.RawConstPointer<B3HullDataNative>):Void;
	@:native("b3Shape_SetMesh")
	public static function shape_SetMesh(shapeId:B3ShapeIdNative, meshData:cpp.RawConstPointer<B3MeshDataNative>, scale:B3Vec3Native):Void;
	@:native("b3Shape_GetContactCapacity")
	public static function shape_GetContactCapacity(shapeId:B3ShapeIdNative):Int;
	@:native("b3Shape_GetContactData")
	public static function shape_GetContactData(shapeId:B3ShapeIdNative, contactData:cpp.RawPointer<B3ContactDataNative>, capacity:Int):Int;
	@:native("b3Shape_GetSensorCapacity")
	public static function shape_GetSensorCapacity(shapeId:B3ShapeIdNative):Int;
	@:native("b3Shape_GetSensorData")
	public static function shape_GetSensorData(shapeId:B3ShapeIdNative, visitorIds:cpp.RawPointer<B3ShapeIdNative>, capacity:Int):Int;
	@:native("b3Shape_GetAABB")
	public static function shape_GetAABB(shapeId:B3ShapeIdNative):B3AABBNative;
	@:native("b3Shape_ComputeMassData")
	public static function shape_ComputeMassData(shapeId:B3ShapeIdNative):B3MassDataNative;
	@:native("b3Shape_GetClosestPoint")
	public static function shape_GetClosestPoint(shapeId:B3ShapeIdNative, target:B3Vec3Native):B3Vec3Native;
	@:native("b3Shape_ApplyWind")
	public static function shape_ApplyWind(shapeId:B3ShapeIdNative, wind:B3Vec3Native, drag:cpp.Float32, lift:cpp.Float32, maxSpeed:cpp.Float32, wake:Bool):Void;
	@:native("b3DestroyJoint")
	public static function destroyJoint(jointId:B3JointIdNative, wakeAttached:Bool):Void;
	@:native("b3Joint_IsValid")
	public static function joint_IsValid(id:B3JointIdNative):Bool;
	@:native("b3Joint_GetType")
	public static function joint_GetType(jointId:B3JointIdNative):B3JointType;
	@:native("b3Joint_GetBodyA")
	public static function joint_GetBodyA(jointId:B3JointIdNative):B3BodyIdNative;
	@:native("b3Joint_GetBodyB")
	public static function joint_GetBodyB(jointId:B3JointIdNative):B3BodyIdNative;
	@:native("b3Joint_GetWorld")
	public static function joint_GetWorld(jointId:B3JointIdNative):B3WorldIdNative;
	@:native("b3Joint_SetLocalFrameA")
	public static function joint_SetLocalFrameA(jointId:B3JointIdNative, localFrame:B3TransformNative):Void;
	@:native("b3Joint_GetLocalFrameA")
	public static function joint_GetLocalFrameA(jointId:B3JointIdNative):B3TransformNative;
	@:native("b3Joint_SetLocalFrameB")
	public static function joint_SetLocalFrameB(jointId:B3JointIdNative, localFrame:B3TransformNative):Void;
	@:native("b3Joint_GetLocalFrameB")
	public static function joint_GetLocalFrameB(jointId:B3JointIdNative):B3TransformNative;
	@:native("b3Joint_SetCollideConnected")
	public static function joint_SetCollideConnected(jointId:B3JointIdNative, shouldCollide:Bool):Void;
	@:native("b3Joint_GetCollideConnected")
	public static function joint_GetCollideConnected(jointId:B3JointIdNative):Bool;
	@:native("b3Joint_SetUserData")
	public static function joint_SetUserData(jointId:B3JointIdNative, userData:cpp.RawPointer<Void>):Void;
	@:native("b3Joint_GetUserData")
	public static function joint_GetUserData(jointId:B3JointIdNative):cpp.RawPointer<Void>;
	@:native("b3Joint_WakeBodies")
	public static function joint_WakeBodies(jointId:B3JointIdNative):Void;
	@:native("b3Joint_IsAwake")
	public static function joint_IsAwake(jointId:B3JointIdNative):Bool;
	@:native("b3Joint_GetConstraintForce")
	public static function joint_GetConstraintForce(jointId:B3JointIdNative):B3Vec3Native;
	@:native("b3Joint_GetConstraintTorque")
	public static function joint_GetConstraintTorque(jointId:B3JointIdNative):B3Vec3Native;
	@:native("b3Joint_GetLinearSeparation")
	public static function joint_GetLinearSeparation(jointId:B3JointIdNative):cpp.Float32;
	@:native("b3Joint_GetAngularSeparation")
	public static function joint_GetAngularSeparation(jointId:B3JointIdNative):cpp.Float32;
	@:native("b3Joint_SetConstraintTuning")
	public static function joint_SetConstraintTuning(jointId:B3JointIdNative, hertz:cpp.Float32, dampingRatio:cpp.Float32):Void;
	@:native("b3Joint_GetConstraintTuning")
	public static function joint_GetConstraintTuning(jointId:B3JointIdNative, hertz:cpp.RawPointer<cpp.Float32>, dampingRatio:cpp.RawPointer<cpp.Float32>):Void;
	@:native("b3Joint_SetForceThreshold")
	public static function joint_SetForceThreshold(jointId:B3JointIdNative, threshold:cpp.Float32):Void;
	@:native("b3Joint_GetForceThreshold")
	public static function joint_GetForceThreshold(jointId:B3JointIdNative):cpp.Float32;
	@:native("b3Joint_SetTorqueThreshold")
	public static function joint_SetTorqueThreshold(jointId:B3JointIdNative, threshold:cpp.Float32):Void;
	@:native("b3Joint_GetTorqueThreshold")
	public static function joint_GetTorqueThreshold(jointId:B3JointIdNative):cpp.Float32;
	@:native("b3CreateParallelJoint")
	public static function createParallelJoint(worldId:B3WorldIdNative, def:cpp.RawConstPointer<B3ParallelJointDefNative>):B3JointIdNative;
	@:native("b3ParallelJoint_SetSpringHertz")
	public static function parallelJoint_SetSpringHertz(jointId:B3JointIdNative, hertz:cpp.Float32):Void;
	@:native("b3ParallelJoint_SetSpringDampingRatio")
	public static function parallelJoint_SetSpringDampingRatio(jointId:B3JointIdNative, dampingRatio:cpp.Float32):Void;
	@:native("b3ParallelJoint_GetSpringHertz")
	public static function parallelJoint_GetSpringHertz(jointId:B3JointIdNative):cpp.Float32;
	@:native("b3ParallelJoint_GetSpringDampingRatio")
	public static function parallelJoint_GetSpringDampingRatio(jointId:B3JointIdNative):cpp.Float32;
	@:native("b3ParallelJoint_SetMaxTorque")
	public static function parallelJoint_SetMaxTorque(jointId:B3JointIdNative, force:cpp.Float32):Void;
	@:native("b3ParallelJoint_GetMaxTorque")
	public static function parallelJoint_GetMaxTorque(jointId:B3JointIdNative):cpp.Float32;
	@:native("b3CreateDistanceJoint")
	public static function createDistanceJoint(worldId:B3WorldIdNative, def:cpp.RawConstPointer<B3DistanceJointDefNative>):B3JointIdNative;
	@:native("b3DistanceJoint_SetLength")
	public static function distanceJoint_SetLength(jointId:B3JointIdNative, length:cpp.Float32):Void;
	@:native("b3DistanceJoint_GetLength")
	public static function distanceJoint_GetLength(jointId:B3JointIdNative):cpp.Float32;
	@:native("b3DistanceJoint_EnableSpring")
	public static function distanceJoint_EnableSpring(jointId:B3JointIdNative, enableSpring:Bool):Void;
	@:native("b3DistanceJoint_IsSpringEnabled")
	public static function distanceJoint_IsSpringEnabled(jointId:B3JointIdNative):Bool;
	@:native("b3DistanceJoint_SetSpringForceRange")
	public static function distanceJoint_SetSpringForceRange(jointId:B3JointIdNative, lowerForce:cpp.Float32, upperForce:cpp.Float32):Void;
	@:native("b3DistanceJoint_GetSpringForceRange")
	public static function distanceJoint_GetSpringForceRange(jointId:B3JointIdNative, lowerForce:cpp.RawPointer<cpp.Float32>, upperForce:cpp.RawPointer<cpp.Float32>):Void;
	@:native("b3DistanceJoint_SetSpringHertz")
	public static function distanceJoint_SetSpringHertz(jointId:B3JointIdNative, hertz:cpp.Float32):Void;
	@:native("b3DistanceJoint_SetSpringDampingRatio")
	public static function distanceJoint_SetSpringDampingRatio(jointId:B3JointIdNative, dampingRatio:cpp.Float32):Void;
	@:native("b3DistanceJoint_GetSpringHertz")
	public static function distanceJoint_GetSpringHertz(jointId:B3JointIdNative):cpp.Float32;
	@:native("b3DistanceJoint_GetSpringDampingRatio")
	public static function distanceJoint_GetSpringDampingRatio(jointId:B3JointIdNative):cpp.Float32;
	@:native("b3DistanceJoint_EnableLimit")
	public static function distanceJoint_EnableLimit(jointId:B3JointIdNative, enableLimit:Bool):Void;
	@:native("b3DistanceJoint_IsLimitEnabled")
	public static function distanceJoint_IsLimitEnabled(jointId:B3JointIdNative):Bool;
	@:native("b3DistanceJoint_SetLengthRange")
	public static function distanceJoint_SetLengthRange(jointId:B3JointIdNative, minLength:cpp.Float32, maxLength:cpp.Float32):Void;
	@:native("b3DistanceJoint_GetMinLength")
	public static function distanceJoint_GetMinLength(jointId:B3JointIdNative):cpp.Float32;
	@:native("b3DistanceJoint_GetMaxLength")
	public static function distanceJoint_GetMaxLength(jointId:B3JointIdNative):cpp.Float32;
	@:native("b3DistanceJoint_GetCurrentLength")
	public static function distanceJoint_GetCurrentLength(jointId:B3JointIdNative):cpp.Float32;
	@:native("b3DistanceJoint_EnableMotor")
	public static function distanceJoint_EnableMotor(jointId:B3JointIdNative, enableMotor:Bool):Void;
	@:native("b3DistanceJoint_IsMotorEnabled")
	public static function distanceJoint_IsMotorEnabled(jointId:B3JointIdNative):Bool;
	@:native("b3DistanceJoint_SetMotorSpeed")
	public static function distanceJoint_SetMotorSpeed(jointId:B3JointIdNative, motorSpeed:cpp.Float32):Void;
	@:native("b3DistanceJoint_GetMotorSpeed")
	public static function distanceJoint_GetMotorSpeed(jointId:B3JointIdNative):cpp.Float32;
	@:native("b3DistanceJoint_SetMaxMotorForce")
	public static function distanceJoint_SetMaxMotorForce(jointId:B3JointIdNative, force:cpp.Float32):Void;
	@:native("b3DistanceJoint_GetMaxMotorForce")
	public static function distanceJoint_GetMaxMotorForce(jointId:B3JointIdNative):cpp.Float32;
	@:native("b3DistanceJoint_GetMotorForce")
	public static function distanceJoint_GetMotorForce(jointId:B3JointIdNative):cpp.Float32;
	@:native("b3CreateMotorJoint")
	public static function createMotorJoint(worldId:B3WorldIdNative, def:cpp.RawConstPointer<B3MotorJointDefNative>):B3JointIdNative;
	@:native("b3MotorJoint_SetLinearVelocity")
	public static function motorJoint_SetLinearVelocity(jointId:B3JointIdNative, velocity:B3Vec3Native):Void;
	@:native("b3MotorJoint_GetLinearVelocity")
	public static function motorJoint_GetLinearVelocity(jointId:B3JointIdNative):B3Vec3Native;
	@:native("b3MotorJoint_SetAngularVelocity")
	public static function motorJoint_SetAngularVelocity(jointId:B3JointIdNative, velocity:B3Vec3Native):Void;
	@:native("b3MotorJoint_GetAngularVelocity")
	public static function motorJoint_GetAngularVelocity(jointId:B3JointIdNative):B3Vec3Native;
	@:native("b3MotorJoint_SetMaxVelocityForce")
	public static function motorJoint_SetMaxVelocityForce(jointId:B3JointIdNative, maxForce:cpp.Float32):Void;
	@:native("b3MotorJoint_GetMaxVelocityForce")
	public static function motorJoint_GetMaxVelocityForce(jointId:B3JointIdNative):cpp.Float32;
	@:native("b3MotorJoint_SetMaxVelocityTorque")
	public static function motorJoint_SetMaxVelocityTorque(jointId:B3JointIdNative, maxTorque:cpp.Float32):Void;
	@:native("b3MotorJoint_GetMaxVelocityTorque")
	public static function motorJoint_GetMaxVelocityTorque(jointId:B3JointIdNative):cpp.Float32;
	@:native("b3MotorJoint_SetLinearHertz")
	public static function motorJoint_SetLinearHertz(jointId:B3JointIdNative, hertz:cpp.Float32):Void;
	@:native("b3MotorJoint_GetLinearHertz")
	public static function motorJoint_GetLinearHertz(jointId:B3JointIdNative):cpp.Float32;
	@:native("b3MotorJoint_SetLinearDampingRatio")
	public static function motorJoint_SetLinearDampingRatio(jointId:B3JointIdNative, damping:cpp.Float32):Void;
	@:native("b3MotorJoint_GetLinearDampingRatio")
	public static function motorJoint_GetLinearDampingRatio(jointId:B3JointIdNative):cpp.Float32;
	@:native("b3MotorJoint_SetAngularHertz")
	public static function motorJoint_SetAngularHertz(jointId:B3JointIdNative, hertz:cpp.Float32):Void;
	@:native("b3MotorJoint_GetAngularHertz")
	public static function motorJoint_GetAngularHertz(jointId:B3JointIdNative):cpp.Float32;
	@:native("b3MotorJoint_SetAngularDampingRatio")
	public static function motorJoint_SetAngularDampingRatio(jointId:B3JointIdNative, damping:cpp.Float32):Void;
	@:native("b3MotorJoint_GetAngularDampingRatio")
	public static function motorJoint_GetAngularDampingRatio(jointId:B3JointIdNative):cpp.Float32;
	@:native("b3MotorJoint_SetMaxSpringForce")
	public static function motorJoint_SetMaxSpringForce(jointId:B3JointIdNative, maxForce:cpp.Float32):Void;
	@:native("b3MotorJoint_GetMaxSpringForce")
	public static function motorJoint_GetMaxSpringForce(jointId:B3JointIdNative):cpp.Float32;
	@:native("b3MotorJoint_SetMaxSpringTorque")
	public static function motorJoint_SetMaxSpringTorque(jointId:B3JointIdNative, maxTorque:cpp.Float32):Void;
	@:native("b3MotorJoint_GetMaxSpringTorque")
	public static function motorJoint_GetMaxSpringTorque(jointId:B3JointIdNative):cpp.Float32;
	@:native("b3CreateFilterJoint")
	public static function createFilterJoint(worldId:B3WorldIdNative, def:cpp.RawConstPointer<B3FilterJointDefNative>):B3JointIdNative;
	@:native("b3CreatePrismaticJoint")
	public static function createPrismaticJoint(worldId:B3WorldIdNative, def:cpp.RawConstPointer<B3PrismaticJointDefNative>):B3JointIdNative;
	@:native("b3PrismaticJoint_EnableSpring")
	public static function prismaticJoint_EnableSpring(jointId:B3JointIdNative, enableSpring:Bool):Void;
	@:native("b3PrismaticJoint_IsSpringEnabled")
	public static function prismaticJoint_IsSpringEnabled(jointId:B3JointIdNative):Bool;
	@:native("b3PrismaticJoint_SetSpringHertz")
	public static function prismaticJoint_SetSpringHertz(jointId:B3JointIdNative, hertz:cpp.Float32):Void;
	@:native("b3PrismaticJoint_GetSpringHertz")
	public static function prismaticJoint_GetSpringHertz(jointId:B3JointIdNative):cpp.Float32;
	@:native("b3PrismaticJoint_SetSpringDampingRatio")
	public static function prismaticJoint_SetSpringDampingRatio(jointId:B3JointIdNative, dampingRatio:cpp.Float32):Void;
	@:native("b3PrismaticJoint_GetSpringDampingRatio")
	public static function prismaticJoint_GetSpringDampingRatio(jointId:B3JointIdNative):cpp.Float32;
	@:native("b3PrismaticJoint_SetTargetTranslation")
	public static function prismaticJoint_SetTargetTranslation(jointId:B3JointIdNative, targetTranslation:cpp.Float32):Void;
	@:native("b3PrismaticJoint_GetTargetTranslation")
	public static function prismaticJoint_GetTargetTranslation(jointId:B3JointIdNative):cpp.Float32;
	@:native("b3PrismaticJoint_EnableLimit")
	public static function prismaticJoint_EnableLimit(jointId:B3JointIdNative, enableLimit:Bool):Void;
	@:native("b3PrismaticJoint_IsLimitEnabled")
	public static function prismaticJoint_IsLimitEnabled(jointId:B3JointIdNative):Bool;
	@:native("b3PrismaticJoint_GetLowerLimit")
	public static function prismaticJoint_GetLowerLimit(jointId:B3JointIdNative):cpp.Float32;
	@:native("b3PrismaticJoint_GetUpperLimit")
	public static function prismaticJoint_GetUpperLimit(jointId:B3JointIdNative):cpp.Float32;
	@:native("b3PrismaticJoint_SetLimits")
	public static function prismaticJoint_SetLimits(jointId:B3JointIdNative, lower:cpp.Float32, upper:cpp.Float32):Void;
	@:native("b3PrismaticJoint_EnableMotor")
	public static function prismaticJoint_EnableMotor(jointId:B3JointIdNative, enableMotor:Bool):Void;
	@:native("b3PrismaticJoint_IsMotorEnabled")
	public static function prismaticJoint_IsMotorEnabled(jointId:B3JointIdNative):Bool;
	@:native("b3PrismaticJoint_SetMotorSpeed")
	public static function prismaticJoint_SetMotorSpeed(jointId:B3JointIdNative, motorSpeed:cpp.Float32):Void;
	@:native("b3PrismaticJoint_GetMotorSpeed")
	public static function prismaticJoint_GetMotorSpeed(jointId:B3JointIdNative):cpp.Float32;
	@:native("b3PrismaticJoint_SetMaxMotorForce")
	public static function prismaticJoint_SetMaxMotorForce(jointId:B3JointIdNative, force:cpp.Float32):Void;
	@:native("b3PrismaticJoint_GetMaxMotorForce")
	public static function prismaticJoint_GetMaxMotorForce(jointId:B3JointIdNative):cpp.Float32;
	@:native("b3PrismaticJoint_GetMotorForce")
	public static function prismaticJoint_GetMotorForce(jointId:B3JointIdNative):cpp.Float32;
	@:native("b3PrismaticJoint_GetTranslation")
	public static function prismaticJoint_GetTranslation(jointId:B3JointIdNative):cpp.Float32;
	@:native("b3PrismaticJoint_GetSpeed")
	public static function prismaticJoint_GetSpeed(jointId:B3JointIdNative):cpp.Float32;
	@:native("b3CreateRevoluteJoint")
	public static function createRevoluteJoint(worldId:B3WorldIdNative, def:cpp.RawConstPointer<B3RevoluteJointDefNative>):B3JointIdNative;
	@:native("b3RevoluteJoint_EnableSpring")
	public static function revoluteJoint_EnableSpring(jointId:B3JointIdNative, enableSpring:Bool):Void;
	@:native("b3RevoluteJoint_IsSpringEnabled")
	public static function revoluteJoint_IsSpringEnabled(jointId:B3JointIdNative):Bool;
	@:native("b3RevoluteJoint_SetSpringHertz")
	public static function revoluteJoint_SetSpringHertz(jointId:B3JointIdNative, hertz:cpp.Float32):Void;
	@:native("b3RevoluteJoint_GetSpringHertz")
	public static function revoluteJoint_GetSpringHertz(jointId:B3JointIdNative):cpp.Float32;
	@:native("b3RevoluteJoint_SetSpringDampingRatio")
	public static function revoluteJoint_SetSpringDampingRatio(jointId:B3JointIdNative, dampingRatio:cpp.Float32):Void;
	@:native("b3RevoluteJoint_GetSpringDampingRatio")
	public static function revoluteJoint_GetSpringDampingRatio(jointId:B3JointIdNative):cpp.Float32;
	@:native("b3RevoluteJoint_SetTargetAngle")
	public static function revoluteJoint_SetTargetAngle(jointId:B3JointIdNative, targetRadians:cpp.Float32):Void;
	@:native("b3RevoluteJoint_GetTargetAngle")
	public static function revoluteJoint_GetTargetAngle(jointId:B3JointIdNative):cpp.Float32;
	@:native("b3RevoluteJoint_GetAngle")
	public static function revoluteJoint_GetAngle(jointId:B3JointIdNative):cpp.Float32;
	@:native("b3RevoluteJoint_EnableLimit")
	public static function revoluteJoint_EnableLimit(jointId:B3JointIdNative, enableLimit:Bool):Void;
	@:native("b3RevoluteJoint_IsLimitEnabled")
	public static function revoluteJoint_IsLimitEnabled(jointId:B3JointIdNative):Bool;
	@:native("b3RevoluteJoint_GetLowerLimit")
	public static function revoluteJoint_GetLowerLimit(jointId:B3JointIdNative):cpp.Float32;
	@:native("b3RevoluteJoint_GetUpperLimit")
	public static function revoluteJoint_GetUpperLimit(jointId:B3JointIdNative):cpp.Float32;
	@:native("b3RevoluteJoint_SetLimits")
	public static function revoluteJoint_SetLimits(jointId:B3JointIdNative, lowerLimitRadians:cpp.Float32, upperLimitRadians:cpp.Float32):Void;
	@:native("b3RevoluteJoint_EnableMotor")
	public static function revoluteJoint_EnableMotor(jointId:B3JointIdNative, enableMotor:Bool):Void;
	@:native("b3RevoluteJoint_IsMotorEnabled")
	public static function revoluteJoint_IsMotorEnabled(jointId:B3JointIdNative):Bool;
	@:native("b3RevoluteJoint_SetMotorSpeed")
	public static function revoluteJoint_SetMotorSpeed(jointId:B3JointIdNative, motorSpeed:cpp.Float32):Void;
	@:native("b3RevoluteJoint_GetMotorSpeed")
	public static function revoluteJoint_GetMotorSpeed(jointId:B3JointIdNative):cpp.Float32;
	@:native("b3RevoluteJoint_GetMotorTorque")
	public static function revoluteJoint_GetMotorTorque(jointId:B3JointIdNative):cpp.Float32;
	@:native("b3RevoluteJoint_SetMaxMotorTorque")
	public static function revoluteJoint_SetMaxMotorTorque(jointId:B3JointIdNative, torque:cpp.Float32):Void;
	@:native("b3RevoluteJoint_GetMaxMotorTorque")
	public static function revoluteJoint_GetMaxMotorTorque(jointId:B3JointIdNative):cpp.Float32;
	@:native("b3CreateSphericalJoint")
	public static function createSphericalJoint(worldId:B3WorldIdNative, def:cpp.RawConstPointer<B3SphericalJointDefNative>):B3JointIdNative;
	@:native("b3SphericalJoint_EnableConeLimit")
	public static function sphericalJoint_EnableConeLimit(jointId:B3JointIdNative, enableLimit:Bool):Void;
	@:native("b3SphericalJoint_IsConeLimitEnabled")
	public static function sphericalJoint_IsConeLimitEnabled(jointId:B3JointIdNative):Bool;
	@:native("b3SphericalJoint_GetConeLimit")
	public static function sphericalJoint_GetConeLimit(jointId:B3JointIdNative):cpp.Float32;
	@:native("b3SphericalJoint_SetConeLimit")
	public static function sphericalJoint_SetConeLimit(jointId:B3JointIdNative, angleRadians:cpp.Float32):Void;
	@:native("b3SphericalJoint_GetConeAngle")
	public static function sphericalJoint_GetConeAngle(jointId:B3JointIdNative):cpp.Float32;
	@:native("b3SphericalJoint_EnableTwistLimit")
	public static function sphericalJoint_EnableTwistLimit(jointId:B3JointIdNative, enableLimit:Bool):Void;
	@:native("b3SphericalJoint_IsTwistLimitEnabled")
	public static function sphericalJoint_IsTwistLimitEnabled(jointId:B3JointIdNative):Bool;
	@:native("b3SphericalJoint_GetLowerTwistLimit")
	public static function sphericalJoint_GetLowerTwistLimit(jointId:B3JointIdNative):cpp.Float32;
	@:native("b3SphericalJoint_GetUpperTwistLimit")
	public static function sphericalJoint_GetUpperTwistLimit(jointId:B3JointIdNative):cpp.Float32;
	@:native("b3SphericalJoint_SetTwistLimits")
	public static function sphericalJoint_SetTwistLimits(jointId:B3JointIdNative, lowerLimitRadians:cpp.Float32, upperLimitRadians:cpp.Float32):Void;
	@:native("b3SphericalJoint_GetTwistAngle")
	public static function sphericalJoint_GetTwistAngle(jointId:B3JointIdNative):cpp.Float32;
	@:native("b3SphericalJoint_EnableSpring")
	public static function sphericalJoint_EnableSpring(jointId:B3JointIdNative, enableSpring:Bool):Void;
	@:native("b3SphericalJoint_IsSpringEnabled")
	public static function sphericalJoint_IsSpringEnabled(jointId:B3JointIdNative):Bool;
	@:native("b3SphericalJoint_SetSpringHertz")
	public static function sphericalJoint_SetSpringHertz(jointId:B3JointIdNative, hertz:cpp.Float32):Void;
	@:native("b3SphericalJoint_GetSpringHertz")
	public static function sphericalJoint_GetSpringHertz(jointId:B3JointIdNative):cpp.Float32;
	@:native("b3SphericalJoint_SetSpringDampingRatio")
	public static function sphericalJoint_SetSpringDampingRatio(jointId:B3JointIdNative, dampingRatio:cpp.Float32):Void;
	@:native("b3SphericalJoint_GetSpringDampingRatio")
	public static function sphericalJoint_GetSpringDampingRatio(jointId:B3JointIdNative):cpp.Float32;
	@:native("b3SphericalJoint_SetTargetRotation")
	public static function sphericalJoint_SetTargetRotation(jointId:B3JointIdNative, targetRotation:B3QuatNative):Void;
	@:native("b3SphericalJoint_GetTargetRotation")
	public static function sphericalJoint_GetTargetRotation(jointId:B3JointIdNative):B3QuatNative;
	@:native("b3SphericalJoint_EnableMotor")
	public static function sphericalJoint_EnableMotor(jointId:B3JointIdNative, enableMotor:Bool):Void;
	@:native("b3SphericalJoint_IsMotorEnabled")
	public static function sphericalJoint_IsMotorEnabled(jointId:B3JointIdNative):Bool;
	@:native("b3SphericalJoint_SetMotorVelocity")
	public static function sphericalJoint_SetMotorVelocity(jointId:B3JointIdNative, motorVelocity:B3Vec3Native):Void;
	@:native("b3SphericalJoint_GetMotorVelocity")
	public static function sphericalJoint_GetMotorVelocity(jointId:B3JointIdNative):B3Vec3Native;
	@:native("b3SphericalJoint_GetMotorTorque")
	public static function sphericalJoint_GetMotorTorque(jointId:B3JointIdNative):B3Vec3Native;
	@:native("b3SphericalJoint_SetMaxMotorTorque")
	public static function sphericalJoint_SetMaxMotorTorque(jointId:B3JointIdNative, torque:cpp.Float32):Void;
	@:native("b3SphericalJoint_GetMaxMotorTorque")
	public static function sphericalJoint_GetMaxMotorTorque(jointId:B3JointIdNative):cpp.Float32;
	@:native("b3CreateWeldJoint")
	public static function createWeldJoint(worldId:B3WorldIdNative, def:cpp.RawConstPointer<B3WeldJointDefNative>):B3JointIdNative;
	@:native("b3WeldJoint_SetLinearHertz")
	public static function weldJoint_SetLinearHertz(jointId:B3JointIdNative, hertz:cpp.Float32):Void;
	@:native("b3WeldJoint_GetLinearHertz")
	public static function weldJoint_GetLinearHertz(jointId:B3JointIdNative):cpp.Float32;
	@:native("b3WeldJoint_SetLinearDampingRatio")
	public static function weldJoint_SetLinearDampingRatio(jointId:B3JointIdNative, dampingRatio:cpp.Float32):Void;
	@:native("b3WeldJoint_GetLinearDampingRatio")
	public static function weldJoint_GetLinearDampingRatio(jointId:B3JointIdNative):cpp.Float32;
	@:native("b3WeldJoint_SetAngularHertz")
	public static function weldJoint_SetAngularHertz(jointId:B3JointIdNative, hertz:cpp.Float32):Void;
	@:native("b3WeldJoint_GetAngularHertz")
	public static function weldJoint_GetAngularHertz(jointId:B3JointIdNative):cpp.Float32;
	@:native("b3WeldJoint_SetAngularDampingRatio")
	public static function weldJoint_SetAngularDampingRatio(jointId:B3JointIdNative, dampingRatio:cpp.Float32):Void;
	@:native("b3WeldJoint_GetAngularDampingRatio")
	public static function weldJoint_GetAngularDampingRatio(jointId:B3JointIdNative):cpp.Float32;
	@:native("b3CreateWheelJoint")
	public static function createWheelJoint(worldId:B3WorldIdNative, def:cpp.RawConstPointer<B3WheelJointDefNative>):B3JointIdNative;
	@:native("b3WheelJoint_EnableSuspension")
	public static function wheelJoint_EnableSuspension(jointId:B3JointIdNative, flag:Bool):Void;
	@:native("b3WheelJoint_IsSuspensionEnabled")
	public static function wheelJoint_IsSuspensionEnabled(jointId:B3JointIdNative):Bool;
	@:native("b3WheelJoint_SetSuspensionHertz")
	public static function wheelJoint_SetSuspensionHertz(jointId:B3JointIdNative, hertz:cpp.Float32):Void;
	@:native("b3WheelJoint_GetSuspensionHertz")
	public static function wheelJoint_GetSuspensionHertz(jointId:B3JointIdNative):cpp.Float32;
	@:native("b3WheelJoint_SetSuspensionDampingRatio")
	public static function wheelJoint_SetSuspensionDampingRatio(jointId:B3JointIdNative, dampingRatio:cpp.Float32):Void;
	@:native("b3WheelJoint_GetSuspensionDampingRatio")
	public static function wheelJoint_GetSuspensionDampingRatio(jointId:B3JointIdNative):cpp.Float32;
	@:native("b3WheelJoint_EnableSuspensionLimit")
	public static function wheelJoint_EnableSuspensionLimit(jointId:B3JointIdNative, flag:Bool):Void;
	@:native("b3WheelJoint_IsSuspensionLimitEnabled")
	public static function wheelJoint_IsSuspensionLimitEnabled(jointId:B3JointIdNative):Bool;
	@:native("b3WheelJoint_GetLowerSuspensionLimit")
	public static function wheelJoint_GetLowerSuspensionLimit(jointId:B3JointIdNative):cpp.Float32;
	@:native("b3WheelJoint_GetUpperSuspensionLimit")
	public static function wheelJoint_GetUpperSuspensionLimit(jointId:B3JointIdNative):cpp.Float32;
	@:native("b3WheelJoint_SetSuspensionLimits")
	public static function wheelJoint_SetSuspensionLimits(jointId:B3JointIdNative, lower:cpp.Float32, upper:cpp.Float32):Void;
	@:native("b3WheelJoint_EnableSpinMotor")
	public static function wheelJoint_EnableSpinMotor(jointId:B3JointIdNative, flag:Bool):Void;
	@:native("b3WheelJoint_IsSpinMotorEnabled")
	public static function wheelJoint_IsSpinMotorEnabled(jointId:B3JointIdNative):Bool;
	@:native("b3WheelJoint_SetSpinMotorSpeed")
	public static function wheelJoint_SetSpinMotorSpeed(jointId:B3JointIdNative, speed:cpp.Float32):Void;
	@:native("b3WheelJoint_GetSpinMotorSpeed")
	public static function wheelJoint_GetSpinMotorSpeed(jointId:B3JointIdNative):cpp.Float32;
	@:native("b3WheelJoint_SetMaxSpinTorque")
	public static function wheelJoint_SetMaxSpinTorque(jointId:B3JointIdNative, torque:cpp.Float32):Void;
	@:native("b3WheelJoint_GetMaxSpinTorque")
	public static function wheelJoint_GetMaxSpinTorque(jointId:B3JointIdNative):cpp.Float32;
	@:native("b3WheelJoint_GetSpinSpeed")
	public static function wheelJoint_GetSpinSpeed(jointId:B3JointIdNative):cpp.Float32;
	@:native("b3WheelJoint_GetSpinTorque")
	public static function wheelJoint_GetSpinTorque(jointId:B3JointIdNative):cpp.Float32;
	@:native("b3WheelJoint_EnableSteering")
	public static function wheelJoint_EnableSteering(jointId:B3JointIdNative, flag:Bool):Void;
	@:native("b3WheelJoint_IsSteeringEnabled")
	public static function wheelJoint_IsSteeringEnabled(jointId:B3JointIdNative):Bool;
	@:native("b3WheelJoint_SetSteeringHertz")
	public static function wheelJoint_SetSteeringHertz(jointId:B3JointIdNative, hertz:cpp.Float32):Void;
	@:native("b3WheelJoint_GetSteeringHertz")
	public static function wheelJoint_GetSteeringHertz(jointId:B3JointIdNative):cpp.Float32;
	@:native("b3WheelJoint_SetSteeringDampingRatio")
	public static function wheelJoint_SetSteeringDampingRatio(jointId:B3JointIdNative, dampingRatio:cpp.Float32):Void;
	@:native("b3WheelJoint_GetSteeringDampingRatio")
	public static function wheelJoint_GetSteeringDampingRatio(jointId:B3JointIdNative):cpp.Float32;
	@:native("b3WheelJoint_SetMaxSteeringTorque")
	public static function wheelJoint_SetMaxSteeringTorque(jointId:B3JointIdNative, torque:cpp.Float32):Void;
	@:native("b3WheelJoint_GetMaxSteeringTorque")
	public static function wheelJoint_GetMaxSteeringTorque(jointId:B3JointIdNative):cpp.Float32;
	@:native("b3WheelJoint_EnableSteeringLimit")
	public static function wheelJoint_EnableSteeringLimit(jointId:B3JointIdNative, flag:Bool):Void;
	@:native("b3WheelJoint_IsSteeringLimitEnabled")
	public static function wheelJoint_IsSteeringLimitEnabled(jointId:B3JointIdNative):Bool;
	@:native("b3WheelJoint_GetLowerSteeringLimit")
	public static function wheelJoint_GetLowerSteeringLimit(jointId:B3JointIdNative):cpp.Float32;
	@:native("b3WheelJoint_GetUpperSteeringLimit")
	public static function wheelJoint_GetUpperSteeringLimit(jointId:B3JointIdNative):cpp.Float32;
	@:native("b3WheelJoint_SetSteeringLimits")
	public static function wheelJoint_SetSteeringLimits(jointId:B3JointIdNative, lowerRadians:cpp.Float32, upperRadians:cpp.Float32):Void;
	@:native("b3WheelJoint_SetTargetSteeringAngle")
	public static function wheelJoint_SetTargetSteeringAngle(jointId:B3JointIdNative, radians:cpp.Float32):Void;
	@:native("b3WheelJoint_GetTargetSteeringAngle")
	public static function wheelJoint_GetTargetSteeringAngle(jointId:B3JointIdNative):cpp.Float32;
	@:native("b3WheelJoint_GetSteeringAngle")
	public static function wheelJoint_GetSteeringAngle(jointId:B3JointIdNative):cpp.Float32;
	@:native("b3WheelJoint_GetSteeringTorque")
	public static function wheelJoint_GetSteeringTorque(jointId:B3JointIdNative):cpp.Float32;
	@:native("b3Contact_IsValid")
	public static function contact_IsValid(id:B3ContactIdNative):Bool;
	@:native("b3Contact_GetData")
	public static function contact_GetData(contactId:B3ContactIdNative):B3ContactDataNative;
	@:native("b3DynamicTree_Create")
	public static function dynamicTree_Create(proxyCapacity:Int):B3DynamicTreeNative;
	@:native("b3DynamicTree_Destroy")
	public static function dynamicTree_Destroy(tree:cpp.RawPointer<B3DynamicTreeNative>):Void;
	@:native("b3DynamicTree_CreateProxy")
	public static function dynamicTree_CreateProxy(tree:cpp.RawPointer<B3DynamicTreeNative>, aabb:B3AABBNative, categoryBits:cpp.UInt64, userData:cpp.UInt64):Int;
	@:native("b3DynamicTree_DestroyProxy")
	public static function dynamicTree_DestroyProxy(tree:cpp.RawPointer<B3DynamicTreeNative>, proxyId:Int):Void;
	@:native("b3DynamicTree_MoveProxy")
	public static function dynamicTree_MoveProxy(tree:cpp.RawPointer<B3DynamicTreeNative>, proxyId:Int, aabb:B3AABBNative):Void;
	@:native("b3DynamicTree_EnlargeProxy")
	public static function dynamicTree_EnlargeProxy(tree:cpp.RawPointer<B3DynamicTreeNative>, proxyId:Int, aabb:B3AABBNative):Void;
	@:native("b3DynamicTree_SetCategoryBits")
	public static function dynamicTree_SetCategoryBits(tree:cpp.RawPointer<B3DynamicTreeNative>, proxyId:Int, categoryBits:cpp.UInt64):Void;
	@:native("b3DynamicTree_GetCategoryBits")
	public static function dynamicTree_GetCategoryBits(tree:cpp.RawPointer<B3DynamicTreeNative>, proxyId:Int):cpp.UInt64;
	@:native("b3DynamicTree_Query")
	public static function dynamicTree_Query(tree:cpp.RawConstPointer<B3DynamicTreeNative>, aabb:B3AABBNative, maskBits:cpp.UInt64, requireAllBits:Bool, callback:B3TreeQueryCallbackFcn, context:cpp.RawPointer<Void>):B3TreeStatsNative;
	@:native("b3DynamicTree_QueryClosest")
	public static function dynamicTree_QueryClosest(tree:cpp.RawConstPointer<B3DynamicTreeNative>, point:B3Vec3Native, maskBits:cpp.UInt64, requireAllBits:Bool, callback:B3TreeQueryClosestCallbackFcn, context:cpp.RawPointer<Void>, minDistanceSqr:cpp.RawPointer<cpp.Float32>):B3TreeStatsNative;
	@:native("b3DynamicTree_RayCast")
	public static function dynamicTree_RayCast(tree:cpp.RawConstPointer<B3DynamicTreeNative>, input:cpp.RawConstPointer<B3RayCastInputNative>, maskBits:cpp.UInt64, requireAllBits:Bool, callback:B3TreeRayCastCallbackFcn, context:cpp.RawPointer<Void>):B3TreeStatsNative;
	@:native("b3DynamicTree_BoxCast")
	public static function dynamicTree_BoxCast(tree:cpp.RawConstPointer<B3DynamicTreeNative>, input:cpp.RawConstPointer<B3BoxCastInputNative>, maskBits:cpp.UInt64, requireAllBits:Bool, callback:B3TreeBoxCastCallbackFcn, context:cpp.RawPointer<Void>):B3TreeStatsNative;
	@:native("b3DynamicTree_GetHeight")
	public static function dynamicTree_GetHeight(tree:cpp.RawConstPointer<B3DynamicTreeNative>):Int;
	@:native("b3DynamicTree_GetAreaRatio")
	public static function dynamicTree_GetAreaRatio(tree:cpp.RawConstPointer<B3DynamicTreeNative>):cpp.Float32;
	@:native("b3DynamicTree_GetRootBounds")
	public static function dynamicTree_GetRootBounds(tree:cpp.RawConstPointer<B3DynamicTreeNative>):B3AABBNative;
	@:native("b3DynamicTree_GetProxyCount")
	public static function dynamicTree_GetProxyCount(tree:cpp.RawConstPointer<B3DynamicTreeNative>):Int;
	@:native("b3DynamicTree_Rebuild")
	public static function dynamicTree_Rebuild(tree:cpp.RawPointer<B3DynamicTreeNative>, fullBuild:Bool):Int;
	@:native("b3DynamicTree_GetByteCount")
	public static function dynamicTree_GetByteCount(tree:cpp.RawConstPointer<B3DynamicTreeNative>):Int;
	@:native("b3DynamicTree_Validate")
	public static function dynamicTree_Validate(tree:cpp.RawConstPointer<B3DynamicTreeNative>):Void;
	@:native("b3DynamicTree_ValidateNoEnlarged")
	public static function dynamicTree_ValidateNoEnlarged(tree:cpp.RawConstPointer<B3DynamicTreeNative>):Void;
	@:native("b3DynamicTree_Save")
	public static function dynamicTree_Save(tree:cpp.RawConstPointer<B3DynamicTreeNative>, fileName:cpp.ConstCharStar):Void;
	@:native("b3DynamicTree_Load")
	public static function dynamicTree_Load(fileName:cpp.ConstCharStar, scale:cpp.Float32):B3DynamicTreeNative;
	@:native("b3CreateCylinder")
	public static function createCylinder(height:cpp.Float32, radius:cpp.Float32, yOffset:cpp.Float32, sides:Int):cpp.RawPointer<B3HullDataNative>;
	@:native("b3CreateCone")
	public static function createCone(height:cpp.Float32, radius1:cpp.Float32, radius2:cpp.Float32, slices:Int):cpp.RawPointer<B3HullDataNative>;
	@:native("b3CreateRock")
	public static function createRock(radius:cpp.Float32):cpp.RawPointer<B3HullDataNative>;
	@:native("b3CreateHull")
	public static function createHull(points:cpp.RawConstPointer<B3Vec3Native>, pointCount:Int, maxVertexCount:Int):cpp.RawPointer<B3HullDataNative>;
	@:native("b3CloneHull")
	public static function cloneHull(hull:cpp.RawConstPointer<B3HullDataNative>):cpp.RawPointer<B3HullDataNative>;
	@:native("b3CloneAndTransformHull")
	public static function cloneAndTransformHull(original:cpp.RawConstPointer<B3HullDataNative>, transform:B3TransformNative, scale:B3Vec3Native):cpp.RawPointer<B3HullDataNative>;
	@:native("b3DestroyHull")
	public static function destroyHull(hull:cpp.RawPointer<B3HullDataNative>):Void;
	@:native("b3MakeCubeHull")
	public static function makeCubeHull(halfWidth:cpp.Float32):B3BoxHullNative;
	@:native("b3MakeBoxHull")
	public static function makeBoxHull(hx:cpp.Float32, hy:cpp.Float32, hz:cpp.Float32):B3BoxHullNative;
	@:native("b3MakeOffsetBoxHull")
	public static function makeOffsetBoxHull(hx:cpp.Float32, hy:cpp.Float32, hz:cpp.Float32, offset:B3Vec3Native):B3BoxHullNative;
	@:native("b3MakeTransformedBoxHull")
	public static function makeTransformedBoxHull(hx:cpp.Float32, hy:cpp.Float32, hz:cpp.Float32, transform:B3TransformNative):B3BoxHullNative;
	@:native("b3MakeScaledBoxHull")
	public static function makeScaledBoxHull(halfWidths:B3Vec3Native, transform:B3TransformNative, postScale:B3Vec3Native):B3BoxHullNative;
	@:native("b3ScaleBox")
	public static function scaleBox(halfWidths:cpp.RawPointer<B3Vec3Native>, transform:cpp.RawPointer<B3TransformNative>, postScale:B3Vec3Native, minHalfWidth:cpp.Float32):Void;
	@:native("b3CreateGridMesh")
	public static function createGridMesh(xCount:Int, zCount:Int, cellWidth:cpp.Float32, materialCount:Int, identifyEdges:Bool):cpp.RawPointer<B3MeshDataNative>;
	@:native("b3CreateWaveMesh")
	public static function createWaveMesh(xCount:Int, zCount:Int, cellWidth:cpp.Float32, amplitude:cpp.Float32, rowFrequency:cpp.Float32, columnFrequency:cpp.Float32):cpp.RawPointer<B3MeshDataNative>;
	@:native("b3CreateTorusMesh")
	public static function createTorusMesh(radialResolution:Int, tubularResolution:Int, radius:cpp.Float32, thickness:cpp.Float32):cpp.RawPointer<B3MeshDataNative>;
	@:native("b3CreateBoxMesh")
	public static function createBoxMesh(center:B3Vec3Native, extent:B3Vec3Native, identifyEdges:Bool):cpp.RawPointer<B3MeshDataNative>;
	@:native("b3CreateHollowBoxMesh")
	public static function createHollowBoxMesh(center:B3Vec3Native, extent:B3Vec3Native):cpp.RawPointer<B3MeshDataNative>;
	@:native("b3CreatePlatformMesh")
	public static function createPlatformMesh(center:B3Vec3Native, height:cpp.Float32, topWidth:cpp.Float32, bottomWidth:cpp.Float32):cpp.RawPointer<B3MeshDataNative>;
	@:native("b3CreateMesh")
	public static function createMesh(def:cpp.RawConstPointer<B3MeshDefNative>, degenerateTriangleIndices:cpp.RawPointer<Int>, degenerateCapacity:Int):cpp.RawPointer<B3MeshDataNative>;
	@:native("b3DestroyMesh")
	public static function destroyMesh(mesh:cpp.RawPointer<B3MeshDataNative>):Void;
	@:native("b3GetHeight")
	public static function getHeight(mesh:cpp.RawConstPointer<B3MeshDataNative>):Int;
	@:native("b3CreateHeightField")
	public static function createHeightField(data:cpp.RawConstPointer<B3HeightFieldDefNative>):cpp.RawPointer<B3HeightFieldDataNative>;
	@:native("b3CreateGrid")
	public static function createGrid(rowCount:Int, columnCount:Int, scale:B3Vec3Native, makeHoles:Bool):cpp.RawPointer<B3HeightFieldDataNative>;
	@:native("b3CreateWave")
	public static function createWave(rowCount:Int, columnCount:Int, scale:B3Vec3Native, rowFrequency:cpp.Float32, columnFrequency:cpp.Float32, makeHoles:Bool):cpp.RawPointer<B3HeightFieldDataNative>;
	@:native("b3DestroyHeightField")
	public static function destroyHeightField(heightField:cpp.RawPointer<B3HeightFieldDataNative>):Void;
	@:native("b3DumpHeightData")
	public static function dumpHeightData(data:cpp.RawConstPointer<B3HeightFieldDefNative>, fileName:cpp.ConstCharStar):Void;
	@:native("b3LoadHeightField")
	public static function loadHeightField(fileName:cpp.ConstCharStar):cpp.RawPointer<B3HeightFieldDataNative>;
	@:native("b3GetCompoundChild")
	public static function getCompoundChild(compound:cpp.RawConstPointer<B3CompoundDataNative>, childIndex:Int):B3ChildShapeNative;
	@:native("b3QueryCompound")
	public static function queryCompound(compound:cpp.RawConstPointer<B3CompoundDataNative>, aabb:B3AABBNative, fcn:B3CompoundQueryFcn, context:cpp.RawPointer<Void>):Void;
	@:native("b3GetCompoundCapsule")
	public static function getCompoundCapsule(compound:cpp.RawConstPointer<B3CompoundDataNative>, index:Int):B3CompoundCapsuleNative;
	@:native("b3GetCompoundHull")
	public static function getCompoundHull(compound:cpp.RawConstPointer<B3CompoundDataNative>, index:Int):B3CompoundHullNative;
	@:native("b3GetCompoundMesh")
	public static function getCompoundMesh(compound:cpp.RawConstPointer<B3CompoundDataNative>, index:Int):B3CompoundMeshNative;
	@:native("b3GetCompoundSphere")
	public static function getCompoundSphere(compound:cpp.RawConstPointer<B3CompoundDataNative>, index:Int):B3CompoundSphereNative;
	@:native("b3GetCompoundMaterials")
	public static function getCompoundMaterials(compound:cpp.RawConstPointer<B3CompoundDataNative>):cpp.RawConstPointer<B3SurfaceMaterialNative>;
	@:native("b3CreateCompound")
	public static function createCompound(def:cpp.RawConstPointer<B3CompoundDefNative>):cpp.RawPointer<B3CompoundDataNative>;
	@:native("b3DestroyCompound")
	public static function destroyCompound(compound:cpp.RawPointer<B3CompoundDataNative>):Void;
	@:native("b3ConvertCompoundToBytes")
	public static function convertCompoundToBytes(compound:cpp.RawPointer<B3CompoundDataNative>):cpp.RawPointer<cpp.UInt8>;
	@:native("b3ConvertBytesToCompound")
	public static function convertBytesToCompound(bytes:cpp.RawPointer<cpp.UInt8>, byteCount:Int):cpp.RawPointer<B3CompoundDataNative>;
	@:native("b3ComputeSphereMass")
	public static function computeSphereMass(shape:cpp.RawConstPointer<B3SphereNative>, density:cpp.Float32):B3MassDataNative;
	@:native("b3ComputeCapsuleMass")
	public static function computeCapsuleMass(shape:cpp.RawConstPointer<B3CapsuleNative>, density:cpp.Float32):B3MassDataNative;
	@:native("b3ComputeHullMass")
	public static function computeHullMass(shape:cpp.RawConstPointer<B3HullDataNative>, density:cpp.Float32):B3MassDataNative;
	@:native("b3ComputeSphereAABB")
	public static function computeSphereAABB(shape:cpp.RawConstPointer<B3SphereNative>, transform:B3TransformNative):B3AABBNative;
	@:native("b3ComputeCapsuleAABB")
	public static function computeCapsuleAABB(shape:cpp.RawConstPointer<B3CapsuleNative>, transform:B3TransformNative):B3AABBNative;
	@:native("b3ComputeHullAABB")
	public static function computeHullAABB(shape:cpp.RawConstPointer<B3HullDataNative>, transform:B3TransformNative):B3AABBNative;
	@:native("b3ComputeMeshAABB")
	public static function computeMeshAABB(shape:cpp.RawConstPointer<B3MeshDataNative>, transform:B3TransformNative, scale:B3Vec3Native):B3AABBNative;
	@:native("b3ComputeHeightFieldAABB")
	public static function computeHeightFieldAABB(shape:cpp.RawConstPointer<B3HeightFieldDataNative>, transform:B3TransformNative):B3AABBNative;
	@:native("b3ComputeCompoundAABB")
	public static function computeCompoundAABB(shape:cpp.RawConstPointer<B3CompoundDataNative>, transform:B3TransformNative):B3AABBNative;
	@:native("b3IsValidRay")
	public static function isValidRay(input:cpp.RawConstPointer<B3RayCastInputNative>):Bool;
	@:native("b3OverlapCapsule")
	public static function overlapCapsule(shape:cpp.RawConstPointer<B3CapsuleNative>, shapeTransform:B3TransformNative, proxy:cpp.RawConstPointer<B3ShapeProxyNative>):Bool;
	@:native("b3OverlapCompound")
	public static function overlapCompound(shape:cpp.RawConstPointer<B3CompoundDataNative>, shapeTransform:B3TransformNative, proxy:cpp.RawConstPointer<B3ShapeProxyNative>):Bool;
	@:native("b3OverlapHeightField")
	public static function overlapHeightField(shape:cpp.RawConstPointer<B3HeightFieldDataNative>, shapeTransform:B3TransformNative, proxy:cpp.RawConstPointer<B3ShapeProxyNative>):Bool;
	@:native("b3OverlapHull")
	public static function overlapHull(shape:cpp.RawConstPointer<B3HullDataNative>, shapeTransform:B3TransformNative, proxy:cpp.RawConstPointer<B3ShapeProxyNative>):Bool;
	@:native("b3OverlapMesh")
	public static function overlapMesh(shape:cpp.RawConstPointer<B3MeshNative>, shapeTransform:B3TransformNative, proxy:cpp.RawConstPointer<B3ShapeProxyNative>):Bool;
	@:native("b3OverlapSphere")
	public static function overlapSphere(shape:cpp.RawConstPointer<B3SphereNative>, shapeTransform:B3TransformNative, proxy:cpp.RawConstPointer<B3ShapeProxyNative>):Bool;
	@:native("b3RayCastSphere")
	public static function rayCastSphere(shape:cpp.RawConstPointer<B3SphereNative>, input:cpp.RawConstPointer<B3RayCastInputNative>):B3CastOutputNative;
	@:native("b3RayCastHollowSphere")
	public static function rayCastHollowSphere(shape:cpp.RawConstPointer<B3SphereNative>, input:cpp.RawConstPointer<B3RayCastInputNative>):B3CastOutputNative;
	@:native("b3RayCastCapsule")
	public static function rayCastCapsule(shape:cpp.RawConstPointer<B3CapsuleNative>, input:cpp.RawConstPointer<B3RayCastInputNative>):B3CastOutputNative;
	@:native("b3RayCastCompound")
	public static function rayCastCompound(shape:cpp.RawConstPointer<B3CompoundDataNative>, input:cpp.RawConstPointer<B3RayCastInputNative>):B3CastOutputNative;
	@:native("b3RayCastHull")
	public static function rayCastHull(shape:cpp.RawConstPointer<B3HullDataNative>, input:cpp.RawConstPointer<B3RayCastInputNative>):B3CastOutputNative;
	@:native("b3RayCastMesh")
	public static function rayCastMesh(shape:cpp.RawConstPointer<B3MeshNative>, input:cpp.RawConstPointer<B3RayCastInputNative>):B3CastOutputNative;
	@:native("b3RayCastHeightField")
	public static function rayCastHeightField(shape:cpp.RawConstPointer<B3HeightFieldDataNative>, input:cpp.RawConstPointer<B3RayCastInputNative>):B3CastOutputNative;
	@:native("b3ShapeCastSphere")
	public static function shapeCastSphere(shape:cpp.RawConstPointer<B3SphereNative>, input:cpp.RawConstPointer<B3ShapeCastInputNative>):B3CastOutputNative;
	@:native("b3ShapeCastCapsule")
	public static function shapeCastCapsule(shape:cpp.RawConstPointer<B3CapsuleNative>, input:cpp.RawConstPointer<B3ShapeCastInputNative>):B3CastOutputNative;
	@:native("b3ShapeCastCompound")
	public static function shapeCastCompound(shape:cpp.RawConstPointer<B3CompoundDataNative>, input:cpp.RawConstPointer<B3ShapeCastInputNative>):B3CastOutputNative;
	@:native("b3ShapeCastHull")
	public static function shapeCastHull(shape:cpp.RawConstPointer<B3HullDataNative>, input:cpp.RawConstPointer<B3ShapeCastInputNative>):B3CastOutputNative;
	@:native("b3ShapeCastMesh")
	public static function shapeCastMesh(shape:cpp.RawConstPointer<B3MeshNative>, input:cpp.RawConstPointer<B3ShapeCastInputNative>):B3CastOutputNative;
	@:native("b3ShapeCastHeightField")
	public static function shapeCastHeightField(shape:cpp.RawConstPointer<B3HeightFieldDataNative>, input:cpp.RawConstPointer<B3ShapeCastInputNative>):B3CastOutputNative;
	@:native("b3QueryMesh")
	public static function queryMesh(mesh:cpp.RawConstPointer<B3MeshNative>, bounds:cpp.RawConstPointer<B3AABBNative>, fcn:B3MeshQueryFcn, context:cpp.RawPointer<Void>):Void;
	@:native("b3QueryHeightField")
	public static function queryHeightField(heightField:cpp.RawConstPointer<B3HeightFieldDataNative>, bounds:B3AABBNative, fcn:B3MeshQueryFcn, context:cpp.RawPointer<Void>):Void;
	@:native("b3ShapeDistance")
	public static function shapeDistance(input:cpp.RawConstPointer<B3DistanceInputNative>, cache:cpp.RawPointer<B3SimplexCacheNative>, simplexes:cpp.RawPointer<B3SimplexNative>, simplexCapacity:Int):B3DistanceOutputNative;
	@:native("b3ShapeCast")
	public static function shapeCast(input:cpp.RawConstPointer<B3ShapeCastPairInputNative>):B3CastOutputNative;
	@:native("b3GetSweepTransform")
	public static function getSweepTransform(sweep:cpp.RawConstPointer<B3SweepNative>, time:cpp.Float32):B3TransformNative;
	@:native("b3TimeOfImpact")
	public static function timeOfImpact(input:cpp.RawConstPointer<B3TOIInputNative>):B3TOIOutputNative;
	@:native("b3CollideSpheres")
	public static function collideSpheres(manifold:cpp.RawPointer<B3LocalManifoldNative>, capacity:Int, sphereA:cpp.RawConstPointer<B3SphereNative>, sphereB:cpp.RawConstPointer<B3SphereNative>, transformBtoA:B3TransformNative):Void;
	@:native("b3CollideCapsuleAndSphere")
	public static function collideCapsuleAndSphere(manifold:cpp.RawPointer<B3LocalManifoldNative>, capacity:Int, capsuleA:cpp.RawConstPointer<B3CapsuleNative>, sphereB:cpp.RawConstPointer<B3SphereNative>, transformBtoA:B3TransformNative):Void;
	@:native("b3CollideHullAndSphere")
	public static function collideHullAndSphere(manifold:cpp.RawPointer<B3LocalManifoldNative>, capacity:Int, hullA:cpp.RawConstPointer<B3HullDataNative>, sphereB:cpp.RawConstPointer<B3SphereNative>, transformBtoA:B3TransformNative, cache:cpp.RawPointer<B3SimplexCacheNative>):Void;
	@:native("b3CollideCapsules")
	public static function collideCapsules(manifold:cpp.RawPointer<B3LocalManifoldNative>, capacity:Int, capsuleA:cpp.RawConstPointer<B3CapsuleNative>, capsuleB:cpp.RawConstPointer<B3CapsuleNative>, transformBtoA:B3TransformNative):Void;
	@:native("b3CollideHullAndCapsule")
	public static function collideHullAndCapsule(manifold:cpp.RawPointer<B3LocalManifoldNative>, capacity:Int, hullA:cpp.RawConstPointer<B3HullDataNative>, capsuleB:cpp.RawConstPointer<B3CapsuleNative>, transformBtoA:B3TransformNative, cache:cpp.RawPointer<B3SimplexCacheNative>):Void;
	@:native("b3CollideHulls")
	public static function collideHulls(manifold:cpp.RawPointer<B3LocalManifoldNative>, capacity:Int, hullA:cpp.RawConstPointer<B3HullDataNative>, hullB:cpp.RawConstPointer<B3HullDataNative>, transformBtoA:B3TransformNative, cache:cpp.RawPointer<B3SATCacheNative>):Void;
	@:native("b3CollideTriangleAndCapsule")
	public static function collideTriangleAndCapsule(manifold:cpp.RawPointer<B3LocalManifoldNative>, capacity:Int, triangleA:cpp.RawConstPointer<B3Vec3Native>, capsuleB:cpp.RawConstPointer<B3CapsuleNative>, cache:cpp.RawPointer<B3SimplexCacheNative>):Void;
	@:native("b3CollideTriangleAndHull")
	public static function collideTriangleAndHull(manifold:cpp.RawPointer<B3LocalManifoldNative>, capacity:Int, v1:B3Vec3Native, v2:B3Vec3Native, v3:B3Vec3Native, triangleFlags:Int, hullB:cpp.RawConstPointer<B3HullDataNative>, cache:cpp.RawPointer<B3SATCacheNative>, enableSpeculative:Bool):Void;
	@:native("b3CollideTriangleAndSphere")
	public static function collideTriangleAndSphere(manifold:cpp.RawPointer<B3LocalManifoldNative>, capacity:Int, triangleA:cpp.RawConstPointer<B3Vec3Native>, sphereB:cpp.RawConstPointer<B3SphereNative>):Void;
	@:native("b3SolvePlanes")
	public static function solvePlanes(targetDelta:B3Vec3Native, planes:cpp.RawPointer<B3CollisionPlaneNative>, count:Int):B3PlaneSolverResultNative;
	@:native("b3ClipVector")
	public static function clipVector(vector:B3Vec3Native, planes:cpp.RawConstPointer<B3CollisionPlaneNative>, count:Int):B3Vec3Native;
	@:native("b3DynamicTree_GetUserData")
	public static function dynamicTree_GetUserData(tree:cpp.RawConstPointer<B3DynamicTreeNative>, proxyId:Int):cpp.UInt64;
	@:native("b3DynamicTree_GetAABB")
	public static function dynamicTree_GetAABB(tree:cpp.RawConstPointer<B3DynamicTreeNative>, proxyId:Int):B3AABBNative;
	@:native("b3GetHullVertices")
	public static function getHullVertices(hull:cpp.RawConstPointer<B3HullDataNative>):cpp.RawConstPointer<B3HullVertexNative>;
	@:native("b3GetHullPoints")
	public static function getHullPoints(hull:cpp.RawConstPointer<B3HullDataNative>):cpp.RawConstPointer<B3Vec3Native>;
	@:native("b3GetHullEdges")
	public static function getHullEdges(hull:cpp.RawConstPointer<B3HullDataNative>):cpp.RawConstPointer<B3HullHalfEdgeNative>;
	@:native("b3GetHullPlanes")
	public static function getHullPlanes(hull:cpp.RawConstPointer<B3HullDataNative>):cpp.RawConstPointer<B3PlaneNative>;
	@:native("b3GetHullFaces")
	public static function getHullFaces(hull:cpp.RawConstPointer<B3HullDataNative>):cpp.RawConstPointer<B3HullFaceNative>;
	@:native("b3GetHullSoaVertices")
	public static function getHullSoaVertices(hull:cpp.RawConstPointer<B3HullDataNative>):cpp.RawConstPointer<cpp.Float32>;
	@:native("b3GetHullSoaNormals")
	public static function getHullSoaNormals(hull:cpp.RawConstPointer<B3HullDataNative>):cpp.RawConstPointer<cpp.Float32>;
	@:native("b3GetMeshVertices")
	public static function getMeshVertices(mesh:cpp.RawConstPointer<B3MeshDataNative>):cpp.RawConstPointer<B3Vec3Native>;
	@:native("b3GetMeshTriangles")
	public static function getMeshTriangles(mesh:cpp.RawConstPointer<B3MeshDataNative>):cpp.RawConstPointer<B3MeshTriangleNative>;
	@:native("b3GetMeshMaterialIndices")
	public static function getMeshMaterialIndices(mesh:cpp.RawConstPointer<B3MeshDataNative>):cpp.RawConstPointer<cpp.UInt8>;
	@:native("b3GetMeshFlags")
	public static function getMeshFlags(mesh:cpp.RawConstPointer<B3MeshDataNative>):cpp.RawConstPointer<cpp.UInt8>;
	@:native("b3GetHeightFieldCompressedHeights")
	public static function getHeightFieldCompressedHeights(hf:cpp.RawConstPointer<B3HeightFieldDataNative>):cpp.RawConstPointer<cpp.UInt16>;
	@:native("b3GetHeightFieldMaterialIndices")
	public static function getHeightFieldMaterialIndices(hf:cpp.RawConstPointer<B3HeightFieldDataNative>):cpp.RawConstPointer<cpp.UInt8>;
	@:native("b3GetHeightFieldFlags")
	public static function getHeightFieldFlags(hf:cpp.RawConstPointer<B3HeightFieldDataNative>):cpp.RawConstPointer<cpp.UInt8>;
	@:native("b3Atan2")
	public static function atan2(y:cpp.Float32, x:cpp.Float32):cpp.Float32;
	@:native("b3ComputeCosSin")
	public static function computeCosSin(radians:cpp.Float32):B3CosSinNative;
	@:native("b3MakeQuatFromMatrix")
	public static function makeQuatFromMatrix(m:cpp.RawConstPointer<B3Matrix3Native>):B3QuatNative;
	@:native("b3ComputeQuatBetweenUnitVectors")
	public static function computeQuatBetweenUnitVectors(v1:B3Vec3Native, v2:B3Vec3Native):B3QuatNative;
	@:native("b3Steiner")
	public static function steiner(mass:cpp.Float32, origin:B3Vec3Native):B3Matrix3Native;
	@:native("b3PointToSegmentDistance")
	public static function pointToSegmentDistance(a:B3Vec3Native, b:B3Vec3Native, q:B3Vec3Native):B3Vec3Native;
	@:native("b3LineDistance")
	public static function lineDistance(p1:B3Vec3Native, d1:B3Vec3Native, p2:B3Vec3Native, d2:B3Vec3Native):B3SegmentDistanceResultNative;
	@:native("b3SegmentDistance")
	public static function segmentDistance(p1:B3Vec3Native, q1:B3Vec3Native, p2:B3Vec3Native, q2:B3Vec3Native):B3SegmentDistanceResultNative;
	@:native("b3IsValidFloat")
	public static function isValidFloat(a:cpp.Float32):Bool;
	@:native("b3IsValidVec3")
	public static function isValidVec3(a:B3Vec3Native):Bool;
	@:native("b3IsValidQuat")
	public static function isValidQuat(q:B3QuatNative):Bool;
	@:native("b3IsValidTransform")
	public static function isValidTransform(a:B3TransformNative):Bool;
	@:native("b3IsValidMatrix3")
	public static function isValidMatrix3(a:B3Matrix3Native):Bool;
	@:native("b3IsValidAABB")
	public static function isValidAABB(a:B3AABBNative):Bool;
	@:native("b3IsBoundedAABB")
	public static function isBoundedAABB(a:B3AABBNative):Bool;
	@:native("b3IsSaneAABB")
	public static function isSaneAABB(a:B3AABBNative):Bool;
	@:native("b3IsValidPlane")
	public static function isValidPlane(a:B3PlaneNative):Bool;
	@:native("b3IsValidPosition")
	public static function isValidPosition(p:B3PosNative):Bool;
	@:native("b3IsValidWorldTransform")
	public static function isValidWorldTransform(t:B3WorldTransformNative):Bool;
	@:native("b3MinInt")
	public static function minInt(a:Int, b:Int):Int;
	@:native("b3MaxInt")
	public static function maxInt(a:Int, b:Int):Int;
	@:native("b3ClampInt")
	public static function clampInt(a:Int, lower:Int, upper:Int):Int;
	@:native("b3AbsFloat")
	public static function absFloat(a:cpp.Float32):cpp.Float32;
	@:native("b3MinFloat")
	public static function minFloat(a:cpp.Float32, b:cpp.Float32):cpp.Float32;
	@:native("b3MaxFloat")
	public static function maxFloat(a:cpp.Float32, b:cpp.Float32):cpp.Float32;
	@:native("b3ClampFloat")
	public static function clampFloat(a:cpp.Float32, lower:cpp.Float32, upper:cpp.Float32):cpp.Float32;
	@:native("b3LerpFloat")
	public static function lerpFloat(a:cpp.Float32, b:cpp.Float32, alpha:cpp.Float32):cpp.Float32;
	@:native("b3Sin")
	public static function sin(radians:cpp.Float32):cpp.Float32;
	@:native("b3Cos")
	public static function cos(radians:cpp.Float32):cpp.Float32;
	@:native("b3UnwindAngle")
	public static function unwindAngle(radians:cpp.Float32):cpp.Float32;
	@:native("b3Add")
	public static function add(a:B3Vec3Native, b:B3Vec3Native):B3Vec3Native;
	@:native("b3Sub")
	public static function sub(a:B3Vec3Native, b:B3Vec3Native):B3Vec3Native;
	@:native("b3Mul")
	public static function mul(a:B3Vec3Native, b:B3Vec3Native):B3Vec3Native;
	@:native("b3Neg")
	public static function neg(a:B3Vec3Native):B3Vec3Native;
	@:native("b3Dot")
	public static function dot(a:B3Vec3Native, b:B3Vec3Native):cpp.Float32;
	@:native("b3Length")
	public static function length(v:B3Vec3Native):cpp.Float32;
	@:native("b3LengthSquared")
	public static function lengthSquared(a:B3Vec3Native):cpp.Float32;
	@:native("b3Distance")
	public static function distance(a:B3Vec3Native, b:B3Vec3Native):cpp.Float32;
	@:native("b3DistanceSquared")
	public static function distanceSquared(a:B3Vec3Native, b:B3Vec3Native):cpp.Float32;
	@:native("b3GetLengthAndNormalize")
	public static function getLengthAndNormalize(length:cpp.RawPointer<cpp.Float32>, a:B3Vec3Native):B3Vec3Native;
	@:native("b3Perp")
	public static function perp(a:B3Vec3Native):B3Vec3Native;
	@:native("b3IsNormalized")
	public static function isNormalized(a:B3Vec3Native):Bool;
	@:native("b3MulAdd")
	public static function mulAdd(a:B3Vec3Native, s:cpp.Float32, b:B3Vec3Native):B3Vec3Native;
	@:native("b3MulSub")
	public static function mulSub(a:B3Vec3Native, s:cpp.Float32, b:B3Vec3Native):B3Vec3Native;
	@:native("b3MulSV")
	public static function mulSV(s:cpp.Float32, a:B3Vec3Native):B3Vec3Native;
	@:native("b3Cross")
	public static function cross(a:B3Vec3Native, b:B3Vec3Native):B3Vec3Native;
	@:native("b3Lerp")
	public static function lerp(a:B3Vec3Native, b:B3Vec3Native, alpha:cpp.Float32):B3Vec3Native;
	@:native("b3Blend2")
	public static function blend2(s:cpp.Float32, a:B3Vec3Native, t:cpp.Float32, b:B3Vec3Native):B3Vec3Native;
	@:native("b3Abs")
	public static function abs(a:B3Vec3Native):B3Vec3Native;
	@:native("b3Sign")
	public static function sign(a:B3Vec3Native):B3Vec3Native;
	@:native("b3Min")
	public static function min(a:B3Vec3Native, b:B3Vec3Native):B3Vec3Native;
	@:native("b3Max")
	public static function max(a:B3Vec3Native, b:B3Vec3Native):B3Vec3Native;
	@:native("b3Clamp")
	public static function clamp(a:B3Vec3Native, lower:B3Vec3Native, upper:B3Vec3Native):B3Vec3Native;
	@:native("b3SafeScale")
	public static function safeScale(a:B3Vec3Native):B3Vec3Native;
	@:native("b3IsNormalizedQuat")
	public static function isNormalizedQuat(q:B3QuatNative):Bool;
	@:native("b3RotateVector")
	public static function rotateVector(q:B3QuatNative, v:B3Vec3Native):B3Vec3Native;
	@:native("b3InvRotateVector")
	public static function invRotateVector(q:B3QuatNative, v:B3Vec3Native):B3Vec3Native;
	@:native("b3DotQuat")
	public static function dotQuat(a:B3QuatNative, b:B3QuatNative):cpp.Float32;
	@:native("b3MulQuat")
	public static function mulQuat(q1:B3QuatNative, q2:B3QuatNative):B3QuatNative;
	@:native("b3InvMulQuat")
	public static function invMulQuat(q1:B3QuatNative, q2:B3QuatNative):B3QuatNative;
	@:native("b3Conjugate")
	public static function conjugate(q:B3QuatNative):B3QuatNative;
	@:native("b3NegateQuat")
	public static function negateQuat(q:B3QuatNative):B3QuatNative;
	@:native("b3NormalizeQuat")
	public static function normalizeQuat(q:B3QuatNative):B3QuatNative;
	@:native("b3MakeQuatFromAxisAngle")
	public static function makeQuatFromAxisAngle(axis:B3Vec3Native, radians:cpp.Float32):B3QuatNative;
	@:native("b3GetAxisAngle")
	public static function getAxisAngle(radians:cpp.RawPointer<cpp.Float32>, q:B3QuatNative):B3Vec3Native;
	@:native("b3GetQuatAngle")
	public static function getQuatAngle(q:B3QuatNative):cpp.Float32;
	@:native("b3GetTwistAngle")
	public static function getTwistAngle(q:B3QuatNative):cpp.Float32;
	@:native("b3NLerp")
	public static function nLerp(q1:B3QuatNative, q2:B3QuatNative, alpha:cpp.Float32):B3QuatNative;
	@:native("b3MulTransforms")
	public static function mulTransforms(a:B3TransformNative, b:B3TransformNative):B3TransformNative;
	@:native("b3InvertTransform")
	public static function invertTransform(t:B3TransformNative):B3TransformNative;
	@:native("b3InvTransformPoint")
	public static function invTransformPoint(t:B3TransformNative, v:B3Vec3Native):B3Vec3Native;
	@:native("b3ToPos")
	public static function toPos(v:B3Vec3Native):B3PosNative;
	@:native("b3ToVec3")
	public static function toVec3(p:B3PosNative):B3Vec3Native;
	@:native("b3RoundDownFloat")
	public static function roundDownFloat(x:Float):cpp.Float32;
	@:native("b3RoundUpFloat")
	public static function roundUpFloat(x:Float):cpp.Float32;
	@:native("b3SubPos")
	public static function subPos(a:B3PosNative, b:B3PosNative):B3Vec3Native;
	@:native("b3OffsetPos")
	public static function offsetPos(p:B3PosNative, d:B3Vec3Native):B3PosNative;
	@:native("b3LerpPosition")
	public static function lerpPosition(a:B3PosNative, b:B3PosNative, t:cpp.Float32):B3PosNative;
	@:native("b3TransformWorldPoint")
	public static function transformWorldPoint(t:B3WorldTransformNative, p:B3Vec3Native):B3PosNative;
	@:native("b3InvTransformWorldPoint")
	public static function invTransformWorldPoint(t:B3WorldTransformNative, p:B3PosNative):B3Vec3Native;
	@:native("b3ToRelativeTransform")
	public static function toRelativeTransform(t:B3WorldTransformNative, base:B3PosNative):B3TransformNative;
	@:native("b3MakeWorldTransform")
	public static function makeWorldTransform(t:B3TransformNative):B3WorldTransformNative;
	@:native("b3OffsetAABB")
	public static function offsetAABB(localBox:B3AABBNative, origin:B3PosNative):B3AABBNative;
	@:native("b3Det")
	public static function det(m:B3Matrix3Native):cpp.Float32;
	@:native("b3MulMV")
	public static function mulMV(m:B3Matrix3Native, a:B3Vec3Native):B3Vec3Native;
	@:native("b3NegateMat3")
	public static function negateMat3(a:B3Matrix3Native):B3Matrix3Native;
	@:native("b3AddMM")
	public static function addMM(a:B3Matrix3Native, b:B3Matrix3Native):B3Matrix3Native;
	@:native("b3SubMM")
	public static function subMM(a:B3Matrix3Native, b:B3Matrix3Native):B3Matrix3Native;
	@:native("b3MulSM")
	public static function mulSM(s:cpp.Float32, a:B3Matrix3Native):B3Matrix3Native;
	@:native("b3MulMM")
	public static function mulMM(a:B3Matrix3Native, b:B3Matrix3Native):B3Matrix3Native;
	@:native("b3Transpose")
	public static function transpose(m:B3Matrix3Native):B3Matrix3Native;
	@:native("b3InvertMatrix")
	public static function invertMatrix(m:B3Matrix3Native):B3Matrix3Native;
	@:native("b3InvertT")
	public static function invertT(m:B3Matrix3Native):B3Matrix3Native;
	@:native("b3AbsMatrix3")
	public static function absMatrix3(m:B3Matrix3Native):B3Matrix3Native;
	@:native("b3MakeAABB")
	public static function makeAABB(points:cpp.RawConstPointer<B3Vec3Native>, count:Int, radius:cpp.Float32):B3AABBNative;
	@:native("b3AABB_Contains")
	public static function aABB_Contains(a:B3AABBNative, b:B3AABBNative):Bool;
	@:native("b3AABB_Area")
	public static function aABB_Area(a:B3AABBNative):cpp.Float32;
	@:native("b3AABB_Center")
	public static function aABB_Center(a:B3AABBNative):B3Vec3Native;
	@:native("b3AABB_Extents")
	public static function aABB_Extents(a:B3AABBNative):B3Vec3Native;
	@:native("b3AABB_Union")
	public static function aABB_Union(a:B3AABBNative, b:B3AABBNative):B3AABBNative;
	@:native("b3AABB_Inflate")
	public static function aABB_Inflate(a:B3AABBNative, extension:cpp.Float32):B3AABBNative;
	@:native("b3AABB_Overlaps")
	public static function aABB_Overlaps(a:B3AABBNative, b:B3AABBNative):Bool;
	@:native("b3ClosestPointToAABB")
	public static function closestPointToAABB(point:B3Vec3Native, a:B3AABBNative):B3Vec3Native;
}