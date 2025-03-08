{ pkgs, ... }: {
  imports =
    [ ./zsh/zsh.nix ./utils.nix ./allowUnfreePredicate.nix ./desktop.nix ];

  home.packages = with pkgs; [ python312 vagrant ];

  programs.fzf.enable = true;

  programs.git = {
    enable = true;
    userName = "0xthefr34k";
    userEmail = "tayayassine6@live.fr";
  };
}
