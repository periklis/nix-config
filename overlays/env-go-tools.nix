self: super:
{
  goToolsEnv = super.buildEnv {
    name = "goTools";
    paths = [
      self.delve
      self.glide
      self.go
      self.gocode
      self.godef
      self.golint
      self.go
      self.go2nix
      self.gotools
    ];
    extraOutputsToInstall = [ "man" "doc" ];
  };
}
