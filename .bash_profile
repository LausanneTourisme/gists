###
# Put your main directory where your project resides. For example:
# alias base="cd ~/sites/something.lausanne-tourisme.ch
###
alias base="cd ~/sites/";


alias ..="cd .."
alias launch="./.launch.sh"
alias le="./.launch.sh exec"
alias pa="php artisan"
alias lh="ls -lh"

export PATH=/opt/php8.2/bin:$PATH
force_color_prompt=yes

## Don't forget to install NVM on the server!
if [ -f ~/.nvm/nvm.sh ]; then
  source ~/.nvm/nvm.sh
fi


## This function loads the current project SSH key, for use with Git for example.
function project() {
	ssh-agent bash -c "ssh-add ~/.ssh/backend_ed25519; $*";	
}


function importDb()
{
  # Rename prefix, user, databasename and Dump
	# mysql -u prefix_user -p prefix_databasename  -h prefix.myd.infomaniak.com < ~/Dump.sql;
	: # cannot have empty function in bash 8D
}


function Bash()
{
	. ~/.bash_profile;
	echo "Bash refreshed!";
}

function Bashrc()
{
	vim ~/.bash_profile;
	Bash;
}

function Composer()
{
	/opt/php8.2/bin/php /opt/php/bin/composer.phar $*;
}

function Dump()
{
  printf "\nPlease input DB password:\n";
  # Replace prefix, user and databasename.
  #	mysqldump --host=prefix.ftp.infomaniak.com -u prefix_user -p prefix_databasename --no-tablespaces > backup.sql
}

## Loads the current SSH key for Github and passes any arguments to git directly.
function Git()
{
	project "git $*";
}

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        # We have color support; assume it's compliant with Ecma-48
        # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
        # a case would tend to support setf rather than setaf.)
        color_prompt=yes
    else
        color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

