self: super:
{
  virtualizationToolsEnv = super.buildEnv {
    name = "virtualizationTools";
    paths = [
      self.buildah
      self.conmon
      self.podman
      self.runc
      self.skopeo
      self.slirp4netns
      self.vagrant
    ];
  };
}
