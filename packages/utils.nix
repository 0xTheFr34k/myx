{ pkgs, config, ... }: {
  home.packages = with pkgs; [
    # distrobox
    exegol
    xorg.xhost
    wget
    docker
    eza
    ripgrep
    jq
    gnumake
    fd
    bat
    uv
    xsel
    tree
    zip
    unzip
    moreutils
    btop
    pipx
    tmux
    alacritty
    lunarvim
    openssl
    openvpn
    nvd
    nix-output-monitor
    # fonts
    nerd-fonts.jetbrains-mono

    direnv
    devenv
    lazygit
    lazydocker
    updog
  ];

}
