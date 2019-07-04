{config, pkgs, ...}:
{
  services.xserver = {
    enable = true;
    enableCtrlAltBackspace = true;

    displayManager.lightdm.enable = true;

    desktopManager = {
      default = "none";
      xterm.enable = false;
      gnome3.enable = true;
    };

    inputClassSections = [
      ''
        Identifier "Trackpoint Wheel Emulation"
        MatchProduct "ThinkPad USB Keyboard with TrackPoint"
        Option "EmulateWheel" "true"
        Option "EmulateWheelButton" "2"
        Option "Emulate3Buttons" "false"
        Option "XkbModel" "pc105"
        Option "XkbLayout" "us,gr"
        Option "XkbVariant" ",extended"
        Option "XKbOptions" "grp:alt_space_toggle,ctrl:nocaps,terminate:ctrl_alt_bksp,eurosign:e"
      ''
    ];

    libinput = {
      enable = true;
      disableWhileTyping = true;
      middleEmulation = true;
      naturalScrolling = true;
    };

    useGlamor = true;

    videoDrivers = [ "intel" ];
  };
}
