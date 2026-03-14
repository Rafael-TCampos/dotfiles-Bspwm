#!/usr/bin/env bash

echo "Instalando programas..."

sudo apt update

sudo apt install -y \
bspwm \
sxhkd \
kitty \
picom \
polybar \
feh \
neovim \
git \
curl

echo "Criando pastas..."

mkdir -p ~/.config

echo "Copiando configurações..."

cp -r bspwm ~/.config/
cp -r sxhkd ~/.config/
cp -r kitty ~/.config/
cp -r picom ~/.config/
cp -r polybar ~/.config/
cp -r nvim ~/.config/

echo "Instalação concluída!"
