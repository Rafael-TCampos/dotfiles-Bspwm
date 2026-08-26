# 🧩 Meu Setup BSPWM 

Configuração completa do meu ambiente Linux usando **bspwm**, **sxhkd** e **polybar**, com suporte a múltiplos monitores.

---

## 🚀 Instalação

```bash
git clone https://github.com/Rafael-TCampos/dotfiles-Bspwm.git dotfiles
cd dotfiles
chmod +x install.sh
./install.sh
```

Depois:

```bash
startx
```

---

## 🖥️ Funcionalidades

* Window Manager: bspwm
* Atalhos: sxhkd
* Barra: polybar (multi-monitor)
* Compositor: picom
* Terminal: alacritty

---

## 🖥️ Monitores

Suporte a dual monitor com script automático (`dualMonitor.sh`)

---

## 📸 Preview

![BSPWM](screenshots/Bspwm1.png)

---

🔒 Lockscreen
- i3lock
- xss-lock
- bloqueio após 10 minutos
- wallpaper independente para os dois monitores

## 📦 Estrutura

```text
bspwm/
sxhkd/
polybar/
kitty/
nvim/
picom/
install.sh
dualMonitor.sh
```

