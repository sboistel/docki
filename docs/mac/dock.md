# Dock

## Space

How to add space on dock as an application ?

This command will add a new blank application into your dock.

```zsh
defaults write com.apple.dock persistent-apps -array-add '{tile-type="spacer-tile";}'
```

To take it into account, restart your dock

```zsh
killall Dock
```

To force start dock, minimise an application
