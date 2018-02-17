# Work in progress
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

mv ./.vimrc ~/.vimrc
mv ./tmux.conf ~/.tmux.conf

git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree
git clone https://github.com/morhetz/gruvbox.git ~/.vim/bundle/gruvbox
