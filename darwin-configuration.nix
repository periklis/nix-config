{ config, lib, pkgs, ... }:
let
  machine = import ./machine/machine.nix { inherit lib pkgs; };

  inherit(machine) activationScripts etc launchd  machinePackages networking nix services;
in
{
  inherit launchd networking;

  #
  # System environment
  #
  environment = import ./machine/environment.nix
    { inherit config etc lib machinePackages pkgs; };

  #
  # Fonts
  #
  fonts = {
    enableFontDir = true;
    fonts = with pkgs; [ hack-font ];
  };

  #
  # Nix & Nixpkgs
  #
  nix = import ./machine/programs/nix.nix {
    machine = nix;
    inherit(pkgs) nix;
  };

  nixpkgs = {
    config = {
      allowUnfree = true;
      allowBroken = true;
    };

    overlays = let path = ./overlays; in with builtins;
      map (n: import (path + ("/" + n)))
          (filter (n: match ".*\\.nix" n != null ||
                      pathExists (path + ("/" + n + "/default.nix")))
                      (attrNames (readDir path)));
  };

  #
  # Programs
  #
  programs = {
    gnupg            = import ./machine/programs/gnupg.nix {};
    info.enable      = true;
    man.enable       = true;
    nix-index.enable = true;
    zsh              = import ./machine/programs/zsh.nix {};
  };

  #
  # Services
  #
  services = services // {
    activate-system.enable = true;
    nix-daemon.enable      = true;
  };

  #
  # System configuration
  #
  system = import ./machine/system.nix
    { inherit activationScripts; };

  time.timeZone = "Europe/Berlin";
}
