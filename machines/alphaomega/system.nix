{config, pkgs, ...}:
{
  system.userActivationScripts.alphaomegaSetup = {
    text = ''
      mkdir -p ~/.gnupg
      mkdir -p ~/.cache
      mkdir -p ~/.gnus
      mkdir -p ~/.config/alacritty
      mkdir -p ~/.config/darktooth
      mkdir -p ~/.config/git
      mkdir -p ~/.config/htop
      mkdir -p ~/.config/i3
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
      ln -sf /etc/per-user/i3/config ~/.config/i3/config
      ln -sf /etc/per-user/i3/status.toml ~/.config/i3/status.toml
      ln -sf /etc/per-user/nixpkgs/config.nix ~/.config/nixpkgs
      ln -sf /etc/per-user/npmrc ~/.npmrc
      ln -sf /etc/per-user/tmux/kube.tmux ~/.tmux/kube.tmux
      ln -sf /etc/per-user/tmux.conf ~/.tmux.conf

      mkdir -p ~/.config/nixpkgs/overlays
      for o in $(ls ~/projects/ptsirakidis/nix-config/overlays);
      do
      ln -sf ~/projects/ptsirakidis/nix-config/overlays/$o ~/.config/nixpkgs/overlays/$o
      done
      for o in $(ls ~/projects/ptsirakidis/nix-config/alphaomega/overlays);
      do
      ln -sf ~/projects/ptsirakidis/nix-config/alphaomega/overlays/$o ~/.config/nixpkgs/overlays/$o
      done
      ln -sf /etc/per-user/ptsirakidis/gitconfig ~/.gitconfig
      ln -sf /etc/per-user/ptsirakidis/gnus.el ~/.gnus.el
      ln -sf /etc/per-user/ptsirakidis/signature ~/.signature
      mkdir -p ~/.sbt/1.0/plugins
      mkdir -p ~/.sbt/gpg
      ln -sf /etc/per-user/ptsirakidis/sbt/1.0/global.sbt ~/.sbt/1.0/global.sbt
      ln -sf /etc/per-user/ptsirakidis/sbt/1.0/plugins/plugins.sbt ~/.sbt/1.0/plugins/plugins.sbt
      ln -sf /etc/per-user/ptsirakidis/sbt/1.0/sonatype.sbt ~/.sbt/1.0/sonatype.sbt
      mkdir -p ~/.ssh
      ln -sf /etc/per-user/ptsirakidis/ssh-config ~/.ssh/config
      ln -sf /etc/per-user/ptsirakidis/zshrc ~/.zshrc
    '';
    deps = [];
  };
}
