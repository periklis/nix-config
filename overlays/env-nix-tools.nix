self: super:
{
  nixToolsEnv = super.buildEnv {
    name = "nixTools";
    paths = [
      self.nixops
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
      # self.vulnix
      self.nix-delegate
      self.nix-deploy
      self.nix-diff
    ];
  };
}
