{
  description = "Dev flake";

  inputs = {
    flakey-profile.url = "github:lf-/flakey-profile";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    # Pin a specific version like below. Find shas and versions from https://www.nixhub.io/
    # terragrunt.url = "github:nixos/nixpkgs/785feb91183a50959823ff9ba9ef673105259cd5";
  };

  outputs = { self, nixpkgs, flake-utils, flakey-profile, ...}@inputs:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
          config.allowUnfree = true;
        };
      in
      {
        packages.dev = flakey-profile.lib.mkProfile {
          inherit pkgs;
          paths = with pkgs; [
            # reference a pinned package like so
            # inputs.terragrunt.legacyPackages.${system}.terragrunt 
            terraform
            terragrunt
            ripgrep
            tldr
            starship
            neovim
            lua
            tree-sitter
            bat
            tree
            jq
            gh
            fzf
            direnv
            docker_27
            ffmpeg
            lazygit
            kubectl
            typescript
            docker
            go
            gopls
            rustc
            rustup
            cargo-watch
          ];
        };
      });
}

