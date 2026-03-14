#!/usr/bin/env bash

# ============================================
# NyapuShell v2.1.0 - Linux Command Helper
# Author: Sameer Tiruwa (@sameertiruwa1010)
# GitHub: https://github.com/sameertiruwa1010/NyapuShell
# Location: Kathmandu, Nepal
# ============================================

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
# YELLOW='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[1;37m'
BOLD='\033[1m'
DIM='\033[2m'
NC='\033[0m'

VERSION="2.1.0"

# ============================================
# Helper Functions
# ============================================

validate_count() {
    local count=$1
    local default=${2:-5}
    local max=${3:-10}

    if [[ -z "$count" ]]; then
        echo $default
        return
    fi

    if [[ ! "$count" =~ ^[0-9]+$ ]]; then
        echo -e "${YELLOW}Invalid number. Showing default $default commands.${NC}" >&2
        echo $default
        return
    fi

    if [[ $count -gt $max ]]; then
        echo -e "${YELLOW}Maximum is $max. Showing $max commands.${NC}" >&2
        echo $max
        return
    fi

    echo $count
}

print_header() {
    local title=$1
    local count=$2
    echo -e "\n${CYAN}${BOLD}[ $title — Top $count ]${NC}\n"
}

print_tip() {
    echo -e "\n${DIM}Tip: $1${NC}\n"
}

# ============================================
# supdate — System Update
# ============================================
supdate() {
    local count=$(validate_count "$1" 5 10)
    print_header "System Update" $count

    local commands=(
        "sudo apt update                           # package list refresh garxa"
        "sudo apt upgrade                          # installed packages upgrade garxa"
        "sudo apt dist-upgrade                     # distribution-level upgrade"
        "sudo apt autoremove                       # unused packages hataauxa"
        "sudo apt autoclean                        # downloaded cache clean garxa"
        "sudo apt --fix-broken install             # broken dependencies fix garxa"
        "sudo apt full-upgrade                     # full system upgrade"
        "sudo do-release-upgrade                   # ubuntu version upgrade"
        "sudo apt update && sudo apt upgrade -y    # one-command full update"
        "sudo apt list --upgradable                # upgradable packages list"
    )

    for ((i=0; i<count; i++)); do
        echo -e "  ${YELLOW}$((i+1)).${NC} ${commands[$i]}"
    done

    print_tip "sudo apt update && sudo apt upgrade -y — ek line ma sab update"
}

# ============================================
# sssh — SSH & SCP
# ============================================
sssh() {
    local count=$(validate_count "$1" 5 10)
    print_header "SSH & SCP" $count

    local commands=(
        "ssh user@hostname                         # basic SSH login"
        "ssh -i key.pem user@host                  # private key bata SSH"
        "scp file user@host:/path                  # file remote ma copy"
        "scp -r dir/ user@host:/path               # directory remote ma copy"
        "ssh-copy-id user@host                     # public key server ma copy"
        "ssh -p 2222 user@host                     # custom port ma SSH"
        "ssh -J jump@server target@host            # jump host through SSH"
        "ssh -o ServerAliveInterval=60 user@host   # long session maintain"
        "sftp user@host                            # sftp connection"
        "ssh-keygen -t ed25519 -C 'email@mail.com' # new SSH key generate"
    )

    for ((i=0; i<count; i++)); do
        echo -e "  ${YELLOW}$((i+1)).${NC} ${commands[$i]}"
    done

    print_tip "~/.ssh/config ma host, user, key sab permanent rakhna sakxa"
}

# ============================================
# sservice — Systemctl
# ============================================
sservice() {
    local count=$(validate_count "$1" 5 10)
    print_header "Service Management" $count

    local commands=(
        "sudo systemctl start nginx                # service start"
        "sudo systemctl stop nginx                 # service stop"
        "sudo systemctl restart nginx              # service restart"
        "sudo systemctl status nginx               # service status check"
        "sudo systemctl enable nginx               # boot ma autostart enable"
        "sudo systemctl disable nginx              # boot autostart disable"
        "sudo systemctl reload nginx               # config reload — no downtime"
        "systemctl list-units --type=service       # all active services"
        "sudo systemctl daemon-reload              # systemd config reload"
        "journalctl -u nginx -f                    # real-time service logs"
    )

    for ((i=0; i<count; i++)); do
        echo -e "  ${YELLOW}$((i+1)).${NC} ${commands[$i]}"
    done

    print_tip "journalctl -u service --since today — aajka logs matra"
}

# ============================================
# sgit — Git
# ============================================
sgit() {
    local count=$(validate_count "$1" 5 10)
    print_header "Git" $count

    local commands=(
        "git clone https://github.com/user/repo    # repository clone"
        "git add . && git commit -m 'message'      # stage and commit"
        "git push origin main                       # remote ma push"
        "git pull origin main                       # remote bata pull"
        "git status                                 # working tree status"
        "git log --oneline --graph --all            # visual commit history"
        "git checkout -b feature/branch             # naya branch create + switch"
        "git merge feature/branch                   # branch merge"
        "git rebase main                            # rebase onto main"
        "git stash && git stash pop                 # changes temporarily store/restore"
    )

    for ((i=0; i<count; i++)); do
        echo -e "  ${YELLOW}$((i+1)).${NC} ${commands[$i]}"
    done

    print_tip "git reset HEAD~1 — last commit undo (changes keep garxa)"
}

# ============================================
# sdocker — Docker
# ============================================
sdocker() {
    local count=$(validate_count "$1" 5 10)
    print_header "Docker" $count

    local commands=(
        "docker ps                                  # running containers"
        "docker ps -a                               # all containers"
        "docker images                              # local images list"
        "docker run -d -p 80:80 --name web nginx    # container run"
        "docker exec -it container_id bash          # container bhitra entry"
        "docker logs -f container_id                # container logs follow"
        "docker stop container_id                   # container stop"
        "docker rm container_id                     # container delete"
        "docker build -t myapp:1.0 .                # image build"
        "docker-compose up -d                       # compose services start"
    )

    for ((i=0; i<count; i++)); do
        echo -e "  ${YELLOW}$((i+1)).${NC} ${commands[$i]}"
    done

    print_tip "docker system prune -a — sabai unused containers/images hatau"
}

# ============================================
# snode — Node.js
# ============================================
snode() {
    local count=$(validate_count "$1" 5 10)
    print_header "Node.js & NPM" $count

    local commands=(
        "node -v && npm -v                          # version check"
        "npm init -y                                # package.json create"
        "npm install express                        # package install"
        "npm install -g nodemon                     # global install"
        "npm run dev                                # dev script run"
        "npm run build                              # build script run"
        "npm uninstall package                      # package remove"
        "npm audit fix                              # security fix"
        "nvm install 20                             # node v20 install"
        "nvm use 20 && nvm alias default 20         # node version set"
    )

    for ((i=0; i<count; i++)); do
        echo -e "  ${YELLOW}$((i+1)).${NC} ${commands[$i]}"
    done

    print_tip "nvm alias default <version> — permanent node version set garxa"
}

# ============================================
# spython — Python
# ============================================
spython() {
    local count=$(validate_count "$1" 5 10)
    print_header "Python & Pip" $count

    local commands=(
        "python3 --version && pip3 --version        # version check"
        "python3 -m venv venv                       # virtual env create"
        "source venv/bin/activate                   # virtual env activate"
        "pip3 install -r requirements.txt           # dependencies install"
        "pip3 freeze > requirements.txt             # dependencies export"
        "pip3 install package                       # package install"
        "pip3 uninstall package                     # package remove"
        "pip3 list                                  # installed packages"
        "python3 -m pytest tests/                   # tests run"
        "deactivate                                 # virtual env exit"
    )

    for ((i=0; i<count; i++)); do
        echo -e "  ${YELLOW}$((i+1)).${NC} ${commands[$i]}"
    done

    print_tip "project har ma virtual environment banau — dependencies isolate rakhxa"
}

# ============================================
# sapt — APT
# ============================================
sapt() {
    local count=$(validate_count "$1" 5 10)
    print_header "APT Package Management" $count

    local commands=(
        "sudo apt update                            # package list refresh"
        "sudo apt install nginx                     # package install"
        "sudo apt remove nginx                      # package remove"
        "sudo apt purge nginx                       # package + config remove"
        "apt search nginx                           # package search"
        "apt show nginx                             # package details"
        "sudo apt autoremove                        # unused dependencies hatau"
        "sudo apt clean                             # cache clean"
        "apt list --installed                       # installed packages"
        "sudo dpkg -i package.deb                   # .deb file install"
    )

    for ((i=0; i<count; i++)); do
        echo -e "  ${}$((i+1)).${NC} ${commands[$i]}"
    done

    print_tip "cat /var/log/apt/history.log — install history herne"
}

# ============================================
# sperm — File Permissions
# ============================================
sperm() {
    local count=$(validate_count "$1" 5 10)
    print_header "File Permissions" $count

    local commands=(
        "chmod 755 script.sh                        # rwxr-xr-x"
        "chmod 644 index.html                       # rw-r--r--"
        "chmod +x script.sh                         # execute permission add"
        "chown user:group file                      # owner change"
        "ls -la                                     # permissions detail herne"
        "chmod -R 755 /var/www/html                 # recursive permission change"
        "chown -R www-data:www-data /var/www        # recursive owner change"
        "chmod 400 id_rsa                           # SSH key — owner read only"
        "chmod 600 .env                             # sensitive file — owner only"
        "umask 022                                  # default permission set"
    )

    for ((i=0; i<count; i++)); do
        echo -e "  ${yellow}$((i+1)).${NC} ${commands[$i]}"
    done

    print_tip "4=read 2=write 1=execute. 755 = owner(rwx) group(r-x) others(r-x)"
}

# ============================================
# snetwork — Network
# ============================================
snetwork() {
    local count=$(validate_count "$1" 5 10)
    print_header "Network" $count

    local commands=(
        "ping -c 4 google.com                       # connectivity check"
        "curl -I https://example.com                # HTTP headers check"
        "ss -tulpn                                  # open ports herne"
        "ip a                                       # IP addresses"
        "ip route show                              # routing table"
        "dig google.com +short                      # DNS lookup"
        "traceroute google.com                      # network path trace"
        "nmap -p 80,443 target.com                  # port scan"
        "wget https://example.com/file.zip          # file download"
        "netstat -tulpn                             # network connections"
    )

    for ((i=0; i<count; i++)); do
        echo -e "  ${YELLOW}$((i+1)).${NC} ${commands[$i]}"
    done

    print_tip "ss -tulpn is faster than netstat — modern alternative"
}

# ============================================
# sprocess — Process Management
# ============================================
sprocess() {
    local count=$(validate_count "$1" 5 10)
    print_header "Process Management" $count

    local commands=(
        "ps aux | grep nginx                        # process find"
        "htop                                       # interactive process monitor"
        "top -o %CPU                                # top by CPU usage"
        "kill -9 PID                                # force kill"
        "pkill nginx                                # name bata kill"
        "pgrep -l nginx                             # PID + name find"
        "lsof -i :80                                # port 80 use garne process"
        "nice -n 10 command                         # low priority run"
        "nohup ./script.sh > out.log 2>&1 &         # background — logout pachi pani"
        "jobs && fg %1                              # background jobs manage"
    )

    for ((i=0; i<count; i++)); do
        echo -e "  ${YELLOW}$((i+1)).${NC} ${commands[$i]}"
    done

    print_tip "sudo apt install htop — top bhanda धेरै better"
}

# ============================================
# slocation — System Paths
# ============================================
slocation() {
    local count=$(validate_count "$1" 5 10)
    print_header "Important System Locations" $count

    local commands=(
        "/etc/nginx/nginx.conf                      # nginx main config"
        "/etc/nginx/sites-available/                # nginx virtual hosts"
        "/var/log/nginx/error.log                   # nginx error logs"
        "/etc/ssh/sshd_config                       # SSH server config"
        "/var/log/syslog                            # system logs"
        "/etc/hosts                                 # local DNS override"
        "/etc/resolv.conf                           # DNS resolver config"
        "/etc/crontab                               # system cron jobs"
        "/etc/fstab                                 # filesystem mounts"
        "/etc/environment                           # system-wide env variables"
    )

    for ((i=0; i<count; i++)); do
        echo -e "  ${YELLOW}$((i+1)).${NC} ${commands[$i]}"
    done

    print_tip "edit garda backup leu: sudo cp file file.bak"
}

# ============================================
# skubectl — Kubernetes
# ============================================
skubectl() {
    local count=$(validate_count "$1" 5 10)
    print_header "Kubernetes (kubectl)" $count

    local commands=(
        "kubectl get pods -A                        # all namespaces pods"
        "kubectl get nodes -o wide                  # nodes with IP + status"
        "kubectl describe pod pod-name -n ns        # pod details"
        "kubectl logs pod-name -f -n ns             # pod logs real-time"
        "kubectl exec -it pod-name -n ns -- bash    # pod bhitra entry"
        "kubectl apply -f manifest.yaml             # resource apply"
        "kubectl delete -f manifest.yaml            # resource delete"
        "kubectl get svc -A                         # all services"
        "kubectl rollout restart deployment/name    # deployment restart"
        "kubectl top pods -A                        # pod CPU/memory usage"
    )

    for ((i=0; i<count; i++)); do
        echo -e "  ${YELLOW}$((i+1)).${NC} ${commands[$i]}"
    done

    print_tip "kubectl get all -n namespace — sabai resources ek palta"
}

# ============================================
# sterraform — Terraform
# ============================================
sterraform() {
    local count=$(validate_count "$1" 5 10)
    print_header "Terraform" $count

    local commands=(
        "terraform init                             # provider plugins install"
        "terraform plan                             # changes preview"
        "terraform apply -auto-approve              # infrastructure apply"
        "terraform destroy -auto-approve            # infrastructure destroy"
        "terraform fmt && terraform validate        # format + validate"
        "terraform state list                       # state resources list"
        "terraform state show resource.name         # resource details herne"
        "terraform output                           # output values"
        "terraform workspace list                   # workspaces herne"
        "terraform import resource.name id          # existing resource import"
    )

    for ((i=0; i<count; i++)); do
        echo -e "  ${YELLOW}$((i+1)).${NC} ${commands[$i]}"
    done

    print_tip "terraform plan -out=plan.tfplan — plan save garxa, apply ma use gara"
}

# ============================================
# snginx — Nginx
# ============================================
snginx() {
    local count=$(validate_count "$1" 5 10)
    print_header "Nginx" $count

    local commands=(
        "sudo nginx -t                              # config syntax test"
        "sudo systemctl reload nginx               # reload — no downtime"
        "sudo systemctl restart nginx              # full restart"
        "sudo systemctl status nginx               # status check"
        "sudo tail -f /var/log/nginx/error.log     # error log watch"
        "sudo tail -f /var/log/nginx/access.log    # access log watch"
        "sudo ln -s /etc/nginx/sites-available/app /etc/nginx/sites-enabled/ # site enable"
        "sudo certbot --nginx -d domain.com        # SSL certificate install"
        "sudo certbot renew --dry-run              # SSL renewal test"
        "nginx -v                                  # version check"
    )

    for ((i=0; i<count; i++)); do
        echo -e "  ${YELLOW}$((i+1)).${NC} ${commands[$i]}"
    done

    print_tip "always sudo nginx -t gara config edit garda, tarpachi reload"
}

# ============================================
# slinux — Linux System
# ============================================
slinux() {
    local count=$(validate_count "$1" 5 10)
    print_header "Linux System" $count

    local commands=(
        "uname -a                                   # kernel + OS info"
        "df -h                                      # disk usage"
        "du -sh /var/log/*                          # directory sizes"
        "free -h                                    # RAM usage"
        "uptime                                     # system uptime + load"
        "who && w                                   # logged in users"
        "last -n 10                                 # last 10 logins"
        "lsblk                                      # block devices list"
        "cat /proc/cpuinfo | grep 'model name'      # CPU info"
        "sudo dmesg | tail -20                      # kernel messages"
    )

    for ((i=0; i<count; i++)); do
        echo -e "  ${YELLOW}$((i+1)).${NC} ${commands[$i]}"
    done

    print_tip "watch -n 1 'df -h' — disk usage real-time monitor"
}

# ============================================
# sfirewall — Firewall (UFW/iptables)
# ============================================
sfirewall() {
    local count=$(validate_count "$1" 5 10)
    print_header "Firewall (UFW)" $count

    local commands=(
        "sudo ufw status verbose                    # firewall status"
        "sudo ufw enable                            # firewall enable"
        "sudo ufw disable                           # firewall disable"
        "sudo ufw allow 22/tcp                      # SSH allow"
        "sudo ufw allow 80,443/tcp                  # HTTP/HTTPS allow"
        "sudo ufw deny 3306                         # MySQL port block"
        "sudo ufw allow from 192.168.1.0/24         # subnet allow"
        "sudo ufw delete allow 80/tcp               # rule delete"
        "sudo ufw logging on                        # logging enable"
        "sudo iptables -L -n -v                     # iptables rules list"
    )

    for ((i=0; i<count; i++)); do
        echo -e "  ${YELLOW}$((i+1)).${NC} ${commands[$i]}"
    done

    print_tip "sudo ufw allow from IP to any port 22 — specific IP bata SSH allow"
}

# ============================================
# snmap — Nmap Network Scanner
# ============================================
snmap() {
    local count=$(validate_count "$1" 5 10)
    print_header "Nmap" $count

    local commands=(
        "nmap 192.168.1.1                           # basic host scan"
        "nmap -p 80,443,22 target.com               # specific ports scan"
        "nmap -p- target.com                        # all 65535 ports scan"
        "nmap -sV target.com                        # service version detect"
        "nmap -O target.com                         # OS detection"
        "nmap -A target.com                         # aggressive scan (OS+ver+script)"
        "nmap -sn 192.168.1.0/24                    # ping sweep — live hosts"
        "nmap --script vuln target.com              # vulnerability scan"
        "nmap -sU -p 53,161 target.com              # UDP scan"
        "nmap -oN output.txt target.com             # output file ma save"
    )

    for ((i=0; i<count; i++)); do
        echo -e "  ${YELLOW}$((i+1)).${NC} ${commands[$i]}"
    done

    print_tip "use nmap only on systems you own or have permission to scan"
}

# ============================================
# shacking — Ethical Hacking Tools
# ============================================
shacking() {
    local count=$(validate_count "$1" 5 10)
    print_header "Ethical Hacking Tools" $count

    local commands=(
        "nmap -sV --script vuln target              # vulnerability scan"
        "nikto -h http://target.com                 # web server scan"
        "gobuster dir -u http://target -w wordlist  # directory bruteforce"
        "sqlmap -u 'http://target.com?id=1' --dbs   # SQL injection test"
        "hydra -l admin -P pass.txt ssh://target    # SSH bruteforce"
        "metasploit: msfconsole                     # metasploit framework"
        "wireshark &                                # packet capture GUI"
        "tcpdump -i eth0 -w capture.pcap            # packet capture CLI"
        "john --wordlist=rockyou.txt hash.txt       # password crack"
        "hashcat -a 0 -m 0 hash.txt wordlist.txt    # GPU password crack"
    )

    for ((i=0; i<count; i++)); do
        echo -e "  ${YELLOW}$((i+1)).${NC} ${commands[$i]}"
    done

    print_tip "ethical hacking — only use on systems you own or have written permission"
}

# ============================================
# stesting — Testing Tools
# ============================================
stesting() {
    local count=$(validate_count "$1" 5 10)
    print_header "Testing Tools" $count

    local commands=(
        "curl -X GET https://api.example.com        # GET request"
        "curl -X POST -d '{\"key\":\"val\"}' -H 'Content-Type: application/json' URL # POST request"
        "curl -X PUT -d @data.json URL              # PUT request with file"
        "ab -n 1000 -c 10 http://target/            # Apache bench load test"
        "wrk -t4 -c100 -d30s http://target/         # advanced load test"
        "wget --spider http://target.com            # link check"
        "python3 -m pytest tests/ -v                # pytest verbose"
        "python3 -m pytest --cov=app tests/         # pytest with coverage"
        "k6 run script.js                           # k6 load test"
        "hey -n 1000 -c 50 http://target/           # hey load test"
    )

    for ((i=0; i<count; i++)); do
        echo -e "  ${YELLOW}$((i+1)).${NC} ${commands[$i]}"
    done

    print_tip "curl -v URL — verbose mode, headers + response sab dekhaauxa"
}

# ============================================
# sansible — Ansible
# ============================================
sansible() {
    local count=$(validate_count "$1" 5 10)
    print_header "Ansible" $count

    local commands=(
        "ansible all -m ping                        # all hosts ping"
        "ansible all -m command -a 'uptime'         # command run on all hosts"
        "ansible-playbook playbook.yml              # playbook run"
        "ansible-playbook playbook.yml --check      # dry run"
        "ansible-playbook playbook.yml -v           # verbose run"
        "ansible-vault encrypt secrets.yml          # file encrypt"
        "ansible-vault decrypt secrets.yml          # file decrypt"
        "ansible-galaxy install role_name           # role install"
        "ansible-inventory --list                   # inventory list"
        "ansible all -m setup | grep ansible_os     # OS info gather"
    )

    for ((i=0; i<count; i++)); do
        echo -e "  ${YELLOW}$((i+1)).${NC} ${commands[$i]}"
    done

    print_tip "ansible-playbook playbook.yml --tags deploy — specific tags matra run"
}

# ============================================
# saws — AWS CLI
# ============================================
saws() {
    local count=$(validate_count "$1" 5 10)
    print_header "AWS CLI" $count

    local commands=(
        "aws configure                              # credentials setup"
        "aws s3 ls                                  # S3 buckets list"
        "aws s3 cp file.txt s3://bucket/            # file S3 ma upload"
        "aws s3 sync ./dir s3://bucket/dir          # directory sync"
        "aws ec2 describe-instances                 # EC2 instances list"
        "aws ec2 start-instances --instance-ids id  # instance start"
        "aws ec2 stop-instances --instance-ids id   # instance stop"
        "aws iam list-users                         # IAM users list"
        "aws logs tail /aws/lambda/func --follow    # CloudWatch logs"
        "aws sts get-caller-identity                # current identity check"
    )

    for ((i=0; i<count; i++)); do
        echo -e "  ${YELLOW}$((i+1)).${NC} ${commands[$i]}"
    done

    print_tip "aws configure --profile myprofile — multiple accounts manage garna"
}

# ============================================
# scron — Cron Jobs
# ============================================
scron() {
    local count=$(validate_count "$1" 5 10)
    print_header "Cron Jobs" $count

    local commands=(
        "crontab -e                                 # current user crontab edit"
        "crontab -l                                 # current user crontab list"
        "sudo crontab -e                            # root crontab edit"
        "sudo crontab -l                            # root crontab list"
        "cat /etc/crontab                           # system crontab"
        "ls /etc/cron.d/                            # cron.d scripts"
        "* * * * * /path/script.sh                  # every minute run"
        "0 2 * * * /path/script.sh                  # daily 2AM run"
        "0 */6 * * * /path/script.sh                # every 6 hours"
        "0 9 * * 1 /path/script.sh                  # every Monday 9AM"
    )

    for ((i=0; i<count; i++)); do
        echo -e "  ${YELLOW}$((i+1)).${NC} ${commands[$i]}"
    done

    print_tip "cron syntax: minute hour day month weekday — * means every"
}

# ============================================
# slog — Log Analysis
# ============================================
slog() {
    local count=$(validate_count "$1" 5 10)
    print_header "Log Analysis" $count

    local commands=(
        "tail -f /var/log/syslog                    # system log real-time"
        "tail -f /var/log/nginx/error.log           # nginx error real-time"
        "grep 'ERROR' /var/log/app.log              # ERROR lines filter"
        "grep -i 'failed' /var/log/auth.log         # failed logins"
        "awk '{print \$1}' access.log | sort | uniq -c | sort -rn # top IPs"
        "journalctl -u nginx --since '1 hour ago'   # last 1 hour logs"
        "journalctl -p err -b                       # boot errors"
        "zcat /var/log/syslog.2.gz | grep ERROR     # compressed log search"
        "find /var/log -name '*.log' -mtime -1      # logs modified in 1 day"
        "wc -l /var/log/nginx/access.log            # total log lines count"
    )

    for ((i=0; i<count; i++)); do
        echo -e "  ${YELLOW}$((i+1)).${NC} ${commands[$i]}"
    done

    print_tip "journalctl -f — systemd logs real-time, tail -f alternative"
}

# ============================================
# shelp — Help Menu
# ============================================
shelp() {
    echo -e ""
    echo -e "${CYAN}${BOLD}╔══════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${CYAN}${BOLD}║           NyapuShell v$VERSION — Linux Command Helper            ║${NC}"
    echo -e "${CYAN}${BOLD}╚══════════════════════════════════════════════════════════════╝${NC}"
    echo -e "  ${WHITE}Author :${NC} Sameer Tiruwa (@sameertiruwa1010)"
    echo -e "  ${WHITE}Usage  :${NC} <command> [1-10]   e.g. ${YELLOW}supdate 8${NC} or ${YELLOW}snmap 10${NC}"
    echo -e ""
    echo -e "  ${CYAN}${BOLD}System & Package${NC}"
    echo -e "   ${GREEN}supdate${NC}       System update (apt)"
    echo -e "   ${GREEN}sapt${NC}          APT package management"
    echo -e "   ${GREEN}slinux${NC}        Linux system info + disk + RAM"
    echo -e "   ${GREEN}sprocess${NC}      Process management"
    echo -e "   ${GREEN}slocation${NC}     Important system paths"
    echo -e "   ${GREEN}scron${NC}         Cron job syntax + management"
    echo -e "   ${GREEN}slog${NC}          Log analysis + grep tricks"
    echo -e "   ${GREEN}sservice${NC}      Systemctl service management"
    echo -e "   ${GREEN}sperm${NC}         File permissions"
    echo -e ""
    echo -e "  ${CYAN}${BOLD}Network & Security${NC}"
    echo -e "   ${GREEN}snetwork${NC}      Network troubleshooting"
    echo -e "   ${GREEN}sssh${NC}          SSH & SCP commands"
    echo -e "   ${GREEN}sfirewall${NC}     UFW + iptables firewall"
    echo -e "   ${GREEN}snmap${NC}         Nmap network scanner"
    echo -e "   ${GREEN}shacking${NC}      Ethical hacking tools"
    echo -e ""
    echo -e "  ${CYAN}${BOLD}DevOps & Cloud${NC}"
    echo -e "   ${GREEN}sdocker${NC}       Docker & compose"
    echo -e "   ${GREEN}skubectl${NC}      Kubernetes (kubectl)"
    echo -e "   ${GREEN}sterraform${NC}    Terraform IaC"
    echo -e "   ${GREEN}snginx${NC}        Nginx config & management"
    echo -e "   ${GREEN}sansible${NC}      Ansible automation"
    echo -e "   ${GREEN}saws${NC}          AWS CLI"
    echo -e ""
    echo -e "  ${CYAN}${BOLD}Development${NC}"
    echo -e "   ${GREEN}sgit${NC}          Git workflow"
    echo -e "   ${GREEN}snode${NC}         Node.js & npm"
    echo -e "   ${GREEN}spython${NC}       Python & pip"
    echo -e "   ${GREEN}stesting${NC}      Testing + load testing tools"
    echo -e ""
    echo -e "  ${YELLOW}Examples:${NC}"
    echo -e "   supdate          shows 5 commands (default)"
    echo -e "   supdate 8        shows 8 commands"
    echo -e "   snmap 10         shows all 10 nmap commands"
    echo -e "   supdate 15       capped at 10 with warning"
    echo -e ""
    echo -e "  ${CYAN}github.com/sameertiruwa1010/NyapuShell${NC}"
    echo -e ""
}

# ============================================
# Main Execution
# ============================================
if [[ "${BASH_SOURCE[0]}" != "${0}" ]]; then
    :
else
    if [[ $# -eq 0 ]]; then
        shelp
    else
        cmd="$1"
        shift
        if declare -f "$cmd" > /dev/null 2>&1; then
            "$cmd" "$@"
        else
            echo -e "${RED}Unknown command: $cmd${NC}"
            echo -e "Run ${GREEN}shelp${NC} to see all available commands."
        fi
    fi
fi
