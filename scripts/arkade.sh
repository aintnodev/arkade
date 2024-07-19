#!/bin/bash

# source required files
source $HOME/.arkade/scripts/var.sh

# removing existing files/symlinks
run_pre "Moving existing symlinks"
sleep 1
mv_file $HOME/.conf_backup && mk_dir $HOME/.conf_backup
mv_file $localdir/konsole/catppuccin-breeze.colorscheme
mv_file $localdir/konsole/ishu.profile
mv_file $localdir/wallpapers/mojave-day.jpg
mv_file $localdir/wallpapers/mojave-night.jpg
mv_file $confdir/btop/btop.conf
mv_file $confdir/Code/User/settings.json
mv_file $confdir/fastfetch/config.jsonc
mv_file $confdir/fastfetch/arci.txt
mv_file $confdir/breezerc
mv_file $confdir/konsolerc
mv_file $confdir/krunnerrc
mv_file $confdir/kscreenlockerrc
mv_file $confdir/kwinrc
mv_file $confdir/kxkbrc
mv_file $confdir/yakuakerc
mv_file $confdir/lf/lfrc
mv_file $confdir/paru/paru.conf
mv_file $confdir/brave-flags.conf
mv_file $confdir/chrome-flags.conf
mv_file $confdir/chromium-flags.conf
mv_file $confdir/electron-flags.conf
mv_file $confdir/microsoft-edge-stable-flags.conf
mv_file $confdir/zed/settings.json
mv_file $confdir/zellij/config.kdl
mv_file $HOME/.vimrc
mv_file $HOME/.zaliases
mv_file $HOME/.zshenv
mv_file $HOME/.zshrc
comp_end "Existing files moved successfully"

# creating non-existing folders
run_pre "Creating required folders..."
sleep 1
mk_dir $localdir/konsole
mk_dir $localdir/wallpapers
mk_dir $confdir/btop
mk_dir $confdir/Code/User
mk_dir $confdir/fastfetch
mk_dir $confdir/lf
mk_dir $confdir/paru
mk_dir $confdir/zed
mk_dir $confdir/zellij
comp_end "Folders created successfully."

# copying local files
run_pre "Making symlinks for [local] files..."
sleep 1
ln -sv $arkdir/konsole/* $localdir/konsole
ln -sv $arkdir/wallpapers/* $localdir/wallpapers
comp_end "Success: [local] files successfully linked."

# copying config files
run_pre "Making symlinks for [config] files..."
sleep 1
ln -sv $arkdir/btop/* $confdir/btop
ln -sv $arkdir/code/* $confdir/Code/User
ln -sv $arkdir/fastfetch/* $confdir/fastfetch
ln -sv $arkdir/kde/* $confdir
ln -sv $arkdir/lf/* $confdir/lf
ln -sv $arkdir/paru/* $confdir/paru
ln -sv $arkdir/wayland/* $confdir
ln -sv $arkdir/zed/* $confdir/zed
ln -sv $arkdir/zellij/* $confdir/zellij
comp_end "Success: [config] files successfully linked"

# copying dot files
run_pre "Making symlinks for [dot] files..."
sleep 1
ln -sv $arkdir/vim/.* $HOME
ln -sv $arkdir/zsh/.* $HOME
comp_end "Success: [dot] files successfully linked."

# firefox with betterfox
run_pre "Firefox with betterfox user.js"
sleep 1
clone_repo "yokoffing" "Betterfox" "$HOME/.betterfox"
comp_pre "Enter this command:"
echo -e ":: ln -sv $HOME/.betterfox/user.js $HOME/.mozilla/firefox/*.default-release/user.js"

# installing oh-my-zsh
run_pre "Installing oh-my-zsh..."
sleep 1
clone_repo "ohmyzsh" "ohmyzsh" "$HOME/.oh-my-zsh"
clone_repo "romkatv" "powerlevel10k" "$themedir/powerlevel10k"
clone_repo "zsh-users" "zsh-autosuggestions" "$plugindir/zsh-autosuggestions"
clone_repo "marlonrichert" "zsh-autocomplete" "$plugindir/zsh-autocomplete"
clone_repo "zsh-users" "zsh-syntax-highlighting" "$plugindir/zsh-syntax-highlighting"
comp_end "Oh-my-zsh installed successfully."
