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
    
    #anime cli tool
    ani-cli
  ];

  programs.tmux.enable = true;
}
