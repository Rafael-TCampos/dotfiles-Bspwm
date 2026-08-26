#!/usr/bin/env bash

set -e

#########################################
# Diretório do repositório
#########################################

DIR="$(cd "$(dirname "$0")" && pwd)"

echo "======================================"
echo "  Instalador dos Dotfiles - Rafael"
echo "======================================"

#########################################
# Detectar distribuição
#########################################

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
# Instalar pacotes
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
        base-devel \
        i3lock \
        xss-lock \
        imagemagick \
        zsh

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
        xorg \
        i3lock \
        xss-lock \
        imagemagick \
        zsh

fi

#########################################
# Criar diretório de backup
#########################################

echo
echo "Criando diretório de backup..."

mkdir -p "$HOME/.config-backup"

#########################################
# Backup das configurações existentes
#########################################

echo
echo "Criando backup das configurações antigas..."

for dir in bspwm sxhkd picom polybar rofi alacritty
do
    if [ -e "$HOME/.config/$dir" ]; then

        BACKUP="$HOME/.config-backup/${dir}.$(date +%Y%m%d_%H%M%S)"

        echo "Backup: ~/.config/$dir -> $BACKUP"

        mv "$HOME/.config/$dir" "$BACKUP"

    fi
done

#########################################
# Backup do .zshrc
#########################################

if [ -e "$HOME/.zshrc" ]; then

    BACKUP="$HOME/.config-backup/zshrc.$(date +%Y%m%d_%H%M%S)"

    echo "Backup: ~/.zshrc -> $BACKUP"

    mv "$HOME/.zshrc" "$BACKUP"

fi

#########################################
# Criar diretórios necessários
#########################################

mkdir -p "$HOME/.config"
mkdir -p "$HOME/.local/share"

#########################################
# Verificar GNU Stow
#########################################

if ! command -v stow >/dev/null 2>&1; then

    echo
    echo "Erro: GNU Stow não encontrado."
    exit 1

fi

#########################################
# Tornar scripts executáveis
#########################################

echo
echo "Configurando permissões dos scripts..."

chmod +x "$DIR/bspwm/.config/bspwm/dualMonitor.sh"

#########################################
# Instalar dotfiles com GNU Stow
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
stow zsh
stow lockscreen

#########################################
# Xinit
#########################################

echo
echo "Configurando .xinitrc..."

echo "exec bspwm" > "$HOME/.xinitrc"

#########################################
# Finalização
#########################################

echo
echo "======================================"
echo " Instalação concluída com sucesso!"
echo "======================================"

echo
echo "Configurações instaladas:"
echo "  - BSPWM"
echo "  - SXHKD"
echo "  - Picom"
echo "  - Polybar"
echo "  - Rofi"
echo "  - Alacritty"
echo "  - Zsh"
echo "  - Lockscreen"
echo
echo "O backup das configurações antigas está em:"
echo "  $HOME/.config-backup"
echo
echo "Reinicie a sessão para aplicar todas as configurações."
