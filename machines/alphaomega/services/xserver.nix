{config, pkgs, ...}:
let
  keymap = pkgs.writeText "keymap.xkb" ''
    xkb_keymap {
        xkb_keycodes  { include "evdev+aliases(qwerty)" };
        xkb_types     { include "complete"  };
        xkb_compat    { include "complete"  };
        xkb_symbols   {
            include "pc+us+gr(extended):2+inet(evdev)+group(alt_space_toggle)+ctrl(swapcaps)+eurosign(e)+terminate(ctrl_alt_bksp)"
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

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.dpi = 144;

  # Enable touchpad support.
  services.xserver.libinput = {
    enable = true;
    disableWhileTyping = true;
    middleEmulation = true;
    naturalScrolling = true;
  };

  services.xserver.synaptics.enable = false;

  # Enable the KDE Desktop Environment.
  services.xserver.displayManager.lightdm = {
    enable = true;
    background = "${pkgs.nixos-artwork.wallpapers.stripes-logo}/share/artwork/gnome/nix-wallpaper-stripes-logo.png";
  };
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
    time   = 5;
  };
}
