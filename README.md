# Python API for [WeChat Work](https://work.weixin.qq.com) Message Bot

**[企业微信](https://work.weixin.qq.com)群机器人 Python 接口和命令行工具。**

About the name: `v` = WeChat, `me` = Me, `vme` = WeChat Me.  It's somewhat inspired by Chinese Internet meme "VME50".

**vme** is [listed on PyPI](https://pypi.org/project/vme/).

**vme** is dependency-free.

## Python API

`vme.send()` sends text (`str`) or image (`bytes`).  Due to limitations of WeChat Work, only PNG and JPG images under 2M size are allowed.  Image is recognized by detecting first few bytes (magic bits) of the binary data.  An exception will be raised if payload is neither text nor image.

All texts are sent as markdown.  Please note that the markdown features WeChat Work supports are [extremely limited](https://developer.work.weixin.qq.com/document/path/91770#markdown%E7%B1%BB%E5%9E%8B).

`vme.send_file()` is not implemented yet.

```python
import vme

# send text
vme.send('your-bot-key', 'Texts with `minimal markdown` support.')

# send image, only PNG or JPG are supported
image = plot_some_curve(...)
vme.send('your-bot-key', image)

# send file (NOT implemented yet)
vme.send_file('your-bot-key', '/path/to/your/file')
```

## Command Line Tool

`vme` is runnable with `python3 -m vme` command line.

You can use the [`all-in-one`](./all-in-one) script to create a traditional single-script app, `vme.py`.  It's equivalent to `python3 -m vme` but feels like a typical Linux executable.

### Send text or image

Text or image data can only be read through pipe or input redirection:

```bash
# sending texts from another process
echo "hello world" | ./vme.py your-bot-key

# sending an image from file
./vme.py your-bot-key < plot.png

# sending long texts in a file
./vme.py your-bot-key < message.txt

# sending image from another process
my-plot --stdout ... | ./vme.py your-bot-key
```

### Send file

Althrough the API is still not implemented yet, command line semantic for "send this file as a file" is designed.

```bash
# sending a file
./vme.py your-bot-key /path/to/your/file
```

