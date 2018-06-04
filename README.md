# Nix-Config

This project defines my declarative multi-machine macOS machine configuration. It is based [nix](https://github.com/nixos) and [nix-darwin](https://github.com/lnl7/nix-darwin) and makes use of submodules for tracking dependencies.

# Rationale

The main objective for this project is to have single machine configurations with extensions for machine dependent configs. In addition the setup of new machine should be as easy as running a single script beyond creating access credentials to repositories. The following requirements are met:

- Single script boostrap process
- Shareable across machines
- Extendability for machine-specific and per-user specific configurations
- Follows a declarative programming model for the system configuration
- Explicit dependency management for `nix-darwin`, `nixpkgs` and machine configurations

The following requirements are missing:

- Pinning for dependencies
- Integration of [dot-emacs](https://github.com/periklis/dot-emacs) configuration
- Integration of emacs package management
- Integration of Applications management

# Boostrap

To bootstrap this project a new macOS machine, you have to run the following script only:

```Shell
$ curl https://raw.githubusercontent.com/periklis/nix-config/master/bin/bootstrap | sh $USERNAME $MACHINE_NAME $TARGET_NIXPGS_BRANCH
```

# Acknowledgments
This in projects is inspired on the work of other giants in the open source community, thus i would like to thank:
- [John Wiegley's](https://github.com/jwiegley/) inspiring [nix-config](https://github.com/jwiegley/nix-config)
- [Daiderd Jordan](https://github.com/lnl7/) for the amazing [nix-darwin](https://github.com/lnl7/nix-darwin)
