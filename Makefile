init:
	ln -fs `pwd`/vimrc ~/.vimrc
	ln -fs `pwd`/zshrc ~/.zshrc
	ln -fs `pwd`/gitconfig ~/.gitconfig

sync:
	git pull
	git push
