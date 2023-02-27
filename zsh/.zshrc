for DOTFILE in `find ~/.dotfiles/system`
do
  [ -f $DOTFILE ] && source $DOTFILE
done

export ZSH="$HOME/.oh-my-zsh"

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

ZSH_THEME="dst"

BUNDLED_COMMANDS=(rubocop)
plugins=(git z zsh-autosuggestions ruby bundler rbenv tmux command-not-found)

source $ZSH/oh-my-zsh.sh

export EDITOR='nvim'

HB_CNF_HANDLER="$(brew --repository)/Library/Taps/homebrew/homebrew-command-not-found/handler.sh"
if [ -f "$HB_CNF_HANDLER" ]; then
source "$HB_CNF_HANDLER";
fi

cop() {
  rubocop "$1" -c .rubocop.yml --format html --out public/tmp/rubocop.html; open public/tmp/rubocop.html
}

eval "$(/opt/homebrew/bin/brew shellenv)"

export GEM_HOME="$HOME/.gem"
export GEM_HOME="$(brew --prefix)/opt/gems"
export PATH="$GEM_HOME/bin:$PATH"
export PATH="$PATH:/opt/homebrew/bin"

export PATH="/opt/homebrew/opt/libpq/bin:$PATH"

export RUBYOPT="-Iopt/homebrew/opt/gems/gems/debug-1.8.0/lib"

export PATH="$HOME/pure-config:$PATH"
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

# rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# BEGIN env Setup -- Managed by Ansible DO NOT EDIT.

# Setup INDEED_ENV_DIR earlier.
if [ -z "${INDEED_ENV_DIR}" ]; then
    export INDEED_ENV_DIR="$HOME/env"
fi

# Single-brace syntax because this is required in bash and sh alike
if [ -e "${INDEED_ENV_DIR}/etc/indeedrc" ]; then
    . "${INDEED_ENV_DIR}/etc/indeedrc"
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

. "$HOME/.indeed-kube-profile"
