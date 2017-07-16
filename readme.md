# dotfiles

This is a repo of the dotfiles I use everyday. I would not recommend coying them without looking into the source first. However, I am not responsible for anythong since I am just a copypasting codemonkey who tries to look cool if someday someone accidently looks at my screen.

## setup
There is a setup.sh file in the root, which currently only symlinks the bash files into your home directory. Be careful and make a backup of your .bash files first, because all of them will get overwritten.

## bash
The bash directory contains a lot of bash related files:

### .bash_profile
loads all the other .bash files. For the sake of your own sanity there should be no other stuff in it.

### .bash_aliases
Aliases only. Nothing else.

### .bash_exports
Environment variables only. Nothing else.

### .bash_externals
This is the exception to the rule. Every installed software which needs some kind of configuaration during shell startup goes here. For example I use it to configure nvm or the virtualenvwrapper.

### .bash_options
Only options. Nothing else.

### .bash_prompt
Now that's the fancy stuff. It makes your prompt more usesful and better looking.

![.bash_prompt](https://i.imgur.com/rY5blpb.png)
