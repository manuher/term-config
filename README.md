# Terminal Configuration

Config files for fish, tmux and vim

## Prerequisites

git
fish
tmux
vim
omf
fonts-powerline
universal-ctags


```
sudo apt install git fish tmux fonts-powerline universal-ctags
```

## Installing

Make fish default shell for user

```
sudo chsh -s /usr/bin/fish username
fish
echo source (PWD)/config.fish > ~/.config/fish/config.fish
```

Install vundle for vim plugin management

```
mkdir ~/.vim/bundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
echo source (PWD)/vimrc > ~/.vimrc
```


Install tmux plugin manager

```
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
echo source (PWD)/tmux.conf > ~/.tmux.conf
```

Install Oh my Fish for shell themes

```
curl -L https://get.oh-my.fish | fish
omf install bobthefish
```
