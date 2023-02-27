# .dotfiles

These are my personal dotfiles setup.

### Install dependencies

#### Mac
```
brew install neovim rbenv fzf ripgrep lazygit stylua when
brew tap homebrew/command-not-found
brew tap homebrew/cask-fonts
brew install font-hack-nerd-font
```

### Symlink files

```
cd
git clone git@github.com:lollkebear/.dotfiles.git
./install
```

### Set up local gitconfig
```
nvim ~/.gitconfig.local

[user]
  name = Your Name
  email = your@email.com
```

## Solargraph

1. Ensure you’re running Neovim 0.5.0 or later.
2. Install Solargraph

  ```
  gem install solargraph
  ```

4. Configure Solargraph for use with Rails

  From your Rails project’s root directory, generate YARD documentation:


  ```
  solargraph bundle
  ```

  Add YARD directives
  ```
  git clone https://gist.github.com/castwide/28b349566a223dfb439a337aea29713e ~/src/enhance-rails-intellisense-in-solargraph
  ```

  And for each project:

  ```
  ln -s ~/src/enhance-rails-intellisense-in-solargraph/rails.rb <project_root>/config/definitions.rb
  ```

  Update all repos with:

  ```
  git -C ~/src/enhance-rails-intellisense-in-solargraph pull
  ```
