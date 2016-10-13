BIN = ff
FILES = bash_aliases asoundrc bashrc gitconfig gitignore gvimrc lesskey ratpoisonrc screenrc vimrc inputrc rtorrent.rc
install:
	for f in ${FILES}; do cp $$f ~/.$$f; done
	cp -Tfr vim ~/.vim
	cp -Tfr config ~/.config
	cp -Tfr bin ~/.bin
take:
	for f in ${FILES}; do cp ~/.$$f $$f; done
	cp -Tfr ~/.config config
	cp -Tfr ~/.vim vim
	for f in ${BIN}; do cp ~/.bin/$$f bin/$$f; done

