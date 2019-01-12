#!/usr/bin/env bash

declare -r GITHUB_REPOSITORY="geraldbaeck/dotfiles"
cd ~

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Create the necessary symbolic links between the `.dotfiles` and `HOME`
# directory.
shopt -s dotglob  # include hidden files
for f in bash/*; do
  ln -fs "${PWD}/${f}" "${HOME}/`basename ${f}`"  # create symlink
  echo "  `basename ${f}` symlinked to "
  echo "    ${PWD}/${f}"
done
for f in git/*; do
  ln -fs "${PWD}/${f}" "${HOME}/`basename ${f}`"  # create symlink
  echo "  `basename ${f}` symlinked to "
  echo "    ${PWD}/${f}"
done
gcp -asf "$(PWD)/projects/dotfiles/ssh/"* ~/.ssh/
gcp -asf "$(PWD)/projects/dotfiles/config/"* ~/.config/
sudo ln -fs "${PWD}/bin" "${HOME}/Library/"  # symlink to ~/Library/bin for custom scripts
echo "Linking done."
