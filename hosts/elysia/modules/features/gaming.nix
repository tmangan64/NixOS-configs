{ config, pkgs, ... }:

{
  # Home Manager packages
  home.packages = with pkgs; [
    #steam
    steam

    #for Minecraft
    prismlauncher
  ];
}
