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

# Antigen zsh plugin manager
source ~/.antigen/antigen.zsh

# Use the oh-my-zsh repo as a default for plugins
antigen use oh-my-zsh
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen theme jnrowe
antigen apply

export VISUAL=/usr/bin/nvim
export EDITOR="$VISUAL"

# required by neovim
export PATH=/usr/bin/python:/usr/bin/python2:/usr/bin/python3:/usr/bin/xclip:$PATH

# required by gem
export PATH=~/.gem/ruby/2.4.0/bin:$PATH

# rust
export RUSTUP_HOME=~/.multirust
export PATH=~/.cargo/bin:$PATH
export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"
export SYSROOT="$(rustc --print sysroot)"

# picture in picture
alias yy="mpv --really-quiet --autofit=35% --geometry=-10-15 --ytdl --ytdl-format='mp4[height<=?720]' -ytdl-raw-options=playlist-start=1"
