{config, pkgs, ...}:
{
  programs.zsh = {
    enable = true;
    enableCompletion = false;
    syntaxHighlighting = {
      enable = true;
      highlighters = ["main" "brackets" "pattern"];
    };
    ohMyZsh = {
      enable = true;
      theme = "McQuen";
    };
    promptInit = ''
      source $FZF_BASE/share/fzf/completion.zsh
      source $FZF_BASE/share/fzf/key-bindings.zsh
    '';
  };
}
