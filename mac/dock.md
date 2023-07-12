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

## Delay

Fortunately, many hidden options in macOS can be set with a command-line utility called defaults. To trigger the fade-in animation of the Dock immediately you can do the following:

```zsh
defaults write com.apple.dock autohide-delay -float 0
killall Dock
```

After executing this command the Dock needs to be restarted (killall Dock). If you want to switch back to the standard behavior, you can simply delete the corresponding configuration key:

```zsh
defaults delete com.apple.dock autohide-delay
killall Dock
```

You can also control the duration of the fade-in and fade-out animation itself. For example, to set the animation duration to half a second, you can enter the following commands.

```zsh
defaults write com.apple.dock autohide-time-modifier -float 0.5
killall Dock
```

My default :

```zsh
defaults write com.apple.dock autohide-time-modifier -float 0.3;killall Doc
```
