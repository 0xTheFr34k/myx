# PATH
export PATH="$PATH:$HOME/go/bin:$HOME/.local/bin"

# eval
eval "$(zoxide init bash)"
eval "$(direnv hook bash)"
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# alias
alias cd=z
alias cat=bat
alias xcopy='xsel --clipboard <'
alias xpaste='xsel --clipboard --output >'
alias xshow='xsel --clipboard --output'
