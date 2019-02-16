{ machine, nix }:
{
  inherit(machine) distributedBuilds buildMachines;

  package = nix;

  useDaemon  = true;
  maxJobs    = 4;
  buildCores = 2;
  useSandbox = false;

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
