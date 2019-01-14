{config, pkgs, ...}:
{
  imports =[
    ./printing.nix
    ./xserver.nix
  ];

  services.acpid.enable = true;
  services.autorandr.enable = false;
  services.fwupd.enable = true;
  services.printing.enable = true;
  services.tlp.enable = true;
  services.zfs.autoScrub.enable = true;
}
