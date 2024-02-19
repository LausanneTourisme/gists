alias Aliases="vim $ZSH_CUSTOM/aliases.zsh;Zsh"
alias Functions="vim $ZSH_CUSTOM/functions.zsh;Zsh"

alias ll="ls -al"
alias lh="lh -alh"
alias ..="cd .."
alias sail='[ -f sail ] && sh sail || sh vendor/bin/sail'
alias sa='sail artisan'
alias pa='php artisan'
alias tinker='[ -f sail ] && pa tinker --ansi || psysh' # if you download PsySH globally.
alias infomaniak='[ -f ~/infomaniak.sh ] && ~/infomaniak.sh || /dev/null'

alias gp="git push"
alias ga='git add'
alias gl='git log --color --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit --branches'
alias gs='git status'
alias gd='git diff'
alias gdc='git diff --cached'
alias gm='git commit -m'
alias gma='git commit -am'
alias gb='git branch'
alias gc='git checkout'
alias gra='git remote add'
alias grr='git remote rm'
alias gpu='git pull'
alias gcl='git clone'
alias gf="git fetch; git flow";

# Remove branches that have already been merged with master
# a.k.a. ‘git remove branch’
alias grb="!git branch --merged | grep -v '\\*' | xargs -n 1 git branch -d"

## Git Flow helpers
alias bugfix="gf bugfix start";
alias feature="gf feature start";
alias hotfix="gf hotfix start";
alias release="gf release start";
alias publish="gf publish";
alias finish="gf finish";

