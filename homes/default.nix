{

  imports = [
    ./packages
  ];
  home.username = "freak";
  home.homeDirectory = "/home/freak";
  home.stateVersion = "24.11"; # Please read the comment before changing.


  home.sessionVariables = {
    EDITOR = "lvim";
    TERMINAL = "alacritty";
    ZSH_DISABLE_COMPFIX = "true";
  };

  programs.home-manager.enable = true;

  xdg = {
    enable = true;
    userDirs = {
      enable = true;
      createDirectories = true;
      templates = null;
      publicShare = null;
    };
    configFile = {
      tmux = {
        source = ./packages/tmux;
      };
      lvim = {
        source = ./packages/lvim;
      };
     alacritty = {
        source = ./packages/alacritty;
      };
    };
  };

}
