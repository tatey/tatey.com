let
  nixpkgs =
    import (builtins.fetchTarball {
      url = https://github.com/NixOS/nixpkgs/archive/bf689c40d035239a489de5997a4da5352434632e.tar.gz;
    }) { };
in
nixpkgs.mkShell {
  buildInputs = [
    nixpkgs.ruby_3_3
    nixpkgs.bundler
    nixpkgs.awscli2
    nixpkgs.libffi
  ];
  shellHook = ''
    eval "$(direnv hook $SHELL)"
  '';
}
