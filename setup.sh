#!/usr/bin/env bash

declare -r GITHUB_REPOSITORY="geraldbaeck/dotfiles"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Create the necessary symbolic links between the `.dotfiles` and `HOME`
# directory.
shopt -s dotglob  # include hidden files
for f in bash/* git/* ; do
  ln -fs "${PWD}/${f}" "${HOME}/`basename ${f}`"  # create symlink
  echo "  `basename ${f}` symlinked to "
  echo "    ${PWD}/${f}"
done
for f in ssh/* ; do
  ln -fs "${PWD}/${f}" "${HOME}/.ssh/`basename ${f}`"  # create symlink
  echo "  `basename ${f}` symlinked to "
  echo "    ${PWD}/${f}"
done
sudo ln -fs "${PWD}/bin" "${HOME}/Library/"  # symlink to ~/Library/bin for custom scripts
echo "Linking done."
