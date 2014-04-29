workstation
===========

Personal Workstation - Get started in seconds!

Brew
----

http://brew.sh/

	$ ruby -v
	$ ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"

Rbenv
----

https://github.com/sstephenson/rbenv

	$ brew install rbenv ruby-build

	$ rbenv install -l
	$ rbenv install 2.1.1

Oh-My-Zsh
---------

https://github.com/robbyrussell/oh-my-zsh

	$ curl -L http://install.ohmyz.sh | sh

	$ echo "export PATH='$HOME/.rbenv/bin:$PATH'" >> ~/.zshrc
	$ echo "eval '$(rbenv init -)'' >> ~/.zshrc
