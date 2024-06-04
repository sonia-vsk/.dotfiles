for DOTFILE in `find ~/.dotfiles/system`
do
  [ -f $DOTFILE ] && source $DOTFILE
done

export ZSH="$HOME/.oh-my-zsh"

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

ZSH_THEME="dst"

BUNDLED_COMMANDS=(rubocop)
plugins=(git z zsh-autosuggestions ruby bundler tmux command-not-found)

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

export PATH="$PATH:/opt/homebrew/bin"

export PATH="/opt/homebrew/opt/libpq/bin:$PATH"

export PATH="$HOME/pure-config:$PATH"
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

# rbenv - moved to end to override any system gem settings
export PATH="$HOME/.rbenv/bin:$PATH"

# BEGIN env Setup -- Managed by Ansible DO NOT EDIT.

# # Setup INDEED_ENV_DIR earlier.
if [ -z "${INDEED_ENV_DIR}" ]; then
    export INDEED_ENV_DIR="$HOME/env"
fi

# Single-brace syntax because this is required in bash and sh alike
if [ -e "${INDEED_ENV_DIR}/etc/indeedrc" ]; then
    . "${INDEED_ENV_DIR}/etc/indeedrc"
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

. "$HOME/.indeed-kube-profile"

  . /opt/homebrew/opt/asdf/libexec/asdf.sh

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

. "/Users/kvasjko/.indeed-kube-profile"
# BEGIN env Setup -- Managed by Ansible DO NOT EDIT.

# Setup INDEED_ENV_DIR earlier.
if [ -z "${INDEED_ENV_DIR}" ]; then
    export INDEED_ENV_DIR="/Users/kvasjko/env"
fi

# Single-brace syntax because this is required in bash and sh alike
if [ -e "${INDEED_ENV_DIR}/etc/indeedrc" ]; then
    . "${INDEED_ENV_DIR}/etc/indeedrc"
fi
# END env Setup -- Managed by Ansible DO NOT EDIT.

# Created by `pipx` on 2024-10-06 10:25:53
export PATH="$PATH:/Users/kvasjko/.local/bin"

eval "$(direnv hook zsh)"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi

# >>> anaconda conda config >>>
source /opt/homebrew/anaconda3/bin/activate
# Add Visual Studio Code (code)
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
alias getmanifest='/Users/kvasjko/apps/dbt/dataplatform-snowflake-dbt/bin/get_manifest.sh' # Created by dbt setup script -  Download the latest version of the production manifest
alias dbtprofile='code /Users/kvasjko/.dbt/profiles.yml' # Created by dbt setup script -  Open your dbt profile in VS Code
alias history='code /Users/kvasjko/.zsh_history' # Created by dbt setup script -  View command history in VS Code
export PATH="/opt/homebrew/opt/node@20/bin:$PATH"
eval "$(direnv hook zsh)"

# Initialize rbenv at the end to override any system gem configurations
unset GEM_HOME
unset GEM_PATH
unset RUBYOPT
eval "$(rbenv init -)"
