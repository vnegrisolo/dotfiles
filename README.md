# Workstation [![Build Status](https://semaphoreapp.com/api/v1/projects/8d21f9f1-bbfb-4db1-be7d-87f08f615894/323974/badge.png)](https://semaphoreapp.com/vnegrisolo/workstation)

Personal Workstation - Get started very fast!

# Setup in Mac
--------------------

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
* See [My Fonts](https://github.com/vnegrisolo/workstation/tree/master/iterm2)

Select the theme

1. Iterm2 -> Preferences -> Profile -> Colors -> Load Presets -> Import...
2. load the `Solarized Dark.itermcolors` or `Solarized Light.itermcolors`
3. Select one of them

Uncheck the bright on bold

1. Iterm2 -> Preferences -> Profile -> Text
2. uncheck `Draw bold text in bright colours`

## Install Workstation
The install ruby script will create some symbol links in your home directory.
```shell
gem install thor;
./bin/install.rb;
```

# Documentation
-------------------
[ruby](https://github.com/vnegrisolo/docs/ruby.md)
[git](https://github.com/vnegrisolo/docs/git.md)
[vim](https://github.com/vnegrisolo/docs/vim.md)
[aws](https://github.com/vnegrisolo/docs/aws.md)
