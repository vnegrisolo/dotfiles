# tmux cheatsheet

As configured in [my dotfiles](https://github.com/henrik/dotfiles/blob/master/tmux.conf).
In tmux, hit the prefix `ctrl+z` and then:

start new:

    tmux

start new with session name:

    tmux new -s my_session_name

list sessions:

    tmux ls

## Windows (tabs)

    c           new window
    ,           name window
    w           list windows
    f           find window
    &           kill window
    .           move window - prompted for a new number
    :movew<CR>  move window to the next unused number

## Panes (splits)

    %  horizontal split
    "  vertical split

    o  swap panes
    q  show pane numbers
    x  kill pane
    ⍽  space - toggle between layouts
