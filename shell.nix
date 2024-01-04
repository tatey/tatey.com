let
  nixpkgs =
    import (builtins.fetchTarball {
      url = https://github.com/NixOS/nixpkgs/archive/d44d59d2b5bd694cd9d996fd8c51d03e3e9ba7f7.tar.gz;
    }) { };
in
nixpkgs.mkShell {
  buildInputs = [
    nixpkgs.ruby_3_2
    nixpkgs.bundler
    nixpkgs.awscli2
  ];
  shellHook = ''
    eval "$(direnv hook $SHELL)"
  '';
}
