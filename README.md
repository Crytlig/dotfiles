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

Use either the krypt key

```bash
git-crypt unlock ~/git-crypt-key
```

Or export the GPG key and use that





