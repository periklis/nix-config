{config, pkgs, ...}:
let
  keymap = pkgs.writeText "keymap.xkb" ''
    xkb_keymap {
        xkb_keycodes  { include "evdev+aliases(qwerty)" };
        xkb_types     { include "complete"  };
        xkb_compat    { include "complete"  };
        xkb_symbols   {
            include "pc+us+gr(extended):2+inet(evdev)+group(alt_space_toggle)+ctrl(nocaps)+eurosign(e)+terminate(ctrl_alt_bksp)"
            key <AC01> { [ a, A, adiaeresis, Adiaeresis ] };
            key <AC02> { [ s, S, ssharp, U03A3 ] };
            key <AD09> { [ o, O, odiaeresis, Odiaeresis ] };
            key <AD07> { [ u, U, udiaeresis, Udiaeresis ] };
            include "level3(ralt_switch)"
        };
        xkb_geometry  { include "pc(pc105)" };
    };
  '';
in
{
  environment.etc."X11/keymap.xkb".source = keymap;

  services.xserver = {
    enable = true;
    enableCtrlAltBackspace = true;

    dpi = 192;

    displayManager.lightdm = {
      enable = true;
      background = "${pkgs.nixos-artwork.wallpapers.stripes-logo}/share/artwork/gnome/nix-wallpaper-stripes-logo.png";
    };

    displayManager.sessionCommands = ''
      ${pkgs.xorg.xkbcomp}/bin/xkbcomp ${keymap} $DISPLAY
    '';

    desktopManager = {
      default = "none";
      xterm.enable = false;
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

    windowManager.i3.enable = true;

    xautolock = {
      enable = true;
      locker = "${pkgs.i3lock-fancy}/bin/i3lock-fancy";
      time   = 5;
    };
  };
}
