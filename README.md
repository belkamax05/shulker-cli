# shulker-cli

## Usage

Add into your .zshrc

```zsh
DEBUG=false
VERBOSE=false
TRACE=false
WATCH=true

if [[ ! -f $HOME/dev/shulker-cli/include.sh ]]; then
    git clone git@github.com:belkamax05/shulker-cli.git $HOME/dev/shulker-cli
fi
source $HOME/dev/shulker-cli/include.sh
```

Additionally (if needed)

```zsh
clone-and-source "git@github.com:belkamax05/dotfiles-public.git" "$HOME/dev/dotfiles-public" "include.sh"
# clone-and-source "git@github.com:<your-repo>/dotfiles-private.git" "$HOME/dev/dotfiles-private" "include.sh"
clone-and-source "git@github.com:belkamax05/shulker-studio.git" "$HOME/dev/shulker-studio" "include.sh"
```


## Related repositories

[dotfiles-public](https://github.com/belkamax05/dotfiles-public)

[dotfiles-private (PRIVATE)](https://github.com/belkamax05/dotfiles-private)

[shulker-studio (PRIVATE)](https://github.com/belkamax05/shulker-studio)