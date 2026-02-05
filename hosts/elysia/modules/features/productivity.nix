{ config, pkgs, ... }:

{
  # Home Manager packages
  home.packages = with pkgs; [
    # Obsidian note-taking app
    obsidian

    # LibreOffice suite
    libreoffice

    #soulseek music torrent client
    nicotine-plus
    #spotify downloader
    spotdl
  ];

  programs.tmux.enable = true;
}
