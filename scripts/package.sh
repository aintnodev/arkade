#!/bin/bash

# source required files
source $HOME/.arkade/scripts/var.sh

# install paru (aur) helper and source package.sh
run_pre "Installing paru (aura) helper..."
sleep 1
install_paru
comp_end "Paru installed successfully."

# installing apps
run_pre "Installing essential apps..."
sleep 1
paru_install $sys_apps
comp_end "Essential apps installed successfully."

run_pre "Installing fonts"
sleep 1
paru_install $font_sans $font_serif $font_mono $font_emoji $font_emoji $font_noto $font_cjk $font_extra $font_tex
comp_end "Fonts installed successfully."

run_pre "Installing user/dev apps..."
sleep 1
paru_install $browser_brave $browser_firfox $user_apps $dev_apps
comp_end "User/Dev apps installed successfully."

run_pre "Installing KDE apps..."
sleep 1
paru_install $kdeconnect $kde_discover $kde_print $kde_thumb $kde_user $kde_sys
comp_end "KDE apps installed successfully."
