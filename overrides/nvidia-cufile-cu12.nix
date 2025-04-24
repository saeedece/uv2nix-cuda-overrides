{ pkgs, ... }:
old: {
  buildInputs =
    (old.buildInputs or [ ])
    ++ (with pkgs.cudaPackages; [
      libcufile
    ]);
  dontUsePyprojectBytecode = true;
}
