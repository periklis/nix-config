self: super:
{
  gnupg = super.gnupg.override {
    pinentry = self.pinentry_qt5;
    guiSupport = true;
  };

  nixosAppsEnv = super.buildEnv {
    name = "nixosApps";
    paths = [
      self.adobeReader
      self.arandr
      self.firefox
      self.gnupg
      self.google-chrome-dev
      self.grobi
      self.handbrake
      self.i3lock-fancy
      self.i3status-rust
      self.jetbrains.idea-ultimate
      self.mupdf
      self.openfortivpn
      self.pavucontrol
      self.skype
      self.slack
      self.vlc
      self.zoom-us
    ];
 };
}
