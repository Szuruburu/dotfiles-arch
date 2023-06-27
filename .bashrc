# ~/.bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# If user ID is greater than or equal to 1000 & if ~/bin exists and is a directory & if ~/bin is not already in your $PATH
# then export ~/bin to your $PATH.
if [[ $UID -ge 1000 && -d $HOME/bin && -z $(echo $PATH | grep -o $HOME/bin) ]]
then
	export PATH="${PATH}:$HOME/bin"
fi

# Fix delete button in st terminal
tput smkx

# enable control-s and control-q
vim() {
    local ret STTYOPTS="$(stty -g)"
    stty -ixon
    command vim "$@"
    ret=$?
    stty "$STTYOPTS"
    return "$ret"
}

# Set locale
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

# Colored man pages
man() {
	LESS_TERMCAP_md=$'\e[01;31m' \
	LESS_TERMCAP_me=$'\e[0m' \
	LESS_TERMCAP_se=$'\e[0m' \
	LESS_TERMCAP_so=$'\e[01;44;33m' \
	LESS_TERMCAP_ue=$'\e[0m' \
	LESS_TERMCAP_us=$'\e[01;32m' \
	command man "$@"
}

function findfolder {
	find ~ -name "$1" -type d
}

function findfile {
	 find ~ -name "$1" -type f
}

# Exit and cd into last dir you were on ranger; exit with Q
function ranger {
    local IFS=$'\t\n'
    local tempfile="$(mktemp -t tmp.XXXXXX)"
    local ranger_cmd=(
        command
        ranger
        --cmd="map Q chain shell echo %d > "$tempfile"; quitall"
    )

    ${ranger_cmd[@]} "$@"
    if [[ -f "$tempfile" ]] && [[ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]]; then
        cd -- "$(cat "$tempfile")" || return
    fi
    command rm -f -- "$tempfile" 2>/dev/null
}

export -f findfolder
export -f findfile
export -f ranger

export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'

export EDITOR=nvim

alias please='sudo'
alias ls='exa --color=always --group-directories-first'
alias ll='exa --color=always --group-directories-first -lgh'
alias llfn='exa --color=always -1'
alias la='exa --color=always --group-directories-first -a'
alias lla='exa --color=always --group-directories-first -la'
alias laa='exa --color=always --group-directories-first -d .?*'
alias llaa='exa --color=always --group-directories-first -ld .?*'
alias lg="exa --color=always -lagh --git"
alias tree="tree -C"
alias dir='-as --group-directories-first'
alias cls='clear'
#alias diff='diff --color=auto -y'
#alias grep='grep --color=auto'

alias ping='prettyping'

alias reboot!='sudo reboot -f'
alias shutdown='sudo shutdown -h now'

# PACKAGE MANAGER
alias pac='yay -S --nodiffmenu --answerclean None'
alias upac='yay -Rns'
alias sysupdate='yay -Syu'


# Networking
# ip color
alias ip='ip -c'

# Calendar
alias cal='cal -m --color=always'
alias calu='kallu'

# Git
alias gitstore='git config --global credential.helper "store --file ~/.my-credentials"'

# Vim
# Suppress output from the 'fg' command
alias fg='fg &> /dev/null'
alias vim='nvim'

# DEVICE
alias lsdev='inxi -Fx'
alias lsgpu='inxi -G'
alias lsmonitors='for p in /sys/class/drm/*/status; do con=${p%/status}; echo -n "${con#*/card?-}: "; cat $p; done'

# Utils
alias clock='tty-clock -cs'
alias wget='wget --show-progress'
alias dirstat='ncdu --graph-style half-block --si --exclude /mnt'

# VPN
alias peum='echo "a7PlN3ZMp*J&t/5a" | sudo openconnect --csd-wrapper /usr/lib/openconnect/hipreport.sh --protocol=gp -u szulemi1@i-s.com.pl --servercert pin-sha256:8SOF9IdK6YzjUEjByDI+VP/WmMqUsUpHEtc+G2ugQZQ= --passwd-on-stdin 195.205.223.118'

#PS1='\[\e[36m\][$(date +%H:%M)]\[\e[0m\] \W\$ '

#powerline-daemon -q
#POWERLINE_BASH_CONTINUATION=1
#POWERLINE_BASH_SELECT=1
#. /usr/lib/python3.6/site-packages/powerline/bindings/bash/powerline.sh

setxkbmap -layout pl

##PS1='[\[\e[1;31m\]\u\[\e[0m\]@\[\e[36m\]\h\[\e[0m\] \W]\$ '
export PS1="\[\e[32m\][\[\e[m\]\[\e[31m\]\u\[\e[m\]\[\e[33m\]@\[\e[m\]\[\e[32m\]\h\[\e[m\]:\[\e[36m\]\w\[\e[m\]\[\e[32m\]]\[\e[m\]\[\e[32;48m\]\\$\[\e[m\] "


PATH="/home/szu/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/szu/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/szu/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
export pdir="/home/szu/.config/picom/"
export dot="/home/szu/build/dotfiles/Szuruburu/dotfiles-arch/"
PERL_MB_OPT="--install_base \"/home/szu/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/szu/perl5"; export PERL_MM_OPT;

