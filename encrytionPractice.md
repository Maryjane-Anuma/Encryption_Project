┌──(kali㉿kali)-[~]
└─$ dd if=/dev/zero of=vault.img bs=1M count=150

150+0 records in
150+0 records out
157286400 bytes (157 MB, 150 MiB) copied, 0.176666 s, 890 MB/s
                                                                                                                                                                                                                                            
┌──(kali㉿kali)-[~]
└─$ sudo cryptsetup luksFormat vault.img

[sudo] password for kali: 

WARNING!
========
This will overwrite data on vault.img irrevocably.

Are you sure? (Type 'yes' in capital letters): YES
Enter passphrase for vault.img: 
Verify passphrase: 
Passphrases do not match.
                                                                                                                                                                                                                                            
┌──(kali㉿kali)-[~]
└─$ sudo cryptsetup luksFormat vault.img


WARNING!
========
This will overwrite data on vault.img irrevocably.

Are you sure? (Type 'yes' in capital letters): YES
Enter passphrase for vault.img: 
Verify passphrase: 
                                                                                                                                                                                                                                            
┌──(kali㉿kali)-[~]
└─$ sudo cryptsetup luksOpen vault.img vault

Enter passphrase for vault.img: 
                                                                                                                                                                                                                                            
┌──(kali㉿kali)-[~]
└─$ sudo mkfs.ext4 /dev/mapper/vault

mke2fs 1.47.2 (1-Jan-2025)
Creating filesystem with 34304 4k blocks and 34304 inodes
Filesystem UUID: e5d269da-1741-4c29-9f83-e785e51e4d53
Superblock backups stored on blocks: 
        32768

Allocating group tables: done                            
Writing inode tables: done                            
Creating journal (4096 blocks): done
Writing superblocks and filesystem accounting information: done

                                                                                                                                                                                                                                            
┌──(kali㉿kali)-[~]
└─$ sudo mkdir /mnt/vault

                                                                                                                                                                                                                                            
┌──(kali㉿kali)-[~]
└─$ sudo mount /dev/mapper/vault /mnt/vault

                                                                                                                                                                                                                                            
┌──(kali㉿kali)-[~]
└─$ echo "Top secret: backup access code is 9981-XD" | sudo tee ~/vault_secret.txt
sudo cp ~/vault_secret.txt /mnt/vault/

Top secret: backup access code is 9981-XD
                                                                                                                                                                                                                                            
┌──(kali㉿kali)-[~]
└─$ ls /mnt/vault
cat /mnt/vault/vault_secret.txt

lost+found  vault_secret.txt
Top secret: backup access code is 9981-XD
                                                                                                                                                                                                                                            
┌──(kali㉿kali)-[~]
└─$ sudo umount /mnt/vault
sudo cryptsetup luksClose vault

                                                                                                                                                                                                                                            
┌──(kali㉿kali)-[~]
└─$ ls /mnt/vault
                                                                                                                                                                                                                                            
┌──(kali㉿kali)-[~]
└─$ nano ~/setup_vault.sh

                                                                                                                                                                                                                                            
┌──(kali㉿kali)-[~]
└─$ 
                                                                                                                                                                                                                                            
┌──(kali㉿kali)-[~]
└─$ chmod +x ~/setup_vault.sh

                                                                                                                                                                                                                                            
┌──(kali㉿kali)-[~]
└─$ ./setup_vault.sh

[+] Opening vault.img...
Enter passphrase for /home/kali/vault.img: 
/dev/mapper/vault: UUID="e5d269da-1741-4c29-9f83-e785e51e4d53" BLOCK_SIZE="4096" TYPE="ext4"
[+] Mounting to /mnt/vault...
Access code: VAULT-9981-XD
[+] vault_secret.txt copied!
[✓] Vault ready at /mnt/vault
                                                                                                                                                                                                                                            
┌──(kali㉿kali)-[~]
└─$ nano ~/mount_vault.sh

                                                                                                                                                                                                                                            
┌──(kali㉿kali)-[~]
└─$ nano mount_vault.sh

                                                                                                                                                                                                                                            
┌──(kali㉿kali)-[~]
└─$ nano ~/setup_vault.sh

                                                                                                                                                                                                                                            
┌──(kali㉿kali)-[~]
└─$ nano ~/lock_vault.sh

                                                                                                                                                                                                                                            
┌──(kali㉿kali)-[~]
└─$ chmod +x setup_vault.sh mount_vault.sh lock_vault.sh

                                                                                                                                                                                                                                            
┌──(kali㉿kali)-[~]
└─$ cd ~                                                
                                                                                                                                                                                                                                            
┌──(kali㉿kali)-[~]
└─$ ./mount_vault.sh

Opening vault.img...
[sudo] password for kali: 
Device vault already exists.
Mounting...
Vault is now open at /mnt/vault
                                                                                                                                                                                                                                            
┌──(kali㉿kali)-[~]
└─$ ./lock_vault.sh

Unmounting...
Locking...
Device vault is still in use.
Vault is now locked and closed.
                                                                                                                                                                                                                                            
┌──(kali㉿kali)-[~]
└─$ nano my_encryptionPRACTICE_log.txt

                                                                                                                                                                                                                                            
┌──(kali㉿kali)-[~]
└─$ nano my_encryptionPRACTICE_log.txt_log.txt

                                                                                                                                                                                                                                            
┌──(kali㉿kali)-[~]
└─$  nano mount_vault.sh

                                                                                                                                                                                                                                            
┌──(kali㉿kali)-[~]
└─$ nano ~/setup_vault.sh

                                                                                                                                                                                                                                            
┌──(kali㉿kali)-[~]
└─$ nano ~/lock_vault.sh
