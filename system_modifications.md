## When RAM memory is not enough we can use SWAP memory

```
sudo swapon --show
sudo swapoff /swap.img
sudo fallocate -l +4G /swap.img
sudo chmod 600 /swap.img
sudo mkswap /swap.img
sudo swapon /swap.img

```

## Extend existing hard disk size 

drive:ubuntu--vg-ubuntu--lv
```
sudo vgdisplay ubuntu-vg
sudo lvextend -l +100%FREE /dev/ubuntu-vg/ubuntu-lv
sudo resize2fs /dev/ubuntu-vg/ubuntu-lv

```
