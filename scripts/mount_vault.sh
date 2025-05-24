
#!/bin/bash

echo "Opening vault.img..."
sudo cryptsetup luksOpen ~/vault.img vault

echo "Mounting..."
sudo mount /dev/mapper/vault /mnt/vault

echo "Vault is now open at /mnt/vault"
