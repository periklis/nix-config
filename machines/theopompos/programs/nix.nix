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

  nixpath = [
    "darwin=$HOME/projects/periklis/nix-config/nix-darwin"
    "darwin-config=$HOME/projects/periklis/nix-config/configuration.nix"
    "nixpkgs=/Users/periklis/projects/periklis/nix-config/nixpkgs"
    "/nix/var/nix/profiles/per-user/root/channels"
  ];
}
