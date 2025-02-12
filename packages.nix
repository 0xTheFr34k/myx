{ pkgs ,... }: {

  # example of how to allow unfree softwares

  # nixpkgs.config.allowUnfreePredicate = 
  #   pkg: builtins.elem ( pkgs.lib.getName pkg) [
  #     "discord"
  #   ];

  home.packages = with pkgs; [
    tmux
    btop
    fzf
    lunarvim
    moreutils
    pwndbg
    git
    lazygit
    # discord
  ];
  programs.zsh.enable = true;
  programs.git.enable = true;


}

