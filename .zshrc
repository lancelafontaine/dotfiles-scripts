# zsh history
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

# added by zsh compistall
zstyle :compinstall filename '/home/lancelafontaine/.zshrc'

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
source /home/lancelafontaine/antigen/antigen.zsh

# Use the oh-my-zsh repo as a default for plugins
antigen use oh-my-zsh
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
export NVM_LAZY_LOAD=true
antigen bundle lukechilds/zsh-nvm
antigen bundle lukechilds/zsh-better-npm-completion
antigen theme jnrowe
antigen apply

export EDITOR=/usr/bin/vim
export VISUAL=/usr/bin/vim

# required by neovim
export PATH=/usr/bin/python:/usr/bin/python2:/usr/bin/python3:/usr/bin/xclip:$PATH

# required by gem
export PATH=/home/lancelafontaine/.gem/ruby/2.4.0/bin:$PATH

# rust
export RUSTUP_HOME=~/.multirust
export RUST_SRC_PATH=~/.multirust/toolchains/nightly-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src


source /usr/share/chruby/chruby.sh
