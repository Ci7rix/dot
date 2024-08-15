# Initialize Starship prompt for Zsh
eval "$(starship init zsh)"

# Ensure the Zinit directory exists
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"

# Clone the Zinit repository if it's not already cloned
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"

# Source the Zinit script to enable its functionality
source "${ZINIT_HOME}/zinit.zsh"

# Configure tmux module settings for Prezto
zstyle ':prezto:module:tmux:auto-start' local 'yes'
zstyle ':prezto:module:tmux:session' name 'default'

# Configure ssh module settings for Prezto
zstyle ':prezto:module:ssh:load' identities 'id_unset' 'id_yena'

# Configure utility module settings for Prezto
zstyle ':prezto:module:utility:ls' color 'yes'

# Load various Prezto modules using snippets
zinit snippet PZTM::environment
zinit snippet PZTM::history
zinit snippet PZTM::directory
zinit snippet PZTM::spectrum
zinit snippet PZTM::gnu-utility
zinit snippet PZTM::utility
zinit snippet PZTM::helper
zinit snippet PZTM::tmux
zinit snippet PZTM::macports
zinit snippet PZTM::completion
zinit snippet PZTM::ssh

# Load zsh-syntax-highlighting theme
zinit snippet 'https://github.com/catppuccin/zsh-syntax-highlighting/blob/main/themes/catppuccin_mocha-zsh-syntax-highlighting.zsh'

# Load Zsh syntax highlighting and autosuggestions
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions

# Unbind the default keybindings for the up and down arrow keys
bindkey -r '^[[A'
bindkey -r '^[[B'

# Define a function to bind history substring search to up and down arrow keys
function __bind_history_keys() {
  bindkey '^[[A' history-substring-search-up
  bindkey '^[[B' history-substring-search-down
}

# History substring searching
zinit ice wait lucid atload'__bind_history_keys'
zinit light zsh-users/zsh-history-substring-search

# Sourcing the custom aliases
source $XDG_CONFIG_HOME/zsh/aliases.zsh

# Setting up completions
fpath=("$XDG_CONFIG_HOME/zsh/completions" $fpath)
autoload -Uz compinit
compinit