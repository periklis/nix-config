self: super:
{
  phpToolsEnv = super.buildEnv {
    name = "phpTools";
    paths = [
      self.php
      self.phpPackages.apcu
      self.phpPackages.composer
    ];
  };
}
