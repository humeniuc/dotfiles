Pentru a adauga un submodul, ruleaza
$ cd ~/.vim
$ git submodule add git://github.com/tpope/vim-fugitive.git bundle/fugitive
$ git submodule init && git submodule update


Note:
$ git submodule init
and
$ git submodule update
need to be run every time a new submodule is added.

$ git submodule foreach git pull
command is used to pull latest upstream changes.
