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

## Modules
### 3
- ex02: gray code
    - I'm not good at thinking in binary, and now I need to solve a problem in a different system for representing numbers in binary? Anyway I settled on using and understanding one formula for converting a binary number to gray code
    `gray n = n XOR (n >> 1)`
    In ocaml xor is lxor and right shift is lsr (logical shift right)
    `gray n = n lxor (n lsr 1)`
    - you should see it when looking at the examples, there's a xor (or but not and) copmaring the binary and shifted number digit by digit, and retaining every instance of there being one or the other but not both, which means only one bit flips (with OR there could be more, since it permits AND)
        - > Binary | Shifted | Gray
            000 | 000 | 000
            001 | 000 | 001
            010 | 001 | 011
            011 | 001 | 010
            100 | 010 | 110
            101 | 010 | 111
            110 | 011 | 101
            111 | 011 | 100
