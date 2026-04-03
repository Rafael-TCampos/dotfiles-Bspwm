#!/usr/bin/env bash

# Pega o diretório onde o script está rodando
DIR="$(cd "$(dirname "$0")" && pwd)"

echo "--- Atualizando sistema (Arch Linux) ---"
sudo pacman -Syu --noconfirm

echo "--- Instalando programas essenciais ---"
# Adicionei o 'stow' e o 'rofi' que você está usando agora
sudo pacman -S --needed --noconfirm \
  xorg-server \
  xorg-xinit \
  xorg-xrandr \
  bspwm \
  sxhkd \
  kitty \
  picom \
  polybar \
  feh \
  neovim \
  rofi \
  git \
  curl \
  stow \
  base-devel

echo "--- Criando pastas de suporte ---"
mkdir -p ~/.config
mkdir -p ~/.local/share/rofi/themes

echo "--- Organizando Links com GNU Stow ---"
# O Stow faz o trabalho de remover o antigo e criar o link novo sozinho
cd "$DIR"

# Garante que as pastas de destino existam para o Stow não se perder
stow bspwm
stow sxhkd
stow kitty
stow picom
stow polybar
stow nvim
stow rofi

echo "--- Configurando scripts e X ---"
# Permissão para o seu script de dois monitores
if [ -f "$DIR/dualMonitor.sh" ]; then
  chmod +x "$DIR/dualMonitor.sh"
fi

# Configura o .xinitrc para iniciar o bspwm
echo "exec bspwm" >~/.xinitrc

echo "--- Instalação concluída! ---"
echo "Dica: Reinicie ou use 'startx' para entrar no bspwm."
