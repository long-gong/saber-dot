#!/usr/bin/env bash

set -e
echo "Clone all submodules for vim"
cd "$(dirname "$0")"/..
git submodule update --init --recursive

echo "Install dependencies for YouCompleteMe"
cd .vim/bundle/YouComplete 
python install.py --clang-completer

echo "Clone all submodule for oh-my-zsh manually"
cd "$(dirname "$0")"
chmod +x ./clone_nested_submodules.py
./clone_nested_submodules.py

echo "Start to move those dot files into ~"
## declare an array variable
declare -a vim_dot_files=(".vimrc" ".vim")
declare -a zsh_dot_files=(".zshrc" ".oh-my-zsh")

function just_move_it(){
	arr=$1
	dest="$HOME"
	for f in "${arr[@]}" 
	do 
		echo "Try to Move ${f}"
		if [ -f "$dest/$f" ] then
			echo "${dest}/${f} already exists, are you sure to move (we will create a backup for your original files)? [Y/N]"
			read response 
			if [ "${response}" == 'Y' ] 
}

## now loop through the above array
for i in "${arr[@]}"
do
   echo "$i"
   # or do whatever with individual element of the array
done


