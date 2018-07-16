self: super:
{
  pythonToolsEnv = super.buildEnv {
    name = "pythonTools";
    paths = [
      self.python3
      self.pipenv
      self.python3Packages.pip
    ];
    extraOutputsToInstall = [ "man" "doc" ];
  };
}
