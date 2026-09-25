import box3d.Box3D;
function main() {
    Sys.println("Hello Box3D!");
    var version = Box3D.getVersion();
    Sys.println('Box3D version: ${version.major}.${version.minor}.${version.revision}');

    Sys.println("\nPress any button to continue.");
    Sys.getChar(false);
}