## Homebrew Install and Restoration

### Installing Homebrew
The following command installs `Homebrew` <br><br>
`/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"` <br><br>

In `dotfiles/personal/Brewfile`, all packages are listed for quick installation. <br>

### Restoring Packages in Homebrew
- Close and launch a new terminal for the installation of `Brew` to take affect. <br>
- Run `brew bundle` where the `Brewfile` is located to restore packages.
