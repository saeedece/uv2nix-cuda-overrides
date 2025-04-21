{
  pkgs,
  ...
}:
old: {
  buildInputs =
    (old.buildInputs or [ ])
    ++ (with pkgs.cudaPackages; [
      cuda_cudart
      cuda_cupti
      cuda_nvrtc
      cudnn
      cusparselt
      libcublas
      libcufft
      libcurand
      libcusolver
      libcusparse
      nccl
    ]);
}
