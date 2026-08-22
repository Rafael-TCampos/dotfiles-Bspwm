#!/usr/bin/env bash

set -e

# Diretório do repositório
DIR="$(cd "$(dirname "$0")" && pwd)"

echo "======================================"
echo "  Instalador dos Dotfiles - Rafael"
echo "======================================"

# Detecta a distribuição
if command -v pacman >/dev/null 2>&1; then
    DISTRO="arch"
elif command -v apt >/dev/null 2>&1; then
    DISTRO="ubuntu"
else
    echo "Distribuição não suportada."
    exit 1
fi

echo
echo "Sistema detectado: $DISTRO"

#########################################
# Atualização e instalação dos pacotes
#########################################

if [ "$DISTRO" = "arch" ]; then

    echo
    echo "Atualizando Arch Linux..."
    sudo pacman -Syu --noconfirm

    echo
    echo "Instalando pacotes..."
    sudo pacman -S --needed --noconfirm \
        xorg-server \
        xorg-xinit \
        xorg-xrandr \
        bspwm \
        sxhkd \
        alacritty \
        picom \
        polybar \
        feh \
        rofi \
        git \
        curl \
        stow \
        base-devel

elif [ "$DISTRO" = "ubuntu" ]; then

    echo
    echo "Atualizando Ubuntu..."
    sudo apt update

    echo
    echo "Instalando pacotes..."
    sudo apt install -y \
        bspwm \
        sxhkd \
        alacritty \
        picom \
        polybar \
        feh \
        rofi \
        git \
        curl \
        stow \
        xorg

fi

#########################################
# Backup das configurações antigas
#########################################

echo
echo "Criando backup das configurações..."

mkdir -p ~/.config-backup

for dir in bspwm sxhkd picom polybar rofi
do
    if [ -e "$HOME/.config/$dir" ]; then
        mv "$HOME/.config/$dir" "$HOME/.config-backup/$dir"
    fi
done

#########################################
# Criando diretórios
#########################################

mkdir -p ~/.config
mkdir -p ~/.local/share/rofi/themes

#########################################
# Verificando GNU Stow
#########################################

if ! command -v stow >/dev/null 2>&1; then
    echo "GNU Stow não encontrado."
    exit 1
fi

#########################################
# Instalando dotfiles
#########################################

echo
echo "Instalando dotfiles..."

cd "$DIR"

stow bspwm
stow sxhkd
stow picom
stow polybar
stow rofi
stow alacritty

#########################################
# Scripts
#########################################

if [ -f "$DIR/dualMonitor.sh" ]; then
    chmod +x "$DIR/dualMonitor.sh"
fi

#########################################
# Xinit
#########################################

echo "exec bspwm" > ~/.xinitrc

#########################################

echo
echo "======================================"
echo " Instalação concluída com sucesso!"
echo "======================================"
echo
echo "Escolha a sessão BSPWM na tela de login."
