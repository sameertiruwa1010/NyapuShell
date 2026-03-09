# Nyapushell -- Custom Bash Commands for Developers

> **Bash command cheat sheets for developers — with Nepali comments**

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Shell: Bash](https://img.shields.io/badge/Shell-Bash-4EAA25?logo=gnu-bash&logoColor=white)](https://www.gnu.org/software/bash/)
[![Platform: Linux](https://img.shields.io/badge/Platform-Linux%20%7C%20macOS-blue)](https://www.linux.org/)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](http://makeapullrequest.com)

Instead of memorizing dozens of commands, you can simply type short commands like: supdate,sgit,sdocker,sssh and get a clean, readable cheat sheet directly in your terminal.

NyapuShell is a lightweight collection of useful Bash helper commands designed for developers and DevOps engineers. It provides quick access to common Linux, Git, Docker, Node.js, networking, and system management commands with simple shortcuts and helpful explanations.

## Preview

```
$ supdate

 Top System Update Commands:
1. sudo apt update              # (Package list update garxa)
2. sudo apt upgrade             # (Installed packages upgrade garxa)
3. sudo apt dist-upgrade        # (Distribution upgrade garxa)
4. sudo apt autoremove          # (Anawashyak packages hataune)
5. sudo apt autoclean           # (Downloaded packages clean garne)
```

---

## Available Commands

| Command | What it shows |
|---------|---------------|
| `supdate` | apt update, upgrade, dist-upgrade |
| `sssh` | SSH, SCP, key generation examples |
| `sservice` | systemctl start / stop / enable / status |
| `snode` | Node.js, npm, nvm commands |
| `spython` | Python, pip, virtualenv commands |
| `sapt` | APT package search, install, remove |
| `sdocker` | Docker & docker-compose commands |
| `sgit` | Git workflow cheat sheet |
| `sperm` | chmod, chown, file permissions |
| `snetwork` | ping, netstat, curl, nmap basics |
| `sprocess` | ps, kill, htop, jobs |
| `slocation` | Important paths: nginx, apache, logs, etc. |
| `shelp` | List all available commands |

---

## Installation

### ⚡ One-liner (recommended)

```bash
curl -fsSL https://raw.githubusercontent.com/sameertiruwa1010/NyapuShell/main/install.sh | bash
```

Then restart your terminal or run:

```bash
source ~/.bashrc   # for bash
source ~/.zshrc    # for zsh
```

---

### 🔧 Manual Installation

**1. Clone the repo**

```bash
git clone https://github.com/sameertiruwa1010/NyapuShell.git
cd NyapuShell

```

**2. Make the script executable**

```bash
chmod +x nyapushell.sh
```

**3. Add to your shell config**

```bash
# For Bash
echo 'source ~/NyapuShell/nyapushell.sh' >> ~/.bashrc
source ~/.bashrc

# For Zsh
echo 'source ~/NyapuShell/nyapushell.sh' >> ~/.zshrc
source ~/.zshrc
```

---

## 🎯 Usage

Once installed, just type the command in any terminal:

```bash
supdate      # System update commands
sssh         # SSH / SCP examples
sgit         # Git cheat sheet
slocation    # Common config file locations
shelp        # See all commands
```

No arguments needed. Each command instantly prints a clean, numbered reference.

---

##  Features

-  **Colorful terminal output** — easy to scan at a glance
-  **Nepali comments** — written for Nepali developers (नेपाली developers का लागि)
-  **Zero dependencies** — pure bash, works everywhere
-  **One-line install** — up and running in seconds
-  **Easy to extend** — add your own commands in minutes

---

## ➕ Adding Your Own Command

Open `nyapushell.sh` and add a new function:

```bash
smycommand() {
  echo ""
  echo " My Custom Commands:"
  echo "1. some-command      # (Yo command yo kaam garxa)"
  echo "2. another-command   # (Arko kaam)"
  echo ""
}
```

Then reload:

```bash
source ~/.bashrc
```

---

## 🤝 Contributing

Contributions are welcome! Here's how:

```bash
# 1. Fork the repo on GitHub, then clone your fork
git clone https://github.com/sameertiruwa1010/NyapuShell.git

# 2. Create a feature branch
git checkout -b feature/add-kubectl-commands

# 3. Make your changes, then commit
git add .
git commit -m "feat: add kubectl cheat sheet command"

# 4. Push and open a Pull Request
git push origin feature/add-kubectl-commands
```

**Ideas for contributions:**
- `skubectl` — Kubernetes commands
- `snginx` — Nginx config and reload commands
- `spm2` — PM2 process manager commands
- `scron` — Cron job syntax examples

---

## 📜 License

[MIT](./LICENSE) — free to use, fork, and modify.

---

## 👨‍💻 Author

**Sameer Tiruwa**
- GitHub: [@sameertiruwa1010](https://github.com/sameertiruwa1010)
- Email: sameertiruwa1010@gmail.com
- website: sameertiruwa.online

---

> *"Ek palta install gara, sadhai  kaam aaucha."* 🇳🇵
> *(Install it once, it helps you forever.)*
