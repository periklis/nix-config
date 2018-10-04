self: super:
{
  gcloudToolsEnv = super.buildEnv {
    name = "gcloudTools";
    paths = [
      self.heptio-ark
      self.jq
      self.kubectx
      self.kubernetes
      self.minikube
      self.netcat
      self.google-cloud-sdk
      self.packer
    ];
    extraOutputsToInstall = [ "doc" "info ""man" ];
  };
}
