## LSP Dependencies

CMake language server
```
//MacOS
brew install cmake-language-server

//Ubuntu / Linux
pip install --user cmake-language-server

```

## Font support on Ubuntu

By default some icons wont be rendered in ubuntu, install this zip file to fix it

```
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/latest/download/Hack.zip
unzip Hack.zip
rm Hack.zip
fc-cache -fv

sudo apt install fonts-powerline fonts-firacode

```

## Nerd Fonts 

https://www.nerdfonts.com/font-downloads 

```
cp FiraCodeNerdFontMono-Regular.ttf ~/.local/share/fonts/
```



