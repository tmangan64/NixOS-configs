{ config, pkgs, ... }:

{
  # Home Manager packages
  home.packages = with pkgs; [
    #steam
    steam

    #for prismlauncher
    prismlauncher
    gsettings-desktop-schemas
    xdg-desktop-portal
  ];
}
