#================================================================================
# ZSH Common Variables - Start
#================================================================================
export LANG=en_US.UTF-8
export LC_ALL="en_US.UTF-8"
export LANG="en_US"
#================================================================================
# ZSH Common Variables - End
#================================================================================

#================================================================================
# ZSH Common Settings/Options - Start
#================================================================================
#autocompletion - git and maybe others
autoload -U compinit && compinit
zmodload -i zsh/complist

#globbing - remove if required
# setopt NO_CASE_GLOB

#correction
# setopt CORRECT
# setopt CORRECT_ALL

#history - let's have more and extended history
HISTSIZE=50000
SAVEHIST=20000
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_find_no_dups
setopt hist_reduce_blanks
setopt hist_ignore_space # ignore command with space in start :)
setopt inc_append_history
setopt share_history

# Changing directories
setopt auto_cd
setopt auto_pushd
unsetopt pushd_ignore_dups
setopt pushd_minus


# Completion
setopt auto_menu
setopt always_to_end
setopt complete_in_word
unsetopt flow_control
unsetopt menu_complete
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z-_}={A-Za-z_-}' 'r:|=*' 'l:|=* r:|=*'
zstyle ':completion::complete:*' use-cache 1
zstyle ':completion::complete:*' cache-path $ZSH_CACHE_DIR
zstyle ':completion:*' list-colors ''
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'

setopt prompt_subst

# useful command - see zsh with bare minimum
#emulate -LR zsh
#================================================================================
# ZSH Common Settings/Options - End
#================================================================================

#================================================================================
# HomeBrew Variables - Start
#================================================================================
export HOMEBREW_UPDATE_PREINSTALL=0
export HOMEBREW_NO_AUTO_UPDATE=1
export HOMEBREW_AUTO_UPDATE_SECS=864000 #24*60*60*10 -> 10 days
#================================================================================
# HomeBrew Variables - End
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
