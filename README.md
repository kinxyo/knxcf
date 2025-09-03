# KNXCF

## About

Setup guide for `CachyOS+Hyprland`.

## Prepare

- CachyOS -- https://cachyos.org/download/
- Rufus -- https://rufus.ie/en/
- BalenaEtcher - https://etcher.balena.io/

## Installation Steps

...

## Download

### Essentials

#### Tools

```
sudo pacman -S zsh git ghostty helix lf glow tree nautilus
```

```
chsh -s $(which zsh)
```

#### Languages

```
sudo pacman -S go rustup base-devel zig nodejs npm
```

```
rustup default stable
```

#### Language Servers

```
sudo pacman -S gopls rust-analyzer clang zls vue-language-server typescript-language-server
```

## Configs

### Zsh

```
# Exports
export EDITOR=helix
export VISUAL=helix

# Alias
alias e="fg"
alias hx="helix"
alias v="helix ."
alias q="exit"
alias clr="clear"
alias b="cd .."
alias work="cd ~/Work"
alias learn="cd ~/Learn"
alias hyprconf="hx ~/.config/hypr/config"
alias zconf="hx ~/.zshrc"
alias zrc="source ~/.zshrc"
alias hxconf="hx ~/.config/helix"
alias gconf="hx ~/.config/ghostty/config"
alias xorw="echo $XDG_SESSION_TYPE"
alias tree="tree -L 3 -I \"node_modules|.git|target|tmp|venv\""
alias treec="tree -L 3 -I \"node_modules|.git|target|tmp|venv\" | wl-copy"
alias treem="tree -L 4 -I \"node_modules|.git|target|tmp|venv\""
alias treemc="tree -L 4 -I \"node_modules|.git|target|tmp|venv\" | wl-copy"
alias treef="tree -L 10 -I \"node_modules|.git|target|tmp|venv\""
alias treefc="tree -L 10 -I \"node_modules|.git|target|tmp|venv\" | wl-copy"
alias zr="zig run main.zig"
alias pwc="pwd | wl-copy"
```

### Helix

```toml
# theme = "ayu_dark"
# theme = "base16_default"
# theme = "github_dark"
theme = "base16_transparent"
# theme = "hex_lavender"
# theme = "dracula"
# theme = "horizon-dark"
# theme = "kanagawa-dragon"
# theme = "doom_acario_dark"
# theme = "curzon"
# theme = "bogster"
# theme = "dracula_at_night"
# theme = "modus_vivendi_tritanopia"
# theme = "amberwood"

[editor]
line-number = "relative"
true-color = true
bufferline = "always"

[editor.cursor-shape]
insert = "bar"
normal = "block"
select = "underline"

[keys.normal]
X = "extend_line_above"
ret = "goto_first_nonwhitespace"
S-ret = "goto_line_end"
A-l = [ "goto_last_line" , "goto_line_end"] # not working in `select` or visual mode.
C-q = "switch_to_uppercase"
C-z = "collapse_selection"
'\' =  ["flip_selections"]
'`' =  ["collapse_selection", "keep_primary_selection", "delete_selection"] # PRODUCTIVITY 1000
i = ["collapse_selection", "insert_mode"]
a = ["collapse_selection", "append_mode", "collapse_selection"]
D = "delete_selection_noyank"

[keys.normal.space]
"space" = ":w"
q = ":q"
x = ":bc"
e = ":wq"
n = "goto_previous_buffer"
m = "goto_next_buffer"
f = "file_picker_in_current_directory"
F = "file_picker"
o = "suspend"

[keys.insert]
C-k = "normal_mode" # doesn't work unless "rich keyboard protocol" or something like this is enabled in terminal. Will work in Kitty.
'C-]' = ["normal_mode", "goto_line_end", "append_mode", "collapse_selection"] # REQUIRES `Rich Keyboard Protocol`.
C-ret = "completion"

[keys.select]
D = "delete_selection_noyank"

[editor.lsp]
display-messages = true
```

### Ghostty

```
# gtk-single-instance = true

# theme = Banana Blueberry
# theme = CyberpunkScarletProtocol
theme = catppuccin-mocha


font-size = 16
# font-family = "SF Pro Display Regular"
# window-padding-x = 9
# window-height = 30
# window-width = 96
# window-width = 100
# gtk-titlebar = false
# copy-on-select = true
background-opacity = 0.7 
# background-opacity = 0.1 
# cursor-style-blink = true
# link-url = true
# cursor-invert-fg-bg = true

# SHORTCUTS
keybind = ctrl+enter=unbind
keybind = ctrl+shift+r=reload_config

keybind = ctrl+shift+enter=new_split:auto
keybind = ctrl+l=goto_split:right
keybind = ctrl+h=goto_split:left
keybind = ctrl+k=scroll_page_up
keybind = ctrl+j=scroll_page_down
keybind = ctrl+space=next_tab
keybind = ctrl+shift+space=previous_tab
keybind = ctrl+n=toggle_split_zoom
keybind = ctrl+'=clear_screen


# keybind = ctrl+shift+i=inspector
# keybind = ctrl+shift+l=new_split:down
# keybind = global:cmd+'=toggle_quick_terminal
```

### Hyprland

#### Keybinds

```conf

# ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
# ┃                         Keybinds                            ┃
# ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛

source = ~/.config/hypr/config/defaults.conf

# Add to your Hyprland config:
# bindd = $mainMod, grave, Toggle overview, hyprexpo:expo, toggle

# https://wiki.hyprland.org/Configuring/Binds/
bindd = $mainMod, RETURN, Opens your preferred terminal emulator ($terminal), exec, $terminal
bindd = $mainMod, E, Opens your preferred filemanager ($filemanager), exec, $filemanager
bindd = $mainMod, W, Closes (not kill) current window, killactive,
bindd = $mainMod SHIFT, M, Exits Hyprland by terminating the user sessions, exec, loginctl terminate-user ""
bindd = $mainMod, V, Switches current window between floating and tiling mode, togglefloating,
bindd = $mainMod, SPACE, Runs your application launcher, exec, $applauncher
bindd = $mainMod, F, Toggles current window fullscreen mode, fullscreen
bindd = $mainMod, Y, Pin current window (shows on all workspaces), pin
bindd = $mainMod, U, Toggles current window split mode, togglesplit, # dwindle

bindd = , Print, Creates a screenshot of an area, exec, $shot-region
bindd = CTRL, Print, Creates a screenshot of the active window, exec, $shot-window
bindd = ALT, Print, Creates a screenshot of the active display, exec, $shot-screen

# ======= Grouping Windows =======

# bindd = $mainMod, K, Toggles  current window group mode (ungroup all related), togglegroup,
# bindd = $mainMod, Tab, Switches to the next window in the group, changegroupactive, f
bindd = $mainMod, Tab, Cycle through windows in current workspace, cyclenext,
bindd = $mainMod SHIFT, Tab, Cycle backwards through windows, cyclenext, prev,

# ======= Toggle Gaps =======

bindd = $mainMod SHIFT, G, Set CachyOS default gaps, exec, hyprctl --batch "keyword general:gaps_out 12;keyword general:gaps_in 10"
bindd = $mainMod, G, Remove gaps between window, exec, hyprctl --batch "keyword general:gaps_out 5;keyword general:gaps_in 3"

# ======= Volume Control =======

bindel = , XF86AudioRaiseVolume, exec, pactl set-sink-volume @DEFAULT_SINK@ +5% && pactl get-sink-volume @DEFAULT_SINK@ | grep -oP '\d+(?=%)' | awk '{if($1>100) system("pactl set-sink-volume @DEFAULT_SINK@ 100%")}' && pactl get-sink-volume @DEFAULT_SINK@ | grep -oP '\d+(?=%)' | awk '{print $1}' | head -1 > /tmp/$HYPRLAND_INSTANCE_SIGNATURE.wob # Raise Volume
bindel = , XF86AudioLowerVolume, exec, pactl set-sink-volume @DEFAULT_SINK@ -5% && pactl get-sink-volume @DEFAULT_SINK@ | grep -oP '\d+(?=%)' | awk '{print $1}' | head -1 > /tmp/$HYPRLAND_INSTANCE_SIGNATURE.wob # Lower Volume
bindel = , XF86AudioMute, exec, amixer sset Master toggle | sed -En '/\[on\]/ s/.*\[([0-9]+)%\].*/\1/ p; /\[off\]/ s/.*/0/p' | head -1 > /tmp/$HYPRLAND_INSTANCE_SIGNATURE.wob	#Mutes player audio

# ======= Playback Control =======

bindd = , XF86AudioPlay, Toggles play/pause, exec, playerctl play-pause
bindd = , XF86AudioNext, Next track, exec, playerctl next
bindd = , XF86AudioPrev, Previous track, exec, playerctl previous

# ======= Screen Brightness =======

bindel = , XF86MonBrightnessUp, exec, brightnessctl s +5% 	#Increases brightness 5%
bindel = , XF86MonBrightnessDown, exec, brightnessctl s 5%- 	#Decreases brightness 5%
bindd = $mainMod, M, Lock the screen, exec, swaylock-fancy -e -K -p 10 -f Hack-Regular
bindd = $mainMod, BackSpace, Private Search, exec, zen --private-window
bindd = $mainMod, O, Reload/restarts Waybar, exec, killall -SIGUSR2 waybar

# ======= Window Actions =======

## Move window with mainMod + LMB/RMB and dragging
bindd = $mainMod, mouse:272, Move the window towards a direction, movewindow
## Move window towards a direction
# bindd = $mainMod SHIFT, left, Move active window to the left, movewindow, l
# bindd = $mainMod SHIFT, right, Move active window to the right, movewindow, r
# bindd = $mainMod SHIFT, up, Move active window upwards, movewindow, u
# bindd = $mainMod SHIFT, down, Move active window downwards, movewindow, d
# Move window with hjkl (Vim-style)
bindd = $mainMod SHIFT, h, Move active window to the left, movewindow, l
bindd = $mainMod SHIFT, l, Move active window to the right, movewindow, r
bindd = $mainMod SHIFT, k, Move active window upwards, movewindow, u
bindd = $mainMod SHIFT, j, Move active window downwards, movewindow, d
## Move focus with mainMod + arrow keys
# bindd = $mainMod, left, Move focus to the left, movefocus, l
# bindd = $mainMod, right,  Move focus to the right, movefocus, r
# bindd = $mainMod, up, Move focus upwards, movefocus, u
# bindd = $mainMod, down, Move focus downwards, movefocus, d
bindd = $mainMod, h, Move focus to the left, movefocus, l
bindd = $mainMod, l, Move focus to the right, movefocus, r
bindd = $mainMod, k, Move focus upwards, movefocus, u  
bindd = $mainMod, j, Move focus downwards, movefocus, d

## Resizing windows
# Activate keyboard window resize mode
# https://wiki.hyprland.org/Configuring/Binds/#submaps
bindd = $mainMod, R, Activates window resizing mode, submap, resize
submap = resize
bindd = , right, Resize to the right (resizing mode), resizeactive, 15 0
bindd = , left, Resize to the left (resizing mode), resizeactive, -15 0
bindd = , up, Resize upwards (resizing mode), resizeactive, 0 -15
bindd = , down, Resize downwards (resizing mode), resizeactive, 0 15
bindd = , l, Resize to the right (resizing mode), resizeactive, 15 0
bindd = , h, Resize to the left (resizing mode), resizeactive, -15 0
bindd = , k, Resize upwards (resizing mode), resizeactive, 0 -15
bindd = , j, Resize downwards (resizing mode), resizeactive, 0 15
bindd = , escape, Ends window resizing mode, submap, reset
submap = reset
# Quick resize window with keyboard
# !!! added $mainMod here because CTRL + SHIFT is used for word selection in various text editors
bindd = $mainMod CTRL SHIFT, right, Resize to the right, resizeactive, 15 0
bindd = $mainMod CTRL SHIFT, left, Resize to the left, resizeactive, -15 0
bindd = $mainMod CTRL SHIFT, up, Resize upwards, resizeactive, 0 -15
bindd = $mainMod CTRL SHIFT, down, Resize downwards, resizeactive, 0 15
bindd = $mainMod CTRL SHIFT, l, Resize to the right, resizeactive, 15 0
bindd = $mainMod CTRL SHIFT, h, Resize to the left, resizeactive, -15 0
bindd = $mainMod CTRL SHIFT, k, Resize upwards, resizeactive, 0 -15
bindd = $mainMod CTRL SHIFT, j, Resize downwards, resizeactive, 0 15
# Resize window with mainMod + LMB/RMB and dragging
bindm = $mainMod, mouse:273, resizewindow	#Resize the window towards a direction
bindm = $mainMod, mouse:272, movewindow		#Drag window
## Resizing Windows End #

## Move active window to a workspace with $mainMod + CTRL + [0-9]
bindd = $mainMod CTRL, 1, Move window and switch to workspace 1, movetoworkspace, 1
bindd = $mainMod CTRL, 2, Move window and switch to workspace 2, movetoworkspace, 2
bindd = $mainMod CTRL, 3, Move window and switch to workspace 3, movetoworkspace, 3
bindd = $mainMod CTRL, 4, Move window and switch to workspace 4, movetoworkspace, 4
bindd = $mainMod CTRL, 5, Move window and switch to workspace 5, movetoworkspace, 5
bindd = $mainMod CTRL, 6, Move window and switch to workspace 6, movetoworkspace, 6
bindd = $mainMod CTRL, 7, Move window and switch to workspace 7, movetoworkspace, 7
bindd = $mainMod CTRL, 8, Move window and switch to workspace 8, movetoworkspace, 8
bindd = $mainMod CTRL, 9, Move window and switch to workspace 9, movetoworkspace, 9
bindd = $mainMod CTRL, 0, Move window and switch to workspace 10, movetoworkspace, 10
bindd = $mainMod CTRL, left, Move window and switch to the next workspace, movetoworkspace, -1
bindd = $mainMod CTRL, right, Move window and switch to the previous workspace, movetoworkspace, +1
## Same as above, but doesn't switch to the workspace
bindd = $mainMod SHIFT, 1, Move window silently to workspace 1, movetoworkspacesilent, 1
bindd = $mainMod SHIFT, 2, Move window silently to workspace 2, movetoworkspacesilent, 2
bindd = $mainMod SHIFT, 3, Move window silently to workspace 3, movetoworkspacesilent, 3
bindd = $mainMod SHIFT, 4, Move window silently to workspace 4, movetoworkspacesilent, 4
bindd = $mainMod SHIFT, 5, Move window silently to workspace 5, movetoworkspacesilent, 5
bindd = $mainMod SHIFT, 6, Move window silently to workspace 6, movetoworkspacesilent, 6
bindd = $mainMod SHIFT, 7, Move window silently to workspace 7, movetoworkspacesilent, 7
bindd = $mainMod SHIFT, 8, Move window silently to workspace 8, movetoworkspacesilent, 8
bindd = $mainMod SHIFT, 9, Move window silently to workspace 9, movetoworkspacesilent, 9
bindd = $mainMod SHIFT, 0, Move window silently to workspace 10, movetoworkspacesilent, 10
# Window actions End #

# ======= Workspace Actions =======

# Switch workspaces with mainMod + [0-9]
bindd = $mainMod, 1, Switch to workspace 1, workspace, 1
bindd = $mainMod, 2, Switch to workspace 2, workspace, 2
bindd = $mainMod, 3, Switch to workspace 3, workspace, 3
bindd = $mainMod, 4, Switch to workspace 4, workspace, 4
bindd = $mainMod, 5, Switch to workspace 5, workspace, 5
bindd = $mainMod, 6, Switch to workspace 6, workspace, 6
bindd = $mainMod, 7, Switch to workspace 7, workspace, 7
bindd = $mainMod, 8, Switch to workspace 8, workspace, 8
bindd = $mainMod, 9, Switch to workspace 9, workspace, 9
bindd = $mainMod, 0, Switch to workspace 10, workspace, 10
# Scroll through existing workspaces with mainMod + , or .
bindd = $mainMod, PERIOD, Scroll through workspaces incrementally, workspace, e+1
bindd = $mainMod, COMMA, Scroll through workspaces decrementally, workspace, e-1
# With $mainMod + scroll
bindd = $mainMod, mouse_down, Scroll through workspaces incrementally, workspace, e+1
bindd = $mainMod, mouse_up, Scroll through workspaces decrementally, workspace, e-1
bindd = $mainMod, slash, Switch to the previous workspace, workspace, previous
# Special workspaces (scratchpads)
bindd = $mainMod, minus, Move active window to Special workspace, movetoworkspace, special
bindd = $mainMod, equal, Toggles the Special workspace, togglespecialworkspace, special
bindd = $mainMod, TAB, Toggles the Special workspace, togglespecialworkspace, special
bindd = $mainMod, F1, Call special workspace scratchpad, togglespecialworkspace, scratchpad
bindd = $mainMod ALT SHIFT, F1, Move active window to special workspace scratchpad, movetoworkspacesilent, special:scratchpad

# ======= Additional Settings =======

# https://wiki.hyprland.org/Configuring/Binds
binds {
    allow_workspace_cycles = 1
    workspace_back_and_forth = 1
    workspace_center_on = 1
	movefocus_cycles_fullscreen = true
	window_direction_monitor_fallback = true
}
```

#### Monitors

```conf
# ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
# ┃                     Monitor Configuration                   ┃
# ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛

# Monitor wiki https://wiki.hyprland.org/Configuring/Monitors/

# monitor = , preferred, auto, 1
# monitor =eDP-1, preferred, auto, 1
# monitor = HDMI-A-1, preferred, auto, 1
# monitor=HDMI-A-1,1920x1080@120,0x0,1
monitor=eDP-1,1920x1080@144,0x0,1.25
# monitor=eDP-1,disable

# If you need to scale things like steam etc, please uncomment these lines.
xwayland {
 force_zero_scaling = true       # Unscale XWayland
}

# Adjust GDK_SCALE accordingly to your liking.
env = GDK_SCALE, 1.25                   # GDK Scaling Factor
```

#### Defaults

```conf
# ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
# ┃                     Defaults Configuration                  ┃
# ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛


# General
$filemanager = nautilus
$applauncher = wofi
$terminal = ghostty
$idlehandler = swayidle -w timeout 300 'swaylock -f -c 000000' before-sleep 'swaylock -f -c 000000'

# Screenshots
$shot-region = grimblast copy area
$shot-window = grimblast copy active
$shot-screen = grimblast copy output
```

#### Colors

```conf
# ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
# ┃                      Colors Configuration                   ┃
# ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛

# $cachylgreen = rgba(82dcccff)
$cachylgreen = rgba(eb6e9fff) #pinkish-red
$cachymgreen = rgba(00aa84ff)
$cachydgreen = rgba(007d6fff)
$cachylblue = rgba(01ccffff)
$cachymblue = rgba(182545ff)
$cachydblue = rgba(111826ff)
$cachywhite = rgba(ffffffff)
$cachygrey = rgba(ddddddff)
$cachygray = rgba(798bb2ff)
```

### Waybar

#### `Config`

```
{
    "layer": "top",
    "position": "top",
    "height": 34,
    "spacing": 4,
    "margin-top": 6,
    "margin-bottom": 0,
    "margin-left": 10,
    "margin-right": 10,
    
    "modules-left": ["custom/music"],
    "modules-center": ["hyprland/workspaces", "hyprland/window"],
    "modules-right": ["pulseaudio", "backlight", "network", "battery", "clock", "tray", "custom/lock", "custom/power"],
    
    "hyprland/workspaces": {
        "all-outputs": true,
        "warp-on-scroll": false,
        "enable-bar-scroll": true,
        "disable-scroll-wraparound": true,
        "active-only": false,
        "format": "{icon}",
        "format-icons": {
            "1": "󰋜",
            "2": "󰈹",
            "3": "󰊴",
            "4": "󰝚",
            "default": "󰋙"
        },
        "persistent-workspaces": {
            "*": 5
        }
    },
    
    "hyprland/window": {
        "format": "{}",
        "rewrite": {
            "^$": "󰇄   Desktop",
            "(.*) — Zen Browser": "󰈹   $1",
            "(.*) - Discord": "󰙯  $1",
            "(.*) - Visual Studio Code": "󰨞  $1",
            "(.*) - Spotify": "󰓇  $1",
            "(.*) - Ghostty": "   $1",
            "^~.*": "  Terminal",         // matches ~, ~/.config, etc.
            "^/.*": "  Terminal",         // matches /etc, /home/user, etc.
            "^[a-z0-9_-]+$": "  Terminal", // matches zsh, bash, nvim, htop, etc.
            "Steam": "󰓓  Steam"
        },
        "max-length": 50,
        "min-length": 20,
        "all-outputs": true
    },
    
    "tray": {
        "icon-size": 18,
        "spacing": 8,
        "show-passive-items": true
    },
    
    "custom/music": {
        "format": "󰎆 {}",
        "escape": true,
        "interval": 2,
        "tooltip": true,
        "tooltip-format": "Playing: {}",
        "exec": "playerctl metadata --format='  {{ artist }} - {{ title }}' 2>/dev/null || echo '  No media playing'",
        "on-click": "playerctl play-pause",
        "on-click-right": "playerctl next",
        "on-click-middle": "playerctl previous",
        "on-scroll-up": "playerctl volume 0.05+",
        "on-scroll-down": "playerctl volume 0.05-",
        "max-length": 60,
        "min-length": 15
    },
    
    "clock": {
        "timezone": "Asia/Kolkata",
        "tooltip-format": "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>",
        "format-alt": "󰃭 {:%A, %B %d, %Y}",
        "format": "󰥔  {:%H:%M}",
        "locale": "en_IN.UTF-8"
    },
    
    "backlight": {
        "device": "intel_backlight",
        "format": "{icon}  {percent}%",
        "format-icons": ["󰃞", "󰃟", "󰃠"],
        "tooltip": true,
        "tooltip-format": "Brightness: {percent}%",
        "on-scroll-up": "brightnessctl set +5%",
        "on-scroll-down": "brightnessctl set 5%-",
        "smooth-scrolling-threshold": 1
    },
    
    "network": {
        "format-wifi": "󰤨  {signalStrength}%",
        "format-ethernet": "󰈀  Connected",
        "format-linked": "󰈀  {ifname} (No IP)",
        "format-disconnected": "󰤭  Disconnected",
        "tooltip-format": "{ifname}: {ipaddr}/{cidr}",
        "tooltip-format-wifi": "{essid} ({signalStrength}%): {ipaddr}/{cidr}",
        "on-click": "nm-connection-editor"
    },
    
    "battery": {
        "states": {
            "good": 95,
            "warning": 30,
            "critical": 15
        },
        "format": "{icon}  {capacity}%",
        "format-charging": "󰂄  {capacity}%",
        "format-plugged": "󰚥  {capacity}%",
        "format-full": "󱈑  {capacity}%",
        "format-icons": ["󰂎", "󰁺", "󰁻", "󰁼", "󰁽", "󰁾", "󰁿", "󰂀", "󰂁", "󰂂", "󰁹"],
        "tooltip": true,
        "tooltip-format": "{capacity}% • {time}"
    },
    
    "pulseaudio": {
        "format": "{icon}  {volume}%",
        "format-muted": "󰖁  Muted",
        "format-icons": {
            "default": ["󰕿", "󰖀", "󰕾"]
        },
        "tooltip": true,
        "tooltip-format": "{volume}% on {desc}",
        "on-click": "pavucontrol",
        "on-click-right": "pactl set-sink-mute @DEFAULT_SINK@ toggle",
        "on-scroll-up": "pactl set-sink-volume @DEFAULT_SINK@ +5%",
        "on-scroll-down": "pactl set-sink-volume @DEFAULT_SINK@ -5%",
        "smooth-scrolling-threshold": 1
    },
    
    "custom/lock": {
        "tooltip": true,
        "tooltip-format": "Lock Screen",
        "on-click": "sh -c '(sleep 0.5s; swaylock --grace 0)' & disown",
        "format": "󰌾"
    },
    
    "custom/power": {
        "tooltip": true,
        "tooltip-format": "Power Menu",
        "on-click": "wlogout &",
        "format": "󰐥"
    }
}
```

### `mocha.css`

```css
/*
*
* Catppuccin Mocha palette
* Maintainer: rubyowo
*
*/

@define-color base   #1e1e2e;
@define-color mantle #181825;
@define-color crust  #11111b;

@define-color text     #cdd6f4;
@define-color subtext0 #a6adc8;
@define-color subtext1 #bac2de;

@define-color surface0 #313244;
@define-color surface1 #45475a;
@define-color surface2 #585b70;

@define-color overlay0 #6c7086;
@define-color overlay1 #7f849c;
@define-color overlay2 #9399b2;

@define-color blue      #89b4fa;
@define-color lavender  #b4befe;
@define-color sapphire  #74c7ec;
@define-color sky       #89dceb;
@define-color teal      #94e2d5;
@define-color green     #a6e3a1;
@define-color yellow    #f9e2af;
@define-color peach     #fab387;
@define-color maroon    #eba0ac;
@define-color red       #f38ba8;
@define-color mauve     #cba6f7;
@define-color pink      #f5c2e7;
@define-color flamingo  #f2cdcd;
@define-color rosewater #f5e0dc;
```

```css
/* Modern Waybar Style with Catppuccin Mocha */
@import "mocha.css";

* {
    font-family: "JetBrainsMono Nerd Font", "Noto Sans", sans-serif;
    font-size: 13px;
    font-weight: 500;
    min-height: 0;
}

window#waybar {
    background: transparent;
    color: @text;
}

window#waybar.hidden {
    opacity: 0.2;
}

/* Left modules */
.modules-left {
    margin-left: 8px;
}

/* Center modules */
.modules-center {
    margin: 0 8px;
}

/* Right modules */
.modules-right {
    margin-right: 8px;
}

/* General button styling */
button {
    box-shadow: none;
    text-shadow: none;
    border: none;
    border-radius: 8px;
    margin: 2px 3px;
    padding: 0 10px;
    background: transparent;
    color: inherit;
    transition: all 0.2s ease;
}

button:hover {
    background: alpha(@surface0, 0.8);
    color: @blue;
}

/* Workspaces */
#workspaces {
    background: alpha(@base, 0.8);
    border-radius: 10px;
    padding: 2px 4px;
    margin: 0 8px;
    border: 1px solid alpha(@surface0, 0.5);
}

#workspaces button {
    padding: 4px 8px;
    margin: 2px;
    background: transparent;
    color: @overlay0;
    border-radius: 6px;
    transition: all 0.3s ease;
}

#workspaces button:hover {
    background: alpha(@blue, 0.2);
    color: @blue;
}

#workspaces button.active {
    background: alpha(@blue, 0.8);
    color: @base;
    font-weight: bold;
}

#workspaces button.urgent {
    background: alpha(@red, 0.8);
    color: @base;
    animation: urgent 2s ease-in-out infinite;
}

@keyframes urgent {
    from { opacity: 1; }
    to { opacity: 0.7; }
}

/* Window title */
#window {
    background: alpha(@base, 0.6);
    padding: 6px 12px;
    margin: 0 8px;
    border-radius: 8px;
    color: @yellow;
    font-weight: 500;
    border: 1px solid alpha(@surface0, 0.3);
}

#window:hover {
    background: alpha(@base, 0.8);
}

/* Music module */
#custom-music {
    background: alpha(@green, 0.7);
    color: @base;
    padding: 6px 12px;
    border-radius: 8px;
    font-weight: 600;
    margin: 0 4px;
    border: 1px solid alpha(@green, 0.3);
}

#custom-music:hover {
    background: alpha(@green, 0.9);
}

/* Clock */
#clock {
    background: alpha(@peach, 0.7);
    color: @base;
    padding: 6px 12px;
    border-radius: 8px;
    font-weight: bold;
    margin: 0 4px;
    border: 1px solid alpha(@peach, 0.3);
}

#clock:hover {
    background: alpha(@peach, 0.9);
}

/* Audio */
#pulseaudio {
    background: alpha(@blue, 0.7);
    color: @base;
    padding: 6px 10px;
    border-radius: 8px;
    font-weight: 600;
    margin: 0 2px;
    border: 1px solid alpha(@blue, 0.3);
}

#pulseaudio:hover {
    background: alpha(@blue, 0.9);
}

#pulseaudio.muted {
    background: alpha(@overlay0, 0.7);
    color: @text;
}

/* Backlight */
#backlight {
    background: alpha(@yellow, 0.7);
    color: @base;
    padding: 6px 10px;
    border-radius: 8px;
    font-weight: 600;
    margin: 0 2px;
    border: 1px solid alpha(@yellow, 0.3);
}

#backlight:hover {
    background: alpha(@yellow, 0.9);
}

/* Network */
#network {
    background: alpha(@teal, 0.7);
    color: @base;
    padding: 6px 10px;
    border-radius: 8px;
    font-weight: 600;
    margin: 0 2px;
    border: 1px solid alpha(@teal, 0.3);
}

#network:hover {
    background: alpha(@teal, 0.9);
}

#network.disconnected {
    background: alpha(@red, 0.7);
    color: @base;
}

/* Battery */
#battery {
    background: alpha(@green, 0.7);
    color: @base;
    padding: 6px 10px;
    border-radius: 8px;
    font-weight: 600;
    margin: 0 2px;
    border: 1px solid alpha(@green, 0.3);
}

#battery:hover {
    background: alpha(@green, 0.9);
}

#battery.charging {
    background: alpha(@yellow, 0.7);
    animation: charging 2s ease-in-out infinite;
}

#battery.warning {
    background: alpha(@peach, 0.7);
    color: @base;
}

#battery.critical {
    background: alpha(@red, 0.7);
    color: @base;
    animation: critical 1s ease-in-out infinite;
}

@keyframes charging {
    from { opacity: 1; }
    to { opacity: 0.8; }
}

@keyframes critical {
    from { opacity: 1; }
    to { opacity: 0.5; }
}

/* Tray */
#tray {
    background: alpha(@base, 0.6);
    padding: 4px 8px;
    border-radius: 8px;
    margin: 0 4px;
    border: 1px solid alpha(@surface0, 0.3);
}

#tray:hover {
    background: alpha(@base, 0.8);
}

#tray menu {
    background: @base;
    border: 1px solid @surface0;
    border-radius: 8px;
}

/* Lock button */
#custom-lock {
    background: alpha(@mauve, 0.7);
    color: @base;
    padding: 6px 10px;
    border-radius: 8px;
    font-weight: 600;
    margin: 0 2px;
    border: 1px solid alpha(@mauve, 0.3);
}

#custom-lock:hover {
    background: alpha(@mauve, 0.9);
}

/* Power button */
#custom-power {
    background: alpha(@red, 0.7);
    color: @base;
    padding: 6px 10px;
    border-radius: 8px;
    font-weight: bold;
    margin: 0 2px;
    border: 1px solid alpha(@red, 0.3);
}

#custom-power:hover {
    background: alpha(@red, 0.9);
}

/* Tooltips */
tooltip {
    background: alpha(@base, 0.95);
    border: 1px solid @surface0;
    border-radius: 8px;
    color: @text;
    font-size: 12px;
    padding: 8px 12px;
}

tooltip label {
    color: @text;
    padding: 2px 4px;
    margin: 2px 0;
}
```

## Extras

### `md` path

name: `md`.
path: `/usr/bin`.
command: `chmod +x md`.

content:
```
#!/bin/bash
LANG=$1
LANG=${LANG:=md}

echo "\`\`\`${LANG}"
echo ""
echo "\`\`\`"
```

### Starship

```
curl -sS https://starship.rs/install.sh | sh
```

```toml
# STYLING GUIDE ↴
# https://starship.rs/advanced-config/#style-strings

add_newline = false # Inserts a blank line between shell prompts

[package]
disabled = true

[battery]
full_symbol = '🔋 '
charging_symbol = '⚡️ '
discharging_symbol = '💀 '

[[battery.display]]
threshold = 1 # disabled
style = 'bold blue'

# CONFIGURATION STARTS ----------->

[character] 
success_symbol = "[❯](blink fg:#f30065)"
error_symbol = "[❯](inverted red)"
vimcmd_symbol = "[❮](green)"

[directory]
home_symbol = "⌂"
style = "dimmed white"
truncation_length = 1
read_only = " 󰌾"

[cmd_duration]
format = "[$duration]($style) "
style="fg:#ffc972"

[username]
show_always = true
style_user = "fg:#9A348E"
style_root = "fg:#9A348E"
format = '[$user ]($style)'
# format = """
# [┗](blue)$character"""
# format = """
# [](fg:#ff79c6)[$custom.spinner](bg:#ff79c6 fg:black)[](fg:#ff79c6) \
# [](fg:#8be9fd)$directory[](fg:#8be9fd) \
# $git_branch$git_status
# $character"""
disabled = true

[git_branch]
style = "blue"
ignore_branches = ["master", "main"]
# symbol = "🍀"

[git_state]
format = '[\($state( $progress_current of $progress_total)\)]($style) '
cherry_pick = '[🍒 PICKING](bold red)'

[git_status]
format = '([$all_status$ahead_behind]($style)) '
conflicted = '[⭕](bold red)'
ahead = '⇡${count}'
diverged = '⇕⇡${ahead_count}⇣${behind_count}'
behind = '⇣${count}'
up_to_date = '[  ✓](bold white)'
untracked = '[ \($count\) untracked](dimmed yellow)'
stashed = 'stashed '
modified = '[\($count\) modified](dimmed red)'
staged = '[ \($count\) staged ](blink green)'
renamed = '[ \($count\) renamed ](inverted yellow)'
deleted = '[ \($count\) deleted ](inverted white)'

# --  ADD ANY NEW STUFF BEFORE THIS --
#
# The following is for removing `via` & `$version` FROM Default Prompt.

[os.symbols]
Windows = "󰍲"
Ubuntu = "󰕈"
SUSE = ""
Raspbian = "󰐿"
Mint = "󰣭"
Macos = "󰀵"
Manjaro = ""
Linux = "󰌽"
Gentoo = "󰣨"
Fedora = "󰣛"
Alpine = ""
Amazon = ""
Android = ""
Arch = "󰣇"
Artix = "󰣇"
CentOS = ""
Debian = "󰣚"
Redhat = "󱄛"
RedHatEnterprise = "󱄛"

[directory.substitutions]
"Documents" = "󰈙 "
"Downloads" = " "
"Music" = "󰝚 "
"Pictures" = " "
"ProductionGrade" = "󰲋 "
"Corporate" = "󰲋 "

[bun]
symbol = ""
style = "bold blue"
format = "[$symbol]($style)"

[buf]
format = "[$symbol]($style)"

[c]
symbol = " "
style = "bg:color_blue"
format = '[[ $symbol( $version) ](fg:color_fg0 bg:color_blue)]($style)'

[cmake]
format = "[$symbol]($style)"

[cobol]
format = "[$symbol]($style)"

[crystal]
format = "[$symbol]($style)"

[daml]
format = "[$symbol]($style)"

[dart]
symbol = " "
format = "[$symbol]($style)"

[deno]
format = "[$symbol]($style)"

[dotnet]
format = "[$symbol(🎯 $tfm )]($style)"

[elixir]
format = '[$symbol]($style)'

[elm]
format = '[$symbol]($style)'

[erlang]
format = '[$symbol]($style)'

[fennel]
format = '[$symbol]($style)'

[golang]
symbol = "Go "
style = "fg:#86BBD8"
format = '[$symbol ]($style)'

[gradle]
format = '[$symbol]($style)'

[haxe]
format = '[$symbol]($style)'

[helm]
format = '[$symbol]($style)'

[java]
symbol = " "
format = '[$symbol]($style)'

[julia]
format = '[$symbol]($style)'

[kotlin]
symbol = ""
format = '[$symbol]($style)'

[lua]
format = '[$symbol]($style)'

[meson]
format = '[$symbol]($style)'

[nim]
format = '[$symbol]($style)'

[nodejs]
symbol = " "
format = '[$symbol]($style)'

[ocaml]
format = '[$symbol(\($switch_indicator$switch_name\) )]($style)'

[opa]
format = '[$symbol]($style)'

[perl]
format = '[$symbol]($style)'

[php]
symbol = ""
format = '[$symbol]($style)'

[docker_context]
symbol = ""
style = "bg:color_bg3"
format = '[[ $symbol( $context) ](fg:#83a598 bg:color_bg3)]($style)'

[haskell]
symbol = ""
style = "bg:color_blue"
format = '[[ $symbol( $version) ](fg:color_fg0 bg:color_blue)]($style)'

[pulumi]
format = '[$symbol$stack]($style)'

[purescript]
format = '[$symbol]($style)'

[python]
symbol = '  '
style = "fg:green" # change color
format = '$virtualenv [${symbol}]($style)'

[quarto]
format = '[$symbol]($style)'

[raku]
format = '[$symbol]($style)'

[red]
format = '[$symbol]($style)'

[rlang]
format = '[$symbol]($style)'

[ruby]
format = '[$symbol]($style)'

[rust]
symbol = "  the crab language"
style = " fg:#FF8705"
format = '[$symbol ]($style)'

[solidity]
format = '[$symbol]($style)'

[typst]
format = '[$symbol]($style)'

[swift]
format = '[$symbol]($style)'

[vagrant]
format = '[$symbol]($style)'

[vlang]
format = '[$symbol]($style)'

[zig]
format = '[$symbol($version)]($style) '
```

### Zen Browser

Download from here: https://zen-browser.app/

- Move `zen/` folder to `/opt/`
- Create symbolic link `ln -s /opt/zen /usr/local/bin/zen`.

```
[Desktop Entry]
Name=Zen
Exec=/usr/local/bin/zen
Icon=/opt/zen/browser/chrome/icons/default/default128.png
Type=Application
Categories=Network;WebBrowser;
```

```
[Desktop Entry]
Name=Zen (private)
Exec=/usr/local/bin/zen --private-window
Icon=/opt/zen/browser/chrome/icons/default/default128.png
Type=Application
Categories=Network;WebBrowser;
```
### Spotify

Use Flatpak to install Spotify.

```
[Desktop Entry]
Name=Spotify (default)
Comment=Spotify with device scale factor fix
Exec=flatpak run com.spotify.Client --force-device-scale-factor=1.25
Icon=/var/lib/flatpak/app/com.spotify.Client/x86_64/stable/9f43d98473c39960912acac04d9fbf0b471bc3792c40311d40c15760cd1c4e1e/export/share/icons/hicolor/scalable/apps/com.spotify.Client.svg
Terminal=false
Type=Application
Categories=Audio;Music;Player;AudioVideo;
```

### Helix (language.toml)

```toml
# ****** Vue ********

# Install these first:
# bun add -g @volar/vue-language-server
# bun add -g @vue/typescript-plugin

[[language]]
name = "vue"
auto-format = true
formatter = { command = "prettier", args = ["--parser", "vue"] }
language-servers = ["typescript-language-server", "emmet-ls"]

[[language-server.typescript-language-server.config.plugins]]
name = "@vue/typescript-plugin"
location = "/home/kinxyo/.bun/install/global/node_modules/@vue/typescript-plugin"
languages = ["vue"]

# Volar is the official Vue Language Server - much better for Vue than TS server
[language-server.volar]
command = "vue-language-server"
args = ["--stdio"]

[language-server.volar.config]
typescript = { tsdk = "/home/kinxyo/.bun/install/global/node_modules/typescript/lib" }

# Enable better HTML support in Vue templates
[language-server.volar.config.vue]
hybridMode = false

[language-server.volar.config.vue.complete.casing]
tags = "kebab"
props = "camel"

# Keep emmet for HTML shortcuts
[language-server.emmet-ls]
command = "emmet-ls"
args = ["--stdio"]

# Optional: Add HTML language server for even better HTML support
[[language]]
name = "html"
language-servers = ["vscode-html-language-server", "emmet-ls"]
auto-format = true
formatter = { command = "prettier", args = ["--parser", "html"] }

[language-server.vscode-html-language-server]
command = "vscode-html-language-server"
args = ["--stdio"]

# ****** BACKUP (vue) ********

# [[language]]
# name = "vue"
# auto-format = true
# formatter = { command = "prettier", args = ["--parser", "vue"] }
# language-servers = ["typescript-language-server", "emmet-ls"]

# [[language-server.typescript-language-server.config.plugins]]
# name = "@vue/typescript-plugin"
# location = "/home/kinxyo/.bun/install/global/node_modules/@vue/typescript-plugin"
# languages = ["vue"]

# [language-server.emmet-ls]
# command = "emmet-ls"
# args = []

# [language-server.vuels.config.typescript]
# tsdk = "/home/kinxyo/.bun/install/global/node_modules/typescript/lib"

# ****** OTHER LANG(s) ********

[[language]]
name = "python"
language-servers = [ "pyright" ]

[[language]]
name = "jsx"
language-servers = [ "typescript-language-server", "eslint", "emmet-ls" ]
formatter = { command = "prettier", args = [ "--parser", "typescript" ] }
auto-format = false

[[language]]
name = "rust"
auto-format = false
```

## Tips

1. To toggle natural scroll

To get device ID use `hyprctl devices`

```
device {
    name = <device_id>
    natural_scroll = true
}
```

**Example:-**

```
device {
    name = ftcs0038:00-2808:0106-touchpad
    natural_scroll = true
}
```

2. If laptop doesn't wake up from sleep, try adding this (if using systemd):

file: `/boot/loader/entries/linux-cachyos.conf`
to add: `pcie_aspm=off`

**Example:-**

```
title Linux Cachyos
options root=UUID=XXXX rw pcie_aspm=off zswap.enabled=0 nowatchdog splash
linux /vmlinuz-linux-cachyos
initrd /initramfs-linux-cachyos.img
```
