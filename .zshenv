#================================================================================
# ZSH Common Settings - Start
#================================================================================
export LANG=en_US.UTF-8
export LC_ALL="en_US.UTF-8"
export LANG="en_US"
#================================================================================
# ZSH Common Settings - End
#================================================================================

#================================================================================
# PATH - IMP - Start
#================================================================================
# If you come from bash you might have to change your $PATH.
export PATH=/usr/local/bin:$PATH #for homebrew
export PATH=/usr/local/sbin:$PATH #for homebrew
export PATH=/usr/local/opt/make/libexec/gnubin:$PATH #for make
export PATH=/usr/local/opt/grep/libexec/gnubin:$PATH #grep
export PATH=$HOME/.asdf/shims:$PATH #https://github.com/asdf-vm/asdf/issues/107#issuecomment-257282018
#================================================================================
# PATH - IMP - End
#================================================================================


#================================================================================
# VOLTA Javascript Package Manager - Start
#================================================================================
export VOLTA_HOME="$HOME/.volta" 
[ -s "$VOLTA_HOME/load.sh" ] && . "$VOLTA_HOME/load.sh"
export PATH=$VOLTA_HOME/bin:$PATH #SET VOLATA in PATH
#================================================================================
# VOLTA Javascript Package Manager - End
#================================================================================

#================================================================================
# Android & Android Studio - Start
#================================================================================
export ANDROID_HOME=/Users/arpit/Library/Android/sdk/
export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools
#================================================================================
# Android & Android Studio - End
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

brewit(){
    brew cleanup
    brew update 
    brew upgrade
    echo "brewed it - `date`"
}
