#!/bin/bash

echo "Creating encrypted container..."
dd if=/dev/zero of=~/vault.img bs=1M count=150

echo "Encrypting the container..."
sudo cryptsetup luksFormat ~/vault.img

echo "Opening the container..."
sudo cryptsetup luksOpen ~/vault.img vault

echo "Formatting with ext4 filesystem..."
sudo mkfs.ext4 /dev/mapper/vault

echo "Creating mount point..."
sudo mkdir -p /mnt/vault

echo "Mounting the container..."
sudo mount /dev/mapper/vault /mnt/vault

echo "Creating a secret file..."
echo "This is my new encrypted file" | sudo tee /mnt/vault/secret.txt

echo "Done! The vault is ready at /mnt/vault"

