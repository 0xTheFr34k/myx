{pkgs,...}: {

  home.packages = with pkgs; [
    zsh
    fzf
  ];
  
    programs.zoxide = {
      enable = true;
      enableZshIntegration = true;
    };

    programs.zsh = {
      enable = true;

      dotDir = ".config/zsh";

      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;

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

      shellAliases = {
        cat = "bat";
        # bat = "batcat";
        cd = "z";
        vi = "nvim";
        vim = "nvim";
        ls = "eza --icons";
        tree = "eza --tree --icons";
        kali = "distrobox enter kali-linux";
        kali-create = "distrobox create kalilinux/kali-rolling --name kali-linux";
        update = "nh home switch ~/.config/home-manager";
        rebuild = "nixos-rebuild switch --use-remote-sudo";
        xcopy = "xsel --clipboard --input <";
        xpaste = "xsel --clipboard --output >";
        xshow = "xsel --clipboard --output";
        a = "arsenal";
        shellerator = "shellerator 2> /dev/null";
        fzf-lists="fd -L . $(wordlists_path) -t file | fzf -e --preview 'bat --style=numbers --color=always --line-range :500 {}'";
      };

      plugins = with pkgs; [
        {
          name = "powerlevel10k";
          src = "${zsh-powerlevel10k}/share/zsh-powerlevel10k";
          file = "powerlevel10k.zsh-theme";
        }
        {
          name = "powerlevel10k-config";
          src = ./.;
          file = ".p10k.zsh";
        }
        {
          name = "fzf-zsh";
          src = "${fzf-zsh}/share/zsh/plugins/fzf-zsh";
          file = "fzf-zsh.plugin.zsh";
        }
        {
          name = "sudo-zsh";
          src = ./.;
          file = "sudo.plugin.zsh";
        }
        {
          name = "zsh-nix-shell";
          file = "nix-shell.plugin.zsh";
          src = pkgs.fetchFromGitHub {
            owner = "chisui";
            repo = "zsh-nix-shell";
            rev = "v0.8.0";
            sha256 = "1lzrn0n4fxfcgg65v0qhnj7wnybybqzs4adz7xsrkgmcsr0ii8b7";
          };
        }
      ];
    };
}
