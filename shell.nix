let
  nixpkgs =
    import (builtins.fetchTarball {
      url = https://github.com/NixOS/nixpkgs/archive/f096b7122ab08e93c8b052c92461ca71b80c0cc8.tar.gz;
    }) { };
in
nixpkgs.mkShell {
  buildInputs = [
    nixpkgs.awscli2
    nixpkgs.direnv
    nixpkgs.ruby_3_0
  ];
  shellHook = ''
    eval "$(direnv hook $SHELL)"
  '';
}
