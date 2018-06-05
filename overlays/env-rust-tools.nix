self: super:
{
  rustToolsEnv = super.buildEnv {
    name = "rustTools";
    paths = [
      self.rustup
      self.rustracer
    ];
    extraOutputsToInstall = [ "man" "doc" ];
  };
}
