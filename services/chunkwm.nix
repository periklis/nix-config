{ chunkwm }:
{
  enable  = true;
  hotload = true;
  package = chunkwm;

  plugins.list = [ "border" "ffm" "tiling" ];

  plugins."border".config = ''
    chunkc set focused_border_width          1
  '';

  plugins."ffm".config = ''
    chunkc set ffm_bypass_modifier           fn
  '';

  extraConfig = ''
    chunkc tiling::rule --owner Finder --name Copy --state float
    chunkc tiling::rule --owner \"App Store\" --state float
    chunkc tiling::rule --owner Emacs --except "^$" --state tile
    chunkc tiling::rule --owner \"Microsoft Outlook\" --subrole AXStandardWindow --state tile
    chunkc tiling::rule --owner Terminal --except "^$" --state tile
    chunkc tiling::rule --owner \"System Preferences\" --subrole AXStandardWindow --state tile
  '';
}
