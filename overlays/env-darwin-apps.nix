self: super:
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

  darwinAppsEnv = super.buildEnv {
    name = "darwinApps";
    paths = [
      self.nix
      self.pinentry_mac
      self.reattach-to-user-namespace
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
