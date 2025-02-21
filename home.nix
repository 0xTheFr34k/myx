{config,...}: {
  imports = [
    ./packages
    ./dotfiles
    ./dconf/dconf.nix
  ];
  home.username = "freak";
  home.homeDirectory = "/home/${config.home.username}";
  home.stateVersion = "24.11";

  home.sessionVariables = {
    DISABLE_COMPFIX= "true";
    EDITOR = "lvim";
    TERMINAL = "alacritty";
    NEO4J_CONF = "${config.home.homeDirectory}/.config/neo4j";
    _VENV_PATH = "${config.home.homeDirectory}/.local/venv-tools/.devenv/state/venv/bin";
    FZF_DEFAULT_OPTS = "-e";
    FZF_CTRL_R_OPTS = "
      --color header:italic
    ";
  };

  programs.home-manager.enable = true;
}
