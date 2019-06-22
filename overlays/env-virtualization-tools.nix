self: super:
{
  # Help derivation to have podman symlinked as docker in $PATH
  docker2podman = super.callPackage ({ podman}: self.stdenv.mkDerivation {
    name = "docker2podman";
    version = "docker2podman-${podman.version}";
    phases = [ "installPhase"];
    installPhase = ''
      mkdir -p $out/bin
      ln -s ${podman}/bin/podman $out/bin/docker
    '';
  }) {};

  virtualizationToolsEnv = super.buildEnv {
    name = "virtualizationTools";
    paths = [
      self.buildah
      self.conmon
      # self.docker2podman
      self.podman
      self.runc
      self.skopeo
      self.slirp4netns
      self.vagrant
    ];
  };
}
