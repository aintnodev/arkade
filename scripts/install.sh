#!/bin/bash

repo=".arkade"
arkdir="$HOME/$repo"

source $arkdir/scripts/var.sh

clone_repo "aintnodev" "arkade" "$arkdir"
cd $arkdir && chmod +x scripts/arkade.sh scripts/package.sh

if [ -z "$EDITOR" ]; then
  echo ":: \$EDITOR is not defined. Installing vim..."
  sudo pacman -S --noconfirm vim
  export $EDITOR = "vim"
  echo ":: Vim installed successfully."
fi

comp_pre "Opening scripts to review"
sleep 1
$EDITOR -p "scripts/arkade.sh"

read -rp "--> Do you want to install packages? (y/n): " ans
ans=$(tr [A-Z] [a-z] <<<"$ans")

if [[ "$ans" == "y" ]]; then
  exec scripts/package.sh
  comp_end "Packages installed successfully"
else
  comp_end "We'll do that later. Skipping..."
fi

read -rp "--> Do you want to update configuration files? (y/n): " ans
ans=$(tr [A-Z] [a-z] <<<"$ans")

if [[ "$ans" == "y" ]]; then
  exec scripts/arkade.sh
  comp_end "Configuration files configured successfully."
else
  comp_end "We'll do that later. Skipping..."
fi
