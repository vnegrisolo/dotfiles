workstation
===========

Personal Workstation - Get started in seconds!

Git
---

You probably have already installed
See [cheatsheet](https://github.com/vnegrisolo/workstation/blob/master/cheatsheets/git.markdown).
See [gitconfig dotfile](https://github.com/vnegrisolo/workstation/blob/master/dotfiles/.gitconfig).
See [gitignore dotfile](https://github.com/vnegrisolo/workstation/blob/master/dotfiles/.gitignore).

Brew
----

http://brew.sh/

    $ ruby -v
    $ ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"

Rbenv
----

https://github.com/sstephenson/rbenv

    $ brew install rbenv ruby-build

Ruby
----

See [dotfile](https://github.com/vnegrisolo/workstation/blob/master/dotfiles/.ruby-version).

    $ rbenv install -l
    $ rbenv install 2.1.1

Oh-My-Zsh
---------

https://github.com/robbyrussell/oh-my-zsh
See [dotfile](https://github.com/vnegrisolo/workstation/blob/master/dotfiles/.zshrc).

    $ curl -L http://install.ohmyz.sh | sh

    $ echo "export PATH='$HOME/.rbenv/bin:$PATH'" >> ~/.zshrc
    $ echo "eval '$(rbenv init -)'' >> ~/.zshrc

TMux
----

See [cheatsheet](https://github.com/vnegrisolo/workstation/blob/master/cheatsheets/tmux.markdown).
See [dotfile](https://github.com/vnegrisolo/workstation/blob/master/dotfiles/.tmux.conf).

    $ brew install tmux

NeoBundle
---------

    curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | sh
