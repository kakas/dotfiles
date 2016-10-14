init:
	ln -fs `pwd`/vimrc ~/.vimrc

sync:
	git pull
	git push
