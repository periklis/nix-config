{config, pkgs, ...}:
{
  services.printing = {
    enable = true;
    drivers = with pkgs; [
      cups-kyocera
      cups-kyodialog3
      cups-kyocera-bizhub
    ];
  };
}
