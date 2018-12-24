{ config, pkgs, ... }:

{
  imports =[
    <nixos-hardware/lenovo/thinkpad/t480s>
    ./environment.nix
    ./hardware-configuration.nix
    ./programs
    ./services
    ./system.nix
  ];

  boot.earlyVconsoleSetup = true;

  networking.hostId = "c0bebeef";
  networking.hostName = "nixos-alphaomega"; # Define your hostname.
  networking.networkmanager.enable = true;

  # Select internationalisation properties.
  i18n = {
    # consoleFont = "Lat2-Terminus16";
    consoleFont = "${pkgs.terminus_font}/share/consolefonts/ter-u28n.psf.gz";
    consoleKeyMap = "us";
    defaultLocale = "en_US.UTF-8";
  };

  # Set your time zone.
  time.timeZone = "Europe/Berlin";

  nixpkgs.config = {
    allowUnfree = true;
    allowUnfreeRedistributable = true;
  };

  nixpkgs.overlays =
    let path = ../../overlays; in with builtins;
      map (n: import (path + ("/" + n)))
          (filter (n: match ".*\\.nix" n != null ||
                      pathExists (path + ("/" + n + "/default.nix")))
                      (attrNames (readDir path)));


  # List packages installed in system profile. To search, run:
  environment.systemPackages = with pkgs; [
     emacsToolsEnv
     gitToolsEnv
     javaToolsEnv
     jsToolsEnv
     langToolsEnv
     networkingToolsEnv
     nixToolsEnv
     nixUtilitiesEnv
     nixosAppsEnv
     gcloudToolsEnv
     goToolsEnv
     pythonToolsEnv
     scalaToolsEnv
     systemToolsEnv
  ];

  fonts = {
    enableFontDir = true;
    enableGhostscriptFonts = true;
    fontconfig = {
      enable = true;
      dpi = 144;
      antialias = true;
      hinting.enable = true;
    };
    fonts = with pkgs; [
      font-awesome-ttf
      hack-font
      helvetica-neue-lt-std
   ];
  };

  # List services that you want to enable:
  services.acpid.enable = true;
  services.autorandr.enable = true;
  services.printing.enable = true;
  services.tlp.enable = true;
  services.zfs.autoScrub.enable = true;

  # Enable sound.
  sound.enable = true;
  sound.mediaKeys.enable = false;

  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = false;
  hardware.pulseaudio.enable = true;
  hardware.pulseaudio.support32Bit = true;
  hardware.opengl.driSupport32Bit = true;

  virtualisation.docker = {
    enable = true;
    enableOnBoot = true;
  };
  virtualisation.virtualbox.host.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.ptsirakidis = {
     isNormalUser = true;
     uid = 1000;
     description = "Periklis Tsirakidis";
     extraGroups = [ "wheel" "networkmanager" "docker" "video" ];
     shell = "/run/current-system/sw/bin/zsh";
  };

  # This value determines the NixOS release with which your system is to be
  # compatible, in order to avoid breaking some software such as database
  # servers. You should change this only after NixOS release notes say you
  # should.
  system.stateVersion = "18.09"; # Did you read the comment?
}
