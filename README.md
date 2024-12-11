# piscine_ocaml
Compilation with ocamlopt, which is similar to gcc for c.
All modules in one folder

I'm learning ocaml with CMU's [cs3110 textbook](https://cs3110.github.io/textbook/)

## adding ssh access to the VM easily

**doesn't work, please help**
vim /etc/ssh/sshd_config
uncomment the following two lines:
```
PasswordAuthentication yes
PermitRootLogin yes
```

systemctl restart sshd

another trick is adding a port forwarding rule in the VM settings
with like guest port 4242 and host port 22, doesn't work either, permission denied