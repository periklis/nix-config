{ config, pkgs, ... }:
{
  environment = {
    #
    # Common config files
    #
    etc."dot-files/aspell.conf".text            = import ../common/dot-files/aspell.nix {};
    etc."dot-files/curlrc".text                 = import ../common/dot-files/curlrc.nix {};
    etc."dot-files/ctags".text                  = import ../common/dot-files/ctags.nix {};
    etc."dot-files/darktooth/darktooth.sh".text = import ../common/dot-files/darktooth/darktooth.nix { inherit(pkgs) bash; };
    etc."dot-files/htoprc".text                 = import ../common/dot-files/htoprc.nix {};
    etc."dot-files/git/ignore".text             = import ../common/dot-files/git/ignore.nix {};
    etc."dot-files/nixpkgs/config.nix".text     = import ../common/dot-files/nixpkgs/config.nix {};
    etc."dot-files/npmrc".text                  = import ../common/dot-files/npmrc.nix {};

    #
    # Per machine config files
    #
    etc."dot-files/alphaomega/alacritty/alacritty.yml".text = import ./dot-files/alacritty/alacritty.nix {};
    etc."dot-files/alphaomega/fonts.conf".text              = import ./dot-files/fonts.nix {};
    etc."dot-files/alphaomega/gtk-3.0/settings.ini".text    = import ./dot-files/gtk-3.0/settings.nix {};
    etc."dot-files/alphaomega/grobi.conf".text              = import ./dot-files/grobi.nix {};
    etc."dot-files/alphaomega/i3/config".text               = import ./dot-files/i3/config.nix {};
    etc."dot-files/alphaomega/i3/status.toml".text          = import ./dot-files/i3/status.nix {};
    etc."dot-files/alphaomega/tmux/kube.tmux".text          = pkgs.lib.fileContents ./dot-files/tmux/kube.tmux;
    etc."dot-files/alphaomega/tmux.conf".text               = import ./dot-files/tmux.nix { inherit(pkgs) bash; };
    etc."dot-files/alphaomega/Xresources".text              = import ./dot-files/Xresources.nix {};

    #
    # Per-user secret config files
    #
    etc."dot-files/ptsirakidis/gitconfig".text                   = import ../../machine/per-user/gitconfig.nix {};
    etc."dot-files/ptsirakidis/gnus.el".text                     = import ../../machine/per-user/gnus.nix {};
    etc."dot-files/ptsirakidis/sbt/1.0/global.sbt".text          = import ../../machine/per-user/sbt/1.0/global.nix {};
    etc."dot-files/ptsirakidis/sbt/1.0/plugins/plugins.sbt".text = import ../../machine/per-user/sbt/1.0/plugins/plugins.nix {};
    etc."dot-files/ptsirakidis/sbt/1.0/sonatype.sbt".text        = import ../../machine/per-user/sbt/1.0/sonatype.nix {};
    etc."dot-files/ptsirakidis/signature".text                   = import ../../machine/per-user/signature.nix {};
    etc."dot-files/ptsirakidis/ssh-config".text                  = import ../../machine/per-user/ssh-user-config.nix {};
    etc."dot-files/ptsirakidis/zshrc".text                       = import ../../machine/per-user/zshrc.nix {};

    extraOutputsToInstall = [ "doc" "lib" "man" "info" ];

    pathsToLink = [ "/lib" "/libexec" "/share" ];

    variables = {
      TERM              = "screen-256color";
      LC_ALL            = "en_US.UTF-8";
      PAGER             = "less -R";
      EDITOR            = "emacsclient";
      ALTERNATE_EDITOR  = "vim";
      LSCOLORS          = "gxfxbEaEBxxEhEhBaDaCaD";
      MANPATH           = [
        "/home/$LOGNAME/.nix-profile/share/man"
        "/home/$LOGNAME/.nix-profile/man"
        "${config.system.path}/share/man"
        "${config.system.path}/man"
        "/usr/local/share/man"
        "/usr/share/man"
      ];
      ACLOCAL_PATH        = "$HOME/.nix-profile/share/aclocal";
      CACHIX_SIGNING_KEY  = "UezrEGeJqHdXD97YjoMqdAV64/O+Sk5mzsBH7hV7rrjpUsDGacxW7t6FEeUAK7HJ4YOMYjz13tCfRRN2xmLfnw==";
      GOPATH              = "$HOME/projects/golang/";
      PKG_CONFIG_PATH     = "$HOME/.nix-profile/lib/pkgconfig";
      PKG_CONFIG_LIBDIR   = "$HOME/.nix-profile/lib/pkgconfig";
      PYTHONPATH          = "$HOME/.local/lib/python3.6/site-packages:${pkgs.pythonToolsEnv}/lib/python3.6/site-packages";
      ZSH_CUSTOM          = "$HOME/.zsh/custom";
      ZSH_CACHE_DIR       = "$HOME/.zsh/cache";
      FZF_DEFAULT_COMMAND = "fd --type file --color=always --follow --hidden --exclude .git";
      FZF_COMMON_OPTS     = "--select-1 --exit-0";
      FZF_CTRL_T_OPTS     = pkgs.lib.concatStringsSep " " [
        "$FZF_COMMON_OPTS --preview"
        "'(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"
      ];
      FZF_CTRL_R_OPTS   = pkgs.lib.concatStringsSep " " [
        "$FZF_COMMON_OPTS --preview"
        "'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview'"
      ];
      FZF_DEFAULT_OPTS  = pkgs.lib.concatStringsSep " " [
        "--ansi"
        "--color dark,hl:33,hl+:37,fg+:235,bg+:234,fg+:254"
        "--color info:254,prompt:37,spinner:108,pointer:235,marker:235"
        "--reverse"
      ];
      PATH = pkgs.lib.concatStringsSep ":" [
        "$HOME/.local/bin"
        "$HOME/.cabal/bin"
        "$HOME/.cargo/bin"
        "$HOME/.composer/vendor/bin"
        "$HOME/.node/bin"
        "$HOME/projects/golang/bin"
        "$PATH"
      ];
    };

    shells = with pkgs; [
      bashInteractive
      zsh
    ];

    shellAliases = {
      mmv                  = "noglob zmv -W";
      emacs-nox            = "$HOME/Applications/Emacs.app/Contents/MacOS/Emacs -nw";
      ec                   = "emacsclient -t";
      firefox              = "firefox --ProfileManager";
      nix-build-out        = "nixBuildOut";
      nix-build-binding-as = "nixBuildBindingAs";
      nix-build-deps       = "nixBuildDeps";
      nix-runtime-deps     = "nixRuntimeDeps";
      nix-check-updates    = "nixCheckUpdates";
      nix-env-rebuild      = "nixEnvRebuild";
      fts                  = "ag --nobreak --nonumbers --noheading . | fzf";
    };
  };
}
