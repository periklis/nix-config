self: super:
let
  emacsWithPkgs = self.emacsWithPackages
    (import ./emacs/packages.nix { epkgs = self.emacsPackages; });
in
{
  emacsToolsEnv = super.buildEnv {
    name = "emacsTools";
    paths = [
      emacsWithPkgs
      self.multimarkdown
      self.poppler
      self.haskellPackages.pandoc
    ];
  };
}
