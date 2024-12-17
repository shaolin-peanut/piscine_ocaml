#!/bin/bash
IS_ROOT=$(whoami)
if [ "$IS_ROOT" != "root" ]; then
    echo "Please run as root"
    exit 1
fi

echo "Yes I need to update everything to not break dependencies, arch policy..."
pacman -Syu --noconfirm opam rsync git gcc make patch
opam init --bare -a -y
source ~/.bash_profile
opam switch create piscine ocaml-base-compiler.5.2.0
echo "should be all good, try compiling some *.ml files"
