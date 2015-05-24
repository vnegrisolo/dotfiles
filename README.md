# Dotfiles
[![Build Status](https://travis-ci.org/vnegrisolo/dotfiles.svg)](https://travis-ci.org/vnegrisolo/dotfiles)
[![Code Climate](https://codeclimate.com/github/vnegrisolo/dotfiles/badges/gpa.svg)](https://codeclimate.com/github/vnegrisolo/dotfiles)

Personal Dotfiles - Get started very fast!

# Documentation

* [ruby](https://github.com/vnegrisolo/dotfiles/tree/master/docs/ruby.md)
* [git](https://github.com/vnegrisolo/dotfiles/tree/master/docs/git.md)
* [vim](https://github.com/vnegrisolo/dotfiles/tree/master/docs/vim.md)
* [aws](https://github.com/vnegrisolo/dotfiles/tree/master/docs/aws.md)

# Setup in Mac

## System Updates
Go to the `Apple menu` -> `Software Update` -> `Update All`

## Xcode
```shell
xcode-select --install;
```

## Oh-My-Zsh
My shell. See [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)
```shell
curl -L http://install.ohmyz.sh | sh;
```

## SSH Key
```shell
ssh-keygen -t rsa -C "your@email.com";
eval "$(ssh-agent -s)";
ssh-add ~/.ssh/id_rsa;
pbcopy < ~/.ssh/id_rsa.pub;
# paste in github settings
ssh -T git@github.com;
```

## Brew
Package manager for Mac. See [Brew](http://brew.sh/)
```shell
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)";
brew doctor;
brew update;
```

## Git
You probably have already installed git. See [Git](http://git-scm.com/doc)
```shell
git --version;
```

## Rbenv
Non intrusive ruby manager. See [Rbenv](https://github.com/sstephenson/rbenv)
```shell
brew install rbenv ruby-build;
brew install rbenv-default-gems rbenv-gem-rehash rbenv-vars;
brew install libyaml readline openssl;
echo "eval \"$(rbenv init -)\"" >> ~/.bashrc;
echo "eval \"$(rbenv init -)\"" >> ~/.zshrc;
```

## Ruby
Powerful language. See [Ruby](https://www.ruby-lang.org/en/).
```shell
rbenv install -l;
rbenv install 2.1.5;
rbenv global 2.1.5;
ruby -v;
```

## NeoBundle
Package manager for vim plugins. See [NeoBundle](https://github.com/Shougo/neobundle.vim)
```shell
curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | sh
```

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

## Install Dotfiles
The install ruby script will create some symbol links in your home directory.
```shell
bundle install;
./bin/install.rb;
```
