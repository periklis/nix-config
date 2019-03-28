{ config, etc, lib, machinePackages, pkgs }:
{
  etc = etc // {
    #
    # Common config files
    #
    "dot-files/aspell.conf".text                    = import ../common/dot-files/aspell.nix {};
    "dot-files/curlrc".text                         = import ../common/dot-files/curlrc.nix {};
    "dot-files/ctags".text                          = import ../common/dot-files/ctags.nix {};
    "dot-files/darktooth/darktooth.sh".text         = import ../common/dot-files/darktooth/darktooth.nix { inherit(pkgs) bash; };
    "dot-files/htoprc".text                         = import ../common/dot-files/htoprc.nix {};
    "dot-files/git/ignore".text                     = import ../common/dot-files/git/ignore.nix {};
    "dot-files/gnupg/dirmngr.conf".text             = import ../common/dot-files/gnupg/dirmngr.nix {};
    "dot-files/gnupg/gpg-agent.conf".text           = import ../common/dot-files/gnupg/gpg-agent.nix { inherit pkgs; };
    "dot-files/gnupg/gpg.conf".text                 = import ../common/dot-files/gnupg/gpg.nix {};
    "dot-files/gnupg/scdaemon.conf".text            = import ../common/dot-files/gnupg/scdaemon.nix {};
    "dot-files/gnupg/sks-keyservers.netCA.pem".text = import ../common/dot-files/gnupg/sks-keyservers.nix {};
    "dot-files/nixpkgs/config.nix".text             = import ../common/dot-files/nixpkgs/config.nix {};
    "dot-files/npmrc".text                          = import ../common/dot-files/npmrc.nix {};

    #
    # Per machine config files
    #
    "dot-files/theopompos/alacritty/alacritty.yml".text = import ./dot-files/alacritty/alacritty.nix {};
    "dot-files/theopompos/tmux.conf".text               = import ./dot-files/tmux.nix { inherit(pkgs) bash; };

    #
    # Per-user secret config files
    #
    "dot-files/periklis/gitconfig".text  = import ../../machine/per-user/gitconfig.nix {};
    "dot-files/periklis/gnus.el".text    = import ../../machine/per-user/gnus.nix {};
    "dot-files/periklis/signature".text  = import ../../machine/per-user/signature.nix {};
    "dot-files/periklis/ssh-config".text = import ../../machine/per-user/ssh-user-config.nix {};
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
      "/Users/periklis/.nix-profile/share/man"
      "/Users/periklis/.nix-profile/man"
      "${config.system.path}/share/man"
      "${config.system.path}/man"
      "/usr/local/share/man"
      "/usr/share/man"
      "/Developer/usr/share/man"
      "/usr/X11/man"
    ];
    ACLOCAL_PATH        = "$HOME/.nix-profile/share/aclocal";
    CACHIX_SIGNING_KEY  = "UezrEGeJqHdXD97YjoMqdAV64/O+Sk5mzsBH7hV7rrjpUsDGacxW7t6FEeUAK7HJ4YOMYjz13tCfRRN2xmLfnw==";
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
