# autotype

Type text into remote desktops that block clipboard paste.

Simulates keyboard input via macOS AppleScript, designed for environments like Vivli and Chrome Remote Desktop where paste is disabled.

## Tools

- **autotype** - CLI backend. Reads from file, clipboard, or stdin and types each line via batched AppleScript keystrokes.
- **autotype-gui** - Native macOS GUI (pywebview/WebKit). Paste code, configure settings, and launch autotype from a standalone window.

## Install

```bash
git clone https://github.com/fukuokaya/autotype.git
cd autotype
bash install.sh
```

## Usage

### CLI

```bash
autotype                     # type from clipboard
autotype file.R              # type from file
autotype --wait 3 file.R     # custom countdown (default: 5s)
autotype --delay 0.02        # per-line delay
echo "code" | autotype -     # pipe from stdin
```

### GUI

```bash
autotype-gui
```

Paste code into the editor, adjust settings (wait, delay, pause interval), and click **start** or press `Cmd+Enter`.

## Requirements

- macOS (uses AppleScript / System Events)
- Python 3
- [pywebview](https://pywebview.flowrl.com/) (auto-installed by `install.sh`)
