{config, pkgs, ...}:
{
  system.userActivationScripts.alphaomegaSetup = {
    text = ''
      mkdir -p ~/.cache
      mkdir -p ~/.gnus
      mkdir -p ~/.config/alacritty
      mkdir -p ~/.config/fontconfig
      mkdir -p ~/.config/gtk-3.0
      mkdir -p ~/.config/git
      mkdir -p ~/.config/htop
      mkdir -p ~/.config/i3
      mkdir -p ~/.config/nixpkgs/overlays
      mkdir -p ~/.config/offlineimap
      mkdir -p ~/.config/rofi
      mkdir -p ~/.maildirs/hcag
      mkdir -p ~/.sbt/1.0/plugins
      mkdir -p ~/.sbt/gpg
      mkdir -p ~/.ssh
      mkdir -p ~/.tmux/plugins

      ln -sf /etc/dot-files/aspell.conf ~/.aspell.conf
      ln -sf /etc/dot-files/curlrc ~/.curlrc
      ln -sf /etc/dot-files/ctags ~/.ctags
      ln -sf /etc/dot-files/htoprc ~/.config/htop
      ln -sf /etc/dot-files/git/ignore ~/.config/git
      ln -sf /etc/dot-files/nixpkgs/config.nix ~/.config/nixpkgs
      ln -sf /etc/dot-files/npmrc ~/.npmrc

      ln -sf /etc/dot-files/alphaomega/alacritty/alacritty.yml ~/.config/alacritty/
      ln -sf /etc/dot-files/alphaomega/fonts.conf ~/.config/fontconfig/
      ln -sf /etc/dot-files/alphaomega/grobi.conf ~/.config/
      ln -sf /etc/dot-files/alphaomega/gtk-3.0/settings.ini ~/.config/gtk-3.0/
      ln -sf /etc/dot-files/alphaomega/i3/config ~/.config/i3/
      ln -sf /etc/dot-files/alphaomega/i3/status.toml ~/.config/i3/
      ln -sf /etc/dot-files/alphaomega/rofi/config ~/.config/rofi/
      ln -sf /etc/dot-files/alphaomega/tmux/plugins/kube.tmux ~/.tmux/plugins
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
      ln -sf /etc/dot-files/ptsirakidis/offlineimap/config ~/.config/offlineimap/config
      ln -sf /etc/dot-files/ptsirakidis/offlineimap/ca.crt ~/.config/offlineimap/ca.crt
      ln -sf /etc/dot-files/ptsirakidis/offlineimap/offlineimap.py ~/.config/offlineimap/offlineimap.py
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
