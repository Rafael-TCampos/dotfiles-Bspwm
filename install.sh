#!/usr/bin/env bash

DIR="$(cd "$(dirname "$0")" && pwd)"

echo "Atualizando sistema..."

sudo pacman -Syu --noconfirm

echo "Instalando programas..."

sudo pacman -S --needed --noconfirm \
  xorg-server \
  xorg-xinit \
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

echo "Removendo configs antigas..."

rm -rf ~/.config/bspwm
rm -rf ~/.config/sxhkd
rm -rf ~/.config/kitty
rm -rf ~/.config/picom
rm -rf ~/.config/polybar
rm -rf ~/.config/nvim

echo "Linkando dotfiles..."

ln -sf $DIR/bspwm ~/.config/bspwm
ln -sf $DIR/sxhkd ~/.config/sxhkd
ln -sf $DIR/kitty ~/.config/kitty
ln -sf $DIR/picom ~/.config/picom
ln -sf $DIR/polybar ~/.config/polybar
ln -sf $DIR/nvim ~/.config/nvim

echo "Configurando monitor script..."

chmod +x $DIR/dualMonitor.sh

echo "Configurando X..."

echo "exec bspwm" >~/.xinitrc

echo "Instalação concluída!"
