self: super:
{
  gitMinimalWithManual = super.gitMinimal.override {
    withManual = true;
  };

  gitToolsEnv = super.buildEnv {
    name = "gitTools";
    paths = [
      self.gitMinimalWithManual
      self.gitAndTools.git-extras
      self.patch
      self.patchutils
    ];
    extraOutputsToInstall = [ "man" "doc" ];
  };
}
