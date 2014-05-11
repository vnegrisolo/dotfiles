# tmux cheatsheet

As configured in [my dotfiles](https://github.com/henrik/dotfiles/blob/master/tmux.conf).
In tmux, hit the prefix `ctrl+z` and then:

start new:

    tmux

start new with session name:

    tmux new -s my_session_name

list sessions:

    tmux ls

connect in exiting session

    tmux a -t my_session_name

change the default ctrl+b to ctrl+z for the tmux commands (~/.tmux.conf)

    unbind C-b
    set -g prefix C-z

## Windows (tabs)

    c           new window
    ,           name window
    w           list windows

## Panes (splits)

    %  horizontal split
    "  vertical split

    o  swap panes
    q  show pane numbers
    x  kill pane
    ⍽  space - toggle between layouts
