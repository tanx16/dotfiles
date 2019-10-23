# Removes plugins and reverts configs, but does not uninstall pathogen.

cp ~/.vimrc.bak ~/.vimrc
cp ~/.tmux.conf.bak ~/.tmux.conf

rm -rf ~/.vim/bundle/nerdtree
rm -rf ~/.vim/bundle/gruvbox
rm -rf ~/.vim/bundle/vim-airline
rm -rf ~/.vim/bundle/vim-gutentags

# Removes scripts
rm ~/bin/cleanup
