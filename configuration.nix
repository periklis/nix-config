{ config, lib, pkgs, ... }:
let
  machine = import ./machine.nix { inherit lib pkgs; };
in
{
  environment = import ./environment.nix { inherit lib; };

  networking.hostName = machine.hostname;

  nix = import ./programs/nix.nix {
    machine = machine.nix;
    nix = pkgs.nixUnstable;
  };

  programs.zsh = import ./programs/zsh.nix {};

  services.nix-daemon.enable = true;

  system.defaults = import ./preferences/defaults.nix {};

  system.stateVersion = 3;

  time.timeZone = "Europe/Berlin";
}
