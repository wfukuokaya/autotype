#!/bin/bash
# install.sh - Install autotype tools to ~/.local/bin
set -e

INSTALL_DIR="$HOME/.local/bin"
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

mkdir -p "$INSTALL_DIR"

for tool in autotype autotype-gui; do
    cp "$SCRIPT_DIR/$tool" "$INSTALL_DIR/$tool"
    chmod +x "$INSTALL_DIR/$tool"
    echo "Installed $tool -> $INSTALL_DIR/$tool"
done

# Check that ~/.local/bin is in PATH
if ! echo "$PATH" | tr ':' '\n' | grep -qx "$INSTALL_DIR"; then
    echo ""
    echo "WARNING: $INSTALL_DIR is not in your PATH."
    echo "Add this to your shell profile (~/.zshrc or ~/.bashrc):"
    echo "  export PATH=\"\$HOME/.local/bin:\$PATH\""
fi

# Check pywebview dependency for autotype-gui
if ! python3 -c "import webview" 2>/dev/null; then
    echo ""
    echo "Installing pywebview (required by autotype-gui)..."
    python3 -m pip install pywebview
fi

echo ""
echo "Done. Run 'autotype --help' or 'autotype-gui' to get started."
