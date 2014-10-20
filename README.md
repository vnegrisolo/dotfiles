# Workstation

Personal Workstation - Get started in seconds!
See [Wiki](https://github.com/vnegrisolo/workstation/wiki) for more info.

## Oh-My-Zsh

My favorite shell. See [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)

```bash
curl -L http://install.ohmyz.sh | sh;
```

## Xcode (MAC)

```bash
xcode-select --install;
```

## Git

You probably have already installed git. See [Git](http://git-scm.com/doc)

```bash
git --version;
```

## Brew

Package manager for Mac. See [Brew](http://brew.sh/)

```bash
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)";
brew doctor;
brew update;
brew doctor;
brew install openssl;
brew link --force openssl;
```

## Rbenv

Non intrusive ruby manager. See [Rbenv](https://github.com/sstephenson/rbenv)

```bash
brew install rbenv ruby-build;
echo "export PATH='$HOME/.rbenv/bin:$PATH'" >> ~/.zshrc;
echo "eval '$(rbenv init -)'" >> ~/.zshrc;
```

## Ruby

Powerful language. See [Ruby](https://www.ruby-lang.org/en/).

```bash
rbenv install -l;
```

```bash
rbenv install 2.1.3;
```

## Install

The install ruby script will create some symbol links in your home directory.

```bash
gem install thor;
bin/install.rb;
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

Select the theme

1. Iterm2 -> Preferences -> Profile -> Colors -> Load Presets -> Import...
2. load the `Solarized Dark.itermcolors` or `Solarized Light.itermcolors`
3. Select one of them

Uncheck the bright on bold

1. Iterm2 -> Preferences -> Profile -> Text
2. uncheck `Draw bold text in bright colours`

