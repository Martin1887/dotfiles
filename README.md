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

## Add this repo as a submodule of your config repo (optional but recommended)

The NixOS configuration is recommended to be in a git repository as a flake.
Using a git repository the best manner of using this repository is including it
as a submodule, so it is inside your repository and you can update it:

```
git submodule add https://github.com/Martin1887/dotfiles
```

Usually you would want to do it inside the same directory of your home-manager
files.

Please read the documentation about git submodules at
https://git-scm.com/book/en/v2/Git-Tools-Submodules

## Referencing the configuration files in home-manager

To copy the files from the submodule you can use `home.file` as follows:

```
home.file."<file>" = {
    source = ./<path_to_submodule>/stow/<program>/<file>;
};
```

And for subtrees of `.config` something like:

```
xdg.configFile."<program>" = {
    source = ./<path_to_submodule>/stow/<program>/.config/<program>;
    recursive = true;
};
