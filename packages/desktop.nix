{ pkgs, ... }: {
  home.packages = with pkgs; [
    discord
    obsidian
    vlc
    spotify
    brave
    chromium
    tor-browser
    # teams
    # apt
    # aptly
    teams-for-linux
    go

  ];
}
