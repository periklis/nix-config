self: super:
{
  nixToolsEnv = super.buildEnv {
    name = "nixTools";
    paths = [
      self.nix
      self.nixops
      self.nix-prefetch-git
      self.nix-zsh-completions
    ];
    extraOutputsToInstall = [ "man" "doc" ];
      };

  nixUtilitiesEnv = super.buildEnv {
    name = "nixUtilities";
    paths = [
      self.nix-index
      # self.vulnix
      # self.haskellPackages.nix-delegate
      # self.haskellPackages.nix-deploy
      # self.haskellPackages.nix-diff
    ];
    extraOutputsToInstall = [ "man" "doc" ];
  };
}
