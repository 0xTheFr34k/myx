{pkgs, ...}: {
  home.packages = with pkgs; [
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
    pipx
    tmux
    alacritty
    lunarvim
    openssl
    docker

    # lsp
    alejandra

    # fonts
    nerd-fonts.jetbrains-mono

    direnv
    devenv
    lazygit
    updog
  ];
}
