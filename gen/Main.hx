
import haxe.io.Path;
import sys.io.File;
import sys.FileSystem;

using StringTools;

typedef CFuncDecl = {
    var name:String;
    var retType:String;
    var argTypes:Array<String>;
    var argNames:Array<String>;
};
typedef CStructDecl = {
    var name:String;
    var memberTypes:Array<String>;
    var memberNames:Array<String>;
    var memberArrayCount:Array<Int>;
    var ?constructorArgNames:Array<String>;
    var ?constructorArgTypes:Array<String>;
}
typedef CEnumDecl = {
    var name:String;
    var memberNames:Array<String>;
}

typedef Binding = {
    var hxDef:String;
}
var box3dPath = "../../lib/box3d/include/box3d/";
var filesToCheck:Array<String> = ["base.h", "types.h", "id.h", "box3d.h", "collision.h", "math_functions.h"];
//var filesToCheck:Array<String> = ["math_functions.h"];
var box3dFuncIdentifier:String = "\nB3_API";
var box3dInlineFuncIdentifier:String = "\nB3_INLINE";
var box3dStructIdentifier:String = "\ntypedef struct";
var box3dEnumIdentifier:String = "\ntypedef enum";

var headerFile = "linc_box3d.h";
var xmlName = "box3d";
var cppFuncPrefix = "box3d";
var mainHxClassName = "Box3D";
var defineMap:Map<String, Int> = [
    "B3_CONTACT_MANIFOLD_COUNT_BUCKETS" => 8,
    "B3_MAX_COMPOUND_MESH_MATERIALS" => 4,
    "B3_MAX_MANIFOLD_POINTS" => 4
];
var ignoredFuncs:Array<String> = [
    
    "b3SetAllocator",
    "b3SetAssertFcn",
    "b3InternalAssert",
    "b3SetLogFcn",

    "b3GetMeshNodes",
    /*
    "b3GetMillisecondsAndReset",
    "b3Hash",

    "b3GetAxisAngle",

    "b3GetGraphColor",
    "b3DefaultDebugDraw",
    "b3MakeDebugColor",

    "b3World_Draw",

    "b3World_DumpShapeBounds",

    "b3RecPlayer_GetKeyframeBudget",
    "b3RecPlayer_GetKeyframeBytes",
    */
];
var ignoredStructs:Array<String> = [
    "b3DebugDraw", 
    "b3MeshNode", //dont think we need this, not sure if hxcpp native supports unions like this struct

    "b3Vec3",
    "b3Transform",
    "b3Pos", 
    "b3WorldTransform", 
    "b3Matrix3",
    "b3CastOutput",
    "b3WorldCastOutput", 
];
var ignoredStructMembers:Map<String, Array<String>> = [
    "b3ContactData" => ["manifolds"]
];
var manualFuncs:Array<CFuncDecl> = [

];
var manualStructs:Array<CStructDecl> = [
    {name: "b3Vec3", memberTypes: ["float", "float", "float"], memberNames: ["x", "y", "z"], memberArrayCount: [1,1,1]},
    {name: "b3Transform", memberTypes: ["b3Pos", "b3Quat"], memberNames: ["p", "q"], memberArrayCount: [1,1]},
    {name: "b3Pos", memberTypes: ["float", "float", "float"], memberNames: ["x", "y", "z"], memberArrayCount: [1,1,1]},
    {name: "b3WorldTransform", memberTypes: ["b3Pos", "b3Quat"], memberNames: ["p", "q"], memberArrayCount: [1,1]},
    {name: "b3Matrix3", memberTypes: ["b3Vec3", "b3Vec3", "b3Vec3"], memberNames: ["cx", "cy", "cz"], memberArrayCount: [1,1,1]},
    {name: "b3WorldCastOutput", memberTypes: ["b3Vec3", "b3Vec3", "float", "int", "int", "int", "int", "bool"], memberNames: ["normal", "point", "fraction", "iterations", "triangleIndex", "childIndex", "materialIndex", "hit"], memberArrayCount: [1, 1, 1, 1, 1, 1, 1, 1]},
    {name: "b3CastOutput", memberTypes: ["b3Vec3", "b3Vec3", "float", "int", "int", "int", "int", "bool"], memberNames: ["normal", "point", "fraction", "iterations", "triangleIndex", "childIndex", "materialIndex", "hit"], memberArrayCount: [1, 1, 1, 1, 1, 1, 1, 1]},

    //swap out if double precision is enabled
    //{name: "b3Pos", memberTypes: ["double", "double", "double"], memberNames: ["x", "y", "z"], memberArrayCount: [1,1,1]},
    //{name: "b3WorldCastOutput", memberTypes: ["b3Vec3", "b3Pos", "float", "int", "int", "int", "int", "bool"], memberNames: ["normal", "point", "fraction", "iterations", "triangleIndex", "childIndex", "materialIndex", "hit"], memberArrayCount: [1, 1, 1, 1, 1, 1, 1, 1]},

    {name: "b3DebugDraw", memberTypes: [
        "b3DebugDrawDrawShapeFcn",
        "b3DebugDrawDrawSegmentFcn",
        "b3DebugDrawDrawTransformFcn",
        "b3DebugDrawDrawPointFcn",
        "b3DebugDrawDrawSphereFcn",
        "b3DebugDrawDrawCapsuleFcn",
        "b3DebugDrawDrawBoundsFcn",
        "b3DebugDrawDrawBoxFcn",
        "b3DebugDrawDrawStringFcn",
        "b3AABB",
        "float",
        "float",
        "bool",
        "bool",
        "bool",
        "bool",
        "bool",
        "bool",
        "bool",
        "bool",
        "bool",
        "bool",
        "bool",
        "bool",
        "bool",
        "bool",
        "void*",
    ], memberNames: [
        "DrawShapeFcn",
        "DrawSegmentFcn",
        "DrawTransformFcn",
        "DrawPointFcn",
        "DrawSphereFcn",
        "DrawCapsuleFcn",
        "DrawBoundsFcn",
        "DrawBoxFcn",
        "DrawStringFcn",
        "drawingBounds",
        "forceScale",
        "jointScale",
        "drawShapes",
        "drawJoints",
        "drawJointExtras",
        "drawBounds",
        "drawMass",
        "drawSleep",
        "drawBodyNames",
        "drawContacts",
        "drawAnchorA",
        "drawGraphColors",
        "drawContactFeatures",
        "drawContactNormals",
        "drawContactForces",
        "drawIslands",
        "context",
    ], memberArrayCount: [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]},
];

var structList:Array<String> = [];
var enumList:Array<String> = [];

var callbacks:Map<String, CFuncDecl> = [
    "b3TaskCallback" => {name: "b3TaskCallback", retType: "void", argNames: ["taskContext"], argTypes: ["void*"]},
    "b3EnqueueTaskCallback" => {name: "b3EnqueueTaskCallback", retType: "void*", argNames: ["task", "taskContext", "userContext", "taskName"], argTypes: ["b3TaskCallback*", "void*", "void*", "const char*"]},
    "b3FinishTaskCallback" => {name: "b3FinishTaskCallback", retType: "void", argNames: ["userTask", "userContext"], argTypes: ["void*", "void*"]},
    "b3CreateDebugShapeCallback" => {name: "b3CreateDebugShapeCallback", retType: "void*", argNames: ["debugShape", "userContext"], argTypes: ["const b3DebugShape*", "void*"]},
    "b3DestroyDebugShapeCallback" => {name: "b3DestroyDebugShapeCallback", retType: "void", argNames: ["userShape", "userContext"], argTypes: ["void*", "void*"]},
    "b3FrictionCallback" => {name: "b3FrictionCallback", retType: "float", argNames: ["frictionA", "userMaterialIdA", "frictionB", "userMaterialIdB"], argTypes: ["float", "uint64_t", "float", "uint64_t"]},
    "b3RestitutionCallback" => {name: "b3RestitutionCallback", retType: "float", argNames: ["restitutionA", "userMaterialIdA", "restitutionB", "userMaterialIdB"], argTypes: ["float", "uint64_t", "float", "uint64_t"]},
    "b3CustomFilterFcn" => {name: "b3CustomFilterFcn", retType: "bool", argNames: ["shapeIdA", "shapeIdB", "context"], argTypes: ["b3ShapeId", "b3ShapeId", "void*"]},
    "b3PreSolveFcn" => {name: "b3PreSolveFcn", retType: "bool", argNames: ["shapeIdA", "shapeIdB", "point", "normal", "context"], argTypes: ["b3ShapeId", "b3ShapeId", "b3Pos", "b3Vec3", "void*"]},
    "b3OverlapResultFcn" => {name: "b3OverlapResultFcn", retType: "bool", argNames: ["shapeId", "context"], argTypes: ["b3ShapeId", "void*"]},
    "b3CastResultFcn" => {name: "b3CastResultFcn", retType: "float", argNames: ["shapeId", "point", "normal", "fraction", "userMaterialId", "triangleIndex", "childIndex", "context"], argTypes: ["b3ShapeId", "b3Pos", "b3Vec3", "float", "uint64_t", "int", "int", "void*"]},
    "b3TreeQueryCallbackFcn" => {name: "b3TreeQueryCallbackFcn", retType: "bool", argNames: ["proxyId", "userData", "context"], argTypes: ["int", "uint64_t", "void*"]},
    "b3TreeQueryClosestCallbackFcn" => {name: "b3TreeQueryClosestCallbackFcn", retType: "float", argNames: ["distanceSqrMin", "proxyId", "userData", "context"], argTypes: ["float", "int", "uint64_t", "void*"]},
    "b3TreeBoxCastCallbackFcn" => {name: "b3TreeBoxCastCallbackFcn", retType: "float", argNames: ["input", "proxyId", "userData", "context"], argTypes: ["const b3BoxCastInput*", "int", "uint64_t", "void*"]},
    "b3TreeRayCastCallbackFcn" => {name: "b3TreeRayCastCallbackFcn", retType: "float", argNames: ["input", "proxyId", "userData", "context"], argTypes: ["const b3RayCastInput*", "int", "uint64_t", "void*"]},
    "b3PlaneResultFcn" => {name: "b3PlaneResultFcn", retType: "bool", argNames: ["shapeId", "plane", "planeCount", "context"], argTypes: ["b3ShapeId", "const b3PlaneResult*", "int", "void*"]},
    "b3MoverFilterFcn" => {name: "b3MoverFilterFcn", retType: "bool", argNames: ["shapeId", "context"], argTypes: ["b3ShapeId", "void*"]},
    "b3CompoundQueryFcn" => {name: "b3CompoundQueryFcn", retType: "bool", argNames: ["compound", "childIndex", "context"], argTypes: ["const b3CompoundData*", "int", "void*"]},
    "b3MeshQueryFcn" => {name: "b3MeshQueryFcn", retType: "bool", argNames: ["a", "b", "c", "triangleIndex", "context"], argTypes: ["b3Vec3", "b3Vec3", "b3Vec3", "int", "void*"]},


    "b3DebugDrawDrawShapeFcn" => {name: "b3DebugDrawDrawShapeFcn", retType: "void", argNames: ["userShape", "transform", "color", "context"], argTypes: ["void*", "b3WorldTransform", "b3HexColor", "void*"]},
    "b3DebugDrawDrawSegmentFcn" => {name: "b3DebugDrawDrawSegmentFcn", retType: "void", argNames: ["p1", "p2", "color", "context"], argTypes: ["b3Pos", "b3Pos", "b3HexColor", "void*"]},
    "b3DebugDrawDrawTransformFcn" => {name: "b3DebugDrawDrawTransformFcn", retType: "void", argNames: ["transform", "context"], argTypes: ["b3WorldTransform", "void*"]},
    "b3DebugDrawDrawPointFcn" => {name: "b3DebugDrawDrawPointFcn", retType: "void", argNames: ["p", "size", "color", "context"], argTypes: ["b3Pos", "float", "b3HexColor", "void*"]},
    "b3DebugDrawDrawSphereFcn" => {name: "b3DebugDrawDrawSphereFcn", retType: "void", argNames: ["p", "radius", "color", "alpha", "context"], argTypes: ["b3Pos", "float", "b3HexColor", "float", "void*"]},
    "b3DebugDrawDrawCapsuleFcn" => {name: "b3DebugDrawDrawCapsuleFcn", retType: "void", argNames: ["p1", "p2", "radius", "color", "alpha", "context"], argTypes: ["b3Pos", "b3Pos", "float", "b3HexColor", "float", "void*"]},
    "b3DebugDrawDrawBoundsFcn" => {name: "b3DebugDrawDrawBoundsFcn", retType: "void", argNames: ["aabb", "color", "context"], argTypes: ["b3AABB", "b3HexColor", "void*"]},
    "b3DebugDrawDrawBoxFcn" => {name: "b3DebugDrawDrawBoxFcn", retType: "void", argNames: ["extents", "transform", "color", "context"], argTypes: ["b3Vec3", "b3WorldTransform", "b3HexColor", "void*"]},
    "b3DebugDrawDrawStringFcn" => {name: "b3DebugDrawDrawStringFcn", retType: "void", argNames: ["p", "s", "color", "context"], argTypes: ["b3Pos", "const char*", "b3HexColor", "void*"]},
];
var opaqueStructs:Array<String> = [
    "b3Recording",
    "b3RecPlayer"
];

var haxeHeader:String = "package box3d;";
var haxeStructOutput:String = "";
var haxeFuncOutput:String = "";
var haxeEnumOutput:String = "";

function main() {

    haxeFuncOutput += '\n\n@:keep';
    haxeFuncOutput += '\n@:include("$headerFile")';
    haxeFuncOutput += '\n#if !display';
    haxeFuncOutput += '\n@:build(linc.Linc.touch())';
    haxeFuncOutput += '\n@:build(linc.Linc.xml("$xmlName"))';
    haxeFuncOutput += '\n#end';
    haxeFuncOutput += '\nextern class $mainHxClassName\n{';

    var funcs:Array<CFuncDecl> = [];
    var enums:Array<CEnumDecl> = [];
    var structs:Array<CStructDecl> = [];

    for (name in filesToCheck) {
        haxeHeader += "\n// " + name;
        var code:String = File.getContent(box3dPath + name);
        funcs = funcs.concat(gatherFunctionsInCode(code, box3dFuncIdentifier));
        funcs = funcs.concat(gatherFunctionsInCode(code, box3dInlineFuncIdentifier));
        structs = structs.concat(gatherStructsInCode(code));
        enums = enums.concat(gatherEnumsInCode(code));
    }

    for (struct in manualStructs) {
        structList.push(struct.name);
    }
    
    for (struct in manualStructs) {
        haxeStructOutput += "\n" + generateBindingsForStruct(struct).hxDef;
    }
    if (manualFuncs.length > 0) {
        haxeFuncOutput += "\n" + generateBindingsForFunctions(manualFuncs).hxDef;
    }

    for (struct in structs) {
        haxeStructOutput += "\n" + generateBindingsForStruct(struct).hxDef;
    }
    for (e in enums) {
        haxeEnumOutput += "\n" + generateBindingsForEnum(e).hxDef;
    }
    haxeFuncOutput += "\n" + generateBindingsForFunctions(funcs).hxDef;
    haxeFuncOutput += "\n}";

    haxeEnumOutput += generateBindingsForCallbacks().hxDef;
    for (o in opaqueStructs) {
        haxeEnumOutput += "\n" + generateBindingForOpaqueStruct(o).hxDef;
    }

    //File.saveContent("../output.cpp", cppHeader + cppStructOutput + cppFuncOutput);
    File.saveContent("../output.hx", haxeHeader + haxeStructOutput + haxeEnumOutput + haxeFuncOutput);
}

function gatherFunctionsInCode(code:String, ident:String):Array<CFuncDecl> {

    var funcs:Array<CFuncDecl> = [];
    
    var nextFuncSearchIndex:Int = 0;
    while(code.indexOf(ident, nextFuncSearchIndex) != -1) {
        var curFuncSearchIndex = code.indexOf(ident, nextFuncSearchIndex);
        
        var retTypeStart:Int = advanceCharIndexUntil(code, curFuncSearchIndex, " ")+1;
        var funcNameStart:Int = advanceCharIndexUntil(code, retTypeStart, " ")+1;
        var argsStart:Int = advanceCharIndexUntil(code, funcNameStart, "(")+1;
        var argsEnd:Int = advanceCharIndexUntil(code, argsStart, ")")+1;

        var retType:String = code.substring(retTypeStart, funcNameStart-1);
        if (retType == "const") {
            retTypeStart = advanceCharIndexUntil(code, retTypeStart, " ")+1;
            funcNameStart = advanceCharIndexUntil(code, retTypeStart, " ")+1;
            argsStart = advanceCharIndexUntil(code, funcNameStart, "(")+1;
            argsEnd = advanceCharIndexUntil(code, argsStart, ")")+1;
            retType = "const " + code.substring(retTypeStart, funcNameStart-1);
        }
        
        
        var funcName:String = code.substring(funcNameStart, argsStart-1);
        var argsRaw:String = code.substring(argsStart, argsEnd-1);

        if (ignoredFuncs.contains(funcName)) {
            haxeHeader += "\n// Skipped Function: " + retType + " " + funcName;
            nextFuncSearchIndex = curFuncSearchIndex+1;
            continue;
        }

        var decl:CFuncDecl = {
            name: funcName,
            retType: retType,
            argNames: [],
            argTypes: []
        };

        var argsSplit = argsRaw.split(",");
        for (arg in argsSplit) {
            var formatted = arg.trim();
            if (formatted == "void" || formatted == "") continue;
            
            var lastSpace:Int = formatted.lastIndexOf(" ");
            var type:String = formatted.substring(0, lastSpace);
            var name:String = formatted.substring(lastSpace+1);
            decl.argTypes.push(type);
            decl.argNames.push(name);
        }
        funcs.push(decl);
        nextFuncSearchIndex = curFuncSearchIndex+1;
    }

    return funcs;
}

inline function advanceCharIndexUntil(code:String, index:Int, val:String) {
    var ret:Int = code.length;
    while(true) {
        if (index > code.length-1) break;
        var char = code.charAt(index);
        if (char == val) {
            ret = index;
            break;
        }
        index++;
    }
    return ret;
}

function gatherStructsInCode(code:String):Array<CStructDecl> {

    var structs:Array<CStructDecl> = [];
    
    var nextSearchIndex:Int = 0;
    while(code.indexOf(box3dStructIdentifier, nextSearchIndex) != -1) {
        var curSearchIndex:Int = code.indexOf(box3dStructIdentifier, nextSearchIndex);

        var defEnd:Int = advanceCharIndexUntil(code, curSearchIndex+1, "\n")+1;
        var def:String = code.substring(curSearchIndex+1, defEnd-1);
        var defSplit = def.split(" ");

        if (defSplit.length == 3) {

        } else if (defSplit.length == 2) {

        } else {
            nextSearchIndex = curSearchIndex+1;
            continue;
        }
        var membersEnd = code.indexOf("\n}", defEnd+1);
        var membersRaw:String = code.substring(defEnd, membersEnd-2).trim();
        var membersSplit = membersRaw.split(";");
        var structName:String = "";
        if (defSplit.length == 2) {
            structName = code.substring(membersEnd+2, code.indexOf(";", membersEnd)).trim();
        } else {
            structName = defSplit[2].trim();
        }
        if (ignoredStructs.contains(structName)) {
            var logSkip = true;
            for (m in manualStructs) if (m.name == structName) logSkip = false;
            if (logSkip) haxeHeader += "\n// Skipped Struct: " + structName;
            nextSearchIndex = curSearchIndex+1;
            continue;
        }
        
        var decl:CStructDecl = {
            name: structName,
            memberTypes: [],
            memberNames: [],
            memberArrayCount: []
        };
        
        for (m in membersSplit) {
            if (!m.contains("\n")) continue;
            var splitNewLine = m.split("\n");
            var formatted = splitNewLine[splitNewLine.length-1].trim();
            if (formatted.startsWith("}") || formatted.startsWith("/")) continue;
            var lastSpace:Int = formatted.lastIndexOf(" ");
            var type:String = formatted.substring(0, lastSpace);
            var name:String = formatted.substring(lastSpace+1);
            var count:Int = 1;
            if (name.indexOf("[") != -1) { //arrays
                var countStr = name.substring(name.indexOf("[")+1, name.indexOf("]"));
                count = defineMap.exists(countStr) ? defineMap.get(countStr) : Std.parseInt(countStr);
                name = name.substring(0, name.indexOf("["));

                type = type + "*"; //force to pointer since its an array

                //haxeHeader += "\n// Skipped Struct member: " + type + "[" + count + "]" + " " + structName + "." + name;
                //continue;
            }
            //if (type != "const char*" && type.endsWith("*")) {
            //    haxeHeader += "\n// Skipped Struct member: " + structName + "." + name;
            //    continue;
            //}

            decl.memberTypes.push(type);
            decl.memberNames.push(name);
            decl.memberArrayCount.push(count);
        }
        structList.push(decl.name);
        structs.push(decl);
        nextSearchIndex = curSearchIndex+1;
    }

    return structs;
}

function gatherEnumsInCode(code:String):Array<CEnumDecl> {

    var enums:Array<CEnumDecl> = [];
    
    var nextSearchIndex:Int = 0;
    while(code.indexOf(box3dEnumIdentifier, nextSearchIndex) != -1) {
        var curSearchIndex:Int = code.indexOf(box3dEnumIdentifier, nextSearchIndex);

        var defEnd:Int = advanceCharIndexUntil(code, curSearchIndex+1, "\n")+1;
        var def:String = code.substring(curSearchIndex+1, defEnd-1);
        var defSplit = def.split(" ");

        if (defSplit.length == 3) {

        } else if (defSplit.length == 2) {

        } else {
            nextSearchIndex = curSearchIndex+1;
            continue;
        }
        var membersEnd = code.indexOf("\n}", defEnd+1);
        var membersRaw:String = code.substring(defEnd, membersEnd-1).trim();
        var membersSplit = membersRaw.split(",");
        var enumName:String = "";
        if (defSplit.length == 2) {
            enumName = code.substring(membersEnd+2, code.indexOf(";", membersEnd)).trim();
        } else {
            enumName = defSplit[2].trim();
        }
        
        var decl:CEnumDecl = {
            name: enumName,
            memberNames: []
        };

        //trace(enumName, membersSplit.length);
        
        for (m in membersSplit) {
            //if (!m.startsWith("\n")) continue;
            //trace(m);
            var splitNewLine = m.split("\n");
            //trace(splitNewLine);
            var formatted = splitNewLine[splitNewLine.length-1].trim();
            
            var splitSpace = formatted.split(" ");
            formatted = splitSpace[0];
            if (!formatted.startsWith("b3_")) continue;
            //trace(formatted);
            
            //var firstSpace:Int = formatted.indexOf(" ");
            //var name:String = formatted.substring(0, firstSpace);
            //trace(name);

            //decl.memberTypes.push(type);
            decl.memberNames.push(formatted);
            //decl.memberArrayCount.push(count);
        }
        enumList.push(decl.name);
        enums.push(decl);
        nextSearchIndex = curSearchIndex+1;
    }

    return enums;
}
function generateBindingsForStruct(struct:CStructDecl) {
    var binding:Binding = {
        hxDef: "",
    };

    
    var hxName = getHxName(struct.name);
    binding.hxDef += '\n@:keep @:structAccess @:include("$headerFile") @:native("${struct.name}")';
    binding.hxDef += '\nextern class ${hxName}Native {';
    for (i in 0...struct.memberTypes.length) {
        var n = struct.memberNames[i];
        var t = getHxArgType(struct.memberTypes[i]);
        binding.hxDef += '\n\tpublic var $n:$t;';
    }
    binding.hxDef += '\n\tpublic inline function toPointer():cpp.RawPointer<${hxName}Native> {';
    binding.hxDef += '\n\t\treturn cpp.RawPointer.addressOf(cast this);';
    binding.hxDef += '\n\t}';
    binding.hxDef += '\n}';
    binding.hxDef += '\n@:keep @:include("$headerFile") @:native("cpp.Reference<${struct.name}>")';
    binding.hxDef += '\nextern class ${hxName}Ref extends ${hxName}Native {}';
    binding.hxDef += '\n@:keep @:include("$headerFile") @:native("cpp.Struct<${struct.name}>")';
    binding.hxDef += '\nextern class ${hxName}Struct extends ${hxName}Ref {}';

    binding.hxDef += '\n';
    binding.hxDef += '\n@:forward() @:transitive';
    binding.hxDef += '\nabstract ${hxName}(${hxName}Struct) from ${hxName}Struct to ${hxName}Struct {';
    binding.hxDef += '\n\toverload extern public inline function new() { this = untyped __cpp__("${struct.name}()"); }';
    binding.hxDef += '\n\toverload extern public inline function new(v:${hxName}Struct) { this = v; }';
    binding.hxDef += '\n\toverload extern public inline function new(v:${hxName}Native) { this = cast v; }';
    binding.hxDef += '\n';
    binding.hxDef += '\n\t@:from @:noCompletion public static inline function fromNative(v:${hxName}Native):${hxName} { return new ${hxName}(v); }';
    binding.hxDef += '\n\t@:to @:noCompletion public static inline function toNative(v:${hxName}):${hxName}Native { return cast v; }';
    binding.hxDef += '\n\t@:from @:noCompletion public static inline function fromStruct(v:${hxName}Struct):${hxName} { return new ${hxName}(v); }';
    binding.hxDef += '\n\t@:to @:noCompletion public static inline function toStruct(v:${hxName}):${hxName}Struct { return cast v; }';
    binding.hxDef += '\n\t@:to @:noCompletion public static inline function autoToPointer(v:${hxName}):cpp.RawPointer<${hxName}Native> { return v.toPointer(); }';
    binding.hxDef += '\n';
    binding.hxDef += '\n\tpublic static inline function allocNativeArray(size:Int):cpp.Pointer<${hxName}Native> {';
    binding.hxDef += '\n\t\treturn size > 0 ? cast cpp.NativeGc.allocGcBytes(cpp.Stdlib.sizeof(${hxName}Native) * size) : null;';
    binding.hxDef += '\n\t}';
    binding.hxDef += '\n}';
    binding.hxDef += '\n';

    return binding;
}

function generateBindingsForFunctions(funcs:Array<CFuncDecl>) {
    var binding:Binding = {
        hxDef: "",
    };

  //  @:native("b3Add")
  //  public static function add(a:B3Vec3, a:B3Vec3):B3Vec3;

    for (func in funcs) {
        var hxName = getHxFuncName(func.name);
        var retHx = getHxArgType(func.retType);
        var args:String = "";
        for (i in 0...func.argNames.length) {
            var n = func.argNames[i];
            var t = getHxArgType(func.argTypes[i]);

            var suffix:String = i < func.argNames.length-1 ? ", " : "";
            args += '$n:$t$suffix';
        }

        binding.hxDef += '\n\t@:native("${func.name}")';
        binding.hxDef += '\n\tpublic static function $hxName($args):$retHx;';
    }
    return binding;
}

function generateBindingsForEnum(e:CEnumDecl) {
    var binding:Binding = {
        hxDef: "",
    };

    var hxName = getHxName(e.name);
    binding.hxDef += '\n@:keep @:include("$headerFile")\nextern enum abstract $hxName(Int) from Int to Int {';
    for (m in e.memberNames) {
        var memberHxName = m.substring(3, m.length);
        binding.hxDef += '\n\t@:native("$m") public static var $memberHxName:Int;';
    }
    binding.hxDef += '\n}';

    return binding;
}

function generateBindingsForCallbacks() {
    var binding:Binding = {
        hxDef: "",
    };

    for (name => callback in callbacks) {
        var hxName = getHxName(name);
        var ret = getHxArgType(callback.retType);
        //binding.hxDef += '\n@:keep @:include("$headerFile") @:native("$name")';
        //binding.hxDef += '\nextern class ${hxName} {}';

        var argsTypedef:String = "";
        var argsFunc:String = "";
        var argsCall:String = "";
        for (i in 0...callback.argNames.length) {
            var argName = callback.argNames[i];
            var hxArgType = getHxArgType(callback.argTypes[i]);

            var suffix = i < callback.argNames.length-1 ? ", " : "";

            argsTypedef += '$hxArgType -> ';
            argsFunc += '$argName:$hxArgType$suffix';
            argsCall += '$argName$suffix';
        }
        argsTypedef += ret;

        binding.hxDef += '\ntypedef ${hxName}Func = $argsTypedef;';
        binding.hxDef += '\ntypedef ${hxName} = cpp.Callable<${hxName}Func>;';

        /*
        binding.hxDef += '\nclass ${hxName}Wrapper {';
        binding.hxDef += '\n\tpublic static var currentCallback:${hxName}Func = null;';
        binding.hxDef += '\n\tpublic static function callback($argsFunc):$ret {';
        var doReturn = ret != "Void" ? "return " : "";
        binding.hxDef += '\n\t\t${doReturn}currentCallback($argsCall);';
        binding.hxDef += '\n\t}';
        binding.hxDef += '\n}';

        binding.hxDef += '\nabstract ${hxName}(${hxName}Func) from ${hxName}Func to ${hxName}Func {';
        binding.hxDef += '\n\tpublic inline function new(f:${hxName}Func) { this = f; }';
        binding.hxDef += '\n\t@:to @:noCompletion public static inline function toCallable(v:${hxName}Func):${hxName}Callable {';
        binding.hxDef += '\n\t\tif (v == null) return null;';
        binding.hxDef += '\n\t\t${hxName}Wrapper.currentCallback = v;';
        binding.hxDef += '\n\t\treturn cpp.Function.fromStaticFunction(${hxName}Wrapper.callback);';
        binding.hxDef += '\n\t}';
        binding.hxDef += '\n}\n';
        */
    }

    return binding;
}

function generateBindingForOpaqueStruct(name:String) {
    var binding:Binding = {
        hxDef: "",
    };
    var hxName = getHxName(name);
    binding.hxDef += '\n@:keep @:include("$headerFile") @:native("$name")';
    binding.hxDef += '\nextern class ${hxName} {}';
    return binding;
}

function getHxArgType(t:String) {
    if (t == "const char*") return "cpp.ConstCharStar";

    var isConst = t.startsWith("const ");
    var isPtr = t.endsWith("*");

    if (isConst) {
        t = t.substring(6, t.length);
    }
    if (isPtr) {
        t = t.substring(0, t.length-1);
    }
    if (t.startsWith("struct ")) {
        t = t.substring(7, t.length);
    }

    if (callbacks.exists(t)) {
        return getHxName(t);
    }

    var baseType = t;
    switch(t) {
        case "void": baseType = "Void";
        case "bool": baseType = "Bool";
        case "int64_t" | "size_t": baseType = "cpp.Int64";
        case "int" | "int32_t": baseType = "Int";
        case "int16_t": baseType = "cpp.Int16";
        case "int8_t": baseType = "cpp.Int8";
        case "uint64_t": baseType = "cpp.UInt64";
        case "uint" | "uint32_t": baseType = "cpp.UInt32";
        case "uint16_t": baseType = "cpp.UInt16";
        case "uint8_t": baseType = "cpp.UInt8";
        case "float": baseType = "cpp.Float32";
        case "double": baseType = "Float";
        case "const char*": baseType = "String";
        default: baseType = getHxName(t) + (structList.contains(t) ? "Native" : "");
    }
    if (isConst) {
        return 'cpp.RawConstPointer<$baseType>';
    } else if (isPtr) {
        return 'cpp.RawPointer<$baseType>';
    }

    return baseType;
}

function getHxName(cppName:String) {
    var str:String = "";
    for (i in 0...cppName.length) {
        var char:String = cppName.charAt(i);
        if (i == 0) {
            str += char.toUpperCase();
        } else {
            str += char;
        }
    }
    return str;
}

function getHxFuncName(cppName:String) {
    var str:String = "";
    for (i in 0...cppName.length) {
        var char:String = cppName.charAt(i);
        if (i < 2) {
            //str += char.toUpperCase();
        } else if (i == 2) {
            str += char.toLowerCase();
        } else {
            str += char;
        }
    }
    return str;
}
