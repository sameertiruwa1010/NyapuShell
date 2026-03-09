#Nyapushell -- Custom Bash Commands for Developers
Instead of memorizing dozens of commands, you can simply type short commands like:
 supdate
 sgit
 sdocker
 sssh

and get a clean, readable cheat sheet directly in your terminal.

NyapuShell is a lightweight collection of useful Bash helper commands designed for developers and DevOps engineers.
It provides quick access to common Linux, Git, Docker, Node.js, networking, and system management commands with simple shortcuts and helpful explanations.

##  Available Commands

| Command | Description |
|---------|-------------|
| `supdate` | System update commands (apt update, upgrade, etc.) |
| `sssh` | SSH and SCP commands with examples |
| `sservice` | Service management with systemctl |
| `snode` | Node.js and npm commands |
| `spython` | Python and pip commands |
| `sapt` | APT package management commands |
| `sdocker` | Docker and docker-compose commands |
| `sgit` | Git commands cheat sheet |
..........etc
## Installation

### Method 1: Quick Install (One-liner)

```bash
curl -o- https://raw.githubusercontent.com/YOUR_USERNAME/custom-commands/main/install.sh | bas
h


Method 2: Manual Installation

    Clone the repository
    bash

    git clone https://github.com/YOUR_USERNAME/custom-commands.git
    cd custom-commands

    Make the script executable
    bash

    chmod +x custom-commands.sh

    Source it in your .bashrc or .zshrc
    bash

    echo "source ~/custom-commands/custom-commands.sh" >> ~/.bashrc

    Reload your shell
    bash

    source ~/.bashrc

 Usage Examples
bash

# Show system update commands
supdate

# Show SSH commands
sssh

# Show important system locations
slocation

# List all available commands
shelp

 Output Example
text

 Top System Update Commands:
1. sudo apt update              # (Package list update garxa)
2. sudo apt upgrade             # (Installed packages upgrade garxa)
3. sudo apt dist-upgrade        # (Distribution upgrade garxa)
4. sudo apt autoremove          # (Anawashyak packages hataune)
5. sudo apt autoclean           # (Downloaded packages clean garne)

Features

    . Colorful output with emojis for better readability

    . Nepali comments for Nepali developers

    . Practical examples with each command

    . Easy to install and use

    . No dependencies - pure bash!

🤝 Contributing

Feel free to contribute! Here's how:

    Fork the repository

    Create a new branch (git checkout -b feature/new-command)

    Add your command

    Commit changes (git commit -m 'Add new command')

    Push to branch (git push origin feature/new-command)

    Open a Pull Request

 License

MIT License - feel free to use and modify!
‍ Author

Your Name

    GitHub: @sameertiruwa1010

    Email: sameertiruwa1010@gmail.com
    website: sameertiruwa.online
