# NOTE: ORDERING IS IMPORTANT.
# Package Managers must be on top. As those languages can be used in shell scripts.
# 1. ASDF
# 2. VOLTA
# 3. Brew

# USERNAME
# export USERNAME=apple
export TERM=xterm-256color

# ALSO - .zshenv is not a good place for setting PATH on macos. https://stackoverflow.com/questions/26433856/why-would-path-be-getting-overwritten-after-shell-login#comment69745215_26434096
#================================================================================
# ASDF - Start
#================================================================================
# . $(brew --prefix asdf)/asdf.sh # https://github.com/asdf-vm/asdf/issues/428
export PATH=~/language-servers/elixir-ls/rel:$PATH # Language Servers
export PATH=~/language-servers/lua-language-server/bin/macOS:$PATH
. /usr/local/opt/asdf/asdf.sh # THIS IS MUCH FASTER THAN THE ABOVE -> . $(brew --prefix asdf)/asdf.sh

#NOTE: asdf path should be first - i.e. before /user/local/bin and /usr/bin etc.
#Hence it's set before all. SEE: PATH - IMP Section
# the above function is also setting the asdf path but it will push below by /user/local/bin.
# That's why in PATH-IMP section we have explicitly set the PATH for asdf,volta,brew,make
# In General, language version managers like asdf, volta should be on top.
# Then brew(/user/local/bin) and then everything else.

# Note: later we have set android paths. I don't need java except for react-native yet.
# Hence I'm not installing java explicitly. We will rely on react-native's java guide.

asdfreshim() {
    asdf reshim erlang elixir golang rust ruby java python
}
#================================================================================
# ASDF - END
#================================================================================

#================================================================================
# PATH - IMP - Start
#================================================================================
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/.asdf/installs/elixir/1.12.0-rc.0-otp-23/.mix/escripts/:$PATH
export PATH=/usr/local/opt/make/libexec/gnubin:$PATH #for make 
export PATH=/usr/local/opt/grep/libexec/gnubin:$PATH #grep
export PATH=/usr/local/lib/luarocks/rocks-5.4/luaformatter/scm-1/bin:$PATH

export PATH=/usr/local/bin:$PATH    #for homebrew
export PATH=/usr/local/sbin:$PATH   #for homebrew
export PATH=$VOLTA_HOME/bin:$PATH   #SET VOLATA in PATH
export PATH=$HOME/.asdf/shims:$PATH #https://github.com/asdf-vm/asdf/issues/107#issuecomment-257282018
export PATH=/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH

export PATH="$HOME/.poetry/bin:$PATH"
export PATH=~/language-servers/elixir-ls/rel:$PATH # Language Servers
export PATH=~/language-servers/lua-language-server/bin/macOS:$PATH


#================================================================================
# PATH - IMP - End
#================================================================================

#================================================================================
# Android & Android Studio - Start
#================================================================================
export ANDROID_HOME=/Users/$USERNAME/Library/Android/sdk/
export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools
#================================================================================
# Android & Android Studio - End
#================================================================================


#================================================================================
# Tmux - Start
#================================================================================
alias ta="tmux attach"
alias ta0="tmux attach-session -t 0"
alias ta1="tmux attach-session -t 1"
alias ta2="tmux attach-session -t 2"
alias ta3="tmux attach-session -t 3"
alias ta4="tmux attach-session -t 4"
alias ta5="tmux attach-session -t 5"
#================================================================================
# Tmux - End
#================================================================================



#================================================================================
# DOTFILE Management - Start
#================================================================================
# dot command should be before we use it in some function. (e.g. dotbrew)
#  echo "alias dot='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'" >> ~/.zshrc
alias dot='/usr/bin/git --git-dir=/Users/$USERNAME/.dotfiles/ --work-tree=/Users/$USERNAME'

alias ds="dot status"
alias da="dot add"
alias dc="dot commit -m"
alias dp="dot push -u origin master"
alias drh="dot reset HEAD"

dopen() {
    if [ $# -eq 0 ]; then
        open https://github.com/collegeimprovements/dotfiles
    else
        open http://localhost:$1
    fi
}
#================================================================================
# DOTFILE Management - End
#================================================================================

#================================================================================
# HomeBrew
#================================================================================
dotbrew() {
    rm $HOME/macos/Brewfile
    brew bundle dump --file=$HOME/macos/Brewfile
    dot add $HOME/macos/Brewfile
    dot commit -m "updates brewfile"
}

updatebrew() {
    # parallel brew ::: update upgrade
    brew update
    brew upgrade
    echo "Brew updated and upgraded"
}

brewit() {
    brew cleanup
    updatebrew
    echo "brewed it - $(date)"
}

brewall() {
    brewit
    dotbrew
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
    antibody bundle <~/.zsh_plugins.txt >~/.zsh_plugins.sh
    antibody update
    source ~/.zshrc
}
#================================================================================
# Antibody - Plugin Manager - END
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
# VSCODE - Start
#================================================================================
vscode-dump-extensions-list-to-file() {
    code --list-extensions >~/.config/vscode/my-extensions.txt
}
vscode-install-extensions-from-file() {
    # Non-Parallel version
    # while read line; do code --install-extension "$line"; done < ~/.config/vscode/my-extensions.txt

    # parallel version - doesn't work -  improve later
    # cat ~/.config/vscode/my-extensions.txt  | xargs -n1 parallel code --install-extension
    # the below one works great. TIL: xargs is not required here with parallel.

    #working Parallel version
    cat ~/.config/vscode/my-extensions.txt | parallel code --install-extension
    vscode-dump-extensions-list-to-file
}

vscode-install-extension() {
    if [ $# -eq 0 ]; then
        echo "provide name of extension. Note: currently we just assume name is valid"
    else
        for word in "$@"; do
            code --install-extension "$word"
            echo "$word" >>~/.config/vscode/my-extensions.txt
        done
        vscode-dump-extensions-list-to-file
    fi
}

alias vix="vscode-install-extension"
alias vd="vscode-dump-extensions-list-to-file"
alias vinstall="vscode-install-extension"
#================================================================================
# VSCODE - End
#================================================================================

#================================================================================
# ELIXIR - Start
#================================================================================
export ERL_AFLAGS="-kernel shell_history enabled"
# export KERL_BUILD_DOCS="yes"
# export KERL_CONFIGURE_OPTIONS="--without-javac --with-ssl=$(brew --prefix openssl)"
# export EGREP=egrep 
# export CPP="clang++ -E "
# export CC=clang

#================================================================================
# ELIXIR - End
#================================================================================


#================================================================================
# PSQL - Start
#================================================================================
export PSQL_EDITOR="nvim"
#================================================================================
# PSQL - End
#================================================================================


#================================================================================
# COMMON ALIASES - Start
#================================================================================
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias vim="nvim"
alias vi="nvim"
alias n="nvim"
alias update-nvim-nightly='asdf uninstall neovim nightly && asdf install neovim nightly'
alias cz="code ~/.zshrc"
alias cnz="nvim ~/.zshrc"
alias zrc="code ~/.zshrc"
alias ce="code ~/.zshenv"
alias cze="code ~/.zshrc ~/.zshenv"
alias o="open ."
alias desk="cd ~/Desktop"
alias down="cd ~/Downloads"
alias ca="~/Projects/ZAKI/cloche_api"
alias p="~/Documents/projects"
alias b="~/Projects/blockfi-mystique"
alias e="~/Projects/Live/eternity_client"
alias ui="/Users/$USERNAME/Documents/projects/ultra-ui"
alias infra="cd ~/Documents/projects/infrastructure"
alias cat="bat"
alias l="exa -l"
alias ls="exa"
alias ll="exa -lha"
alias la="exa -a"
alias cls="printf '\033[2J\033[3J\033[1;1H'" # kitty - cmd+k - clears scrollback
alias rr="rm -rf"
alias urm="command rm -i"
alias t1="tree -L 1"
alias t2="tree -L 2"
alias t3="tree -L 3"
alias t4="tree -L 4"
alias rt="rg --files | tree --fromfile"
alias t=rt
alias weather="curl wttr.in"
alias ball="brewall"
alias si="source .in"
alias sz="source ~/.zshrc"

alias allowapp="sudo xattr -rd com.apple.quarantine"

#spelling mistakes
alias claer="clear"
alias cler="clear"
alias oepn="open"

#suffix aliases
# alias -s {zip,ZIP}="unzip -l"
# alias -s {mp4,MP4,mov,MOV}="background vlc"
# alias -s html='brave'
alias -s {pdf,PDF}='preview'
alias -s {mp4,MP4,mov,MOV}='vlc'
alias -s {zip,ZIP}="unzip -l"
alias -s {txt,css,js,mdx,md,ex,exs,jsx,zshrc,zsh_profile,json,xml}="code"

# Git Aliases
alias lg="lazygit"
alias gopen="git-open"
alias ga="git add"
alias gc="git commit -m"
alias gp="git push"
alias gs="git status"
alias gd="git diff"
alias gco="git checkout"
alias gpo="git pull origin"
alias gpo="git pull origin master"
alias gpf="git pull && git fetch --prune"
alias gm="git checkout master && git pull origin master && git push all master && gco rex"
alias gr='cd "$(git rev-parse --show-toplevel)"'

# Elixir Aliases
alias m="mix ecto.migrations"
alias mr="mix ecto.rollback"
alias mm="mix ecto.migrate"
alias mg="mix deps.get"
alias mc="mix deps.compile"
alias mgc="mix deps.get && mix deps.compile && mix compile"
alias mh="mix hex.outdated"
alias ix="iex -S mix"
alias x="iex -S mix"
alias xp="gr && iex -S mix phx.server"
alias mt="MIX_ENV=test iex -S mix"
alias ips="iex -S mix phx.server"
alias lxp="MIX_ENV=local iex -S mix phx.server"

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
alias att="almostontop toggle"

#python
# alias python=python3
# alias pip=pip3

#================================================================================
# COMMON ALIASES - End
#================================================================================

# source /Users/arpit/Library/Preferences/org.dystroy.broot/launcher/bash/br
export PATH="$HOME/.apollo/bin:$PATH"

#================================================================================
# Useful Functions
# https://github.com/mdumitru/fancy-ctrl-z/blob/master/fancy-ctrl-z.zsh
#================================================================================

fancy-ctrl-z () {
  if [[ $#BUFFER -eq 0 ]]; then
    BUFFER="fg"
    zle accept-line
  else
    zle push-input
    zle clear-screen
  fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z

#================================================================================
# Python Related Things - CAPCHASE
#================================================================================
