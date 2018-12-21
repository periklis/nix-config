{ config, pkgs, ... }:

{
  imports =[
    <nixos-hardware/lenovo/thinkpad/t480s>
    ./machine/environment.nix
    ./machine/hardware-configuration.nix
    ./machine/programs/gnupg.nix
    ./machine/programs/zsh.nix
    ./machine/services/xserver.nix
    ./machine/system.nix
  ];

  networking.hostId = "c0bebeef";
  networking.hostName = "nixos-alphaomega"; # Define your hostname.
  networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Select internationalisation properties.
  i18n = {
     # consoleFont = "Lat2-Terminus16";
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
    let path = ./overlays; in with builtins;
      map (n: import (path + ("/" + n)))
          (filter (n: match ".*\\.nix" n != null ||
                      pathExists (path + ("/" + n + "/default.nix")))
                      (attrNames (readDir path)));


  # List packages installed in system profile. To search, run:
  # $ nix search wget
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
    fonts = with pkgs; [
      hack-font
      font-awesome-ttf
   ];
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  programs.mtr.enable = true;

  # List services that you want to enable:
  services.acpid.enable = true;
  services.autorandr.enable = true;
  services.printing.enable = true;
  services.tlp.enable = true;
  services.zfs.autoScrub.enable = true;

  # Enable sound.
  sound.enable = true;

  hardware.brightnessctl.enable = true;
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
