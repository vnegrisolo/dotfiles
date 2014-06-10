# Workstation

Personal Workstation - Get started in seconds!
See [Wiki](https://github.com/vnegrisolo/workstation/wiki) for more info.

## Install

The install ruby script will create some symbol links in your home directory.

```bash
bin/install.rb
```

## Git

You probably have already installed git. See [Git](http://git-scm.com/doc)

## Brew

Package manager for Mac. See [Brew](http://brew.sh/)

```bash
ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
```

## Rbenv

Non intrusive ruby manager. See [Rbenv](https://github.com/sstephenson/rbenv)

```bash
brew install rbenv ruby-build
```

## Ruby

Powerful language. See [Ruby](https://www.ruby-lang.org/en/).

```bash
rbenv install -l
```

```bash
rbenv install 2.1.1
```

## Oh-My-Zsh

My favorite shell. See [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)

```bash
curl -L http://install.ohmyz.sh | sh;
echo "export PATH='$HOME/.rbenv/bin:$PATH'" >> ~/.zshrc;
echo "eval '$(rbenv init -)'" >> ~/.zshrc;
```

## TMux

Multi session terminal. See [tmux](http://tmux.sourceforge.net/)

```bash
brew install tmux
```

## NeoBundle

Package manager for vim plugins. See [NeoBundle](https://github.com/Shougo/neobundle.vim)

```bash
curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | sh
```

## Solarized colors in ITerm2

* See [Original Fonts](https://github.com/altercation/solarized/tree/master/iterm2-colors-solarized)
* See [My Fonts](https://github.com/vnegrisolo/workstation/tree/master/iterm2)

1. Iterm2 -> Preferences -> Profile -> Colors -> Load Presets -> Import...
2. load the `Solarized Dark.itermcolors` or `Solarized Light.itermcolors`
3. Select one of them

1. Iterm2 -> Preferences -> Profile -> Text
2. uncheck `Draw bold text in bright colours`

