# Dotfiles

The dotfiles are managed with stow for symlinking.


## Clone

This repo has submodules. Clone those as well.

```bash
git clone --recursive https://github.com/Crytlig/dotfiles
```

## Update

```bash
git submodule update --recursive --remote
```


## git-crypt

Some files are encrypted with git-crypt

```bash
git-crypt status
```

```bash
git-crypt lock
```

## Import keys

Import the public and private keys

```bash
gpg --import gpg-pub.asc
gpg --import gpg-sc.asc
```

```bash
git-crypt unlock
```

or use the crypt key

```bash
git-crypt unlock ~/git-crypt-key
```


## Flake

Any extra arguments to mkProfile are forwarded directly to pkgs.buildEnv.

### Usage:
Switch to this flake:

`nix run ~/dotfiles/#dev.switch`

Revert a dev change (note: does not revert pins):
`nix run ~/dotfiles/#dev.rollback`

Build, without switching:
`nix build ~/dotfiles/#dev`
