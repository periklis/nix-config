self: super:
{
  gcloudToolsEnv = super.buildEnv {
    name = "gcloudTools";
    paths = [
      self.heptio-ark
      self.kubectx
      self.kubernetes
      self.minikube
      self.google-cloud-sdk
    ];
    extraOutputsToInstall = [ "doc" "info ""man" ];
  };
}
