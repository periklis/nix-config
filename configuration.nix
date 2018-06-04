{ config, lib, pkgs, ... }:
let
  machine = import ./machine.nix { inherit lib pkgs; };

  inherit(machine) activationScripts agents daemons etc machinePackages networking nix services;

  #
  # TODO Switch over when the following PR is merged:
  # https://github.com/periklis/nixpkgs/commit/9201e84257139f076da8bf0d6a5c8a3655831a0f
  chunkwm = pkgs.runCommand "chunkwm" {} ''
    mkdir -p $out/bin
    mkdir -p $out/plugins
    cp ${/usr/local/bin}/chunkc $out/bin
    cp ${/usr/local/bin}/chunkwm $out/bin
    cp ${/usr/local/lib}/border.so $out/plugins
    cp ${/usr/local/lib}/ffm.so $out/plugins
    cp ${/usr/local/lib}/tiling.so $out/plugins
  '';
in
{
  #
  # System environment
  #
  environment = import ./environment.nix
    { inherit config etc lib machinePackages pkgs; };

  launchd = { inherit agents daemons; };

  #
  # Nix & Nixpkgs
  #
  nix = import ./programs/nix.nix {
    machine = nix;
    inherit(pkgs) nix;
  };

  nixpkgs = {
    config = {
      allowUnfree = true;
      allowBroken = true;
    };

    overlays = import ./overlays/overlays.nix;
  };

  #
  # Programs
  #
  programs.gnupg = import ./programs/gnupg.nix {};

  programs.info.enable      = true;
  programs.man.enable       = true;
  programs.nix-index.enable = false;

  programs.zsh = import ./programs/zsh.nix {};

  #
  # Services
  #
  services = services // {
    activate-system.enable = true;
    nix-daemon.enable      = true;

    chunkwm = import ./services/chunkwm.nix
      { inherit chunkwm; };

    skhd = import ./services/skhd.nix
      { inherit(pkgs) skhd; };
  };

  #
  # System configuration
  #
  networking = {
    inherit (networking) hostName;
    knownNetworkServices = [ "Ethernet" "Wi-Fi" ];
  };

  system = import ./system.nix
    { inherit activationScripts; };

  time.timeZone = "Europe/Berlin";
}
