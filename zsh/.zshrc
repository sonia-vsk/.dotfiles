for DOTFILE in `find ~/.dotfiles/system`
do
  [ -f $DOTFILE ] && source $DOTFILE
done

export ZSH="/Users/ksenijavasjko/.oh-my-zsh"

ZSH_THEME="dst"

plugins=(rbenv git z zsh-autosuggestions ruby)

source $ZSH/oh-my-zsh.sh

export EDITOR='nvim'

cop() {
  rubocop "$1" -c .rubocop.yml --format html --out public/tmp/rubocop.html; open public/tmp/rubocop.html
}

export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"
export PATH="$PATH:/path/to/elixir/bin"
export PATH="/usr/local/opt/node@14/bin:$PATH"
export PATH="$PATH:$HOME/.gem/ruby/2.7.0/bin"
