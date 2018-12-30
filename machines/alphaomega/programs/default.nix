{config, pkgs, ...}:
{
  imports =[
    ./gnupg.nix
    ./xss-lock.nix
    ./zsh/default.nix
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  programs.light.enable = true;
  programs.mtr.enable = true;

  security.wrappers.bluetooth.source = "${pkgs.tlp}/bin/bluetooth";
}
