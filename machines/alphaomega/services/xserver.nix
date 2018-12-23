{config, pkgs, ...}:
let
  keymap = pkgs.writeText "keymap.xkb" ''
    xkb_keymap {
      xkb_keycodes  { include "evdev+aliases(qwerty)" };
      xkb_types     { include "complete"  };
      xkb_compat    { include "complete"  };
      xkb_symbols   {
        include "pc+us+inet(evdev)+terminate(ctrl_alt_bksp)"
        key <AC01> { [ a, A, adiaeresis, Adiaeresis ] };
        key <AC02> { [ s, S, ssharp, U03A3 ] };
        key <AD09> { [ o, O, odiaeresis, Odiaeresis ] };
        key <AD07> { [ u, U, udiaeresis, Udiaeresis ] };
        key <CAPS> { [ Control_L ] };
        key <LCTL> { [ Caps_Lock ] };
        include "level3(ralt_switch)"
      };
      xkb_geometry  { include "pc(pc104)" };
    };
  '';
in
{
  #
  # Keymap
  #
  environment.etc."X11/keymap.xkb".source = keymap;

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.layout = "us";
  services.xserver.xkbOptions = "eurosign:e, ctrl:swapcaps";

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
  services.xserver.displayManager.sessionCommands = ''
    ${pkgs.xorg.xkbcomp}/bin/xkbcomp ${keymap} $DISPLAY
  '';
  services.xserver.desktopManager = {
    default = "none";
    xterm.enable = false;
  };
  services.xserver.windowManager.i3.enable = true;

  services.xserver.xautolock = {
    enable = true;
    locker = "${pkgs.i3lock-fancy}/bin/i3lock-fancy";
    time   = 1;
  };
}
