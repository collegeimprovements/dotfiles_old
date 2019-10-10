export LANG=en_US.UTF-8
export LC_ALL="en_US.UTF-8"
export LANG="en_US"
# If you come from bash you might have to change your $PATH.
. $(brew --prefix asdf)/asdf.sh # https://github.com/asdf-vm/asdf/issues/428
export PATH=/usr/local/bin:$PATH #for homebrew
export PATH=/usr/local/sbin:$PATH #for homebrew
export PATH=/usr/local/opt/make/libexec/gnubin:$PATH #for make
export PATH=/usr/local/opt/grep/libexec/gnubin:$PATH #grep
export PATH=$HOME/.asdf/shims:$PATH #https://github.com/asdf-vm/asdf/issues/107#issuecomment-257282018
# export PATH=/Users/arpit/.asdf/installs/rust/1.38.0/bin:$PATH # asdf rust-cargo packages e.g. ff etc.
# NOTE: after adding new executables e.g. rust cargo packages or some other language's packages - we need to run reshim.
# e.g. asdf reshim python or asdf reshim rust 

# volta javascript package manager
export VOLTA_HOME="$HOME/.volta" 
[ -s "$VOLTA_HOME/load.sh" ] && . "$VOLTA_HOME/load.sh"
export PATH=$VOLTA_HOME/bin:$PATH #SET VOLATA in PATH
# volta --- over


export ANDROID_HOME=/Users/arpit/Library/Android/sdk/
export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools
#  export PATH=$PATH:~/android-sdks/platform-tools/
#  export PATH=$PATH:~/android-sdks/tools/

#================================================================================
# DOTFILE Management - Start
#================================================================================
#  echo "alias dot='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'" >> ~/.zshrc
alias dot='/usr/bin/git --git-dir=/Users/arpit/.dotfiles/ --work-tree=/Users/arpit'
#================================================================================
# DOTFILE Management - End
#================================================================================


# z - frecency based cd 
 . /usr/local/etc/profile.d/z.sh


#fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#autocompletion - git and maybe others
autoload -U compinit && compinit
zmodload -i zsh/complist

#================================================================================
# ALIASES
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

#================================================================================
# Antibody - Plugin Manager - START
#================================================================================
# source <(antibody init)

source ~/.zsh_plugins.sh


updatezsh() {
    antibody bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.sh
    antibody update
}
#================================================================================
# Antibody - Plugin Manager - END
#================================================================================

#================================================================================
# HomeBrew
#================================================================================
HOMEBREW_NO_AUTO_UPDATE=1
#================================================================================
# HomeBrew - END
#================================================================================

