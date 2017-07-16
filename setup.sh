#!/bin/bash

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
echo "Linking done."
