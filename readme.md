##sources
https://wiki.osdev.org/User:Zesterer/Bare_Bones

## Utilisation
Lancer la commande:
```sh
docker run --rm -it -v $(pwd):/root/env compilator
```
Puis make la partie que vous souhaitez:
- mandatory
- bonus

Quitter le container puis lancer:
```sh
qemu-system-i386 -enable-kvm -cpu host -cdrom dist/bonus/kernel_bonus.iso
```
