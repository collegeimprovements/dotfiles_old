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
* 
