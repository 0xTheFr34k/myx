{ config, ... }: {
  imports = [ ../../packages ../../dotfiles ../../dconf/dconf.nix ];
  home.username = "freak";
  home.homeDirectory = "/home/${config.home.username}";
  home.stateVersion = "24.11";

  home.sessionVariables = {
    DISABLE_COMPFIX = "true";
    EDITOR = "lvim";
    TERMINAL = "alacritty";
    FZF_DEFAULT_OPTS = "-e";
    FZF_CTRL_R_OPTS = "\n      --color header:italic\n    ";
  };
  programs.home-manager.enable = true;
}

