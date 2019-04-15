self: super:
{
  pythonToolsEnv = super.buildEnv {
    name = "pythonTools";
    paths = [
      self.python2
      self.python3
      # self.pipenv # Pending https://github.com/NixOS/nixpkgs/issues/51034
      self.python3Packages.pip
    ];
  };
}
