#!/bin/bash
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

mkdir -p ~/.vim/pack/plugins/start
git clone --depth=1 https://github.com/ervandew/supertab.git ~/.vim/pack/plugins/start/supertab

mkdir -p ~/.vim/pack/airblade/start
cd ~/.vim/pack/airblade/start
git clone https://github.com/airblade/vim-gitgutter.git
vim -u NONE -c "helptags vim-gitgutter/doc" -c q

mkdir -p ~/.vim/pack/git-plugins/start
git clone https://github.com/w0rp/ale.git ~/.vim/pack/git-plugins/start/ale

git clone https://github.com/github/copilot.vim.git \
  ~/.vim/pack/github/start/copilot.vim

mkdir -p ~/.vim/colors
curl -fLo ~/.vim/colors/habamax.vim --create-dirs \
    https://raw.githubusercontent.com/habamax/vim-habamax/master/colors/habamax.vim
