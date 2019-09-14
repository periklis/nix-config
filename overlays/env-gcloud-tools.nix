self: super:
{
  gcloudToolsEnv = super.buildEnv {
    name = "gcloudTools";
    paths = [
      self.jq
      self.kubectx
      self.kustomize
      self.packer
      self.stern
      # self.vault
    ];
  };
}
