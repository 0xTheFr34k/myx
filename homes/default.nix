{

  imports = [
    ./packages
  ];
  home.username = "freak";
  home.homeDirectory = "/home/freak";
  home.stateVersion = "24.11"; # Please read the comment before changing.
  home.file = {
    ".config/tmux/tmux.conf".source = ./packages/tmux/tmux.conf;
    ".config/tmux/tmux.reset.conf".source = ./packages/tmux/tmux.reset.conf;
    ".config/lvim/config.lua".source = ./packages/lvim/config.lua;
    ".config/alacritty/alacritty.toml".source = ./packages/alacritty/alacritty.toml;
    ".zshrc".source = ./packages/zsh/.zshrc;
  };

  home.sessionVariables = {
    EDITOR = "lvim";
  };
  programs.home-manager.enable = true;
}
