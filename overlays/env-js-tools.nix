self: super:
{
  jsToolsEnv = super.buildEnv {
    name = "jsTools";
    paths = [
      self.nodejs-10_x
      # self.nodePackages_8_x.eslint_d
      # self.nodePackages_8_x.import_js # Not yet packaged in master
      # self.nodePackages_8_x.prettier
      # self.nodePackages_8_x.reveal-md # Not yet packaged in master
      # self.nodePackages_8_x.tern
      # self.nodePackages_8_x.tern-jsx  # Not yet packaged in master
      # self.nodePackages_8_x.typescript
      # self.phantomjs2                 # Not yet packaged for darwin
      self.yarn
    ];
  };
}
