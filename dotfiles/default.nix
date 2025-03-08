{ ... }: {
  xdg = {
    enable = true;
    userDirs = {
      enable = true;
      createDirectories = true;
      templates = null;
      publicShare = null;
    };
    configFile = {
      tmux = { source = ./tmux; };
      lvim = { source = ./lvim; };
      alacritty = { source = ./alacritty; };
      neo4j = { source = ./neo4j; };
      dockerfiles = { source = ./dockerfiles; };
      kanata = { source = ./kanata; };
    };
  };
}
