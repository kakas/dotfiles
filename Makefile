init:
	ln -fs `pwd`/vimrc ~/.vimrc
	ln -fs `pwd`/zshrc ~/.zshrc
	ln -fs `pwd`/gitconfig ~/.gitconfig
	ln -fs `pwd`/gitignore ~/.gitignore
	ln -fs `pwd`/rgignore ~/.rgignore
	ln -fs `pwd`/editorconfig ~/.editorconfig
	ln -fs `pwd`/ctags ~/.ctags
	ln -fs `pwd`/fzf.zsh ~/.fzf.zsh

sync:
	git pull
	git push
