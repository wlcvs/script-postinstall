#!/bin/bash

set -e

#CORES
VERMELHO='\e[1;91m'
VERDE='\e[1;92m'
SEM_COR='\e[0m'

pacman_update(){
    sudo pacman -Syuuuu
}

## Instalando pacotes Flatpak ##
install_flatpaks(){

    echo -e "${VERDE}[INFO] - Instalando pacotes flatpak${SEM_COR}"

    flatpak install flathub com.google.Chrome -y
    flatpak install flathub com.visualstudio.code -y

}

## Finalização, atualização e limpeza##

system_clean(){

    pacman_update -y
    flatpak update -y

}

# -------------------------------------------------------------------------------- #
# -------------------------------EXECUÇÃO----------------------------------------- #

pacman_update
install_flatpaks
pacman_update
system_clean

## finalização

  echo -e "${VERDE}[INFO] - Script finalizado, instalação concluída! :)${SEM_COR}"

