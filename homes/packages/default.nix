{ pkgs, ... }: {

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
    nerd-fonts.jetbrains-mono
    xsel
    cargo
    zsh
    (pkgs.callPackage ./alacritty { })
  ];

  programs.fzf.enable = true;

  programs.git = {
    enable = true;
    userName = "0xthefr34k";
    userEmail = "tayayassine6@live.fr";
  };


programs.zsh = {
  enable = true;
  enableCompletion = true;
  syntaxHighlighting.enable = true;

  shellAliases = {
    update  = "home-manager switch";
    xcopy   = "xsel --clipboard --input <";
    xpaste  = "xsel --clipboard --output >";
    xshow   = "xsel --clipboard --output";
  };
  history.size = 10000;
  oh-my-zsh = {
    enable = true;
    plugins = [ "git" "z" "tmux" ];
    theme = "robbyrussell";
  };
  };

}
