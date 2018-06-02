{ machine, nix }:
{
  inherit(machine) distributedBuilds buildMachines;

  package = nix;

  useDaemon  = true;
  maxJobs    = 4;
  buildCores = 1;
  useSandbox = false;

  binaryCaches          = [ https://cache.nixos.org/ ];
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
    "nixpkgs-overlays=/Users/$LOGNAME/projects/$LOGNAME/nix-config/overlays"
    "nixpkgs=/Users/$LOGNAME/projects/$LOGNAME/nix-config/nixpkgs"
    "/nix/var/nix/profiles/per-user/root/channels"
    "$HOME/.nix-defexpr/channels"
  ];
}
