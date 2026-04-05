{ config, pkgs, ... }:

{
  # Home Manager packages
  home.packages = with pkgs; [
    # Obsidian note-taking app
    obsidian

    # LibreOffice suite
    libreoffice

    #references
    zotero
    jdk

    #soulseek music torrent client
    nicotine-plus
    #spotify downloader
    spotdl
    
    #anime cli tool
    ani-cli

    #file transfer for server
    filezilla

    #:3
    tor
    tor-browser
    protonvpn-gui

    #cursor
    code-cursor

    google-chrome

    jellyfin
  ];

  programs.tmux.enable = true;
}
