## Install Clip board enabled Vim
sudo apt install vim-gtk3

## Installing vim-plug plugin manager

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

## Installing vim-plug for NeoVim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

## Matching braces

% -> to switch between matching braces

## Relative numbering

```
set relativenumber
```

### norm > normal mode

works as normal mode while in command mode

use norm command after selecting using the visual select using v 


## Vim Arthimetics

### Incrementing

10<C-a>  ->  Increments the number under the cursor by 10

vg<C-a> -> Increment all numbers in a visual selection by a specific amount:

## Decrementing

10<C-x> ->  Decrements the number under the cursor by 10

vg<C-x> ->  Decrement all numbers in a visual selection by a specific amount


### Modifying selection after visual selection

o -> by using o key we can switch between selection start and selection end


