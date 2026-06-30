#!/bin/bash
# ─────────────────────────────────────────────
#  NyapuShell Installer v2.0.0
#  GitHub: https://github.com/sameertiruwa1010/NyapuShell
#  Author: Sameer Tiruwa (@sameertiruwa1010)
# ─────────────────────────────────────────────

set -e

# ── Colors ────────────────────────────────────
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
BOLD='\033[1m'
NC='\033[0m'

# ── Helpers ───────────────────────────────────
success() { echo -e "${GREEN}  ✅ $1${NC}"; }
warn()    { echo -e "${YELLOW}  ⚠  $1${NC}"; }
error()   { echo -e "${RED}  ❌ $1${NC}"; exit 1; }
step()    { echo -e "\n${CYAN}${BOLD}▶  $1${NC}"; }

# ── Banner ────────────────────────────────────
clear
echo ""
echo -e "${BLUE}${BOLD}"
echo "  ███╗   ██╗██╗   ██╗ █████╗ ██████╗ ██╗   ██╗"
echo "  ████╗  ██║╚██╗ ██╔╝██╔══██╗██╔══██╗██║   ██║"
echo "  ██╔██╗ ██║ ╚████╔╝ ███████║██████╔╝██║   ██║"
echo "  ██║╚██╗██║  ╚██╔╝  ██╔══██║██╔═══╝ ██║   ██║"
echo "  ██║ ╚████║   ██║   ██║  ██║██║     ╚██████╔╝"
echo "  ╚═╝  ╚═══╝   ╚═╝   ╚═╝  ╚═╝╚═╝      ╚═════╝"
echo -e "${NC}"
echo -e "${CYAN}  v2.0.0 — Bash command cheat sheets for developers 🇳🇵${NC}"
echo -e "${CYAN}  github.com/sameertiruwa1010/NyapuShell${NC}"
echo -e "\n  ${BLUE}────────────────────────────────────────────────${NC}"

# ── Bash check ────────────────────────────────
if [ -z "$BASH_VERSION" ]; then
    error "This script must be run with bash"
fi

# ── Step 1: ~/bin directory ───────────────────
step "Checking install directory..."
if [ ! -d "$HOME/bin" ]; then
    mkdir -p "$HOME/bin"
    success "Created ~/bin"
else
    success "~/bin already exists"
fi

# ── Step 2: Download ──────────────────────────
COMMANDS_URL="https://raw.githubusercontent.com/sameertiruwa1010/NyapuShell/main/nyapushell.sh"
COMMANDS_FILE="$HOME/bin/nyapushell"

step "Downloading NyapuShell v2.0.0..."

if command -v curl &> /dev/null; then
    curl -fsSL "$COMMANDS_URL" -o "$COMMANDS_FILE" || error "Download failed. Check your internet connection."
elif command -v wget &> /dev/null; then
    wget -q "$COMMANDS_URL" -O "$COMMANDS_FILE" || error "Download failed. Check your internet connection."
else
    error "curl or wget is required. Please install one and try again."
fi

[ -f "$COMMANDS_FILE" ] || error "File not found after download."

chmod +x "$COMMANDS_FILE"
success "Downloaded to: $COMMANDS_FILE"

# ── Step 3: Detect shell ──────────────────────
step "Detecting shell..."
SHELL_TYPE=$(basename "$SHELL")
RC_FILE=""

case "$SHELL_TYPE" in
    bash) RC_FILE="$HOME/.bashrc" ;;
    zsh)  RC_FILE="$HOME/.zshrc" ;;
    fish)
        RC_FILE="$HOME/.config/fish/config.fish"
        warn "Fish shell — manual config may be needed."
        ;;
    *)    RC_FILE="$HOME/.profile" ;;
esac

success "Shell: $SHELL_TYPE → $RC_FILE"

# ── Step 4: Add to shell config ───────────────
step "Configuring shell..."
if [ -n "$RC_FILE" ] && [ -f "$RC_FILE" ]; then

    # Always update the comment line if it exists
    if grep -q "# NyapuShell" "$RC_FILE"; then
        sed -i 's|# NyapuShell.*|# NyapuShell v2.0.0 - https://github.com/sameertiruwa1010/NyapuShell|' "$RC_FILE" 2>/dev/null || true
    fi

    # Only check for the actual source line (not the comment)
    if grep -q "^source.*nyapushell" "$RC_FILE"; then
        success "Already configured in $RC_FILE (updated to v2.0.0)"
    else
        # Remove any stale comment-only block, then write fresh
        sed -i '/# NyapuShell/d' "$RC_FILE" 2>/dev/null || true
        {
            echo ""
            echo "# NyapuShell v2.0.0 - https://github.com/sameertiruwa1010/NyapuShell"
            echo "source \$HOME/bin/nyapushell"
        } >> "$RC_FILE"
        success "Added source line to $RC_FILE"
    fi
else
    warn "Could not find shell config. Add manually:"
    echo ""
    echo "    source \$HOME/bin/nyapushell"
    echo ""
fi

# ── Step 5: Load NOW ──────────────────────────
step "Loading NyapuShell into current session..."
# shellcheck disable=SC1090
. "$COMMANDS_FILE"
success "NyapuShell loaded — commands ready immediately!"

# ── Done ──────────────────────────────────────
echo ""
echo -e "  ${BLUE}────────────────────────────────────────────────${NC}"
echo ""
echo -e "${GREEN}${BOLD}  ✨ NyapuShell v2.0.0 Installed!${NC}"
echo ""
echo -e "${BLUE}${BOLD}  📋 All Commands:${NC}"
echo ""
echo -e "   ${YELLOW}supdate${NC}      System update (apt)"
echo -e "   ${YELLOW}sssh${NC}         SSH & SCP"
echo -e "   ${YELLOW}sservice${NC}     Systemctl service management"
echo -e "   ${YELLOW}snode${NC}        Node.js & npm"
echo -e "   ${YELLOW}spython${NC}      Python & pip"
echo -e "   ${YELLOW}sapt${NC}         APT package management"
echo -e "   ${YELLOW}sdocker${NC}      Docker & compose"
echo -e "   ${YELLOW}sgit${NC}         Git workflow"
echo -e "   ${YELLOW}sperm${NC}        File permissions"
echo -e "   ${YELLOW}snetwork${NC}     Network troubleshooting"
echo -e "   ${YELLOW}sprocess${NC}     Process management"
echo -e "   ${YELLOW}slocation${NC}    Important system paths"
echo -e "   ${YELLOW}skubectl${NC}     Kubernetes ✨ new"
echo -e "   ${YELLOW}sterraform${NC}   Terraform ✨ new"
echo -e "   ${YELLOW}snginx${NC}       Nginx ✨ new"
echo -e "   ${YELLOW}shelp${NC}        Show all commands"
echo ""
echo -e "  ${BLUE}────────────────────────────────────────────────${NC}"
echo ""
echo -e "${GREEN}${BOLD}  🎉 Commands are ready NOW — no restart needed!${NC}"
echo ""
echo -e "  Try:  ${YELLOW}shelp${NC}   or   ${YELLOW}skubectl${NC}   or   ${YELLOW}sterraform${NC}"
echo ""
echo -e "  ${CYAN}⭐ Star: https://github.com/sameertiruwa1010/NyapuShell${NC}"
echo ""
