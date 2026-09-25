# linc_box3d
Haxe/Hxcpp @:native bindings for [Box3D](https://github.com/erincatto/box3d)

![Example image](https://github.com/TheZoroForce240/linc_box3d/blob/main/test/flixel-foxlite/screenshot.png)

## Installation

Install haxelib:
```haxelib git linc_box3d https://github.com/TheZoroForce240/linc_box3d```

In Project.xml (if openfl)
```xml
<haxelib name="linc_box3d" />
```

## Example

See [here](https://github.com/TheZoroForce240/linc_box3d/blob/main/test/flixel-foxlite/source/PlayState.hx) for a full example

```haxe
import box3d.Box3D;

class Test {
    static function main() {
        var version = Box3D.getVersion();
        trace("Box3D");
        trace(version.major, version.minor, version.revision);
  
        var worldDef:B3WorldDef = Box3D.defaultWorldDef();
        worldDef.gravity.y = -10;
        var worldId = Box3D.createWorld(worldDef);

        Box3D.destroyWorld(worldId);
    }
}
```

### Some quirks

Setting the type of a variable makes a big difference here with box3d structs, it uses an abstract that auto casts whenever needed, and casts the native struct into a haxe cpp.Struct type, which makes it possible to store in arrays.

```haxe
var worldDef:B3WorldDef = Box3D.defaultWorldDef(); //returns B3WorldDefNative but is casted automatically
worldDef.gravity.y = -10;
worldId = Box3D.createWorld(worldDef); //auto casts into a pointer
```

```haxe
var worldDef = Box3D.defaultWorldDef();
worldDef.gravity.y = -10;
worldId = Box3D.createWorld(worldDef.toPointer()); //have to manually cast because its currently a B3WorldDefNative
```
There is a small advantage to leaving it as native since it will be directly stack allocated and no casting is used, which works well for temp variables.

##

Callbacks can currently only be created using cpp.Function.fromStaticFunction(), and only work with static functions
```haxe
public function new() {
    var worldDef:B3WorldDef = Box3D.defaultWorldDef();
    worldDef.frictionCallback = cpp.Function.fromStaticFunction(PlayState.frictionCallback);
    worldId = Box3D.createWorld(worldDef);
}

public static function frictionCallback(frictionA:cpp.Float32, materialA:cpp.UInt64, frictionB:cpp.Float32, materialB:cpp.UInt64):cpp.Float32 {
    return Math.sqrt(frictionA * frictionB); //should be same as original, just to show it works
}
```
