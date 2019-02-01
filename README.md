# saber-dot
dot files for saber


## How to Use Them

```bash
# Clone this repo
git clone https://github.com/long-gong/saber-dot.git
# cd to it
cd saber-dot
# Clone all submodules for vim
git submodule update --init --recursive
# Clone all submodules for zsh
cd script && ./clone_nested_submodules.py
# Handle special submodules
cd ../.vim/bundle/YouCompleteMe
# Please make sure you have installed all dependencies for YouCompleteMe
# before executing the following commands, which can be found at
# https://github.com/Valloric/YouCompleteMe
python install.py --clang-completer
# Backup your old dot files (if you have them)
mv ~/.vimrc ~/.vimrc.OLD
mv ~/.vim ~/.vim.OLD
mv ~/.zshrc ~/.zshrc.OLD
mv ~/.oh-my-zsh ~/.oh-my-zsh.OLD
# Move those dot files to you home directory
mv .vimrc .vim ~
mv .zshrc .oh-my-zsh ~
```