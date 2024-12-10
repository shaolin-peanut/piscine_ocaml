#!/bin/bash
IS_ROOT=$(whoami)
if [ "$IS_ROOT" != "root" ]; then
    echo "Please run as root"
    exit 1
fi

pacman -S --noconfirm opam rsync git gcc make patch
opam init --bare -a -y
source ~/.bash_profile
opam switch create piscine ocaml-base-compiler.5.2.0
opam install utop # because it's cool
"should be all good, try compiling some *.ml files"
