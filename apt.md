## Add/Remove foreign archieture
```
sudo dpkg --add-architecture arm64

sudo dpkg --remove-architecture arm64

sudo apt purge ".*:arm64"
```

## Dowload apt package with depdencies
```
--- For downloading arm architecture
apt-get download $(apt-rdepends tigervnc-standalone-server:arm64 | grep -v "^ ")

--- For native architecture
apt-get download $(apt-rdepends tigervnc-standalone-server | grep -v "^ ")
```


## Print cache index
```
dpkg --print-foreign-architectures
```

## Installing package offline

NOTE: with this approach, its not necesssary to add arm to cache index, as the package will be downloaded with all dependencies. [Add/Remove foreign archieture](add/remove-foreign-archieture)

Generate a sig file with the requirements of the package ( here, tigervnc)
```
--- in the pc/target without internet connection
sudo apt-offline set vnc-install.sig --install-packages tigervnc-standalone-server

--- in the pc with internet connection
apt-offline get apt-chroot.sig --bundle bundle.zip

--- in the pc/target without internet connection
sudo apt-offline install bundle.zip

```




