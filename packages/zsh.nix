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
      shellerator = "shellerator 2> /dev/null";
      fzf-lists="fd -L . $(wordlists_path) -t file | fzf -e --preview 'bat --style=numbers --color=always --line-range :500 {}'";
      kalilinux= "docker run --network host --privileged  --mount type=bind,source=$HOME/kali,target=/root/kali  -it kalilinux";
      helper = "~/.local/bin/helper.py";
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

      fzf_path_completion() {
        local dir
        dir=$(echo $LBUFFER | awk '{print $NF}')  # Extract last word

        # Manually expand ~ to $HOME
        case "$dir" in
          "~"*) dir=$(echo $dir | sed "s|~|$HOME|") ;;
        esac

        # Default to PWD if not a valid directory
        [ -d "$dir" ] || dir="$PWD"

        local selected
        selected=$(ls -A "$dir" | fzf) && LBUFFER=$(echo $LBUFFER | sed "s|[^ ]*$|$dir$selected|")
        zle redisplay
      }

      zle -N fzf_path_completion
      bindkey '^T' fzf_path_completion  # Bind to Ctrl+T

      # devevn
      eval "$(direnv hook zsh)"
    '';
  };
}
