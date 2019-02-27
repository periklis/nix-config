{ config, pkgs, ...}:
{
  services.dovecot2 = {
    enable = true;
    enableImap = true;
    mailLocation = "maildir:~/.maildirs:LAYOUT=fs";
  };
}
