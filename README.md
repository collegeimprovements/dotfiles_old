# Dotfiles

* | Tool        | Description - Usage                                          |
  | ----------- | ------------------------------------------------------------ |
  | **ZSH**     | `.zshrc`, `.zshenv`, `.zsh_plugins.txt`                   |
  | **ASDF**    | `elixir`,` erlang`, `rust`, `golang`, `postgres`, `rabbitmq`  etc. |
  | **macOS** | `Brewfile`,` setup-macos`, more coming soon.                 |
  | **Config**  | `Kitty`, global yarn packages                                |
  | **Git**     | `.gitignore(global gitignore)`,` gitconfig`                  |
  | **Hammerspoon** | For `contro-esc` key binding. It occasionally stops working. But restarting(i.e. open-quit-open) hammersoon seems to be fixing it. |
  | **Code**    | Contains all User settings related to `vscode`. ```rm -rf ~/Library/Application\ Support/Code/User <br />ln -s ~/.config/vscode/User` ~/Library/Application\ Support/Code/User``` |
  | **Language Servers** | Lua, Elixir, Efm |
  
  ---------
  
* This files currently assumes username as `arpit`. i.e. `whoami` returns arpit. # Update: Most of the hard-coded things have been removed now.

  * At few places we have used $HOME and at some place we have used `/Users/arpit` in settings. 
  * All `macos` related files are in `$HOME/macos` folder.

    * `Brewfile` contains all the `homebrew` package.
    * `setup-macos` contains sane settings for `macos`. It's currently WIP.
  * For ZSH we track `.zshenv`, `.zshrc`, `.zsh_plugins.txt` file.

    * We use [Antigen](https://github.com/zsh-users/antigen) for managing `Zsh Packages`
  * We use `asdf` as our primary language version manager.: 
    We manage `elixir`, `erlang`, `rust`, `golang` and other languages with `asdf`
  * For `node` we used to use volta for managing `node` versions and installing global executables of `node libraries`. 
    But now we use `asdf` for node as well. And it's working well. 

* Note: For `vscode` we have ran the following commands.

  * `rm -rf ~/Library/Application\ Support/Code/Userln -s ~/.config/vscode/User`
  * `ln -s ~/.config/vscode/User ~/Library/Application\ Support/Code/User`
  * And just for the first time we needed to create `~/.config/vscode/User` folder by running `mkdir -p ~/.config/vscode/User`

  # [Neovim](https://github.com/collegeimprovements/dotfiles/tree/master/.config/nvim)

  There is only `init.lua` file to configure the whole Neovim. 

  It contains all the configurations, key-mappings, LSP-related stuff, treesitter etc.

  We make the following assumption:

  1. Language servers are installed at `~/language-servers` path

  

  ## Language Servers (@ <u>~/language-servers</u> path)

  ### Lua Language Server

  * Follow the instructions at: https://www.chrisatmachine.com/Neovim/28-neovim-lua-development/ 

  ### Elixir Language Server 

  * Follow the instructions at: https://www.mitchellhanberg.com/how-to-set-up-neovim-for-elixir-development/?utm_medium=email&utm_source=elixir-radar 
  * Note: setup erlang and elixir version according to the version used in the project. 
  * Use `asdf local elixir 1.10.3-otp-22` and `asdf list erlang 22.3.4.1`. And then build the `elixirls` language server build.
  * Once we migrate all the project to `erlang-24` and latest elixir then update the `elixirls`'s  versions accordingly and build again. 

  # [Kitty](https://github.com/collegeimprovements/dotfiles/tree/master/.config/kitty)

  We use `JetbrainsMono Nerd Font` font.

  We use `gruvbox` theme.

  All keymappings and config can be found [here](https://github.com/collegeimprovements/dotfiles/blob/master/.config/kitty/custom-kitty.conf).

  # [ZSH](https://github.com/collegeimprovements/dotfiles/blob/master/.zshrc)

  We use [anitbody](https://getantibody.github.io/) to install and update zsh plugins. 

  Our `zshrc` file have PATH config and some really nice functions like `fancy-ctrl-z`, ` almostontop`, `dot` commands for `dotfiles` management, aliases  etc.

  

  

  
