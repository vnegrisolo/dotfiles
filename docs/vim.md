# Vim Cheatsheet
--------------------

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
