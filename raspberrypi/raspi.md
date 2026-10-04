## Global Raspberry Pi Setup
```
sudo raspi-config
```

## Installing VNC
```
sudo apt install tigervnc-standalone-server tigervnc-tools
```

## Client VNC Viewer
```
sudo apt install tigervnc-viewer
sudo apt install -y remmina-plugin-vnc
```


### Create a config file at home directory and the root directory for VNC server

**~/.config/wayvnc/config**
```
address=::
enable_auth=true
username=yahyath
password=wolverine
private_key_file=/home/yahyath/.config/wayvnc/tls_key.pem
certificate_file=/home/yahyath/.config/wayvnc/tls_cert.pem

```

**/etc/wayvnc/config**
```
address=::
enable_auth=true
username=yahyath
password=wolverine
private_key_file=/etc/wayvnc/tls/tls_key.pem
certificate_file=/etc/wayvnc/tls/tls_cert.pem
```
**keygen generation**

```
mkdir -p ~/.config/wayvnc
cd ~/.config/wayvnc
openssl req -x509 -newkey ec -pkeyopt ec_paramgen_curve:secp384r1 -sha384 \
  -days 3650 -nodes -keyout tls_key.pem -out tls_cert.pem \
  -subj /CN=pi5 \
  -addext subjectAltName=DNS:pi5,IP:192.168.50.45
```

**Client connection**
```
xtigervncviewer 192.168.50.45:5900

```

