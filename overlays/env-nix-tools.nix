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
      # self.nix-index
      self.nix-review
      self.vulnix
      # self.nix-delegate
      self.nix-deploy
      self.nix-diff
    ];
    extraOutputsToInstall = [ "man" "doc" ];
  };
}
