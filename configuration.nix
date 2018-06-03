{ config, lib, pkgs, ... }:
let
  machine = import ./machine.nix { inherit lib pkgs; };

  inherit(machine) activationScripts etc networking nix;

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

  services.chunkwm = import ./services/chunkwm.nix { inherit chunkwm; };

  services.skhd = import ./services/skhd.nix { inherit(pkgs) skhd; };

  system = import ./system.nix { inherit activationScripts; };

  time.timeZone = "Europe/Berlin";
}
