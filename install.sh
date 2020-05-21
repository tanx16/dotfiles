# Installs pathogen, changes dotfiles, and adds plugins.
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

cp ~/.vimrc ~/.vimrc.bak
cp ~/.tmux.conf ~/.tmux.conf.bak
cp ~/.bashrc ~/.bashrc.bak

cp ./.vimrc ~/.vimrc
cp ./.tmux.conf ~/.tmux.conf
cp ./.bashrc ~/.bashrc

git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree
git clone https://github.com/morhetz/gruvbox.git ~/.vim/bundle/gruvbox
git clone https://github.com/vim-airline/vim-airline ~/.vim/bundle/vim-airline
git clone https://github.com/ludovicchabant/vim-gutentags.git ~/.vim/bundle/vim-gutentags

# Installs scripts and makes them runnable
mkdir -p ~/bin/
chmod u+x scripts/cleanup && cp scripts/cleanup ~/bin/
