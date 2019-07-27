{config, pkgs, ...}:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    syntaxHighlighting = {
      enable = true;
      highlighters = ["main" "brackets" "pattern" "cursor" "root" "line"];
    };
    ohMyZsh = {
      enable = true;
      theme = "sunrise";
    };
    promptInit = ''
      source $FZF_BASE/share/fzf/completion.zsh
      source $FZF_BASE/share/fzf/key-bindings.zsh
    '';
  };
}
