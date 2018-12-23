{ config, pkgs, ... }:
{
  environment = {
    #
    # Per-user machine secret config files
    #
    etc."per-user/ptsirakidis/gitconfig".text                   = import ../../machine/per-user/gitconfig.nix {};
    etc."per-user/ptsirakidis/gnus.el".text                     = import ../../machine/per-user/gnus.nix {};
    etc."per-user/ptsirakidis/sbt/1.0/global.sbt".text          = import ../../machine/per-user/sbt/1.0/global.nix {};
    etc."per-user/ptsirakidis/sbt/1.0/plugins/plugins.sbt".text = import ../../machine/per-user/sbt/1.0/plugins/plugins.nix {};
    etc."per-user/ptsirakidis/sbt/1.0/sonatype.sbt".text        = import ../../machine/per-user/sbt/1.0/sonatype.nix {};
    etc."per-user/ptsirakidis/signature".text                   = import ../../machine/per-user/signature.nix {};
    etc."per-user/ptsirakidis/ssh-config".text                  = import ../../machine/per-user/ssh-user-config.nix {};
    etc."per-user/ptsirakidis/zshrc".text                       = import ../../machine/per-user/zshrc.nix {};

    #
    # Per-user common config files
    #
    etc."per-user/aspell.conf".text                    = import ../common/dot-files/aspell.nix {};
    etc."per-user/curlrc".text                         = import ../common/dot-files/curlrc.nix {};
    etc."per-user/ctags".text                          = import ../common/dot-files/ctags.nix {};
    etc."per-user/darktooth/darktooth.sh".text         = import ../common/dot-files/darktooth/darktooth.nix { inherit(pkgs) bash; };
    etc."per-user/htoprc".text                         = import ../common/dot-files/htoprc.nix {};
    etc."per-user/git/ignore".text                     = import ../common/dot-files/git/ignore.nix {};
    etc."per-user/nixpkgs/config.nix".text             = import ../common/dot-files/nixpkgs/config.nix {};
    etc."per-user/npmrc".text                          = import ../common/dot-files/npmrc.nix {};

    #
    # Per machine config files
    #
    etc."per-user/alacritty/alacritty.yml".text        = import ./dot-files/alacritty/alacritty.nix {};
    etc."per-user/i3/config".text                      = import ./dot-files/i3/config.nix {};
    etc."per-user/i3/status.toml".text                 = import ./dot-files/i3/status.nix {};
    etc."per-user/tmux/kube.tmux".text                 = pkgs.lib.fileContents ./dot-files/tmux/kube.tmux;
    etc."per-user/tmux.conf".text                      = import ./dot-files/tmux.nix { inherit(pkgs) bash; };

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
