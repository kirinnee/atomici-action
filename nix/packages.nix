{ nixpkgs ? import <nixpkgs> { } }:
let pkgs = {
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
  "nix 21.05 4th August 2021" = (
    with import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/d867206bb8a434cb55de1155cf65118919574b67.tar.gz") { };
    {
      inherit pre-commit git shfmt shellcheck nixpkgs-fmt coreutils sd;
    }
  );
  "nix Unstable 4th August 2021" = (
    with import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/39bce8345f32d0c37b4b7154f66aa6a8c8700c25.tar.gz") { };
    {
      pnpm = nodePackages.pnpm;
      prettier = nodePackages.prettier;
    }
  );
}; in
pkgs.latest //
pkgs.atomi //
pkgs."nix 21.05 4th August 2021" //
pkgs."nix Unstable 4th August 2021"
