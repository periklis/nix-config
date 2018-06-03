{ chunkwm }:
{
  enable  = true;
  hotload = true;
  package = chunkwm;

  plugins.dir             = "${chunkwm}/plugins";
  plugins.list            = [ "border" "ffm" "tiling" ];
  plugins."border".config = "";
  plugins."tiling".config = "";

  extraConfig = import ../dot-files/chunkwmrc.nix {};
}
