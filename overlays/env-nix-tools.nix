self: super:
{
  nixToolsEnv = super.buildEnv {
    name = "nixTools";
    paths = [
      self.nix-prefetch-git
      self.nix-prefetch-github
    ];
  };

  nixUtilitiesEnv = super.buildEnv {
    name = "nixUtilities";
    paths = [
      self.nix-index
      self.nix-review
      self.nix-top
      self.nix-delegate
      self.nix-deploy
      self.nix-diff
    ];
  };
}
