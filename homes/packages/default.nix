{ pkgs, ... }: {

  # example of how to allow unfree softwares
  # nixpkgs.config.allowUnfreePredicate = 
  #   pkg: builtins.elem ( pkgs.lib.getName pkg) [
  #     "discord"
  #   ];
home.packages = with pkgs; [
    tmux
    btop
    fzf lunarvim moreutils
    pwndbg
    git
    lazygit
    nerd-fonts.jetbrains-mono
    xsel
    cargo
    zsh
    (pkgs.callPackage ./alacritty { })
    python312Packages.impacket
    arsenal
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

  initExtra = ''
    vipe_pipe_exec() {
      local original_buffer="$BUFFER"
      BUFFER=""
      local edited_content
      edited_content=$(echo "$original_buffer" | vipe)
      zle -U "$edited_content"
    }
    zle -N vipe_pipe_exec
    bindkey '^E' vipe_pipe_exec
  '';

  shellAliases = {
    update  = "home-manager switch";
    xcopy   = "xsel --clipboard --input <";
    xpaste  = "xsel --clipboard --output >";
    xshow   = "xsel --clipboard --output";
    a       = "arsenal";
  };
  history.size = 10000;
  oh-my-zsh = {
    enable = true;
    plugins = [ "git" "z" "tmux"];
    theme = "robbyrussell";
  };
  };

}
