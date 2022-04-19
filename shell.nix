let
  nixpkgs =
    import (builtins.fetchTarball {
      url = https://github.com/NixOS/nixpkgs/archive/7f58f36cd5bdc99f36ddaae320c49b5a6340ce43.tar.gz;
    }) { };
in
nixpkgs.mkShell {
  buildInputs = [
    nixpkgs.awscli2
    nixpkgs.ruby_3_0
  ];
  shellHook = ''
    eval "$(direnv hook $SHELL)"
  '';
}
