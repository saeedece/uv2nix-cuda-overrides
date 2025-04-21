{ pkgs, ... }:
old: {
  buildInputs =
    (old.buildInputs or [ ])
    ++ (with pkgs.cudaPackages; [
      libnvjitlink
    ]);
  dontUsePyprojectBytecode = true;
}
