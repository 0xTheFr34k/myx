{config, ...}: {
  imports = [
    ./packages
    ./dotfiles
  ];
  home.username = "freak";
  home.homeDirectory = "/home/${config.home.username}";
  home.stateVersion = "24.11";

  home.sessionVariables = {
    EDITOR = "lvim";
    TERMINAL = "alacritty";
    NEO4J_CONF = "${config.home.homeDirectory}/.config/neo4j";
    _VENV_PATH = "${config.home.homeDirectory}/.local/venv-tools/.devenv/state/venv/bin";
    FZF_DEFAULT_OPTS = "-e";
    FZF_CTRL_R_OPTS = "
      --color header:italic
    ";
    FZF_CTRL_T_OPTS = "
      --walker-skip .git,node_modules,target
      --style full
      --preview 'bat -n --color=always {}'
      --bind 'ctrl-/:change-preview-window(down|hidden|)'
    ";
  };
  programs.home-manager.enable = true;
}
