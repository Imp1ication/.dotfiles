# Rime Configuration

本目錄包含 [Rime 輸入法](https://rime.im/) 的自訂設定檔。

## Contents

- `default.custom.yaml`：主要自訂設定（方案、外觀、快捷鍵等）
- `custom_phrase.txt`：自訂詞庫
- 其他 `.yaml` 檔案：各類輸入方案與細部設定
- `*.userdb` 目錄：保存用戶的輸入習慣而自動創建與更新的用戶詞典

## Installation

1. 從[官方網站](https://rime.im/)或使用 Homebrew 安裝 Rime 輸入法：

```
brew install squirrel-app
```

2. 安裝所需輸入法 (optional)：Rime 官方提供了許多的輸入法，可以到[這裡](https://github.com/rime/home/wiki/RimeWithIBus#ubuntu)去找到你最熟悉的一款來下載。或者，你也可以和我一樣去下載其他人寫好的輸入法，來把它加進 `~/.dotfiles/Rime/` 中使用。

例如我所使用的就是官方所額外提供的[許氏注音方案](https://www.facebook.com/rime.tw/photos/a.1089773121039113/1170985266251231/?type=3)。

3. Symlink Rime 的配置文件到系統用戶設定目錄中：

```
ln -sf ~/.dotfiles/Rime ~/Library/Rime
```

並於輸入法選單中選擇「重新部署」以套用設定。

![Rime deploy](assets/rime-deploy.jpg)

完成後即可使用快捷鍵 F4 來選擇輸入法。

![Rime input method](assets/rime-input-method.jpg)

## References

- [RIME](https://rime.im/)
- [Ubuntu 上安装使用 ibus-rime（超实用）](https://www.cnblogs.com/keatonlao/p/12983158.html)
- [RIME中的許氏注音方案](https://www.facebook.com/rime.tw/photos/a.1089773121039113/1170985266251231/?type=3)
- [Ubuntu20.04+i3wm折腾笔记](https://blog.csdn.net/lpwmm/article/details/108334254)
