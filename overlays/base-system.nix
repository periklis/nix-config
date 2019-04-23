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
     self.bind
     self.nghttp2
     self.nmap
     self.tcpdump
     self.tshark
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
      self.bat
      self.cacert
      self.dos2unix
      self.exa
      self.fd
      self.fzf
      self.gnutls
      self.htop
      self.pwgen
      self.restic
      self.ripgrep
      self.shellcheck
      self.silver-searcher
      self.tree
      self.tmux
      self.tmux-cssh
      self.vim
    ];
  };
}
