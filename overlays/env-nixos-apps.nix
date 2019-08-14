self: super:
{
  nixosAppsEnv = super.buildEnv {
    name = "nixosApps";
    paths = [
      self.adobeReader
      self.corefonts
      self.direnv
      self.file
      self.firefox
      self.flameshot
      self.gnome3.gnome-tweaks
      self.gnupg
      self.google-chrome
      self.grobi
      self.handbrake
      self.imagemagick
      self.i3lock-fancy
      self.i3status-rust
      self.killall
      self.lsof
      self.networkmanagerapplet
      self.openfortivpn
      self.pa_applet
      self.pavucontrol
      self.powertop
      self.pstree
      self.rofi
      self.slack
      self.xorg.xkbcomp
      self.vlc
      self.zoom-us
    ];
 };
}
