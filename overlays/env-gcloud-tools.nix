self: super:
{
  gcloudToolsEnv = super.buildEnv {
    name = "gcloudTools";
    paths = [
      # self.heptio-ark # Disable for our cluster for now
      self.jq
      self.kubectx
      self.kubernetes
      self.kustomize
      self.minikube
      self.netcat
      self.google-cloud-sdk
      self.packer
    ];
    extraOutputsToInstall = [ "doc" "info ""man" ];
  };
}
