{ config, lib, pkgs, ... }:
let
  machine = import ./machine.nix { inherit lib pkgs; };

  inherit(machine) networking nix;
in
{
  environment = import ./environment.nix { inherit lib; };

  networking = {
    inherit (networking) hostName;
    knownNetworkServices = [ "Ethernet" "Wi-Fi" ];
  };

  nix = import ./programs/nix.nix {
    machine = nix;
    nix = pkgs.nixUnstable;
  };

  nixpkgs = {
    config = {
      allowUnfree = true;
      allowBroken = true;
    };

    overlays = import ./overlays/overlays.nix;
  };

  programs.zsh = import ./programs/zsh.nix {};

  services.nix-daemon.enable = true;

  system.defaults = import ./preferences/defaults.nix {};

  system.stateVersion = 3;

  time.timeZone = "Europe/Berlin";
}
