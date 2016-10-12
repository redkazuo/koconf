source /etc/profile

# Verifica se o shell é interativo.
if [ "$PS1" ]; then

  # Executa o ~/.bash_aliases, se existir.
#if [ -f ~/.bash_aliases ]; then
    source ~/.bash_aliases
#  fi

  # Configura a aparência do prompt do shell


  if [ -e ~/bin/mypwd.pl ]; then
    PS1='\h `~/bin/mypwd.pl "\`pwd\`"` \!\$ '
  else
    PS1='\h \w \!\$ '
  fi

  PS2='> '
  export PS1 PS2

#  cd

  set -o vi

fi

export PATH=~/.bin:~/.local/bin:~/.opt/mingw32ce/bin:~/.rvm/bin:$PATH
export CFLAGS="-I/home/kazuo/.local/include -L/home/kazuo/.local/lib $CFLAGS"
export PKG_CONFIG_PATH=/home/kazuo/.local/lib/pkgconfig
export LD_LIBRARY_PATH=/home/kazuo/.local/lib

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

export VISUAL=vim
export EDITOR=vim

export INPUTRC=~/.inputrc

# setxkbmap -model abnt2 -layout br
# setxkbmap us

if [ "$DISPLAY" ]; then
    setxkbmap -option terminate:ctrl_alt_bksp
fi

#clear

export LC_CTYPE="en_US.UTF-8"
