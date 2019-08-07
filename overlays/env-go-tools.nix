self: super:
{
  goToolsEnv = super.buildEnv {
    name = "goTools";
    paths = [
      self.delve
      self.go
      self.golint
      self.go
      self.go2nix
      self.go-outline
      self.gotools
    ];
  };
}
