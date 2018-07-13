self: super:
{
  pythonToolsEnv = super.buildEnv {
    name = "pythonTools";
    paths = [
      self.python3
      self.pipenv
      # self.python3Packages.autopep8
      # self.python3Packages.elpy
      # self.python3Packages.flake8
      # self.python3Packages.ipython
      # self.python3Packages.jedi
      self.python3Packages.pip
      # self.python3Packages.service_factory
      # self.python3Packages.setuptools
    ];
    extraOutputsToInstall = [ "man" "doc" ];
  };
}
