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
      self.corefonts
      self.file
      self.firefox
      self.gimp-with-plugins
      self.gnupg
      self.google-chrome-dev
      self.grobi
      self.handbrake
      self.imagemagick
      self.i3lock-fancy
      self.i3status-rust
      self.jetbrains.idea-ultimate
      self.libreoffice
      self.lsof
      self.mupdf
      self.networkmanagerapplet
      self.openfortivpn
      self.pa_applet
      self.pavucontrol
      self.rofi
      self.scrot
      self.skype
      self.slack
      self.thunderbird
      self.vistafonts
      self.vlc
      self.zoom-us
    ];
 };
}
