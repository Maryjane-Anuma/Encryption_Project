#!/bin/bash

echo "Unmounting..."
sudo umount /mnt/vault

echo "Locking..."
sudo cryptsetup luksClose vault

echo "Vault is now locked and closed."
