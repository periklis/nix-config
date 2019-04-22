{config, pkgs, ...}:
let
  fzfHistory = ./fzf-history.zsh;
in
{
  programs.zsh = {
    enable = true;
    ohMyZsh = {
      enable = true;
      plugins = [
        "docker"
        "emacs"
        "git"
        "git-extras"
        "kubectl"
        "sudo"
      ];
      theme = "sunrise";
    };

    promptInit = ''
      source ${fzfHistory}
    '';
  };
}
