# Dotfiles

* This files currently assumes username as `arpit`. i.e. `whoami` returns arpit.
  At few places we have used $HOME and at some place we have used `/Users/arpit` in settings. 

* All `macos` related files are in `$HOME/macos` folder.

  * `Brewfile` contains all the `homebrew` package.
  * `setup-macos` contains sane settings for `macos`. It's currently WIP.

* For ZSH we track `.zshenv`, `.zshrc`, `.zsh_plugins.txt` file.
  
  * We use [Antigen](https://github.com/zsh-users/antigen) for managing `Zsh Packages`
  
* We use `asdf` as our primary language version manager. 
  We manage `elixir`, `erlang`, `rust`, `golang` and other languages with `asdf`

* For `node` we use volta for managing `node` versions and installing global executables of `node libraries`

  | Tool        | Description - Usage                                          |
  | ----------- | ------------------------------------------------------------ |
  | ZSH         | .zshrc, .zshenv, .zsh_plugins.txt                            |
  | ASDF        | elixir, erlang, rust, golang, Haskell  etc.                  |
  | macOS       | Brewfile, setup-macos, more coming soon.                     |
  | Config      | Kitty, global yarn packages                                  |
  | Git         | .gitignore(global gitignore), gitconfig                      |
  | Hammerspoon | For contro-esc key binding. It occasionally stops working. But restarting(i.e. open-quit-open) hammersoon seems to be fixing it. |
  | Code        | Contains all User settings related to `vscode`. ```rm -rf ~/Library/Application\ Support/Code/User <br />ln -s ~/.config/vscode/User` ~/Library/Application\ Support/Code/User``` |

* Note: For `vscode` we have ran the following commands.

  * `rm -rf ~/Library/Application\ Support/Code/Userln -s ~/.config/vscode/User`
  * `ln -s ~/.config/vscode/User ~/Library/Application\ Support/Code/User`
  * And just for the first time we needed to create `~/.config/vscode/User` folder by running `mkdir -p ~/.config/vscode/User`

  
