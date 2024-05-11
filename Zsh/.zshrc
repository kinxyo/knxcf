# -----------------
# Zsh configuration
# -----------------

# !DEFAULT-CONFIG!

# Case-insensitive
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'

# Autocomplete
# source /usr/local/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh

#
# History
#

# Remove older command from the history if a duplicate is to be added.
setopt HIST_IGNORE_ALL_DUPS

#
# Input/output
#

# Set editor default keymap to emacs (`-e`) or vi (`-v`)
bindkey -e

# Prompt for spelling correction of commands.
#setopt CORRECT

# Customize spelling correction prompt.
#SPROMPT='zsh: correct %F{red}%R%f to %F{green}%r%f [nyae]? '

# Remove path separator from WORDCHARS.
WORDCHARS=${WORDCHARS//[\/]}

# bun completions
[ -s "/home/kinxyo/.bun/_bun" ] && source "/home/kinxyo/.bun/_bun"

# !PATH!

# Kitty
export PATH="$PATH:~/.local/kitty.app"

# Rust LSP
export PATH="$PATH:$HOME/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/bin/rust-analyzer"

# Go LSP
export PATH="$PATH:$HOME/go/bin/"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# go
export PATH=$PATH:/usr/local/go/bin

# act
export PATH=$PATH:$HOME/Applications/Act/

# python
alias python="python3"
alias py="python3"

# !ALIAS!

# qol
alias q="exit"
alias b="cd .."
alias ls="ls --color=auto"
alias v="hx ."
alias work="cd ~/Documents/ProductionGrade/"
alias add="sudo apt install"
alias ff="fd"
alias clr="clear"
alias cat="batcat"
alias -g peak="-X batcat"
alias nuxtup="bunx nuxi@latest init"
alias -g tree="tree -L 2 -I \"node_modules|.git|target|tmp|venv\""

# configurations
alias zconf="hx ~/.zshrc"
alias zrc="source ~/.zshrc" # Stands for `zsh source`
alias sconf="hx ~/.config/starship.toml"
alias hxconf="vim ~/.config/helix/config.toml"
alias hxc="hx ~/.config/helix/config.toml"
alias zconfv="vim ~/.zshrc"
alias tconf="hx ~/.tmux.conf"
alias kconf="hx ~/.config/kitty/kitty.conf"

# system fix
alias quiet="echo 0 | sudo tee /sys/module/snd_hda_intel/parameters/power_save_controller
echo 0 | sudo tee /sys/module/snd_hda_intel/parameters/power_save
"
alias camera="systemctl --user restart pipewire"
alias internet="sudo iwconfig wlp0s20f3 power off"

# system info
alias xorw="echo $XDG_SESSION_TYPE"

# !INITIALIZATIONS!

# starship 
eval "$(starship init zsh)"

# fnm
export PATH="/home/kinxyo/.local/share/fnm:$PATH"
eval "`fnm env`"
