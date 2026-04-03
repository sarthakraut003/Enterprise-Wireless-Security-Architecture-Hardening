#!/bin/bash
# Title: Network Interface & Gateway Recovery Script
# Description: Resolves 'No Carrier' and DHCP lease failure after VM migration.

echo "[*] Starting Network Recovery Sequence..."

# 1. Clear NetworkManager 'Zombie' states
sudo systemctl stop NetworkManager
sudo rm -f /var/lib/NetworkManager/NetworkManager.state
sudo systemctl start NetworkManager

# 2. Reset Iptables (Clearing any restrictive project 'Kill-Switches')
sudo iptables -F
sudo iptables -P INPUT ACCEPT
sudo iptables -P FORWARD ACCEPT
sudo iptables -P OUTPUT ACCEPT

# 3. Force Interface Hardware Re-initialization
sudo ip link set eth0 down
sudo ip link set eth0 up

# 4. Request Fresh DHCP Lease (Using nmcli for modern environments)
echo "[*] Attempting to re-establish NAT handshake..."
sudo nmcli device set eth0 managed yes
sudo nmcli device connect eth0

# 5. DNS Recovery
echo "nameserver 8.8.8.8" | sudo tee /etc/resolv.conf > /dev/null

echo "[+] Sequence Complete. Testing connectivity..."
ping -c 3 8.8.8.8
