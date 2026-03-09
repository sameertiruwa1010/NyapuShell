#!/bin/bash

# Custom commands for development and system management
# Bikas ra system management ko lagi custom commands

# System Update Commands
supdate() {
    echo -e "\n\033[1;34m📦 Top System Update Commands:\033[0m"
    echo -e "\033[1;33m1.\033[0m sudo apt update              # (Package list update garxa)"
    echo -e "\033[1;33m2.\033[0m sudo apt upgrade             # (Installed packages upgrade garxa)"
    echo -e "\033[1;33m3.\033[0m sudo apt dist-upgrade        # (Distribution upgrade garxa)"
    echo -e "\033[1;33m4.\033[0m sudo apt autoremove          # (Anawashyak packages hataune)"
    echo -e "\033[1;33m5.\033[0m sudo apt autoclean           # (Downloaded packages clean garne)"
    echo -e "\n\033[1;32m💡 Tip:\033[0m sudo apt update && sudo apt upgrade -y"
    echo -e "   (Command haru combine garera pani use garna sakincha)"
}

# SSH Commands
sssh() {
    echo -e "\n\033[1;34m🔐 Top SSH Commands:\033[0m"
    echo -e "\033[1;33m1.\033[0m ssh user@hostname            # (Basic SSH login)"
    echo -e "\033[1;33m2.\033[0m ssh -i key.pem user@host     # (Private key bata SSH login)"
    echo -e "\033[1;33m3.\033[0m scp file user@host:/path     # (File remote ma copy garne)"
    echo -e "\033[1;33m4.\033[0m scp -r dir user@host:/path   # (Directory remote ma copy garne)"
    echo -e "\033[1;33m5.\033[0m ssh-copy-id user@host        # (SSH key server ma copy garne)"
    echo -e "\n\033[1;32m💡 Tip:\033[0m ssh -o ServerAliveInterval=60 user@host"
    echo -e "   (Long lasting connection ko lagi)"
}

# Service Management Commands
sservice() {
    echo -e "\n\033[1;34m⚙️ Top Service Commands (systemctl):\033[0m"
    echo -e "\033[1;33m1.\033[0m sudo systemctl status service    # (Service ko status check garne)"
    echo -e "\033[1;33m2.\033[0m sudo systemctl start service     # (Service start garne)"
    echo -e "\033[1;33m3.\033[0m sudo systemctl stop service      # (Service stop garne)"
    echo -e "\033[1;33m4.\033[0m sudo systemctl restart service   # (Service restart garne)"
    echo -e "\033[1;33m5.\033[0m sudo systemctl enable service    # (Boot ma automatic start hune)"
    echo -e "\n\033[1;32m💡 Example:\033[0m sudo systemctl restart nginx"
    echo -e "   (Nginx restart garne example)"
}

# Node.js Commands
snode() {
    echo -e "\n\033[1;34m🟢 Top Node.js Commands:\033[0m"
    echo -e "\033[1;33m1.\033[0m node -v                    # (Node version check garne)"
    echo -e "\033[1;33m2.\033[0m npm -v                     # (NPM version check garne)"
    echo -e "\033[1;33m3.\033[0m npm install [package]      # (Package install garne)"
    echo -e "\033[1;33m4.\033[0m npm install -g [package]   # (Global ma install garne)"
    echo -e "\033[1;33m5.\033[0m npm run [script]           # (NPM script chalauane)"
    echo -e "\n\033[1;32m💡 Common:\033[0m npm install && npm start"
    echo -e "   (Dependencies install garne ani start garne)"
}

# Python Commands
spython() {
    echo -e "\n\033[1;34m🐍 Top Python Commands:\033[0m"
    echo -e "\033[1;33m1.\033[0m python3 --version          # (Python version check garne)"
    echo -e "\033[1;33m2.\033[0m pip3 install [package]     # (Python package install garne)"
    echo -e "\033[1;33m3.\033[0m pip3 freeze > requirements.txt  # (Requirements file banaune)"
    echo -e "\033[1;33m4.\033[0m pip3 install -r requirements.txt # (Requirements bata install garne)"
    echo -e "\033[1;33m5.\033[0m python3 -m venv venv       # (Virtual environment banaune)"
    echo -e "\n\033[1;32m💡 Tip:\033[0m source venv/bin/activate"
    echo -e "   (Virtual environment active garne)"
}

# APT Package Commands
sapt() {
    echo -e "\n\033[1;34m📥 Top APT Package Commands:\033[0m"
    echo -e "\033[1;33m1.\033[0m sudo apt install [package]     # (Package install garne)"
    echo -e "\033[1;33m2.\033[0m sudo apt remove [package]      # (Package hataune)"
    echo -e "\033[1;33m3.\033[0m apt search [package]           # (Package khojne)"
    echo -e "\033[1;33m4.\033[0m apt show [package]             # (Package details herne)"
    echo -e "\033[1;33m5.\033[0m dpkg -l | grep [package]       # (Installed packages list herne)"
    echo -e "\n\033[1;32m💡 Tip:\033[0m sudo apt update before installing"
    echo -e "   (Install garne agadi update garnu ramro)"
}

# Docker Commands
sdocker() {
    echo -e "\n\033[1;34m🐳 Top Docker Commands:\033[0m"
    echo -e "\033[1;33m1.\033[0m docker ps                    # (Running containers haru)"
    echo -e "\033[1;33m2.\033[0m docker ps -a                 # (Sabai containers haru)"
    echo -e "\033[1;33m3.\033[0m docker images                # (Images haru herne)"
    echo -e "\033[1;33m4.\033[0m docker-compose up -d         # (Background ma services start garne)"
    echo -e "\033[1;33m5.\033[0m docker-compose down          # (Services stop garne)"
    echo -e "\n\033[1;32m💡 Tip:\033[0m docker system prune -a"
    echo -e "   (Naprayeko sabai hataune - Clean up unused)"
}

# Git Commands
sgit() {
    echo -e "\n\033[1;34m📚 Top Git Commands:\033[0m"
    echo -e "\033[1;33m1.\033[0m git status                    # (File haruko status herne)"
    echo -e "\033[1;33m2.\033[0m git add .                     # (Sabai changes stage ma rakhene)"
    echo -e "\033[1;33m3.\033[0m git commit -m \"message\"      # (Changes commit garne)"
    echo -e "\033[1;33m4.\033[0m git push                      # (Remote ma pathaune)"
    echo -e "\033[1;33m5.\033[0m git pull                      # (Remote bata lyaune)"
    echo -e "\n\033[1;32m💡 Tip:\033[0m git log --oneline --graph --all"
    echo -e "   (History herne - View history)"
}

# File Permission Commands
sperm() {
    echo -e "\n\033[1;34m🔑 Top File Permission Commands:\033[0m"
    echo -e "\033[1;33m1.\033[0m chmod +x file.sh             # (Executable banaune)"
    echo -e "\033[1;33m2.\033[0m chmod 755 file               # (Owner full, aru read-execute)"
    echo -e "\033[1;33m3.\033[0m chmod 644 file               # (Owner read-write, aru read matra)"
    echo -e "\033[1;33m4.\033[0m chown user:group file        # (Owner ra group change garne)"
    echo -e "\033[1;33m5.\033[0m ls -la                       # (Permission sahit list herne)"
    echo -e "\n\033[1;32m💡 Tip:\033[0m chmod -R 755 directory/"
    echo -e "   (Directory vitra sabai ma change garne - Recursive change)"
}

# Network Commands
snetwork() {
    echo -e "\n\033[1;34m🌐 Top Network Commands:\033[0m"
    echo -e "\033[1;33m1.\033[0m ifconfig or ip addr          # (Network interfaces haru)"
    echo -e "\033[1;33m2.\033[0m ping hostname                 # (Connection test garne)"
    echo -e "\033[1;33m3.\033[0m netstat -tulpn                # (Listening ports haru)"
    echo -e "\033[1;33m4.\033[0m curl http://example.com       # (HTTP request pathaune)"
    echo -e "\033[1;33m5.\033[0m wget file_url                 # (File download garne)"
    echo -e "\n\033[1;32m💡 Tip:\033[0m ss -tulpn"
    echo -e "   (Netstat ko modern option - Modern alternative to netstat)"
}

# Process Management Commands
sprocess() {
    echo -e "\n\033[1;34m⚡ Top Process Commands:\033[0m"
    echo -e "\033[1;33m1.\033[0m ps aux                        # (Sabai processes haru)"
    echo -e "\033[1;33m2.\033[0m top or htop                   # (Interactive viewer)"
    echo -e "\033[1;33m3.\033[0m kill PID                      # (PID bata process banda garne)"
    echo -e "\033[1;33m4.\033[0m killall process_name          # (Name bata process banda garne)"
    echo -e "\033[1;33m5.\033[0m pgrep process_name            # (Process ID khojne)"
    echo -e "\n\033[1;32m💡 Tip:\033[0m kill -9 PID"
    echo -e "   (Jabarjasti banda garne - Force kill)"
}

# System & Service Locations Commands
slocation() {
    echo -e "\n\033[1;34m📍 Top System & Service Locations:\033[0m"
    echo -e "\033[1;33m1.\033[0m /etc/nginx/sites-available/   # (Nginx site config files haru)"
    echo -e "\033[1;33m2.\033[0m /etc/nginx/sites-enabled/     # (Nginx enabled sites haru)"
    echo -e "\033[1;33m3.\033[0m /etc/apache2/sites-available/ # (Apache site config files)"
    echo -e "\033[1;33m4.\033[0m /etc/apache2/sites-enabled/   # (Apache enabled sites)"
    echo -e "\033[1;33m5.\033[0m /var/www/html/                # (Web server root directory)"
    echo -e "\033[1;33m6.\033[0m /etc/mysql/mysql.conf.d/      # (MySQL config files)"
    echo -e "\033[1;33m7.\033[0m /etc/redis/redis.conf         # (Redis config file)"
    echo -e "\033[1;33m8.\033[0m /etc/ssh/sshd_config          # (SSH server config)"
    echo -e "\033[1;33m9.\033[0m /etc/hosts                    # (Hosts file - domain mapping)"
    echo -e "\033[1;33m10.\033[0m /etc/environment             # (System environment variables)"
    echo -e "\033[1;33m11.\033[0m /var/log/nginx/              # (Nginx log files)"
    echo -e "\033[1;33m12.\033[0m /var/log/mysql/              # (MySQL log files)"
    echo -e "\033[1;33m13.\033[0m /var/log/redis/              # (Redis log files)"
    echo -e "\033[1;33m14.\033[0m /etc/systemd/system/         # (Systemd service files)"
    echo -e "\033[1;33m15.\033[0m /lib/systemd/system/         # (Default systemd services)"
    echo -e "\n\033[1;32m💡 Tip:\033[0m ls -la [location]"
    echo -e "   (Location vitra ko files herna)"
}

# Display help for all commands
shelp() {
    echo -e "\n\033[1;35m📋 Available Custom Commands:\033[0m"
    echo -e "\033[1;33msupdate\033[0m    - System update commands"
    echo -e "\033[1;33msssh\033[0m       - SSH and SCP commands"
    echo -e "\033[1;33msservice\033[0m   - Service management commands"
    echo -e "\033[1;33msnode\033[0m      - Node.js commands"
    echo -e "\033[1;33mspython\033[0m    - Python commands"
    echo -e "\033[1;33msapt\033[0m       - APT package commands"
    echo -e "\033[1;33msdocker\033[0m    - Docker commands"
    echo -e "\033[1;33msgit\033[0m       - Git commands"
    echo -e "\033[1;33msperm\033[0m      - File permission commands"
    echo -e "\033[1;33msnetwork\033[0m   - Network commands"
    echo -e "\033[1;33msprocess\033[0m   - Process management commands"
    echo -e "\033[1;33mslocation\033[0m  - System & service locations"
    echo -e "\033[1;33mshelp\033[0m      - Show this help"
     echo -e "   (if you want more contact nyapu)"
}

