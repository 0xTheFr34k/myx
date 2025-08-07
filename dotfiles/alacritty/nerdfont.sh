#!/bin/bash

# Font configuration
FONT_NAME="JetBrainsMono"
FONT_STYLE="Regular"
DOWNLOAD_URL="https://github.com/ryanoasis/nerd-fonts/releases/latest/download/${FONT_NAME}.zip"

# Font installation directory
FONT_DIR="$HOME/.local/share/fonts"

# Create fonts directory if it doesn't exist
mkdir -p "$FONT_DIR"

# Download the font zip
echo "🔽 Downloading ${FONT_NAME} Nerd Font..."
curl -L -o "${FONT_NAME}.zip" "$DOWNLOAD_URL"

# Unzip only the Regular TTF variant
echo "📦 Extracting ${FONT_STYLE}..."
unzip -j "${FONT_NAME}.zip" "*${FONT_STYLE}.ttf" -d "$FONT_DIR"

# Remove the zip file
rm "${FONT_NAME}.zip"

# Refresh font cache (Linux)
if command -v fc-cache &>/dev/null; then
  echo "🔄 Refreshing font cache..."
  fc-cache -fv "$FONT_DIR"
fi

echo "✅ Installed ${FONT_NAME} Nerd Font (${FONT_STYLE}) in $FONT_DIR"
