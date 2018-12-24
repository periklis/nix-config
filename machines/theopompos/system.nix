{ activationScripts }:
{
  activationScripts.extraUserActivation.text = activationScripts.extraUserActivation.text + ''
    mkdir -p ~/.gnupg
    mkdir -p ~/.cache
    mkdir -p ~/.gnus
    mkdir -p ~/.config/alacritty
    mkdir -p ~/.config/darktooth
    mkdir -p ~/.config/git
    mkdir -p ~/.config/htop
    mkdir -p ~/.config/nixpkgs
    mkdir -p ~/.tmux

    ln -sf /etc/per-user/alacritty/alacritty.yml ~/.config/alacritty/
    ln -sf /etc/per-user/aspell.conf ~/.aspell.conf
    ln -sf /etc/per-user/curlrc ~/.curlrc
    ln -sf /etc/per-user/ctags ~/.ctags
    ln -sf /etc/per-user/darktooth/darktooth.sh ~/.config/darktooth/
    ln -sf /etc/per-user/htoprc ~/.config/htop
    ln -sf /etc/per-user/git/ignore ~/.config/git
    ln -sf /etc/per-user/gnupg/dirmngr.conf ~/.gnupg
    ln -sf /etc/per-user/gnupg/gpg-agent.conf ~/.gnupg
    ln -sf /etc/per-user/gnupg/gpg.conf ~/.gnupg
    ln -sf /etc/per-user/gnupg/scdaemon.conf ~/.gnupg
    ln -sf /etc/per-user/gnupg/sks-keyservers.netCA.pem ~/.gnupg
    ln -sf /etc/per-user/nixpkgs/config.nix ~/.config/nixpkgs
    ln -sf /etc/per-user/npmrc ~/.npmrc
    ln -sf /etc/per-user/tmux.conf ~/.tmux.conf
  '';

  defaults = import ./preferences/defaults.nix {};
  stateVersion = 3;
}
