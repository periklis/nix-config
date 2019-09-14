self: super:
{
  jsToolsEnv = super.buildEnv {
    name = "jsTools";
    paths = [
      self.nodejs-10_x
      self.yarn
    ];
  };
}
