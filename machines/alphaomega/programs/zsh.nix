{config, pkgs, ...}:
{
   programs.zsh = {
     enable = true;
     autosuggestions.enable = true;
     enableCompletion = true;
     syntaxHighlighting.enable = true;
     ohMyZsh = {
       enable = true;
       plugins = [ "git" ];
       theme = "sunrise";
      };
   };
}