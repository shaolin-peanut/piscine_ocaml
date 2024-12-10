# piscine_ocaml
Compilation with ocamlopt, which is similar to gcc for c.
All modules in one folder

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