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
      # self.vulnix # Pending https://github.com/NixOS/nixpkgs/issues/51016
      # self.nix-delegate
      # self.nix-deploy
      self.nix-diff
    ];
  };
}
