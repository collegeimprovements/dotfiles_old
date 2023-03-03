# NOTE: ORDERING IS IMPORTANT.
# Package Managers must be on top. As those languages can be used in shell scripts.
# 1. ASDF
# 2. VOLTA
# 3. Brew

# USERNAME
# export USERNAME=apple
export TERM=xterm-256color

# GPG
export GPG_TTY=$(tty)

# export AWS_REGION=us-east-1
# export PATH=/Users/arpit/Library/Python/3.10/bin:$PATH

# cd ~/Blockfi/blockfi-mystique

#================================================================================
# Open file with  nvim and goto line.
nl(){ IFS=: read -r f l <<< "$1"; nvim "$f" +"$l"; }
vimtoline(){ IFS=: read -r f l <<< "$1"; nvim "$f" +"$l"; }
#================================================================================

# ALSO - .zshenv is not a good place for setting PATH on macos. https://stackoverflow.com/questions/26433856/why-would-path-be-getting-overwritten-after-shell-login#comment69745215_26434096
#================================================================================
# ASDF - Start
#================================================================================
# . $(brew --prefix asdf)/asdf.sh # https://github.com/asdf-vm/asdf/issues/428
export PATH=~/language-servers/elixir-ls/rel:$PATH # Language Servers
export PATH=~/language-servers/lua-language-server/bin/macOS:$PATH
# . /usr/local/opt/asdf/asdf.sh # THIS IS MUCH FASTER THAN THE ABOVE -> . $(brew --prefix asdf)/asdf.sh
. /usr/local/opt/asdf/libexec/asdf.sh
export PATH=$HOME/.asdf/shims:$PATH #https://github.com/asdf-vm/asdf/issues/107#issuecomment-257282018


#NOTE: asdf path should be first - i.e. before /user/local/bin and /usr/bin etc.
#Hence it's set before all. SEE: PATH - IMP Section
# the above function is also setting the asdf path but it will push below by /user/local/bin.
# That's why in PATH-IMP section we have explicitly set the PATH for asdf,volta,brew,make
# In General, language version managers like asdf, volta should be on top.
# Then brew(/user/local/bin) and then everything else.

# Note: later we have set android paths. I don't need java except for react-native yet.
# Hence I'm not installing java explicitly. We will rely on react-native's java guide.

# asdfreshim() {
#     asdf reshim erlang elixir golang rust ruby java python
# }

asdfreshim(){
  rm -rf ~/.asdf/shims; asdf reshim
}

#================================================================================
# ASDF - END
#================================================================================

#================================================================================
# PATH - IMP - Start
#================================================================================
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/.asdf/installs/elixir/1.12.0-rc.0-otp-23/.mix/escripts/:$PATH

export PATH=/usr/local/bin:$PATH    #for homebrew
export PATH=/usr/local/sbin:$PATH   #for homebrew

export PATH=/usr/local/opt/make/libexec/gnubin:$PATH #for make
export PATH=/usr/local/opt/grep/libexec/gnubin:$PATH #grep
export PATH=/usr/local/lib/luarocks/rocks-5.4/luaformatter/scm-1/bin:$PATH

export PATH=/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH

export PATH=${PATH//$(asdf where python)\/shims:/}
export PATH=~/language-servers/elixir-ls/rel:$PATH # Language Servers
export PATH=~/language-servers/lua-language-server/bin/macOS:$PATH

export PATH="/usr/local/opt/openssl@3/bin:$PATH"
export PATH="$HOME/.apollo/bin:$PATH"

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
alias tls="tmux ls"
alias tk="tmux kill-session -t"
alias ta0="tmux attach-session -t 0"
alias ta1="tmux attach-session -t 1"
alias ta2="tmux attach-session -t 2"
alias ta3="tmux attach-session -t 3"
alias ta4="tmux attach-session -t 4"
alias ta5="tmux attach-session -t 5"
alias x0="tmux attach-session -t 0"

alias tmono="tmux attach-session -t mono || tmx "
alias tm="tmono && cd ~/savi/mono"
alias tkm="tmux kill-session -t mono"
# alias tm= tmono || tmx
tmx () {
    # Use -d to allow the rest of the function to run
    tmux new-session -d -s mono -n 'iex' -c ~/Savi/mono/services 'make iex.server'
    #tmux new-window -n iex -c ~/Savi/mono/services
    # tmux send -d -t mono:iex 'make iex.server' Enter
    # -d to prevent current window from changing
    tmux new-window -d -n web -c ~/Savi/mono/web 'yarn start'
    # tmux send -d -t mono:web 'yarn start' Enter
    # tmux new-window -d -n Win3
    # tmux new-window -d -n Win4
    # -d to detach any other client (which there shouldn't be,
    # since you just created the session).
    # tmux attach-session -d -t mono
    # tmux select-window -t e:1
    cd ~/Savi/mono/
}
#================================================================================
# Tmux - End
#================================================================================

#================================================================================
# Zellij - End
#================================================================================

alias zls="zellij ls"
alias za="zellij attach"
alias zk="zellij kill-session"
alias zka="zellij kill-all-sessions"
alias zw="zellij attach mw || zellij -s mw --layout /Users/arpit/.config/zellij/mono-layout.kdl"
alias zm="zellij attach mono || zellij -s mono --layout /Users/arpit/.config/zellij/mono-layout.kdl"
alias zv="zellij attach vms || zellij -s vms --layout /Users/arpit/.config/zellij/vms-layout.kdl"

#================================================================================
# Zellij - End
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
    dot add $HOME/.confg/nvim
    dot commit -m "updates brewfile and nvim"
}

updatebrew() {
    # parallel brew ::: update upgrade
    brew update
    brew upgrade
    echo "Brew updated and upgraded"
}

brewit() {
    brew cleanup --prune 1
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

# source ~/.zsh_plugins.sh

# Update Zsh plugins
updatezsh() {
    # antibody bundle <~/.zsh_plugins.txt >~/.zsh_plugins.sh
    # antibody update

    # zinit update --all
    zinit update --parallel
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
export FZF_DEFAULT_COMMAND='rg --files'
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
export KERL_BUILD_DOCS="yes"
export KERL_CONFIGURE_OPTIONS="--without-wx --without-javac --with-ssl=$(brew --prefix openssl)"
export EGREP=egrep
export CPP="clang++ -E "
export CC=clang
# export KERL_CONFIGURE_OPTIONS="–disable-debug --without-javac"



#================================================================================
# ELIXIR - End
#================================================================================

#================================================================================
# fkill - Start
#================================================================================
fkill() {
  lsof -ti:$1 | xargs kill -9
}


#================================================================================
# fkill - End
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
alias ......="cd ../../../../.."
alias 2.="cd ../.."
alias 3.="cd ../../.."
alias 4.="cd ../../../.."
alias 5.="cd ../../../../.."
alias vim="nvim"
alias vi="nvim"
alias n="nvim"
alias update-nvim-nightly='asdf uninstall neovim nightly && asdf install neovim nightly'
alias cz="code ~/.zshrc"
alias nz="nvim ~/.zshrc"
alias cnz="code ~/.zshrc"
alias zrc="nvim ~/.zshrc"
alias ce="code ~/.zshenv"
alias cze="code ~/.zshrc ~/.zshenv"
alias nck="nvim ~/.config/kitty/custom-kitty.conf"
alias o="open ."
alias desk="cd ~/Desktop"
alias down="cd ~/Downloads"
alias ca="~/Projects/ZAKI/cloche_api"
alias p="~/Documents/projects"
alias mn="~/savi/mono/"
alias mono="~/savi/mono/"
alias mns="~/savi/mono/services/"
alias bl="~/Blockfi/blockfi-mystique"
alias bm="~/Blockfi/blockfi-mystique"
alias cl="~/Cookstro/cloche_api"
alias lc="~/Cookstro/cloche_api"
alias clo="~/Cookstro/cloche_api"
alias e="~/Projects/Live/eternity_client"
alias ui="/Users/$USERNAME/Documents/projects/ultra-ui"
alias infra="cd ~/Documents/projects/infrastructure"
alias cat="bat --theme ansi -p"
alias bat="bat --theme ansi"
alias l="exa -l"
alias ls="exa"
alias ll="exa -lha"
alias la="exa -a"
# alias cls="printf '\033[2J\033[3J\033[1;1H'" # kitty - cmd+k - clears scrollback
alias cls="printf '\e[3J'" # kitty - cmd+k - clears scrollback
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

alias cb='defbro $(defbro | grep -v "^\*" | grep "com.brave.Browser\|com.google.Chrome" | cut -d " " -f3)'

alias allowapp="sudo xattr -rd com.apple.quarantine"

#spelling mistakes
alias claer="clear"
alias cler="clear"
alias oepn="open"
alias breww="brew"
alias fomrat="format"

#suffix aliases
# alias -s {zip,ZIP}="unzip -l"
# alias -s {mp4,MP4,mov,MOV}="background vlc"
# alias -s html='brave'
alias -s {pdf,PDF}='preview'
alias -s {mp4,MP4,mov,MOV}='vlc'
alias -s {zip,ZIP}="unzip -l"
# alias -s {txt,css,js,mdx,md,ex,exs,jsx,zshrc,zsh_profile,json,xml}="code"
alias -s {txt,css,js,mdx,md,ex,exs,jsx,zshrc,zsh_profile,json,xml,yml,toml,yaml}="nvim"

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
alias gr='cd "$(git rev-parse --show-toplevel)"'
alias gm="git checkout master && git pull origin master && git checkout - && git rebase master"
# alias gm="git checkout master && git pull origin master && git push all master && gco rex"

# Elixir Aliases
alias m="mix ecto.migrations"
alias mr="mix ecto.rollback"
alias mm="mix ecto.migrate"
alias mg="mix deps.get"
alias mc="mix deps.compile"
alias mgc="mix deps.get && mix deps.compile && mix compile"
alias mh="mix hex.outdated"
alias mdu="mix deps.update --all  "
alias mf="mix format"
alias ix="iex -S mix"
alias x="iex -S mix"
alias xp="gr && iex -S mix phx.server"
alias mt="MIX_ENV=test iex -S mix"
alias ips="iex -S mix phx.server"
alias lxp="MIX_ENV=local iex -S mix phx.server"
# alias ms="cd ~/Savi/mono/services && fkill 9001 && make iex.server"
alias mcs="cd ~/Savi/mono/services && fkill 9001 && make console.server"
alias ms="cd ~/Savi/mono/services && fkill 9001 && make console.server"

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
alias sl="sh ~/a.sh"

# currencyConverter - https://github.com/Rayrsn/currencyConverter
function ccd() { currencyConverter $1 usd inr}

#python
# alias python=python3
# alias pip=pip3

#================================================================================
# COMMON ALIASES - End
#================================================================================

# source /Users/arpit/Library/Preferences/org.dystroy.broot/launcher/bash/br

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

# See details of what's running on a port
# Maybe you want to kill -9 the pid of it
# lsof -i :9001 -S


#================================================================================
# Python Related Things - CAPCHASE
#================================================================================


#================================================================================
# Kitty - Zsh - Cursor Shape should be blocked
#================================================================================
function zle-keymap-select zle-line-init zle-line-finish
{
  case $KEYMAP in
      vicmd)      print -n '\033[1 q';; # block cursor -> '\033[1 q';;
      viins|main) print -n '\033[1 q';; # line cursor -> '\033[5 q';;
  esac
}

zle -N zle-line-init
zle -N zle-line-finish
zle -N zle-keymap-select
#================================================================================


#================================================================================
# EXAMPLES
#================================================================================
# rg 'ClocheApi' --files-with-matches | xargs sd -f c ClocheApi Cie
#================================================================================

#================================================================================
### Added by Zinit's installer
#================================================================================
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk
#================================================================================
# MY ZSH PLUGINS (I used to use Antibody for this)
#================================================================================
zinit ice wait"2" lucid
zinit light zsh-users/zsh-autosuggestions
zinit ice wait"2" lucid
zinit light zsh-users/zsh-completions
zinit ice wait"2" lucid
zinit light zsh-users/zsh-history-substring-search
zinit ice wait"2" lucid
zinit light zsh-users/zsh-syntax-highlighting

zinit light zpm-zsh/autoenv

# denysdovhan/spaceship-prompt - another good shell.
zinit light subnixr/minimal # current shell - it's quite nice.
zinit ice wait"2" lucid
zinit light popstas/zsh-command-time

zinit ice wait"2" lucid
zinit light changyuheng/fz
zinit ice wait"2" lucid
zinit light rupa/z

zinit ice wait"2" lucid
zinit light caarlos0/zsh-mkc
zinit ice wait"2" lucid
zinit light mattmc3/zsh-safe-rm

# unixorn/tumult.plugin.zsh #https://github.com/unixorn/tumult.plugin.zsh -> For useful commands
# unixorn/tumult.plugin.zsh
zinit ice wait"2" lucid
zinit light MichaelAquilina/zsh-you-should-use

zinit ice wait"2" lucid
zinit light paulirish/git-open

#experimental
zinit ice wait"2" lucid
zinit light wfxr/forgit

zinit ice wait"2" lucid
zinit light Valiev/almostontop
# jeffreytse/zsh-vi-mode
#================================================================================
. /usr/local/opt/asdf/libexec/asdf.sh


#=====================================SAVI========================================
eval "$(ssh-agent -s)" > /dev/null 2>&1
# mac
ssh-add --apple-use-keychain ~/.ssh/*.pem &>/dev/null

function setJump {
  export JUMP_PUBLIC_IP=$(aws ec2 describe-instances --filters Name=tag:Name,Values=jump  --region us-west-2 \
    --query "Reservations[*].Instances[*].PublicIpAddress" --output=text)
  export MIGRATION_PRIVATE_IP=$(aws ec2 describe-instances --filters Name=tag:Name,Values=migration-prod-v1  --region us-west-2 \
    --query "Reservations[*].Instances[*].PrivateIpAddress" --output=text)
}
function sshReadReplica {
  setJump
  echo "Jump IP set, connecting to read replica"
  ssh -N -L 5432:getsavi-mono-prod-read-replica2.cuwk9myovve6.us-west-2.rds.amazonaws.com:5432 -J \
    ubuntu@$JUMP_PUBLIC_IP "ec2-user@$MIGRATION_PRIVATE_IP" -i ~/.ssh/savi-us-west-2.pem
}

#=====================================SAVI========================================

# Created by `pipx` on 2023-02-25 20:41:17
export PATH="$PATH:/Users/arpit/.local/bin"
