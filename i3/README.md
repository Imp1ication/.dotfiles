# i3

## Screenshot

![](https://i.imgur.com/NvNokcV.png)

## Dependencies

- Desktop: feh
- Fonts & Icons: Nerd Fonts

## Installation

- Install i3

```
/usr/lib/apt/apt-helper download-file https://debian.sur5r.net/i3/pool/main/s/sur5r-keyring/sur5r-keyring_2023.02.18_all.deb keyring.deb SHA256:a511ac5f10cd811f8a4ca44d665f2fa1add7a9f09bef238cdfad8461f5239cc4
sudo apt-get install ./keyring.deb

echo "deb http://debian.sur5r.net/i3/ $(grep '^DISTRIB_CODENAME=' /etc/lsb-release | cut -f2 -d=) universe" | sudo tee /etc/apt/sources.list.d/sur5r-i3.list

sudo apt-get update
sudo apt-get install i3 -y
```

- Display version (should be above 4.22):

```
i3 -v
```

## Additional Tools

- Launcher: [Rofi](https://github.com/davatorium/rofi)
- Lock screen: [betterlockscreen](https://github.com/betterlockscreen/betterlockscreen)
- Status bar: [bumblebee-status](https://bumblebee-status.readthedocs.io/en/main/)

## Mappings

| Mappings                      | Action                                                                                     |
| ----------------------------- |:------------------------------------------------------------------------------------------ |
| `Modifier`                    | `Win`                                                                                      |
| `Mod + Return`                | Open new terminal                                                                          |
| `Mod + d`                     | Start rofi (a program launcher)                                                            |
| `Mod + p`                     | Powermenu                                                                                  |
| `Mod + o`                     | Wifimenu                                                                                   |
| `Mod + Shift + x`             | Lock screen                                                                                |
| `Mod + f`                     | Toggle fullscreen                                                                          |
| `Mod + c/v`                   | Split in horizontal/vertical orientation                                                   |
| `Mod + s/w/e`                 | Change container layout (stacked, tabbed, toggle split)                                    |
| `Mod + Shift + Space`         | Toggle tiling/floating                                                                     |
| `Mod + space`                 | Change focus between tiling/floating windows                                               |
| `Mod + r`                     | Trigger resize window (`Arror/h/j/k/l` to resize, `Return/Escape/Mod+r` to back to normal) |
| `Mod + Shift + r`             | Restart i3                                                                                 |
| `Mod + Shift + e`             | Exit i3                                                                                    |
| `Mod + q`                     | Kill a window                                                                              |
| `Mod + Arrow/h/j/k/l`         | Change focus                                                                               |
| `Mod + Shift + Arrow/h/j/k/l` | Move focused window                                                                        |
| `Mod + number`                | Switch to workspace                                                                        |
| `Mod + Shift + number`        | Move focused container to workspace                                                        |

## References
- [i3wm.org](https://i3wm.org/)
- [i3 tutorial](https://youtube.com/playlist?list=PL5ze0DjYv5DbCv9vNEzFmP6sU7ZmkGzcf&si=-pHvjPONHTSqDpKW)
- [bumblebee-status](https://bumblebee-status.readthedocs.io/en/main/introduction.html)