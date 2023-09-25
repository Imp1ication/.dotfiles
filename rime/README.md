# RIME

RIME / 中州韻輸入法引擎（Rime Input Method Engine）是一個跨平臺的輸入法算法框架。

基於這一框架，Rime 開發者與其他開源社區的參與者在 Windows、macOS、Linux、Android 等平臺上創造了不同的輸入法前端實現。

## Installation

- 下載 ibus-rime

```
sudo apt-get install ibus-rime
```

- 安裝輸入法

Rime 官方提供了許多的輸入法，可以到[這裡](https://github.com/rime/home/wiki/RimeWithIBus#ubuntu)去找到你最熟悉的一款來下載。或者，你也可以和我一樣去下載其他人寫好的輸入法，來把它加進Rime的用戶文件夾（`~/.config/ibus/rime`）中使用。

例如我所使用的就是官方所額外提供的[許氏注音方案](https://www.facebook.com/rime.tw/photos/a.1089773121039113/1170985266251231/?type=3)。

安裝好輸入法和配置文件後，可以使用快捷鍵 Ctrl + \` 或 F4 來選擇輸入法。

![](https://i.imgur.com/OxV5IhJ.jpg)

- 配置完成後，必須重新起動 ibus 來啟用配置

```
ibus-daemon -drx
```

## Usage 

- 切換至 rime

```
ibus engine rime
```

- 修改 ibus 設置

到 Input Method 中加入Chinese - Rime。

```
ibus-setup
```

![](https://i.imgur.com/eqH4twv.jpg)

- 加入 i3wm 的起動項

```
exec_always --no-startup-id ibus-daemon -drx
```

## References

- [RIME](https://rime.im/)
- [Ubuntu 上安装使用 ibus-rime（超实用）](https://www.cnblogs.com/keatonlao/p/12983158.html)
- [RIME中的許氏注音方案](https://www.facebook.com/rime.tw/photos/a.1089773121039113/1170985266251231/?type=3)
- [Ubuntu20.04+i3wm折腾笔记](https://blog.csdn.net/lpwmm/article/details/108334254)
