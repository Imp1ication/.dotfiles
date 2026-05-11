# fish

## Screenshot

![](https://i.imgur.com/0ayGBbM.jpg)

## Installation

- Install fish

```
sudo add-apt-repository ppa:fish-shell/release-3
sudo apt-get update
sudo apt-get install fish -y
```

- Change default shell

```
chsh -s /usr/bin/fish
```

## My Aliases

| Alias | Command             |
| ----- |:------------------- |
| `..`  | `cd ..`             |
| `.2`  | `cd ../..`          |
| `.3`  | `cd ../../..`       |
| `.4`  | `cd ../../../..`    |
| `.5`  | `cd ../../../../..` |
| `c`   | `clear`             |

## Mappings

| Mappings          | Action                                         |
|:----------------- | ---------------------------------------------- |
| `Alt + f/b`       | Jump forwards/backwards to the start of a word |
| `Ctrl + a/e`      | Jump to the start/end of line                  |
| `Ctrl + u/k`      | Cut till beginning/end                         |
| `Ctrl + l`        | Clear screen (`clear`)                         |
| `Ctrl + c`        | Interrupt/Kill                                 |
| `Ctrl + r`        | History search                                 |
| `Ctrl + f` or `→` | Accept the autosuggestion                      |
| `Alt + →`         | Accept a single word of the autosuggestion     |
| `!!`              | History previous command                       |
| `!$`              | History previous command arguments             |

## References

- [fish shell documents](https://fishshell.com/docs/current/index.html)
- [Creating Functions In The Fish Shell](https://youtu.be/ec1A3YGQY60?si=0c2DKlq-Z3mgaq9p)
- [Fish Shell Tips and Tricks (Can Your Shell Do This?)](https://youtu.be/8GN9D-OnG-A?si=0pdXcVtJ3KJtZbma)

