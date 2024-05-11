# My config files

## Kitty

### Install

```bash
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
```

### Set Desktop Environment

```bash
sudo ln -sf ~/.local/kitty.app/bin/kitty ~/.local/kitty.app/bin/kitten /usr/bin/
sudo cp ~/.local/kitty.app/share/applications/kitty.desktop ~/.local/share/applications/
sudo cp ~/.local/kitty.app/share/applications/kitty-open.desktop ~/.local/share/applications/
sudo sed -i "s|Icon=kitty|Icon=/home/$USER/.local/kitty.app/share/icons/hicolor/256x256/apps/kitty.png|g" ~/.local/share/applications/kitty*.desktop
sudo sed -i "s|Exec=kitty|Exec=/home/$USER/.local/kitty.app/bin/kitty|g" ~/.local/share/applications/kitty*.desktop
```
