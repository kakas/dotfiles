init:
	ln -fs `pwd`/vimrc ~/.vimrc
	ln -fs `pwd`/zshrc ~/.zshrc
	ln -fs `pwd`/gitconfig ~/.gitconfig
	ln -fs `pwd`/editorconfig ~/.editorconfig
	ln -fs `pwd`/ctags ~/.ctags

sync:
	git pull
	git push
