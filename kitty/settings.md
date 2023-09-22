# Kitty settings

- [Default terminal](#default-terminal)
- [Terminal hyperlink](#terminal-hyperlink)
- [SSH tip](#ssh-tip)
- [New window](#new-window)
- [Chinese input](#chinese-input)

## Default terminal
Set kitty as default terminal
```bash
sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator $(which kitty) 50
sudo update-alternatives --config x-terminal-emulator
```

## Terminal hyperlink
Supported mouse click on terminal hyperlink

Create file `~/.config/kitty/open-actions.conf`
```conf
protocol file
ext json
action launch --type=overlay --title=${FILE} $EDITOR $FILE_PATH
```
### Reference
- [Scripting the mouse click](https://sw.kovidgoyal.net/kitty/open_actions/)
- [The launch command](https://sw.kovidgoyal.net/kitty/launch/)

## SSH tip
Some keys not working properly when SSH to remote
```bash
kitty +kitten ssh myserver
```
`.bashrc` config
```bash
alias sshk="kitty +kitten ssh"
```

## New Window
Open new window with the current working directory (`~/.config/kitty.conf`)
```conf
map ctrl+alt+enter launch --cwd=current
```

## Chinese input
To enable Chinese input in kitty, launch kitty with command
```bash
env GLFW_IM_MODULE=ibus /path/to/kitty/execution
```