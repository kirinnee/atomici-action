{ nixpkgs ? import <nixpkgs> { } }:
let
  pkgs = {
    latest = (
      with nixpkgs;
      { }
    );
    atomi = (
      with import (fetchTarball "https://github.com/kirinnee/test-nix-repo/archive/refs/tags/v8.0.2.tar.gz");
      {
        inherit gitlint pls sg;
      }
    );
    "Unstable 15th August 2022" = (
      with import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/441dc5d512153039f19ef198e662e4f3dbb9fd65.tar.gz") { };
      {
        inherit pre-commit git shfmt shellcheck nixpkgs-fmt coreutils sd;
        pnpm = nodePackages.pnpm;
        prettier = nodePackages.prettier;
      }
    );
  };
in
pkgs.latest //
pkgs.atomi //
pkgs."Unstable 15th August 2022"
