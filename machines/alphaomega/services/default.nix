{config, pkgs, ...}:
{
  imports =[
    ./coredns.nix
    ./dovecot.nix
    ./offlineimap.nix
    ./printing.nix
    ./restic.nix
    ./throttled.nix
    ./udev.nix
    ./xserver.nix
  ];

  services.acpid.enable = true;
  services.autorandr.enable = false;
  services.fwupd.enable = true;
  services.printing.enable = true;
  services.tlp.enable = true;
}
