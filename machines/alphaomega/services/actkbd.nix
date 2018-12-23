{config, pkgs, ...}:
{
  services.actkbd = {
    enable = true;
    bindings = [
      # { keys = [  ]; events = [ "key" ]; command = "/run/wrappers/bin/light -U 10"; }
      # { keys = [  ]; events = [ "key" ]; command = "/run/wrappers/bin/light -A 10"; }
      { keys = [ 63 ]; events = [ "key" ]; command = "/run/wrappers/bin/light -U 10"; }
      { keys = [ 64 ]; events = [ "key" ]; command = "/run/wrappers/bin/light -A 10"; }
    ];
  };
}
