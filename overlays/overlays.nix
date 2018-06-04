[
  (self: super:
    let
      extraOutputsToInstall = [ "man" "doc" ];

      myProfile = super.writeText "my-profile" ''
        export PATH=$HOME/.nix-profile/bin:/nix/var/nix/profiles/default/bin:/sbin:/bin:/usr/sbin:/usr/bin
        export MANPATH=$HOME/.nix-profile/share/man:/nix/var/nix/profiles/default/share/man:/usr/share/man
        export INFOPATH=$HOME/.nix-profile/share/info:/nix/var/nix/profiles/default/share/info:/usr/share/info
      '';
    in
    {
      gitMinimalWithManual = super.gitMinimal.override {
        withManual = true;
      };

      cppToolsEnv = super.buildEnv {
        name = "cppTools";
        paths = [
          self.boost
          self.clang-tools
          self.cmake
          self.cppcheck
          self.gdb
          self.libcxx
          self.libcxxabi
          self.qcachegrind
          self.rtags
          self.stdman
          self.valgrind
        ];
        inherit extraOutputsToInstall;
      };

      elmToolsEnv = super.buildEnv {
        name = "elmTools";
        paths = [
          self.elmPackages.elm
        ];
        inherit extraOutputsToInstall;
      };

      emacsToolsEnv = super.buildEnv {
        name = "emacsTools";
        paths = [
          self.emacs
          self.multimarkdown
          self.poppler
          self.universal-ctags
          self.haskellPackages.pandoc
        ];
        inherit extraOutputsToInstall;
      };

      emscriptenToolsEnv = super.buildEnv {
        name = "emscriptenTools";
        paths = [
          self.emscripten
          self.yasm
        ];
        inherit extraOutputsToInstall;
      };

      gitToolsEnv = super.buildEnv {
        name = "gitTools";
        paths = [
          self.gitMinimalWithManual
          self.gitAndTools.git-extras
          self.patch
          self.patchutils
        ];
        inherit extraOutputsToInstall;
      };

      goToolsEnv = super.buildEnv {
        name = "goTools";
        paths = [
          self.glide
          self.go
          self.go2nix
        ];
        inherit extraOutputsToInstall;
      };

      javaToolsEnv = super.buildEnv {
        name = "javaTools";
        paths = [
          self.ant
          self.maven
          self.jmeter
          self.openjdk
        ];
        inherit extraOutputsToInstall;
      };

      jsToolsEnv = super.buildEnv {
        name = "jsTools";
        paths = [
          self.nodejs-9_x
          self.nodePackages_6_x.eslint_d
          # self.nodePackages_6_x.import_js # Not yet packaged in master
          self.nodePackages_6_x.prettier
          # self.nodePackages_6_x.reveal-md # Not yet packaged in master
          self.nodePackages_6_x.tern
          # self.nodePackages_6_x.tern-jsx  # Not yet packaged in master
          self.nodePackages_6_x.typescript
          # self.phantomjs2                 # Not yet packaged for darwin
          self.yarn
        ];
        inherit extraOutputsToInstall;
      };

      langToolsEnv = super.buildEnv {
        name = "langTools";
        paths = [
          self.autoconf
          self.automake
          self.global
          self.gnum4
          self.gnumake
          self.libtool
          self.pkgconfig
        ];
        inherit extraOutputsToInstall;
      };

      mailToolsEnv = super.buildEnv {
        name = "mailTools";
        paths = [
          self.dovecot
          self.offlineimap
        ];
        inherit extraOutputsToInstall;
      };

      networkingToolsEnv = super.buildEnv {
        name = "networkingTools";
        paths = [
          self.curl
          self.mtr
          self.nghttp2
          self.nmap
          self.openssh
          self.rsync
          self.wget
        ];
        inherit extraOutputsToInstall;
      };

      nixToolsEnv = super.buildEnv {
        name = "nixTools";
        paths = [
          self.nix
          self.nixops
          self.nix-prefetch-git
          self.nix-zsh-completions
        ];
        inherit extraOutputsToInstall;
      };

      nixUtilitiesEnv = super.buildEnv {
        name = "nixUtilities";
        paths = [
          self.nix-index
          self.vulnix
          # self.haskellPackages.nix-delegate
          # self.haskellPackages.nix-deploy
          # self.haskellPackages.nix-diff
        ];
        inherit extraOutputsToInstall;
      };

      scalaToolsEnv = super.buildEnv {
        name = "scalaTools";
        paths = [
          self.ammonite
          self.sbt
          self.scala
          self.scalafmt
        ];
        inherit extraOutputsToInstall;
      };

      systemToolsEnv = super.buildEnv {
        name = "systemTools";
        paths = [
          (super.runCommand "profile" {} ''
            mkdir -p $out/etc/profile.d
            cp ${myProfile} $out/etc/profile.d/my-profile.sh
          '')
          self.aspell
          self.aspellDicts.de
          self.aspellDicts.en
          self.bashInteractive
          self.bzip2
          self.cacert
          self.diffutils
          self.dos2unix
          self.findutils
          self.fzf
          self.gawk
          self.gnugrep
          self.gnupg
          self.gnused
          self.gnutls
          self.htop
          self.oh-my-zsh
          self.pinentry_mac
          self.pwgen
          self.shellcheck
          self.silver-searcher
          self.tree
          self.which
          self.zsh
          self.zsh-autosuggestions
          self.zsh-completions
          self.zsh-syntax-highlighting
        ];
        extraOutputsToInstall = extraOutputsToInstall ++ [ "info" ];
        postBuild = ''
          if [ -x $out/bin/install-info -a -w $out/share/info ]; then
          shopt -s nullglob
          for i in $out/share/info/*.info $out/share/info/*.info.gz; do
          $out/bin/install-info $i $out/share/info/dir
          done
          fi
        '';
      };

      phpToolsEnv = super.buildEnv {
        name = "phpTools";
        paths = [
          self.php
          self.phpPackages.apcu
          self.phpPackages.composer
        ];
        inherit extraOutputsToInstall;
      };

      rustToolsEnv = super.buildEnv {
        name = "rustTools";
        paths = [
          self.rustup
          self.rustracer
        ];
        inherit extraOutputsToInstall;
      };

      virtualizationToolsEnv = super.buildEnv {
        name = "virtualizationTools";
        paths = [
          self.docker
          self.docker-machine
          self.python36Packages.docker_compose
          self.socat
          self.vagrant
        ];
        inherit extraOutputsToInstall;
      };

      wmToolsEnv = super.buildEnv {
        name = "wmTools";
        paths = [
          self.qes
          self.skhd
        ];
        inherit extraOutputsToInstall;
      };
    }
  )
]
