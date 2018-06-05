self: super:
{
  emscriptenToolsEnv = super.buildEnv {
    name = "emscriptenTools";
    paths = [
      self.emscripten
      self.yasm
    ];
    extraOutputsToInstall = [ "man" "doc" ];
  };
}
