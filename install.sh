# #!/usr/bin/env bash
# Installation script for setV
#
# License: GNU GPL v3, See LICENSE file.
#
# WARNING: This will replace existing installation of setV.
#
# TODO: Verify THIS file.

BOLD_GREEN="\033[1m"
RED="\e[0;31m"
BLUE="\e[0;34m"
RESET="\e[0m"

if [[ ! -d "${HOME}/virtualenvs" ]];
   then
       echo -e "${RED}"* "${RESET}""${BOLD_GREEN}"Creating directory to hold all Python virtual environments"${RESET}"
       mkdir -p "${HOME}"/virtualenvs
fi

if [ ! -e "${HOME}/.virtual.sh" ];
   then
       echo -e "${RED}"* "${RESET}""${BOLD_GREEN}"Downloading and Updating setV"${RESET}"
       curl -# https://github.com/FernandezR/setV/raw/master/virtual.sh -o ${HOME}/.virtual.sh
else
       echo -e "${RED}"* "${RESET}""${BOLD_GREEN}"Downloading and Installing setV"${RESET}"
       curl -# https://github.com/FernandezR/setV/raw/master/virtual.sh -o ${HOME}/.virtual.sh
fi

# for SH/BASH
# TODO: Check if the configuration already exist.
if [ -e "${HOME}/.bashrc" ];
then
    echo -e "${RED}"* "${RESET}""${BOLD_GREEN}"Appending "${BLUE}"~/.bashrc"${RESET}"
    echo "source ~/.virtual.sh" >> ${HOME}/.bashrc
elif [ -e "${HOME}/.bash_profile" ];
then
    echo -e "${RED}"* "${RESET}""${BOLD_GREEN}"Appending "${BLUE}"~/.bash_profile"${RESET}"
    echo "source ~/.virtual.sh" >> ${HOME}/.bash_profile
fi

# for ZSH
# TODO: Check if the configuration already exist.
if [ -e "${HOME}/.zshrc" ];
then
    echo -e "${RED}"* "${RESET}""${BOLD_GREEN}"Appending "${BLUE}"~/.zshrc"${RESET}"
    echo "autoload -Uz compinit" >> ${HOME}/.zshrc
    echo "compinit" >> ${HOME}/.zshrc
    echo "autoload -U +X bashcompinit" >> ${HOME}/.zshrc
    echo "bashcompinit" >> ${HOME}/.zshrc
    echo "source ~/.virtual.sh" >> ${HOME}/.zshrc
fi

# Done installing
echo -e "${RED}"* "${RESET}"Type: 'source ~/.bashrc or source ~/.bash_profile or source ~/.zshrc'
echo -e "${RED}"* "${RESET}"or open new terminal to start using "${BOLD_GREEN}"setV"${RESET}"

# Usage
echo -e "${RED}"===================="${RESET}"
echo -e "${BOLD_GREEN}"Usage: setv VIRTUAL_ENVIRONMENT_NAME"${RESET}\n"
