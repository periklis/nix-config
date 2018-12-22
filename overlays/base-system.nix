self: super:
{
  mailToolsEnv = super.buildEnv {
    name = "mailTools";
    paths = [
      self.dovecot
      self.offlineimap
    ];
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
  };

  systemToolsEnv = super.buildEnv {
    name = "systemTools";
    paths = [
      self.alacritty
      self.aspell
      self.aspellDicts.de
      self.aspellDicts.en
      self.bashInteractive
      self.bat
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
      self.pwgen
      self.restic
      self.ripgrep
      self.shellcheck
      self.silver-searcher
      self.tree
      self.tmux
      self.tmux-cssh
      self.vim
      self.which
      self.zsh-autosuggestions
      self.zsh-completions
      self.zsh-syntax-highlighting
    ];
  };
}
