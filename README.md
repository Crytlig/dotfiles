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

