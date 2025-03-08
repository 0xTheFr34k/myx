{ pkgs, config, ... }: {
  home.packages = with pkgs; [
    exegol
    wget
    docker
    eza
    ripgrep
    jq
    fd
    bat
    uv
    xsel
    tree
    zip
    unzip
    moreutils
    btop
    tmux
    alacritty
    lunarvim
    nerd-fonts.jetbrains-mono
    direnv
    devenv
    lazygit
    lazydocker
    updog
  ];

}
