self: super:
{
  gitToolsEnv = super.buildEnv {
    name = "gitTools";
    paths = [
      self.gitMinimal
      self.gitAndTools.git-extras
      self.git-review
      self.patchutils
    ];
  };
}
