{config, pkgs, ...}:
{
  imports =[
    ./gnupg.nix
    ./zsh.nix
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  programs.light.enable = true;
  programs.mtr.enable = true;
}
