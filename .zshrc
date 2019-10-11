#================================================================================
# ZSH - Autocompletion - Start
#================================================================================
#autocompletion - git and maybe others
autoload -U compinit && compinit
zmodload -i zsh/complist
#================================================================================
# ZSH - Autocompletion - End
#================================================================================

#================================================================================
# DOTFILE Management - Start 
#================================================================================
# dot command should be before we use it in some function. (e.g. dotbrew)
#  echo "alias dot='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'" >> ~/.zshrc
alias dot='/usr/bin/git --git-dir=/Users/arpit/.dotfiles/ --work-tree=/Users/arpit'

alias ds="dot status"
alias da="dot add"
alias dc="dot commit"
alias dp="dot push -u origin master"
#================================================================================
# DOTFILE Management - End
#================================================================================

#================================================================================
# HomeBrew
#================================================================================
dotbrew(){
    rm $HOME/macos/Brewfile
    brew bundle dump --file=$HOME/macos/Brewfile
    dot add $HOME/macos/Brewfile
    dot commit -m "updates brewfile"
}

updatebrew(){
    brew update
    brew upgrade
}

brewit(){
    brew cleanup
    brew update 
    brew upgrade
    echo "brewed it - `date`"
}

#================================================================================
# HomeBrew - END
#================================================================================

#================================================================================
# Antibody - Plugin Manager - START
#================================================================================
# source <(antibody init)

source ~/.zsh_plugins.sh

# Update Zsh plugins
updatezsh() {
    antibody bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.sh
    antibody update
}
#================================================================================
# Antibody - Plugin Manager - END
#================================================================================

#================================================================================
# ASDF - Start
#================================================================================
# . $(brew --prefix asdf)/asdf.sh # https://github.com/asdf-vm/asdf/issues/428
. /usr/local/opt/asdf/asdf.sh # THIS IS MUCH FASTER THAN THE ABOVE -> . $(brew --prefix asdf)/asdf.sh

asdfreshim(){
   asdf reshim erlang elixir golang rust ruby java     
}
#================================================================================
# ASDF - END
#================================================================================


#================================================================================
# rupa z - Start
#================================================================================
# z - frecency based cd 
 . /usr/local/etc/profile.d/z.sh
#================================================================================
# rupa z - End
#================================================================================


#================================================================================
# FZF - Start
#================================================================================
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
#================================================================================
# FZF - End
#================================================================================


#================================================================================
# COMMON ALIASES - Start
#================================================================================
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias vim="nvim"
alias vi="nvim"
alias o="open ."
alias desk="cd ~/Desktop"
alias cat="bat"
alias l="exa -l"
alias ll="ls -ltrh"
alias la="ls -ltrha"
alias cls="printf '\033[2J\033[3J\033[1;1H'" # kitty - cmd+k - clears scrollback
alias rr="rm -rf"
alias t="tree"
alias t1="tree -L 1"
alias t2="tree -L 2"
alias t3="tree -L 3"
alias t4="tree -L 4"


# IP addresses - https://github.com/mathiasbynens/dotfiles/blob/master/.aliases
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en0"
alias ips="ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"

# Show active network interfaces
alias ifactive="ifconfig | pcregrep -M -o '^[^\t:]+:([^\n]|\n\t)*status: active'"

# Recursively delete `.DS_Store` files
alias deleteDS_Stores="find . -type f -name '*.DS_Store' -ls -delete"

# Show/hide hidden files in Finder
alias show="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hide="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"

# Hide/show all desktop icons (useful when presenting)
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"

#cal - show previous and future month as well
alias cal="cal -3"

#================================================================================
# COMMON ALIASES - End
#================================================================================


#================================================================================
# General Functions - Start
#================================================================================

# Search aliases/functions
falias() {
    CMD=$(
        (
            (alias)
            (functions | grep "()" | cut -d ' ' -f1 | grep -v "^_" )
        ) | fzf | cut -d '=' -f1
    );

    eval $CMD
}

# down <url> - Download <url> and save to current dir.
download(){
  curl -O "$1"
}
# copy current working directory path
cw() { printf %s "$PWD" | pbcopy; }

# ram <process-name> - Find how much RAM a process is taking.
ram() {
  local sum
  local items
  local app="$1"
  if [ -z "$app" ]; then
    echo "First argument - pattern to grep from processes"
  else
    sum=0
    for i in `ps aux | grep -i "$app" | grep -v "grep" | awk '{print $6}'`; do
      sum=$(($i + $sum))
    done
    sum=$(echo "scale=2; $sum / 1024.0" | bc)
    if [[ $sum != "0" ]]; then
      echo "${fg[blue]}${app}${reset_color} uses ${fg[green]}${sum}${reset_color} MBs of RAM."
    else
      echo "There are no processes with pattern '${fg[blue]}${app}${reset_color}' are running."
    fi
  fi
}

# xo <xcode-proj> - Open Xcode project.
xo(){
  if test -n "$(find . -maxdepth 1 -name '*.xcworkspace' -print -quit)"
  then
    echo "Opening workspace"
    open *.xcworkspace
    return
  else
    if test -n "$(find . -maxdepth 1 -name '*.xcodeproj' -print -quit)"
    then
      echo "Opening project"
      open *.xcodeproj
      return
    else
      echo "Nothing found"
    fi
  fi
}

# dirfiles <dir> - Give number of files found inside given directory.
dirfiles() {
    find "$1" -type f | wc -l
}

# cfile <file> - Copy content of file to clipboard
cfile(){
  cat $1 | pbcopy
}

# md <folder-name> - Create (a single) folder and cd to it
md(){
  mkdir "$1"
  cd "$1"
}

#yarn add 
ya(){
  if [ $# -eq 0 ]; then
    yarn
  else
    yarn add "$@"
  fi
}

#yarn start
ys(){
  if [ $# -eq 0 ]; then
    yarn && yarn start
  else
    yarn "$@"
  fi
}


findEmptyDirsAndFiles(){
  find . -type f -exec bash -c 'if [ `cat "{}" |wc -w` -eq 0 ]; then echo "file - {}";fi' \; -or -empty -exec bash -c "echo dir - {}" \;
}

# bin <binary>. Move <binary> to /usr/local/bin (in my PATH).
binmove(){
  mv "$@" /usr/local/bin
}

c() {
  if [ $# -eq 0 ]; then
    code .
  else
    code "${1:-.}"
  fi
}

# allowapp <path of application> - generally app is in /Application
allowapp() {
  if [ $# -eq 0 ]; then
    echo "Select Application's Path. e.g. /Applications/Sketch.app "
  else
    xattr -cr $1
  fi
}

# Make any number of directories, passing options to mkdir. Then cd to the last-mentioned directory.

mkcd() { 
    mkdir "$@" || return
    shift "$(( $# - 1 ))"
    cd -- "$1"
}
 
#================================================================================
# General Functions - End
#================================================================================
