#
# ~/.bash_aliases
#


export LS_OPTIONS=--color

alias ls='ls $LS_OPTIONS'
alias la='ls -A'
alias ll='ls -l'
#alias lh='ls -d .*'
#alias cp='cp -v'
#alias mv='mv -v'
#alias rm='rm -v'
alias  l='ls -la'
alias pine='pine -i'
alias startx='startx 2>/dev/null'

alias gvim='gvim 2>/dev/null'
alias gvimv='gvim -c "source .vimrc" 2>/dev/null'

alias koset_sp='export SHORTPROMPT=1'
alias koset_nosp='export SHORTPROMPT=""'

alias tagscc='ctags -R --language-force=c++ --c++-kinds=+p --fields=+iaS --extra=+q'
alias tagsc='ctags -R --language-force=c --c-kinds=+p --fields=+iaS'

#alias urldecode='python -c "import sys, urllib as ul; print ul.unquote_plus(sys.argv[1])"'
alias urldecode="perl -e 'use URI::Encode qw(uri_decode); print uri_decode(@ARGV[0] . qq|\n|);'"
