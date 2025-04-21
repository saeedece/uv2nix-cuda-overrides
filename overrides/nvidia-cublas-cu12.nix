{ _final, ... }:
old: {
  postInstall =
    old.postInstall or ""
    + ''
      rm -rf $out/${_final.python.sitePackages}/nvidia/__pycache__/__init__*
    '';
}
