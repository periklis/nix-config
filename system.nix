{ activationScripts }:
{
  activationScripts.extraUserActivation.text = activationScripts.extraUserActivation.text + ''
    mkdir -p ~/.config/htop
    ln -sf /etc/per-user/curlrc ~/.curlrc
    ln -sf /etc/per-user/ctags ~/.ctags
    ln -sf /etc/per-user/htoprc ~/.config/htop
    ln -sf /etc/per-user/gnupg/dirmgr.conf ~/.gnupg
    ln -sf /etc/per-user/gnupg/gpg-agent.conf ~/.gnupg
    ln -sf /etc/per-user/gnupg/gpg.conf ~/.gnupg
    ln -sf /etc/per-user/gnupg/scdaemon.conf ~/.gnupg
    ln -sf /etc/per-user/gnupg/sks-keyservers.netCA.pem ~/.gnupg
    ln -sf /etc/per-user/nixpkgs/config.nix ~/.config/nixpkgs
    ln -sf /etc/per-user/npmrc ~/.npmrc
  '';

  defaults = import ./preferences/defaults.nix {};
  stateVersion = 3;
}
