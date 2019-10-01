self: super:
{
  gcloudToolsEnv = super.buildEnv {
    name = "gcloudTools";
    paths = [
      self.jq
      self.kubectx
      self.packer
      self.stern
    ];
  };
}
