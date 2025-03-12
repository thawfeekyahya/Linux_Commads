sudo swapon --show
sudo swapoff /swap.img
sudo fallocate -l +4G /swap.img
sudo chmod 600 /swap.img
sudo mkswap /swap.img
sudo swapon /swap.img

