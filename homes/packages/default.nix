{ config, pkgs, lib, inputs, ... }: {
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
    # oh-my-zsh
    alacritty
    nerd-fonts.jetbrains-mono
    xsel
    cargo    # discord
    fzf-zsh
  ];

  programs.fzf.enable = true;
  programs.zsh = {
    enable = true;
  };
  programs.bash.enable  = true;
  programs.git = {
    enable = true;
    userName = "0xthefr34k";
    userEmail = "tayayassine6@live.fr";
  };

}

