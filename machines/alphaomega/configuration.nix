{ config, pkgs, ... }:
{
  imports =[
    ./environment.nix
    ./hardware-configuration.nix
    ./modules
    ./programs
    ./services
    ./system.nix
  ];

  boot.earlyVconsoleSetup = true;

  networking.hostId = "c0bebeef";
  networking.hostName = "alphaomega";
  networking.networkmanager = {
    enable = true;
    wifi.powersave = true;
    insertNameservers = [ "127.0.0.1" ];
  };
  networking.nameservers = [ "127.0.0.1" ];

  i18n = {
    consoleFont = "${pkgs.terminus_font}/share/consolefonts/ter-u28n.psf.gz";
    consoleKeyMap = "us";
    defaultLocale = "en_US.UTF-8";
  };

  time.timeZone = "Europe/Berlin";

  nixpkgs.config = {
    allowUnfree = true;
    allowUnfreeRedistributable = true;
  };

  nixpkgs.overlays =
    let
      paths = [
        ../../overlays
        ../../machine/overlays
      ];
    in with builtins;
      concatMap (path:
        (map (n: import (path + ("/" + n)))
          (filter (n: match ".*\\.nix" n != null ||
                      pathExists (path + ("/" + n + "/default.nix")))
                      (attrNames (readDir path))))) paths;

  environment.systemPackages = with pkgs; [
     emacsToolsEnv
     gitToolsEnv
     javaToolsEnv
     jsToolsEnv
     langToolsEnv
     manpages
     networkingToolsEnv
     nixToolsEnv
     nixUtilitiesEnv
     nixosAppsEnv
     gcloudToolsEnv
     goToolsEnv
     pythonToolsEnv
     scalaToolsEnv
     systemToolsEnv
     virtualizationToolsEnv
  ];

  fonts = {
    enableFontDir = true;
    enableGhostscriptFonts = true;
    fontconfig = {
      enable = true;
      # dpi = 144;
      antialias = true;
      hinting.enable = true;
    };
    fonts = with pkgs; [
      font-awesome-ttf
      hack-font
      helvetica-neue-lt-std
      unifont
   ];
  };

  documentation.dev.enable = true;

  sound.enable = true;
  sound.mediaKeys.enable = false;

  virtualisation.docker = {
    enable = true;
    enableOnBoot = true;
  };
  virtualisation.virtualbox.host.enable = false;

  users.users.ptsirakidis = {
     isNormalUser = true;
     uid = 1000;
     subUidRanges = [
       { count = 65536; startUid = 10000; }
     ];
     subGidRanges = [
       { count = 65536; startGid = 10000; }
     ];
     description = "Periklis Tsirakidis";
     extraGroups = [ "docker" "networkmanager" "systemd-journal" "wheel" "video" ];
     shell = "/run/current-system/sw/bin/zsh";
  };

  # This value determines the NixOS release with which your system is to be
  # compatible, in order to avoid breaking some software such as database
  # servers. You should change this only after NixOS release notes say you
  # should.
  system.stateVersion = "18.09"; # Did you read the comment?
}
