let
  overlay =
    self: super: {
      # Ruby 2.6.6
      ruby = (import (builtins.fetchTarball {
        url = https://github.com/NixOS/nixpkgs-channels/archive/fa54dd346fe5e73d877f2068addf6372608c820b.tar.gz;
      }) {}).ruby;

      # Bundler 2.1.4
      bundler = (import (builtins.fetchTarball {
        url = https://github.com/NixOS/nixpkgs-channels/archive/fa54dd346fe5e73d877f2068addf6372608c820b.tar.gz;
      }) {}).bundler.override({
        ruby = self.ruby;
      });
    };

  nixpkgs =
    import (builtins.fetchTarball {
      url = https://releases.nixos.org/nixpkgs/nixpkgs-20.09pre236343.78215a8395f/nixexprs.tar.xz;
    }) {
      overlays = [ overlay ];
    };
in
with nixpkgs;
stdenv.mkDerivation {
  pname = "tatey.com";
  version = "1.0.0";
  buildInputs = [
    aws
    bundler
    direnv
    ruby
  ];
  shellHook = ''
    eval "$(direnv hook $SHELL)"
  '';
}
