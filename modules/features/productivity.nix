{ config, pkgs, ... }:

{
  # Home Manager packages
  home.packages = with pkgs; [
    # Obsidian note-taking app
    obsidian

    # LibreOffice suite
    libreoffice
  ];

  programs.tmux.enable = true;
}
