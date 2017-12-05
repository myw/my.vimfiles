My .vim files
=============

Finally got around to organizing my .vim directory in a sane manner.

I use `vim-plug` to organize all of my non-custom plugins. When setting this up on a new computer, simply running `:PlugInstall` should install all of the configured plugins correctly. For YouCompleteMe, however, there is a secondary compilation step.

My custom plugins are divided into _personal_, which should apply anywhere, and other folders which I may or may not care about, depending on my work environment.

## Generically Useful Functionality

Some of the tools in this repo could be useful to others:

- [clean-swap-files](scripts/clean-swap-files.sh): a script to clean up used swap files after a
  crash or unexpected restart
- [Stab](plugged_custom/personal/plugin/stab.vim): an implementation of Drew Neil's indentation
  command
