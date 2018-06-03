{ config, lib, etc }:
{
  etc = etc // {
    "per-user/curlrc".text                         = import ./dot-files/curlrc.nix {};
    "per-user/ctags".text                          = import ./dot-files/ctags.nix {};
    "per-user/chunkwmrc".text                      = import ./dot-files/chunkwmrc.nix {};
    "per-user/htoprc".text                         = import ./dot-files/htoprc.nix {};
    "per-user/gnupg/dirmngr.conf".text             = import ./dot-files/gnupg/dirmgr.nix {};
    "per-user/gnupg/gpg-agent.conf".text           = import ./dot-files/gnupg/gpg-agent.nix {};
    "per-user/gnupg/gpg.conf".text                 = import ./dot-files/gnupg/gpg.nix {};
    "per-user/gnupg/scdaemon.conf".text            = import ./dot-files/gnupg/scdaemon.nix {};
    "per-user/gnupg/sks-keyservers.netCA.pem".text = import ./dot-files/gnupg/sks-keyservers.nix {};
    "per-user/npmrc".text                          = import ./dot-files/npmrc.nix {};
  };

  extraOutputsToInstall = [ "man" "info" ];

  variables = {
    TERM              = "xterm-256color";
    LANG              = "en_US.UTF-8";
    LC_ALL            = "en_US.UTF-8";
    PAGER             = "less";
    EDITOR            = "emacsclient";
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
    ACLOCAL_PATH      = "$HOME/.nix-profile/share/aclocal";
    PKG_CONFIG_PATH   = "$HOME/.nix-profile/lib/pkgconfig";
    PKG_CONFIG_LIBDIR = "$HOME/.nix-profile/lib/pkgconfig";
    SSH_AUTH_SOCK     = "$HOME/.gnupg/S.gpg-agent.ssh";
    ZSH               = "$HOME/.nix-profile/share/oh-my-zsh";
    ZSH_CUSTOM        = "$HOME/.zsh/custom";
    ZSH_CACHE_DIR     = "$HOME/.zsh/cache";
    ZSH_THEME         = "sunrise";
    FZF_COMMON_OPTS   = "--select-1 --exit-0";
    FZF_CTRL_T_OPTS   = lib.concatStringsSep " " [
      "$FZF_COMMON_OPTS --preview"
      "'(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"
    ];
    FZF_CTRL_R_OPTS   = lib.concatStringsSep " " [
      "$FZF_COMMON_OPTS --preview"
      "'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview'"
    ];
    FZF_DEFAULT_OPTS  = lib.concatStringsSep " " [
      "--color dark,hl:33,hl+:37,fg+:235,bg+:234,fg+:254"
      "--color info:254,prompt:37,spinner:108,pointer:235,marker:235"
      "--reverse"
    ];
  };

  shellAliases = {
    mmv                  = "noglob zmv -W";
    ec                   = "emacsclient -nq";
    nix-env              = "nix-env -f '<nixpkgs>'";
    nix-build-out        = "nixBuildOut";
    nix-build-binding-as = "nixBuildBindingAs";
    nix-build-deps       = "nixBuildDeps";
    nix-runtime-deps     = "nixRuntimeDeps";
    nix-check-updates    = "nixCheckUpdates";
    nix-env-rebuild      = "nixEnvRebuild";
    fts                  = "ag --nobreak --nonumbers --noheading . | fzf";
  };

  systemPackages = [];
}
