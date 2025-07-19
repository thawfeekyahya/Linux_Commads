## Install Neo Vim
```
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt update && sudo apt install neovim -y
```


## Install Vim with clipboard
```
sudo apt install vim-gtk3
```

## Installing vim-plug plugin manager
```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

## Installing vim-plug for NeoVim
```
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

## Installing packer for NeoVim (lua)
```
git clone --depth 1 https://github.com/wbthomason/packer.nvim \
  ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

## Neo vim config file location
```
~/user/.config/nvim/init.lua
```

## Config update-alternatives nvim as vim
```
sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 100
```

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

10 \<Ctrl+a\>  ->  Increments the number under the cursor by 10

vg \<Ctrl+a\> -> Increment all numbers in a visual selection by a specific amount:

## Decrementing

10 \<Ctrl+x\> ->  Decrements the number under the cursor by 10

vg \<Ctrl+x\> ->  Decrement all numbers in a visual selection by a specific amount


### Modifying selection after visual selection

o -> by using o key we can switch between selection start and selection end


