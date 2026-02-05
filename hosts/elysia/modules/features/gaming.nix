{ config, pkgs, ... }:

{
  # Home Manager packages
  home.packages = [
    pkgs.steam
  ];
}
