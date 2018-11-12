self: super:
{
  nixToolsEnv = super.buildEnv {
    name = "nixTools";
    paths = [
      self.nix
      self.nixops
      self.nix-prefetch-git
      self.nix-prefetch-github
      self.nix-zsh-completions
    ];
    extraOutputsToInstall = [ "man" "doc" ];
  };

  nixUtilitiesEnv = super.buildEnv {
    name = "nixUtilities";
    paths = [
      # self.nix-index # Pending https://github.com/NixOS/nixpkgs/pull/49708
      self.nix-review
      self.nix-top
      self.vulnix
      self.nix-delegate
      self.nix-deploy
      self.nix-diff
    ];
    extraOutputsToInstall = [ "man" "doc" ];
  };
}
