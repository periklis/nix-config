# Nix-Config

This project defines my declarative multi-machine macOS machine configuration. It is based [nix][nixos] and [nix-darwin][nix-darwin] and makes use of sub-modules for tracking dependencies.

# Rationale

The main objective for this project is to have single machine configurations with extensions for machine dependent configurations. In addition the setup of new machine should be as easy as running a single script beyond creating access credentials to repositories. The following requirements are met:

- Single script bootstrap process
- Shareable across machines
- Extensible for machine-specific and per-user specific configurations
- Follows a declarative programming model for the system configuration
- Explicit dependency management for `nix-darwin`, `nixpkgs` and machine configurations
- Integration of Emacs package management

The following requirements are missing:

- Pinning for dependencies
- Integration of [dot-emacs][dot-emacs] configuration
- Integration of Applications management (e.g. [jwiegley's apps overlay](https://github.com/jwiegley/nix-config/blob/master/overlays/30-apps.nix))

# Bootstrap

To bootstrap this project a new macOS machine, you have to run the following script only:

```Shell
$ curl https://raw.githubusercontent.com/periklis/nix-config/master/bin/bootstrap |  \
  bash -s -- $USERNAME $MACHINE_NAME $TARGET_NIXPGS_BRANCH
```

# Acknowledgments
This in projects is inspired on the work of other giants in the open source community, thus i would like to thank:
- [John Wiegley's][jwiegley] inspiring [nix-config][nix-jw-config]
- [Daiderd Jordan][lnl7] for the amazing [nix-darwin][nix-darwin]
- [Matthew Justin Bauer][matthewbauer] for the single script bootstrap idea in [bauer][bauer-nix]

# License

**nix-config** is licensed under the MIT license, available at http://opensource.org/licenses/MIT and also in the [LICENSE](https://github.com/periklis/nix-config/blob/master/LICENSE) file.

[bauer-nix]: https://github.com/matthewbauer/bauer
[dot-emacs]: https://github.com/periklis/dot-emacs
[jwiegley]: https://github.com/jwiegley/
[lnl7]: https://github.com/lnl7/
[matthewbauer]: https://github.com/matthewbauer/
[nixos]: https://github.com/nixos
[nix-darwin]: https://github.com/lnl7/nix-darwin
[nix-jw-config]: https://github.com/jwiegley/nix-config
