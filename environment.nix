{ config, etc, lib, machinePackages, pkgs }:
{
  etc = etc // {
    "per-user/alacritty/alacritty.yml".text        = import ./dot-files/alacritty/alacritty.nix {};
    "per-user/aspell.conf".text                    = import ./dot-files/aspell.nix {};
    "per-user/curlrc".text                         = import ./dot-files/curlrc.nix {};
    "per-user/ctags".text                          = import ./dot-files/ctags.nix {};
    "per-user/darktooth/darktooth.sh".text         = import ./dot-files/darktooth/darktooth.nix { inherit(pkgs) bash; };
    "per-user/htoprc".text                         = import ./dot-files/htoprc.nix {};
    "per-user/git/ignore".text                     = import ./dot-files/git/ignore.nix {};
    "per-user/gnupg/dirmngr.conf".text             = import ./dot-files/gnupg/dirmngr.nix {};
    "per-user/gnupg/gpg-agent.conf".text           = import ./dot-files/gnupg/gpg-agent.nix {};
    "per-user/gnupg/gpg.conf".text                 = import ./dot-files/gnupg/gpg.nix {};
    "per-user/gnupg/scdaemon.conf".text            = import ./dot-files/gnupg/scdaemon.nix {};
    "per-user/gnupg/sks-keyservers.netCA.pem".text = import ./dot-files/gnupg/sks-keyservers.nix {};
    "per-user/nixpkgs/config.nix".text             = import ./dot-files/nixpkgs/config.nix {};
    "per-user/npmrc".text                          = import ./dot-files/npmrc.nix {};
    "per-user/tmux/kube.tmux".text                 = lib.fileContents ./dot-files/tmux/kube.tmux;
    "per-user/tmux.conf".text                      = import ./dot-files/tmux.nix { inherit(pkgs) bash; };
  };

  extraOutputsToInstall = [ "doc" "lib" "man" "info" ];

  pathsToLink = [ "/lib" "/libexec" "/share" ];

  variables = {
    TERM              = "screen-256color";
    LANG              = "en_US.UTF-8";
    LC_ALL            = "en_US.UTF-8";
    PAGER             = "less -R";
    EDITOR            = "emacsclient";
    ALTERNATE_EDITOR  = "vim";
    LSCOLORS          = "gxfxbEaEBxxEhEhBaDaCaD";
    MANPATH           = [
      "/Users/$LOGNAME/.nix-profile/share/man"
      "/Users/$LOGNAME/.nix-profile/man"
      "${config.system.path}/share/man"
      "${config.system.path}/man"
      "/usr/local/share/man"
      "/usr/share/man"
      "/Developer/usr/share/man"
      "/usr/X11/man"
    ];
    ACLOCAL_PATH        = "$HOME/.nix-profile/share/aclocal";
    GOPATH              = "$HOME/projects/golang/";
    PKG_CONFIG_PATH     = "$HOME/.nix-profile/lib/pkgconfig";
    PKG_CONFIG_LIBDIR   = "$HOME/.nix-profile/lib/pkgconfig";
    PYTHONPATH          = "$HOME/.local/lib/python3.6/site-packages:${pkgs.pythonToolsEnv}/lib/python3.6/site-packages";
    SSH_AUTH_SOCK       = "$HOME/.gnupg/S.gpg-agent.ssh";
    ZSH                 = "/run/current-system/sw/share/oh-my-zsh";
    ZSH_CUSTOM          = "$HOME/.zsh/custom";
    ZSH_CACHE_DIR       = "$HOME/.zsh/cache";
    ZSH_THEME           = "sunrise";
    FZF_DEFAULT_COMMAND = "fd --type file --color=always --follow --hidden --exclude .git";
    FZF_COMMON_OPTS     = "--select-1 --exit-0";
    FZF_CTRL_T_OPTS     = lib.concatStringsSep " " [
      "$FZF_COMMON_OPTS --preview"
      "'(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"
    ];
    FZF_CTRL_R_OPTS   = lib.concatStringsSep " " [
      "$FZF_COMMON_OPTS --preview"
      "'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview'"
    ];
    FZF_DEFAULT_OPTS  = lib.concatStringsSep " " [
      "--ansi"
      "--color dark,hl:33,hl+:37,fg+:235,bg+:234,fg+:254"
      "--color info:254,prompt:37,spinner:108,pointer:235,marker:235"
      "--reverse"
    ];
    PATH = lib.concatStringsSep ":" [
      "$HOME/.local/bin"
      "$HOME/.cabal/bin"
      "$HOME/.cargo/bin"
      "$HOME/.composer/vendor/bin"
      "$HOME/.node/bin"
      "$HOME/projects/golang/bin"
      "$PATH"
    ];
  };

  shells = [
    pkgs.bashInteractive
    pkgs.zsh
  ];

  shellAliases = {
    mmv                  = "noglob zmv -W";
    emacs-nox            = "$HOME/Applications/Emacs.app/Contents/MacOS/Emacs -nw";
    ec                   = "emacsclient -t";
    nix-env              = "nix-env -f '<nixpkgs>'";
    nix-build-out        = "nixBuildOut";
    nix-build-binding-as = "nixBuildBindingAs";
    nix-build-deps       = "nixBuildDeps";
    nix-runtime-deps     = "nixRuntimeDeps";
    nix-check-updates    = "nixCheckUpdates";
    nix-env-rebuild      = "nixEnvRebuild";
    fts                  = "ag --nobreak --nonumbers --noheading . | fzf";
  };

  systemPackages = with pkgs; [
    emacsToolsEnv
    gitToolsEnv
    networkingToolsEnv
    nixToolsEnv
    systemToolsEnv
  ] ++ machinePackages;
}
