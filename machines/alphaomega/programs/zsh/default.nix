{config, pkgs, ...}:
let
  fzfHistory = ./fzf-history.zsh;
in
{
  programs.zsh = {
    enable = true;
    enableCompletion = false;
    ohMyZsh = {
      enable = true;
      plugins = [
        "autojump"
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
