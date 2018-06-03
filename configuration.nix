{ config, lib, pkgs, ... }:
let
  machine = import ./machine.nix { inherit lib pkgs; };

  inherit(machine) activationScripts etc networking nix;
in
{
  environment = import ./environment.nix { inherit lib etc; };

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

  # services.chunkwm = import ./services/chunkwm.nix { inherit(pkgs) chunkwm; };

  services.skhd = import ./services/skhd.nix { inherit(pkgs) skhd; };

  system = {
    inherit activationScripts;
    defaults = import ./preferences/defaults.nix {};
    stateVersion = 3;
  };

  time.timeZone = "Europe/Berlin";
}
