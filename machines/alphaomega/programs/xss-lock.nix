{config, pkgs, ...}:
{
  programs.xss-lock = {
    enable = true;
    lockerCommand = "${pkgs.i3lock-fancy}/bin/i3lock-fancy && ${pkgs.openssh}/bin/ssh-add -x";
  };
}
