## Add static ip to device

```
sudo ip addr add 192.168.50.1/24 dev <device-name>
sudo ip link set <device-name> up
```

## Virtual DHCP ( Dynamic Host Configuration Protocol )

```
sudo apt install dnsmasq

---sudo nano ~/local-dhcp.conf----

# Disable DNS server (prevents 127.0.0.1 port 53 conflict)
port=0

# Bind strictly to Ethernet
interface=<device-name>
bind-dynamic

# DHCP Pool
dhcp-range=192.168.50.10,192.168.50.50,12h

---- End of Config file ----


```


