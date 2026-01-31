{ pkgs, inputs, ... }:

{
  programs.fish = {
    enable = true;

    shellAliases = {
      ll = "ls -lah";
      gs = "git status";
    };

    interactiveShellInit = 
    "fastfetch";
  };

  programs.kitty = {
  enable = true;
  shellIntegration.enableFishIntegration = true;

  settings = {
    linux_display_server = "x11";
    shell = "fish";
  };
  };

  home.packages = with pkgs; [
    fastfetch
    inputs.curd.packages.${pkgs.system}.default
    kew
    lidarr
    prowlarr
    qbittorrent
  ];
}
