self: super:
{
  darwinAppsEnv = super.buildEnv {
    name = "darwinApps";
    paths = [
      self.bzip2
      self.curl
      self.diffutils
      self.findutils
      self.gawk
      self.gnugrep
      self.gnused
      self.gnupg
      self.mtr
      self.netcat
      self.nix
      self.nix-zsh-completions
      self.oh-my-zsh
      self.openssh
      self.patch
      self.reattach-to-user-namespace
      self.rsync
      self.which
      self.zsh-autosuggestions
      self.zsh-completions
      self.zsh-syntax-highlighting
    ];
  };

  wmToolsEnv = super.buildEnv {
    name = "wmTools";
    paths = [
      # self.chunkwm
      self.qes
      self.skhd
    ];
  };
}
