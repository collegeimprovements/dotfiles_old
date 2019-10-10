export LANG=en_US.UTF-8
export LC_ALL="en_US.UTF-8"
export LANG="en_US"
# If you come from bash you might have to change your $PATH.
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


#================================================================================
# HomeBrew
#================================================================================
HOMEBREW_NO_AUTO_UPDATE=1
HOMEBREW_AUTO_UPDATE_SECS=864000 #24*60*60*10 -> 10 days