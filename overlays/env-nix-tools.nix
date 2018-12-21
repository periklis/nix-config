self: super:
{
  nixToolsEnv = super.buildEnv {
    name = "nixTools";
    paths = [
      #self.nix
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
      self.nix-index
      self.nix-review
      self.nix-top
      # self.vulnix # Pending https://github.com/NixOS/nixpkgs/issues/51016
      # self.nix-delegate
      #self.nix-deploy
      self.nix-diff
    ];
    extraOutputsToInstall = [ "man" "doc" ];
  };
}
