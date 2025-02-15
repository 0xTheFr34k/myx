{config,pkgs,lib,...}:
{

  imports = [
    ./packages
  ];
  home.username = "freak";
  home.homeDirectory = "/home/freak";
  home.stateVersion = "24.11"; # Please read the comment before changing.


  home.sessionVariables = {
    _VENV_PATH = "${config.home.homeDirectory}/.local/venv-tools/.devenv/state/venv/bin";    
    EDITOR = "lvim";
    TERMINAL = "alacritty";
    NEO4J_CONF = "${config.home.homeDirectory}/.config/neo4j"; 
    FZF_DEFAULT_OPTS = "-e";
    FZF_CTRL_R_OPTS="
      --color header:italic
    ";
    FZF_CTRL_T_OPTS="
      --walker-skip .git,node_modules,target
      --style full
      --preview 'bat -n --color=always {}'
      --bind 'ctrl-/:change-preview-window(down|hidden|)'
    ";
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
      neo4j = {
        source = ./packages/neo4j;
      };

    };
  };

}
