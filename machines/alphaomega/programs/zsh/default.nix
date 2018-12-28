{config, pkgs, ...}:
let
  fzfHistory = ./fzf-history.zsh;
in
{
  programs.zsh = {
    enable = true;
    autosuggestions.enable = false;
    enableCompletion = false;
    syntaxHighlighting.enable = true;
    ohMyZsh = {
    enable = true;
      plugins = [
        "docker"
        "emacs"
        "git"
      ];
      theme = "sunrise";
    };

    promptInit = ''
      source ${fzfHistory}
    '';
  };
}
