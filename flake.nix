{
  description = "A collection of uv2nix overrides for python packages that ship their own CUDA binaries.";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs =
    {
      self,
      nixpkgs,
    }:
    let
      inherit (nixpkgs) lib;

      # helper functions
      collectNix = path: lib.filter (lib.hasSuffix ".nix") (lib.filesystem.listFilesRecursive path);
      stemOf =
        path:
        let
          file = builtins.baseNameOf path;
          pieces = lib.splitString "." file;
        in
        builtins.head pieces;

      # extract overrides
      overrides =
        pkgs: _final: _prev:
        lib.listToAttrs (
          map (p: rec {
            name = stemOf p;
            value = _prev."${name}".overrideAttrs (import p { inherit pkgs _final _prev; });
          }) (collectNix ./overrides)
        );
    in
    {
      inherit overrides;
    };
}
