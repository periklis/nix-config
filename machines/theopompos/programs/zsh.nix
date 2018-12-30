{}:
{
  enable                   = true;
  enableCompletion         = true;
  enableFzfCompletion      = true;
  enableFzfHistory         = true;
  enableSyntaxHighlighting = true;

  loginShellInit = ''
    nixBuildOut() {
      nix-store --tree -q $(nix-store -q --outputs $(nix-instantiate '<nixpkgs>' -A $1))
    }

    nixBuildBindingAs() {
      nix-store -q --referrers $(nix-store -q --binding $1 $(nix-store -qd $(which $2)))
    }

    nixBuildDeps() {
      nix-store --tree -q $(nix-instantiate '<nixpkgs>' -A $1)
    }

    nixRuntimeDeps() {
      nix-store -q --tree $(nix-store -qR $(nix-instantiate '<nixpkgs>' -A $1))
    }

    nixCheckUpdates() {
      for p in $(nix-env -f '<nixpkgs>' -q);
      do
        nix-env -f '<nixpkgs>' -i --dry-run $p
      done
    }

    nixEnvRebuild() {
      for p in $(nix-env -f '<nixpkgs>' -q);
      do
        local res=$(nix-env -f '<nixpkgs>' -i --dry-run $p 2>&1 | grep -cE "derivations|paths")
        if [ "$res" -gt "0" ]; then
          nix-env -f '<nixpkgs>' -i $p
        fi
      done
    }
  '';

  interactiveShellInit = ''
    plugins=(
      cp
      docker
      docker-compose
      emacs
      git
      git-extras
      history
      history-substring-search
      kubectl
      man
      nix
      node
      npm
      osx
      sbt
      scala
      sudo
      themes
      vagrant
      yarn
      web-search
    )
  '';

  promptInit = ''
    autoload -U promptinit && promptinit && prompt walters
    source $ZSH/oh-my-zsh.sh
  '';
}
