workstation
===========

Personal Workstation - Get started in seconds!
See [Wiki](https://github.com/vnegrisolo/workstation/wiki) for more info.

Install
-------

The install ruby script will create some symbol links in your home directory.

    $ ruby bin/install.rb

Git
---

You probably have already installed git. See [Git](http://git-scm.com/doc)

Brew
----

Package manager for Mac. See [Brew](http://brew.sh/)

    $ ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"

Rbenv
----

Non intrusive ruby manager. See [Rbenv](https://github.com/sstephenson/rbenv)

    $ brew install rbenv ruby-build

Ruby
----

Powerful language. See [Ruby](https://www.ruby-lang.org/en/).

    $ rbenv install -l
    $ rbenv install 2.1.1

Oh-My-Zsh
---------

My favorite shell. See [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)

    $ curl -L http://install.ohmyz.sh | sh
    $ echo "export PATH='$HOME/.rbenv/bin:$PATH'" >> ~/.zshrc
    $ echo "eval '$(rbenv init -)'' >> ~/.zshrc

TMux
----

Multi session terminal. See [tmux](http://tmux.sourceforge.net/)

    $ brew install tmux

NeoBundle
---------

Package manager for vim plugins. See [NeoBundle](https://github.com/Shougo/neobundle.vim)

    $ curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | sh
