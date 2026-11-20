{ config, pkgs, pkgs-unstable, lib, inputs, ... }:

{
  imports = [
    ./boot.nix
    ./users.nix
    ./networking.nix
    ./audio.nix
    ./packages.nix
    ./graphical.nix
    ./locale.nix
    ./virtualization.nix
    ./environment.nix
  ];
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  console.colors = [ "000000" "dc322f" "859900" "b58900" "268bd2" "d33682" "2aa198" "eee8d5" "002b36" "cb4b16" "586e75" "657b83" "839496" "6c71c4" "93a1a1" "fdf6e3" ];
}
