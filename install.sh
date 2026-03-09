#!/bin/bash
# ─────────────────────────────────────────────
#  NyapuShell Installer
#  GitHub: https://github.com/sameertiruwa1010/NyapuShell
#  Author: Sameer Tiruwa (@sameertiruwa1010)
# ─────────────────────────────────────────────

set -e  # Exit on any error

# ── Colors ────────────────────────────────────
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
BOLD='\033[1m'
NC='\033[0m'

# ── Helpers ───────────────────────────────────
info()    { echo -e "${BLUE}  ℹ  $1${NC}"; }
success() { echo -e "${GREEN}  ✅ $1${NC}"; }
warn()    { echo -e "${YELLOW}  ⚠  $1${NC}"; }
error()   { echo -e "${RED}  ❌ $1${NC}"; exit 1; }
step()    { echo -e "${CYAN}${BOLD}▶  $1${NC}"; }

# ── Banner ────────────────────────────────────
echo ""
echo -e "${BLUE}${BOLD}"
echo "  ███╗   ██╗██╗   ██╗ █████╗ ██████╗ ██╗   ██╗"
echo "  ████╗  ██║╚██╗ ██╔╝██╔══██╗██╔══██╗██║   ██║"
echo "  ██╔██╗ ██║ ╚████╔╝ ███████║██████╔╝██║   ██║"
echo "  ██║╚██╗██║  ╚██╔╝  ██╔══██║██╔═══╝ ██║   ██║"
echo "  ██║ ╚████║   ██║   ██║  ██║██║     ╚██████╔╝"
echo "  ╚═╝  ╚═══╝   ╚═╝   ╚═╝  ╚═╝╚═╝      ╚═════╝ "
echo -e "${NC}"
echo -e "${CYAN}  Bash command cheat sheets for developers 🇳🇵${NC}"
echo -e "${CYAN}  github.com/sameertiruwa1010/NyapuShell${NC}"
echo ""
echo -e "  ${BLUE}────────────────────────────────────────────────${NC}"
echo ""

# ── Bash check ────────────────────────────────
if [ -z "$BASH_VERSION" ]; then
    error "This script must be run with bash"
fi

# ── Step 1: Create ~/bin if needed ────────────
step "Checking install directory..."
if [ ! -d "$HOME/bin" ]; then
    mkdir -p "$HOME/bin"
    success "Created ~/bin"
else
    success "~/bin already exists"
fi

# ── Step 2: Download nyapushell.sh ────────────
COMMANDS_URL="https://raw.githubusercontent.com/sameertiruwa1010/NyapuShell/main/nyapushell.sh"
COMMANDS_FILE="$HOME/bin/nyapushell"

echo ""
step "Downloading NyapuShell..."

if command -v curl &> /dev/null; then
    curl -fsSL "$COMMANDS_URL" -o "$COMMANDS_FILE" || error "Download failed. Check your internet connection."
elif command -v wget &> /dev/null; then
    wget -q "$COMMANDS_URL" -O "$COMMANDS_FILE" || error "Download failed. Check your internet connection."
else
    error "curl or wget is required. Please install one and try again."
fi

[ -f "$COMMANDS_FILE" ] || error "File not found after download. Something went wrong."

chmod +x "$COMMANDS_FILE"
success "Downloaded to: $COMMANDS_FILE"

# ── Step 3: Detect shell & RC file ────────────
echo ""
step "Detecting shell..."

SHELL_TYPE=$(basename "$SHELL")
RC_FILE=""

case "$SHELL_TYPE" in
    bash) RC_FILE="$HOME/.bashrc" ;;
    zsh)  RC_FILE="$HOME/.zshrc" ;;
    fish)
        RC_FILE="$HOME/.config/fish/config.fish"
        warn "Fish shell detected — you may need to manually add the source line."
        ;;
    *)    RC_FILE="$HOME/.profile" ;;
esac

success "Shell: $SHELL_TYPE → $RC_FILE"

# ── Step 4: Add to shell config ───────────────
echo ""
step "Configuring shell..."

if [ -n "$RC_FILE" ] && [ -f "$RC_FILE" ]; then
    if ! grep -q "source.*nyapushell" "$RC_FILE"; then
        {
            echo ""
            echo "# NyapuShell - https://github.com/sameertiruwa1010/NyapuShell"
            echo "source \$HOME/bin/nyapushell"
        } >> "$RC_FILE"
        success "Added to $RC_FILE"
    else
        success "Already configured in $RC_FILE"
    fi
else
    warn "Could not find shell config. Add this line manually:"
    echo ""
    echo "    source \$HOME/bin/nyapushell"
    echo ""
fi

# ── Step 5: Source NOW so commands work immediately ──
# This loads the functions into the current shell session
# so the user doesn't need to run `source ~/.bashrc` manually
# shellcheck disable=SC1090
. "$COMMANDS_FILE"
success "NyapuShell loaded into current session"

# ── Done ──────────────────────────────────────
echo ""
echo -e "  ${BLUE}────────────────────────────────────────────────${NC}"
echo ""
echo -e "${GREEN}${BOLD}  ✨ Installation Complete!${NC}"
echo ""
echo -e "${BLUE}${BOLD}  📋 Available Commands:${NC}"
echo ""
echo -e "   ${YELLOW}supdate${NC}    System update commands"
echo -e "   ${YELLOW}sssh${NC}       SSH and SCP commands"
echo -e "   ${YELLOW}sservice${NC}   Service management (systemctl)"
echo -e "   ${YELLOW}snode${NC}      Node.js & npm commands"
echo -e "   ${YELLOW}spython${NC}    Python & pip commands"
echo -e "   ${YELLOW}sapt${NC}       APT package management"
echo -e "   ${YELLOW}sdocker${NC}    Docker & compose commands"
echo -e "   ${YELLOW}sgit${NC}       Git workflow cheat sheet"
echo -e "   ${YELLOW}sperm${NC}      File permission commands"
echo -e "   ${YELLOW}snetwork${NC}   Network troubleshooting"
echo -e "   ${YELLOW}sprocess${NC}   Process management"
echo -e "   ${YELLOW}slocation${NC}  Important system locations"
echo -e "   ${YELLOW}shelp${NC}      Show all commands"
echo ""
echo -e "  ${BLUE}────────────────────────────────────────────────${NC}"
echo ""
echo -e "${GREEN}${BOLD}  🎉 Commands are ready NOW — no restart needed!${NC}"
echo ""
echo -e "  Try:  ${YELLOW}supdate${NC}   or   ${YELLOW}shelp${NC}"
echo ""
echo -e "  ${CYAN}⭐ Star us: https://github.com/sameertiruwa1010/NyapuShell${NC}"
echo ""
