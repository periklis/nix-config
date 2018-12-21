self: super:
let
  extraOutputsToInstall = [ "man" "doc" ];
in
{
  nixosAppsEnv = super.buildEnv {
    name = "nixosApps";
    paths = [
      self.adobeReader
      self.firefox
      self.google-chrome-dev
      self.handbrake
      self.i3lock-fancy
      self.i3status-rust
      self.libreoffice
      self.mupdf
      self.openfortivpn
      self.pavucontrol
      self.skype
      self.slack
      self.vlc
      self.zoom-us
    ];
    inherit extraOutputsToInstall;
 };
}
