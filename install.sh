#!/bin/bash

echo "Atualizando sistema..."
sudo apt update && sudo apt upgrade -y

echo "Instalando programas essenciais..."
sudo apt install -y \
bspwm \
sxhkd \
kitty \
picom \
feh \
git \
curl \
build-essential \
unzip \
neovim \
ripgrep \
fd-find

echo "Instalando Ruby..."
sudo apt install -y ruby-full

echo "Instalando Rubocop..."
gem install rubocop

echo "Criando pasta de config..."
mkdir -p ~/.config

echo "Linkando dotfiles..."

ln -sf ~/dotfiles/bspwm ~/.config/bspwm
ln -sf ~/dotfiles/sxhkd ~/.config/sxhkd
ln -sf ~/dotfiles/kitty ~/.config/kitty
ln -sf ~/dotfiles/picom ~/.config/picom
ln -sf ~/dotfiles/nvim ~/.config/nvim

echo "Instalando LazyVim..."
git clone https://github.com/LazyVim/starter ~/.config/nvim

echo "Instalação finalizada!"
echo "Reinicie a sessão para carregar o bspwm."
