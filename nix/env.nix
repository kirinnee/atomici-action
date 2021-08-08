{ nixpkgs ? import <nixpkgs> { } }:
let pkgs = import ./packages.nix { inherit nixpkgs; }; in
with pkgs;
{
  minimal = [
    pls
    git
    coreutils
  ];
  lint = [
    gitlint
    pre-commit
    nixpkgs-fmt
    prettier
    sg
    shfmt
    shellcheck
  ];
  releaser = [
    pnpm
    sg
    prettier
  ];
}
