{ pkgs, ... }: {
  home.packages = with pkgs; [
    discord
    obsidian
    vlc
    spotify
    brave
    chromium
  ];
}
