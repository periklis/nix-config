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
      self.chromium
      self.corefonts
      self.direnv
      self.file
      self.firefox
      self.gimp-with-plugins
      self.gnupg
      self.grobi
      self.handbrake
      self.imagemagick
      self.i3lock-fancy
      self.i3status-rust
      self.killall
      self.lsof
      self.mupdf
      self.networkmanagerapplet
      self.openfortivpn
      self.pa_applet
      self.pavucontrol
      self.powertop
      self.rofi
      self.scrot
      self.slack
      self.thunderbird
      self.xorg.xkbcomp
      # self.vistafonts
      self.vlc
      self.zoom-us
    ];
 };
}
