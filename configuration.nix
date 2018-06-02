{ config, pkgs, ... }:
{
  environment.systemPackages = [
    pkgs.hello
  ];

  services.nix-daemon.enable = true;

  nix = {
    package = pkgs.nixUnstable;

    useDaemon = true;
    maxJobs = 4;
    buildCores = 1;
    useSandbox = false;

    binaryCaches = [ https://cache.nixos.org/ ];
    binaryCachePublicKeys = [ "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY=" ];

    trustedUsers = [ "root" ];
    allowedUsers = [ "*" ];

    extraOptions = ''
      gc-keep-derivations = true
      gc-keep-outputs = true
    '';

    nixPath = [
      "darwin=$HOME/projects/$LOGNAME/nix-config/nix-darwin"
      "darwin-config=$HOME/projects/$LOGNAME/nix-config/configuration.nix"
      "nixpkgs=/Users/ptsirakidis/projects/periklis/nixpkgs"
      "/nix/var/nix/profiles/per-user/root/channels"
      "$HOME/.nix-defexpr/channels"
    ];
  };

  programs.zsh.enable = true;

  system.stateVersion = 3;
}
