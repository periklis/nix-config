{config, pkgs, ...}:
{
  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.dpi = 144;
  services.xserver.layout = "us,gr";
  services.xserver.xkbModel = "pc105";
  services.xserver.xkbOptions = "eurosign:e, ctrl:swapcaps, grp:alt_shift_toggle";
  services.xserver.xkbVariant = "intl,extended";

  # Enable touchpad support.
  services.xserver.libinput = {
    enable = true;
    disableWhileTyping = true;
    middleEmulation = true;
    naturalScrolling = true;
  };

  services.xserver.synaptics.enable = false;

  # Enable the KDE Desktop Environment.
  services.xserver.displayManager.lightdm.enable = true;
  services.xserver.desktopManager = {
    default = "none";
    xterm.enable = false;
  };
  services.xserver.windowManager.i3.enable = true;

  services.xserver.xautolock = {
    enable = true;
    locker = "${pkgs.i3lock-fancy}/bin/i3lock-fancy";
    time   = 5;
  };
}
