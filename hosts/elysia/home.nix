{ config, pkgs, ... }:

{
  home.username = "mizutani";
  home.homeDirectory = "/home/mizutani";
  home.stateVersion = "24.05";

  # Remember to 'git add' any new modules you create!!!

  imports = [
    ./modules/home-manager/terminal.nix
    ./modules/features/productivity.nix
    ./modules/features/gaming.nix
  ];

  nixpkgs.config.allowUnfree = true;
}