{config, pkgs, ...}:
{
  services.restic.backups.alphaomega = {
    initialize = true;
    repository = "/run/media/ptsirakidis/hcbackup";
    passwordFile = "/etc/nixos/restic-pw";
    timerConfig = { OnCalendar = "daily"; };
    user = "ptsirakidis";
    paths = [
      "/home/ptsirakidis/.authinfo.gpg"
      "/home/ptsirakidis/.ssh"
      "/home/ptsirakidis/.newsrc"
      "/home/ptsirakidis/.newsrc.eld"
      "/home/ptsirakidis/.zsh"
      "/home/ptsirakidis/Downloads"
      "/home/ptsirakidis/Documents"
      "/home/ptsirakidis/Music"
      "/home/ptsirakidis/Pictures"
      "/home/ptsirakidis/projects"
      "/home/ptsirakidis/Videos"
    ];
  };
}
