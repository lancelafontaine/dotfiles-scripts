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

export VISUAL=/usr/bin/nvim
export EDITOR="$VISUAL"

# required by neovim
export PATH=/usr/bin/python:/usr/bin/python2:/usr/bin/python3:/usr/bin/xclip:$PATH

# required by gem
export PATH=/home/lancelafontaine/.gem/ruby/2.4.0/bin:$PATH

# rust
export RUSTUP_HOME=~/.multirust
export PATH=/home/lancelafontaine/.cargo/bin:$PATH
export RUST_SRC_PATH=~/.multirust/toolchains/nightly-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src

# transfer.sh
transfer() { if [ $# -eq 0 ]; then echo -e "No arguments specified. Usage:\necho transfer /tmp/test.md\ncat /tmp/test.md | transfer test.md"; return 1; fi
tmpfile=$( mktemp -t transferXXX ); if tty -s; then basefile=$(basename "$1" | sed -e 's/[^a-zA-Z0-9._-]/-/g'); curl --progress-bar --upload-file "$1" "https://transfer.sh/$basefile" >> $tmpfile; else curl --progress-bar --upload-file "-" "https://transfer.sh/$1" >> $tmpfile ; fi; cat $tmpfile; rm -f $tmpfile; }
