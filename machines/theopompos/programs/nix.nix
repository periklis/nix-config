{ machine, nix }:
{
  inherit(machine) distributedBuilds buildMachines;

  package = nix;

  useDaemon  = true;
  maxJobs    = 32;
  buildCores = 4;
  useSandbox = false;

  # binaryCaches = [ https://periklis.cachix.org ];

  # binaryCachePublicKeys = [ "periklis.cachix.org-1:6VLAxmnMVu7ehRHlACuxyeGDjGI89d7Qn0UTdsZi358=" ];

  trustedUsers = [ "root" ];
  allowedUsers = [ "*" ];

  envVars = {
    OBJC_DISABLE_INITIALIZE_FORK_SAFETY = "YES";
  };

  extraOptions = ''
    keep-derivations = true
    show-trace = true
  '';

  nixPath = [
    "darwin=$HOME/projects/$LOGNAME/nix-config/nix-darwin"
    "darwin-config=$HOME/projects/$LOGNAME/nix-config/configuration.nix"
    "nixpkgs=/Users/$LOGNAME/projects/$LOGNAME/nix-config/nixpkgs"
    "/nix/var/nix/profiles/per-user/root/channels"
  ];
}
