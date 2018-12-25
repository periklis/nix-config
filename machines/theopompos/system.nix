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

    ln -sf /etc/dot-files/aspell.conf ~/.aspell.conf
    ln -sf /etc/dot-files/curlrc ~/.curlrc
    ln -sf /etc/dot-files/ctags ~/.ctags
    ln -sf /etc/dot-files/darktooth/darktooth.sh ~/.config/darktooth/
    ln -sf /etc/dot-files/htoprc ~/.config/htop
    ln -sf /etc/dot-files/git/ignore ~/.config/git
    ln -sf /etc/dot-files/gnupg/dirmngr.conf ~/.gnupg
    ln -sf /etc/dot-files/gnupg/gpg-agent.conf ~/.gnupg
    ln -sf /etc/dot-files/gnupg/gpg.conf ~/.gnupg
    ln -sf /etc/dot-files/gnupg/scdaemon.conf ~/.gnupg
    ln -sf /etc/dot-files/gnupg/sks-keyservers.netCA.pem ~/.gnupg
    ln -sf /etc/dot-files/nixpkgs/config.nix ~/.config/nixpkgs
    ln -sf /etc/dot-files/npmrc ~/.npmrc

    ln -sf /etc/dot-files/theopompos/alacritty/alacritty.yml ~/.config/alacritty/
    ln -sf /etc/dot-files/theopompos/tmux.conf ~/.tmux.conf
  '';

  defaults = import ./preferences/defaults.nix {};
  stateVersion = 3;
}
