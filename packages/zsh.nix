{...}: {
  programs.zsh = { enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    history.size = 10000;

    shellAliases = {
      update = "home-manager switch";
      rebuild = "nixos-rebuild switch --use-remote-sudo";
      xcopy = "xsel --clipboard --input <";
      xpaste = "xsel --clipboard --output >";
      xshow = "xsel --clipboard --output";
      a = "arsenal";
      responder = "_ responder";
      shellerator = "$_VENV_PATH/shellerator 2> /dev/null";
      pwncat-cs = "$_VENV_PATH/pwncat-cs";
      abuseACL = "$_VENV_PATH/abuseACL";
      dirsearch = "$_VENV_PATH/dirsearch";
    };

    oh-my-zsh = {
      enable = true;
      plugins = ["git" "z" "tmux"];
      theme = "robbyrussell";
    };

    initExtra = ''
      # export _VENV_PATH="/home/freak/.local/venv-tools/.devenv/state/venv/bin"
      # vipe
      vipe_pipe_exec() {
        local original_buffer="$BUFFER"
        BUFFER=""
        local edited_content
        edited_content=$(echo "$original_buffer" | vipe)
        zle -U "$edited_content"
      }
      zle -N vipe_pipe_exec
      bindkey '^E' vipe_pipe_exec

      # devevn
      eval "$(direnv hook zsh)"
    '';
  };
}
