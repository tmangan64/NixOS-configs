{ config, pkgs, ... }:

{
  home.username = "mizutani";
  home.homeDirectory = "/home/mizutani";
  home.stateVersion = "24.05";

  imports = [
  ../../modules/home-manager/terminal.nix
  ../../modules/features/productivity.nix
];

  nixpkgs.config.allowUnfree = true;

}

