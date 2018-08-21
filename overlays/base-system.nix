self: super:
let
  extraOutputsToInstall = [ "man" "doc" ];

  myProfile = super.writeText "my-profile" ''
    export PATH=$HOME/.nix-profile/bin:/nix/var/nix/profiles/default/bin:/sbin:/bin:/usr/sbin:/usr/bin
    export MANPATH=$HOME/.nix-profile/share/man:/nix/var/nix/profiles/default/share/man:/usr/share/man
    export INFOPATH=$HOME/.nix-profile/share/info:/nix/var/nix/profiles/default/share/info:/usr/share/info
 '';

in
{
  pinentry = super.pinentry.override {
    enableEmacs = true;
    ncurses = null;
    gcr = null;
    qt = null;
    gtk2 = null;
  };

  gnupg = super.gnupg.override {
    pinentry = self.pinentry;
    guiSupport = false;
  };

  mailToolsEnv = super.buildEnv {
    name = "mailTools";
    paths = [
      self.dovecot
      self.offlineimap
    ];
    inherit extraOutputsToInstall;
 };

 networkingToolsEnv = super.buildEnv {
   name = "networkingTools";
   paths = [
     self.curl
     self.mtr
     self.nghttp2
     self.nmap
     self.openssh
     self.rsync
     self.wget
   ];
   inherit extraOutputsToInstall;
  };

  systemToolsEnv = super.buildEnv {
    name = "systemTools";
    paths = [
      (super.runCommand "profile" {} ''
         mkdir -p $out/etc/profile.d
         cp ${myProfile} $out/etc/profile.d/my-profile.sh
       '')
      self.alacritty
      self.aspell
      self.aspellDicts.de
      self.aspellDicts.en
      self.bashInteractive
      self.bzip2
      self.cacert
      self.diffutils
      self.dos2unix
      self.exa
      self.fd
      self.findutils
      self.fzf
      self.gawk
      self.gnugrep
      self.gnupg
      self.gnused
      self.gnutls
      self.htop
      self.oh-my-zsh
      self.pinentry
      self.pwgen
      self.reattach-to-user-namespace
      self.ripgrep
      self.shellcheck
      self.silver-searcher
      self.tree
      self.tmux
      self.tmux-cssh
      self.which
      self.zsh
      self.zsh-autosuggestions
      self.zsh-completions
      self.zsh-syntax-highlighting
    ];
    extraOutputsToInstall = extraOutputsToInstall ++ [ "info" ];
    postBuild = ''
      if [ -x $out/bin/install-info -a -w $out/share/info ]; then
        shopt -s nullglob
        for i in $out/share/info/*.info $out/share/info/*.info.gz; do
          $out/bin/install-info $i $out/share/info/dir
        done
      fi
   '';
  };

  wmToolsEnv = super.buildEnv {
    name = "wmTools";
    paths = [
      # self.chunkwm
      self.qes
      self.skhd
    ];
    inherit extraOutputsToInstall;
   };
}
