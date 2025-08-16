dotfiles
========

checkout
 git clone --recursive https://github.com/humeniuc/dotfiles.git

sau

git clone https://github.com/humeniuc/dotfiles.git
cd dotfiles
git submodule update --init --recursive

new submodule
=============

```
git submodule add "git@github.com:github/copilot.vim.git" "./.config/vim/pack/plugins/opt/copilot.vim"
git submodule update --init --recursive
```
