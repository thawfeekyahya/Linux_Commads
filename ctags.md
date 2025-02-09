## Install Ctags
```
sudo apt install universal-ctags
```

## Enable ctags for qml and cpp 

```
ctags -R --languages=QML,C++ .
```

## Ctags config directory
~/.ctags.d/

```
~/.ctags.d/
  ├── c++.ctags
  ├── python.ctags
  ├── custom.ctags
```
