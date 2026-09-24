package box3d;

class Box3DUtil {

    //https://community.haxe.org/t/reconstituting-a-cpp-rawpointer-of-a-haxe-dynamic-object-passed-into-c-and-then-later-returned-out-of-context/2513/5
    public static inline function toHxVoidPointer(c:Dynamic):cpp.RawPointer<Void> {
        return untyped __cpp__("{0}.GetPtr()", c);
    }
    public static inline function toHxDynamic(ptr:cpp.RawPointer<Void>):Dynamic {
        return untyped __cpp__("Dynamic(static_cast<hx::Object*>({0}))", ptr);
    }

    public static inline function allocNativeIntArray(size:Int):cpp.RawPointer<Int> {
        return size > 0 ? cast cpp.NativeGc.allocGcBytes(cpp.Stdlib.sizeof(Int) * size) : null;
    }
    public static inline function allocNativeUInt8Array(size:Int):cpp.RawPointer<cpp.UInt8> {
        return size > 0 ? cast cpp.NativeGc.allocGcBytes(cpp.Stdlib.sizeof(cpp.UInt8) * size) : null;
    }
    public static inline function allocNativeFloat32Array(size:Int):cpp.RawPointer<cpp.Float32> {
        return size > 0 ? cast cpp.NativeGc.allocGcBytes(cpp.Stdlib.sizeof(cpp.Float32) * size) : null;
    }
}