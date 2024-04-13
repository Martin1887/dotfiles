Configuration files for several applications and keyboard mappings ready to use
with stow and home-manager.

# stow

The configuration files outside of the `stow` directory cannot be installed
simply using stow or manual symbolic links to the home folder because their
files reside in other locations or they need additional instructions. Please
read the `README.md` file of those directories to install/uninstall them.

To re-apply the configuration files managed by stow for all folders use the
command

```
make
```

To delete the dotfiles for them use

```
make delete
```

# home-manager and NixOS

Nix flakes do not handle git submodules well, so the best manner to
include this repository is as an additional non-flake input:

```nix
inputs = {
  ...
  dotfiles = {
    url = "github:Martin1887/dotfiles";
    flake = false;
  };
```

Then, you can pass the input to home-manager as a `extraSpecialArg`.
For example, if using home-manager as a module:

```nix
outputs = { self, nixpkgs, home-manager, dotfiles, ...}:
  nixosConfigurations = {
    "myhost" = nixpkgs.lib.nixosSystem {
      ...
      modules = [
        ...
        home-manager.nixosModules.home-manager {
          ...
          home-manager.extraSpecialArgs = {
            dotfiles = dotfiles;
          };
        }
      ];
    };
  };
  ...
};
```

To link the files from dotfiles you can use `home.file` as follows:

```nix
home.file."<file>" = {
    source = "${dotfiles}/stow/<program>/<file>";
};
```

And for subtrees of `.config` something like:

```nix
xdg.configFile."<program>" = {
    source = "${dotfiles}/stow/<program>/.config/<program>";
    recursive = true;
};
```

A handy function to automatically read all files in the `stow`
subdirectory of the dotfiles repository with low priority (to
give more priority to your Nix configurations) is:

```nix
{ lib, dotfiles, ... }:

{
  home.file = with builtins; with lib; pipe "${dotfiles}/stow" [
    filesystem.listFilesRecursive
    (filter (file: ! hasSuffix ".nix" file))
    (filter (file: ! hasSuffix "README.md" file))
    (map (file: {
      # remove the prefix and the first folder after that (application name)
      name = unsafeDiscardStringContext (concatStringsSep "/" (tail (splitString "/" (removePrefix "${dotfiles}/stow/" (toString file)))));
      value = { source = mkOverride 2000 file; };
    }))
    listToAttrs
  ];
}
```

