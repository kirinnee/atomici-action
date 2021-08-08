{ nixpkgs ? import <nixpkgs> { } }:
let env = import ./env.nix { inherit nixpkgs; }; in
{
  dev = nixpkgs.mkShell {
    buildInputs = env.minimal ++ env.lint ++ [ ];
  };
  lint-ci = nixpkgs.mkShell {
    buildInputs = env.minimal ++ env.lint ++ [ ];
  };
  releaser = nixpkgs.mkShell {
    buildInputs = env.releaser;
  };
}
