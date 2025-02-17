{pkgs, ...}: {
  home.packages = with pkgs; [
    jq
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
