# dotfiles

:books: Dotfiles and Tips

# Install Dotfiles

```bash
./bin/install;
```

# Setup in Mac

## Solarized colors in ITerm2
* See [Original Fonts](https://github.com/altercation/solarized/tree/master/iterm2-colors-solarized)
* See [My Fonts](https://github.com/vnegrisolo/dotfiles/tree/master/iterm2)

Select the theme

1. Iterm2 -> Preferences -> Profile -> Colors -> Load Presets -> Import...
2. load the `Solarized Dark.itermcolors` or `Solarized Light.itermcolors`
3. Select one of them

Uncheck the bright on bold

1. Iterm2 -> Preferences -> Profile -> Text
2. uncheck `Draw bold text in bright colours`

# New machine

```shell
brew install bat
brew install chromedriver
brew install git
brew install htop
brew install imagemagick
brew install the_silver_searcher
brew install tmux
brew install vim
brew install wget
brew install wget
brew install youtube-dl
```

```shell
brew cask install google-chrome
brew cask install iterm2
brew cask install postgres
brew cask install postico
brew cask install slack
brew cask install visual-studio-code
```

```shell
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.6.3
```

# Documentation

* [ruby](https://github.com/vnegrisolo/dotfiles/tree/master/docs/ruby.md)
* [aws](https://github.com/vnegrisolo/dotfiles/tree/master/docs/aws.md)
