{pkgs, config,...}: {
  home.packages = with pkgs; [
    distrobox
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

    # lsp
    alejandra

    # fonts
    nerd-fonts.jetbrains-mono

    direnv
    devenv
    lazygit
    updog
  ];

  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 4d --keep 3";
    flake = "${config.home.homeDirectory}/.config/home-manager";
  };
}
