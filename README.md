# Setup env quickly (Ubuntu)

## Zsh

- Install `zsh`
- Install `fnm`
- Install `fd`
- Install `bat`
- Install `fkill`

### Install

```bash
sudo apt install zsh
```

### Plugins

#### fnm

```bash
curl -fsSL https://fnm.vercel.app/install | bash
```

_install node_:
```bash
fnm install --lts
```

#### fd

[binary](https://github.com/sharkdp/fd?tab=readme-ov-file#installation)

#### bat

```bash
sudo apt install bat
```

#### fkill

```bash
npm install --global fkill-cli
```

## Starship

### Install

```bash
curl -sS https://starship.rs/install.sh | sh
```

### Nerd Font

1. [get any](https://www.nerdfonts.com/)
2. move 'em fonts to `$HOME/.fonts`

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

_[get the real icon](https://github.com/kovidgoyal/kitty/issues/3618) then replace it._
