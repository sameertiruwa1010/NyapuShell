#!/bin/bash
# NyapuShell Installer
# GitHub: https://github.com/sameertiruwa1010/NyapuShell

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}┌────────────────────────────────────┐${NC}"
echo -e "${BLUE}│        NyapuShell Installer         │${NC}"
echo -e "${BLUE}│  github.com/sameertiruwa1010        │${NC}"
echo -e "${BLUE}└────────────────────────────────────┘${NC}"
echo ""

# Check if running with bash
if [ -z "$BASH_VERSION" ]; then
    echo -e "${RED}❌ Error: This script must be run with bash${NC}"
    exit 1
fi

echo -e "${YELLOW}📦 Installing NyapuShell...${NC}"

# Create bin directory if it doesn't exist
if [ ! -d "$HOME/bin" ]; then
    echo -e "${YELLOW}📁 Creating ~/bin directory...${NC}"
    mkdir -p "$HOME/bin"
fi

# Download the commands file
COMMANDS_URL="https://raw.githubusercontent.com/sameertiruwa1010/NyapuShell/main/nyapushell.sh"
COMMANDS_FILE="$HOME/bin/nyapushell"

echo -e "${YELLOW}📥 Downloading NyapuShell...${NC}"

# Check if curl or wget is installed
if command -v curl &> /dev/null; then
    curl -fsSL "$COMMANDS_URL" -o "$COMMANDS_FILE"
elif command -v wget &> /dev/null; then
    wget -q "$COMMANDS_URL" -O "$COMMANDS_FILE"
else
    echo -e "${RED}❌ Error: Please install curl or wget${NC}"
    exit 1
fi

# Check if download was successful
if [ ! -f "$COMMANDS_FILE" ]; then
    echo -e "${RED}❌ Error: Failed to download NyapuShell${NC}"
    exit 1
fi

# Make it executable
chmod +x "$COMMANDS_FILE"
echo -e "${GREEN}✅ NyapuShell installed to: $COMMANDS_FILE${NC}"

# Detect shell type
SHELL_TYPE=$(basename "$SHELL")
RC_FILE=""

case "$SHELL_TYPE" in
    bash)
        RC_FILE="$HOME/.bashrc"
        ;;
    zsh)
        RC_FILE="$HOME/.zshrc"
        ;;
    fish)
        RC_FILE="$HOME/.config/fish/config.fish"
        echo -e "${YELLOW}⚠️  Fish shell detected. Manual configuration may be needed.${NC}"
        ;;
    *)
        RC_FILE="$HOME/.profile"
        ;;
esac

# Add to shell config if not already there
if [ -n "$RC_FILE" ] && [ -f "$RC_FILE" ]; then
    if ! grep -q "source.*nyapushell" "$RC_FILE"; then
        echo -e "${YELLOW}📝 Adding to $RC_FILE...${NC}"
        echo "" >> "$RC_FILE"
        echo "# NyapuShell - https://github.com/sameertiruwa1010/NyapuShell" >> "$RC_FILE"
        echo "source \$HOME/bin/nyapushell" >> "$RC_FILE"
        echo -e "${GREEN}✅ Added to $RC_FILE${NC}"
    else
        echo -e "${GREEN}✅ Already configured in $RC_FILE${NC}"
    fi
else
    echo -e "${YELLOW}⚠️  Could not find shell config file. Add this line manually:${NC}"
    echo "   source \$HOME/bin/nyapushell"
fi

echo ""
echo -e "${GREEN}✨ Installation Complete!${NC}"
echo ""
echo -e "${BLUE}📋 Available Commands:${NC}"
echo -e "  ${YELLOW}supdate${NC}     - System update commands"
echo -e "  ${YELLOW}sssh${NC}        - SSH and SCP commands"
echo -e "  ${YELLOW}sservice${NC}    - Service management commands"
echo -e "  ${YELLOW}snode${NC}       - Node.js commands"
echo -e "  ${YELLOW}spython${NC}     - Python commands"
echo -e "  ${YELLOW}sapt${NC}        - APT package commands"
echo -e "  ${YELLOW}sdocker${NC}     - Docker commands"
echo -e "  ${YELLOW}sgit${NC}        - Git commands"
echo -e "  ${YELLOW}sperm${NC}       - File permission commands"
echo -e "  ${YELLOW}snetwork${NC}    - Network commands"
echo -e "  ${YELLOW}sprocess${NC}    - Process management commands"
echo -e "  ${YELLOW}slocation${NC}   - System & service locations"
echo -e "  ${YELLOW}shelp${NC}       - Show all commands"
echo ""
echo -e "${BLUE}🔧 To activate, reload your shell:${NC}"
echo -e "  ${YELLOW}source ~/.bashrc${NC}   (for bash)"
echo -e "  ${YELLOW}source ~/.zshrc${NC}    (for zsh)"
echo ""
echo -e "${GREEN}🎉 Try it now:${NC}"
echo -e "  ${YELLOW}supdate${NC}     - Show system update commands"
echo -e "  ${YELLOW}slocation${NC}   - Show important system locations"
echo -e "  ${YELLOW}shelp${NC}       - Show all available commands"
echo ""
echo -e "${BLUE}⭐ Like NyapuShell? Star it on GitHub:${NC}"
echo -e "   https://github.com/sameertiruwa1010/NyapuShell"
echo ""
