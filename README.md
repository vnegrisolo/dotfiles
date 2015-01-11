# Workstation
====================

Personal Workstation - Get started very fast!

--------------------

# Setup in Mac
====================

## System Updates
Go to the `Apple menu` -> `Software Update` -> `Update All`

## Xcode
```shell
xcode-select --install;
```

## Nice Programs
Adium, Skype, Chrome, Firefox, iTerm2, Sublime3, DiffMerge, Gitx, Squirrel, Mou

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

## TMux
Multi session terminal. See [tmux](http://tmux.sourceforge.net/)
```shell
brew install tmux
```

## Install Workstation
The install ruby script will create some symbol links in your home directory.
```shell
gem install thor;
bin/install.rb;
```

--------------------

# Ruby Cheatsheet
====================

## Ruby

* `irb` - starts ruby console

## Rails

* `rails new my_rails_app` - create your rails app
* `rails s` - starts your rails app
* `rails c` - starts your rails console
* `rake` - run tests

## Gems

* `bundle gem my_gem` - create your gem
* `rake install` - install your gem

--------------------

# Git Cheatsheet
====================

* `git status`
* `git branch`
* `git branch -a` - all branches including remotes
* `git remote prune origin` - remove remote references to deleted branches
* `git branch --merged master` - list local branches merged with master
* `git remote -v` - remote information
* `git pull origin master`
* `git push origin master`
* `git pull --rebase origin master`
* `git merge featured_branch`
* `git diff`
* `git commit -m 'commit message'`
* `git commit -am 'commit message'` - commits all tracked files
* `git branch featured_branch`
* `git checkout featured_branch`
* `git checkout -b featured_branch`
* `git branch -d featured_branch`
* `git push origin :featured_branch`
* `git submodule init`
* `git submodule update`
* `git bisect start; git bisect bad; git bisect good <rev>` - so you start test and say if its bad or good
* `git bisect visualize`

If you want to create a git hook to forbide the commits in master branch copy the `config/pre-commit.sh` file to the project and run:

```shell
mkdir -p .git/hooks;
ln -s ../../pre-commit.sh .git/hooks/pre-commit;
```

--------------------

# Vim Cheatsheet
====================

enter in your project directory, open the vim with `vim .` and open the NERDTree `,n`

## files

* `ctrl p <file_name>` - find your file and press `enter`
* `ctrl p <file_name> ctrl o t` - open the file in a new tab
* `:w` - save the file
* `:q` - quit
* `:x` - save and quit
* `u` - undo
* `ctrl r` - redo
* `:set paste` - set the paste mode - no identation, comments, etc
* `:set nopaste` - set the normal insert mode
* `,f` - show the open file in the nerdtree

## tab
* `gt` - next tab

## cursor movement

* `h` - left
* `l` - right
* `j` - down (use a number before optionally)
* `k` - up (use a number before optionally)
* `0` - line start
* `$` - line end

## insert mode

* `i` - before the cursor
* `I` - at the beginning of the line
* `a` - after the cursor
* `A` - at the end of the line
* `o` - new line after
* `O` - new line before

## panes

* `ctrl w w` - navigate between panes
* `ctrl w s` - split horizontal pane
* `ctrl w v` - split vertical pane
* `ctrl w |` or `ctrl w _` - maximize current pane

## cut and paste

* `y y` - copy line (use a number before optionally)
* `y w` - copy word
* `y $` - copy to the end of line
* `p` - paste
* `d d` - cut line (use a number before optionally)
* `d w` - cut word
* `d $` - cut to the end of line
* `V` - select the current line use the arrows up and down to select more than 1 line (`y` or `d` and finally `p`)
* `v` - select some text
* `ctrl v` - select columns

## search and replace

* `/pattern` - search
* `?pattern` - search backward
* `//` - clear the highlight
* `n` - next result
* `N` - previous result
* `:%s/old/new/g` - replace the old with the new
* `:%s/old/new/gc` - replace the old with the new after confirmation

## fugitive

* `Gstatus` - git status
* `-` - add/reset file to stage

--------------------

# Tmux Cheatsheet
====================

start new:

```shell
tmux
```

* `tmux new -s my_session_name` - start new with session name
* `tmux ls` - list sessions
* `tmux a` - connect to open tmux session
* `tmux a -t my_session_name` - connect in exiting session
* `tmux kill-session -t myname` - kill tmux session by name

The tmux default prefix is `ctrl+b` but I've changed to `ctrl+z` in my ~/.tmux.conf.
So, inside tmux, hit the prefix `ctrl+z` and then:

## Windows (tabs)

* `c` - new window
* `,` - name window
* `w` - list windows

## Panes (splits)

* `"` or `s` - horizontal split
* `%` or `v` - vertical split
* `o` - swap panes
* `ctrl a` - broadcast panes
* `z` - maximize pane
* `q` - show pane numbers
* `x` - kill pane
* `<space>` - toggle between layouts
* `?` - help
