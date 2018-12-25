{config, pkgs, ...}:
{
  system.userActivationScripts.alphaomegaSetup = {
    text = ''
      mkdir -p ~/.cache
      mkdir -p ~/.gnus
      mkdir -p ~/.config/alacritty
      mkdir -p ~/.config/darktooth
      mkdir -p ~/.config/git
      mkdir -p ~/.config/htop
      mkdir -p ~/.config/i3
      mkdir -p ~/.config/nixpkgs/overlays
      mkdir -p ~/.sbt/1.0/plugins
      mkdir -p ~/.sbt/gpg
      mkdir -p ~/.ssh
      mkdir -p ~/.tmux

      ln -sf /etc/dot-files/aspell.conf ~/.aspell.conf
      ln -sf /etc/dot-files/curlrc ~/.curlrc
      ln -sf /etc/dot-files/ctags ~/.ctags
      ln -sf /etc/dot-files/darktooth/darktooth.sh ~/.config/darktooth/
      ln -sf /etc/dot-files/htoprc ~/.config/htop
      ln -sf /etc/dot-files/git/ignore ~/.config/git
      ln -sf /etc/dot-files/nixpkgs/config.nix ~/.config/nixpkgs
      ln -sf /etc/dot-files/npmrc ~/.npmrc

      ln -sf /etc/dot-files/alphaomega/alacritty/alacritty.yml ~/.config/alacritty/
      ln -sf /etc/dot-files/alphaomega/grobi.conf ~/.config/grobi.conf
      ln -sf /etc/dot-files/alphaomega/i3/config ~/.config/i3/config
      ln -sf /etc/dot-files/alphaomega/i3/status.toml ~/.config/i3/status.toml
      ln -sf /etc/dot-files/alphaomega/tmux/kube.tmux ~/.tmux/kube.tmux
      ln -sf /etc/dot-files/alphaomega/tmux.conf ~/.tmux.conf
      ln -sf /etc/dot-files/alphaomega/Xresources ~/.Xresources

      for o in $(ls ~/projects/ptsirakidis/nix-config/overlays);
      do
        ln -sf ~/projects/ptsirakidis/nix-config/overlays/$o ~/.config/nixpkgs/overlays/$o
      done

      for o in $(ls ~/projects/ptsirakidis/nix-config/alphaomega/overlays);
      do
        ln -sf ~/projects/ptsirakidis/nix-config/alphaomega/overlays/$o ~/.config/nixpkgs/overlays/$o
      done

      ln -sf /etc/dot-files/ptsirakidis/gitconfig ~/.gitconfig
      ln -sf /etc/dot-files/ptsirakidis/gnus.el ~/.gnus.el
      ln -sf /etc/dot-files/ptsirakidis/signature ~/.signature
      ln -sf /etc/dot-files/ptsirakidis/sbt/1.0/global.sbt ~/.sbt/1.0/global.sbt
      ln -sf /etc/dot-files/ptsirakidis/sbt/1.0/plugins/plugins.sbt ~/.sbt/1.0/plugins/plugins.sbt
      ln -sf /etc/dot-files/ptsirakidis/sbt/1.0/sonatype.sbt ~/.sbt/1.0/sonatype.sbt
      ln -sf /etc/dot-files/ptsirakidis/ssh-config ~/.ssh/config
      ln -sf /etc/dot-files/ptsirakidis/zshrc ~/.zshrc
    '';
    deps = [];
  };
}
