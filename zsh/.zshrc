for DOTFILE in `find ~/.dotfiles/system`
do
  [ -f $DOTFILE ] && source $DOTFILE
done

export ZSH="/Users/sonia/.oh-my-zsh"

ZSH_THEME="dst"

BUNDLED_COMMANDS=(rubocop)
plugins=(rbenv git z zsh-autosuggestions ruby bundler)

source $ZSH/oh-my-zsh.sh

export EDITOR='nvim'

cop() {
  rubocop "$1" -c .rubocop.yml --format html --out public/tmp/rubocop.html; open public/tmp/rubocop.html
}

export GEM_HOME="$HOME/.gem"
export PATH="$GEM_HOME/bin:$PATH"
export PATH="$PATH:/opt/homebrew/bin"
export PATH="$PATH:/path/to/elixir/bin"
export PATH="/usr/local/opt/node@14/bin:$PATH"
export PATH="$PATH:$HOME/.gem/ruby/2.7.0/bin"
export PATH="/usr/local/opt/mysql@5.6/bin:$PATH"
export PATH="/opt/homebrew/opt/mysql@5.7/bin:$PATH"
export PATH="$HOME/.rbenv/shims:$PATH"
eval "$(rbenv init -)"
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"
