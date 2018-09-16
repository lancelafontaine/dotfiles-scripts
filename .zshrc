# zsh history
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

# added by zsh compistall
zstyle :compinstall filename '~/.zshrc'

# load completions
autoload -Uz compinit
compinit

# Vim emulation for navigation
bindkey -v

# Key bindings
bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word
bindkey '^r' history-incremental-search-backward
bindkey '^f' autosuggest-accept

#########
# ZPLUG #
#########

# Install zplug unless it is already installed
if ! $(ls -a ~ | grep -q '.zplug'); then
  echo "Installing zplug..."
  curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
fi
source ~/.zplug/init.zsh

# List plugins
zplug 'plugins/git', from:oh-my-zsh
zplug 'plugins/vi-mode', from:oh-my-zsh
zplug 'plugins/bundler', from:oh-my-zsh
zplug 'plugins/gem', from:oh-my-zsh
zplug 'plugins/dircycle', from:oh-my-zsh
zplug 'plugins/docker', from:oh-my-zsh
zplug 'plugins/brew', from:oh-my-zsh
zplug 'plugins/per-directory-history', from:oh-my-zsh
zplug 'plugins/fasd', from:oh-my-zsh
zplug 'zsh-users/zsh-syntax-highlighting'
zplug 'zsh-users/zsh-completions'
zplug 'zsh-users/zsh-autosuggestions'
zplug "zsh-users/zsh-history-substring-search"
zplug 'hlissner/zsh-autopair'
zplug 'themes/jnrowe', from:oh-my-zsh, as:theme

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi
zplug load

export VISUAL=/usr/bin/nvim
export EDITOR="$VISUAL"

# required by neovim
export PATH=/usr/bin/python:/usr/bin/python2:/usr/bin/python3:/usr/bin/xclip:$PATH

# required by gem
export PATH=~/.gem/ruby/2.4.0/bin:$PATH

# rust
export RUSTUP_HOME=~/.multirust
export PATH=~/.cargo/bin:$PATH

# picture in picture
alias yy="mpv --really-quiet --autofit=35% --geometry=-10-15 --ytdl --ytdl-format='mp4[height<=?720]' -ytdl-raw-options=playlist-start=1"

