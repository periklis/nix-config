{config, pkgs, ...}:
{
  services.actkbd = {
    enable = true;
    bindings = [
      # Sound Media Keys
      { keys = [ 59 ]; events = [ "key" ]; command = "${pkgs.alsaUtils}/bin/amixer -q sset Master toggle"; }
      { keys = [ 60 ]; events = [ "key" ]; command = "${pkgs.alsaUtils}/bin/amixer -q sset Master 5%-"; }
      { keys = [ 61 ]; events = [ "key" ]; command = "${pkgs.alsaUtils}/bin/amixer -q sset Master 5%+"; }
      { keys = [ 62 ]; events = [ "key" ]; command = "${pkgs.alsaUtils}/bin/amixer -q sset Capture toggle"; }
      # Backlight keys
      { keys = [ 63 ]; events = [ "key" ]; command = "/run/wrappers/bin/light -U 10"; }
      { keys = [ 64 ]; events = [ "key" ]; command = "/run/wrappers/bin/light -A 10"; }
      # Bluetooth media keys
      { keys = [ 68 ]; events = [ "key" ]; command = "/run/wrappers/bin/bluetooth toggle"; }
    ];
  };
}
