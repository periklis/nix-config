self: super:
{
  virtualizationToolsEnv = super.buildEnv {
    name = "virtualizationTools";
    paths = [
      self.docker
      self.docker-machine
      self.python36Packages.docker_compose
      self.socat
      self.vagrant
    ];
    extraOutputsToInstall = [ "man" "doc" ];
  };
}
