---
title: A minimal shell.nix example for managing system dependencies in Ruby on Rails projects
layout: post
---

The other day I was helping someone get started with [Nix](https://nixos.org). I wanted to give them the most minimal example of getting up and running with Nix and Ruby on Rails. No [niv](https://github.com/nmattia/niv). No [flakes](https://nixos.wiki/wiki/Flakes). Just a 14 line [shell.nix](https://github.com/tatey/nix_rails_example/blob/b83b5eafd2d5942fcbca5c81aec85727f9e9c05b/shell.nix).

You can think of using Nix to manage system dependencies like we use [Bundler](https://bundler.io) to manage application dependencies. Everything can be self contained to the working directory and your future self won't have to wrangle with different versions of Ruby, Node, or C libraries between projects.

# Step 1: Install nix

Follow the [official installation instructions](https://nixos.org/download.html#nix-install-macos) on NixOS. It is recommended to use the multi-user installation if you're on macOS or Linux. It should only take a few minutes.

# Step 2: Clone the example app and enter the Nix shell

1. Clone the example [Git repository](https://github.com/tatey/nix_rails_example) and change into the directory
2. Enter the Nix shell by running `$ nix-shell`. Verify you're in the Nix shell by running `$ which ruby` to see if Nix is in the path (E.g. /nix/store/vwa1c708p5447vjkk06f8xfvl66yy1wx-ruby-3.1.4/bin/ruby)
3. Try running the console `$ ./bin/rails console`

# Food for thought

We've only scratched the surface. To make your day-to-day usage more ergonomic consider the following:

- [Pin](https://nix.dev/tutorials/towards-reproducibility-pinning-nixpkgs#pinning-packages-with-urls-inside-a-nix-expression) nixpkgs to a specific Git reference to guarantee reproducibility. See an [example](https://github.com/tatey/nix_rails_example/blob/b83b5eafd2d5942fcbca5c81aec85727f9e9c05b/shell.nix#L4).
- Use [direnv](https://direnv.net) to automatically enter the Nix shell when you change directory. You'll want to hook direnv into your shell. See an [example](https://github.com/tatey/tatey.com/blob/57294f6d6f57bb017215bd9dc3d1cfcd00cd3603/shell.nix#L14).
- Use [bundler-app-dev-shell](https://github.com/thelookoutway/bundler-app-dev-shell) to isolate gems between directories
- Learn more about Nix on [Zero to Nix](https://zero-to-nix.com)

Thanks to [Brad Parker](https://bradparker.com) for introducing our team to Nix in 2020.
