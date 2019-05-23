self: super:
{
  virtualizationToolsEnv = super.buildEnv {
    name = "virtualizationTools";
    paths = [
      self.buildah
      self.podman
      self.runc
      self.skopeo
      self.vagrant
    ];
  };
}
