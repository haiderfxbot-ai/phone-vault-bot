#!/data/data/com.termux/files/usr/bin/bash
set -e

BOLD='\033[1m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
RED='\033[0;31m'
NC='\033[0m'

echo -e "${CYAN}${BOLD}[*] JARVIS/MYTHOS Core — Termux Environment Setup${NC}"
echo -e "${YELLOW}[*] Starting at $(date)${NC}\n"

echo -e "${GREEN}[1/5] Updating Termux packages...${NC}"
pkg update -y && pkg upgrade -y

echo -e "${GREEN}[2/5] Installing Python, Git, curl...${NC}"
pkg install -y python git curl

echo -e "${GREEN}[3/5] Installing Python dependencies...${NC}"
pip install --upgrade pip
pip install -r requirements.txt

echo -e "${GREEN}[4/5] Installing Ollama via Termux package manager...${NC}"
pkg install -y ollama

echo -e "${GREEN}[5/5] Starting Ollama service & pulling model...${NC}"
ollama serve &
sleep 5
ollama pull llama3.2:3b

echo -e "\n${CYAN}${BOLD}[✓] Setup complete. Run: python main.py${NC}"
echo -e "${YELLOW}[!] Make sure ollama serve is running before using main.py${NC}"
echo -e "${YELLOW}[!] Default model: llama3.2:3b (~2 GB RAM){NC}"
