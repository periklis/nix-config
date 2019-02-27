{config, pkgs, ...}:
{
  services.offlineimap = {
    enable = false;
    install = true;
  };
}
