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

## Where are the modules?
For some reasons they're a pain to find, the ones with xp show up in search bar, otherwise it's only through the link in the pdf which we don't want to open all the time.
So here are the links to each. You need an active 42 account though
- https://projects.intra.42.fr/projects/ocaml-basic-syntax-and-semantics-0
- https://projects.intra.42.fr/projects/ocaml-recursion-and-higher-order-functions-0
- https://projects.intra.42.fr/projects/ocaml-pattern-matching-and-data-types-0
- https://projects.intra.42.fr/projects/ocaml-ocaml-s-modules-language-1
- https://projects.intra.42.fr/projects/ocaml-imperative-features-1
- https://projects.intra.42.fr/projects/ocaml-functor-1
- https://projects.intra.42.fr/projects/ocaml-object-oriented-programming-1
- https://projects.intra.42.fr/projects/ocaml-object-oriented-programming-2
- https://projects.intra.42.fr/projects/ocaml-monoids-and-monads-3