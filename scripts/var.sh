#!/bin/bash

arkdir="$HOME/.arkade"
confdir="$HOME/.config"
localdir="$HOME/.local/share"
plugindir="$ZSH/custom/plugins"
themedir="$ZSH/custom/themes"

# ╦ ╦╔═╗╔═╗╦═╗  ╔═╗╔═╗╔═╗╔═╗
# ║ ║╚═╗║╣ ╠╦╝  ╠═╣╠═╝╠═╝╚═╗
# ╚═╝╚═╝╚═╝╩╚═  ╩ ╩╩  ╩  ╚═╝
browser_brave="brave-bin"
browser_chrome="google-chrome"
browser_chromium="chromium"
browser_firfox="firefox"

sys_apps="appmenu-gtk-module dosfstools fwupd grub iwd openresolv network-manager-applet networkmanager libdbusmenu-glib powerdevil power-profiles-daemon xdg-utils"

user_apps="gnome-boxes marble normcap songrec telegram-desktop"
dev_apps="android-tools base base-devel cmatrix code code-features code-marketplace cowsay curl eza fastfetch figlet git htop lf npm wget jre-openjdk python-pip reflector thefuck vim zed zellij zsh"

# ╔═╗╔═╗╔╗╔╔╦╗╔═╗
# ╠╣ ║ ║║║║ ║ ╚═╗
# ╚  ╚═╝╝╚╝ ╩ ╚═╝
font_sans="inter-font cantarell-fonts"
font_serif="ttf-ibm-plex"
font_mono="ttf-jetbrains-mono ttf-jetbrains-mono-nerd ttf-cascadia-code ttf-cascadia-code-nerd"
font_emoji="noto-fonts-emoji"
font_noto="noto-fonts"
font_cjk="noto-fonts-cjk"
font_extra="noto-fonts-extra"
font_tex="texlive-fontsextra texlive-latexextra"

# ╦╔═╔╦╗╔═╗  ╔═╗╔═╗╔═╗╔═╗
# ╠╩╗ ║║║╣   ╠═╣╠═╝╠═╝╚═╗
# ╩ ╩═╩╝╚═╝  ╩ ╩╩  ╩  ╚═╝
kde_connect="kdeconnect sshfs xdg-desktop-portal"
kde_discover="flatpak packagekit-qt6"
kde_print="print-manager cups system-config-printer"
kde_thumb="kdegraphics-thumbnailers ffmpegthumbs"

kde_user="ark dolphin elisa gwenview haruna isoimagewriter kalk kamoso kclock kcharselect kcolorchooser kdeconnect kdeplasma-addons keysmith kfind kgpg konsole krecorder ktorrent kweather plasma-meta plasma-workspace spectacle sweeper yakuake"

kde_sys="bup colord-kde kdenetwork-filesharing kdialog kup kscreen p7zip partitionmanager plasma-browser-integration sonnet unarchiver unrar"

# ╔═╗╦ ╦╔╗╔╔═╗╔╦╗╦╔═╗╔╗╔╔═╗
# ╠╣ ║ ║║║║║   ║ ║║ ║║║║╚═╗
# ╚  ╚═╝╝╚╝╚═╝ ╩ ╩╚═╝╝╚╝╚═╝
install_paru() {
  cd $HOME
  sudo pacman -S --needed base-devel
  git clone https://aur.archlinux.org/paru.git
  cd paru
  makepkg -si
  cd $arkdir
}

paru_install() {
  for package in "$@"; do
    paru -S --noconfirm "$package"
  done
}

run_pre() {
  echo -e "\n\033[94m-> $1\033[0m"
}

run_end() {
  echo -e "\033[94m-> $1\033[0m\n"
}

comp_pre() {
  echo -e "\n\033[32m:: $1\033[0m"
}

comp_end() {
  echo -e "\033[32m:: $1\033[0m\n"
}

mk_dir() {
  if [ ! -d "$1" ]; then
    mkdir -pv "$1"
  else
    echo ":: Folder already exists."
  fi
}

clone_repo() {
  if [ ! -d "$3" ]; then
    git clone https://github.com/$1/$2.git "$3"
    comp_end "Theme installed successfully."
  else
    echo ":: $2 is already installed. Skipping..."
  fi
}

mv_file() {
  if [ -e "$1" ]; then
    mv -vf "$1" $HOME/.conf_backup
  fi
}
