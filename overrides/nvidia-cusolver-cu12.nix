{ pkgs, ... }:
old: {
  buildInputs =
    (old.buildInputs or [ ])
    ++ (with pkgs.cudaPackages; [
      libcublas
      libcusparse
      libnvjitlink
    ]);
  dontUsePyprojectBytecode = true;
}
