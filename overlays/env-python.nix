self: super:
{
  pythonToolsEnv = super.buildEnv {
    name = "pythonTools";
    paths = [
      self.python2
      self.python3
    ];
  };
}
