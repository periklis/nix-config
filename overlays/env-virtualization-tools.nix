self: super:
{
  virtualizationToolsEnv = super.buildEnv {
    name = "virtualizationTools";
    paths = [
      self.docker
      self.docker-machine
      self.docker-compose
      self.socat
      self.vagrant
    ];
    extraOutputsToInstall = [ "man" "doc" ];
  };
}
