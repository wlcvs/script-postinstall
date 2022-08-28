#!/bin/bash

# Versão agora pra red hat, pra não falar fedora pq é um
# nome meio zoado

set -e

#CORES
VERMELHO='\e[1;91m'
VERDE='\e[1;92m'
SEM_COR='\e[0m'

dnf_update(){
    sudo dnf check-update && sudo dnf distro-sync -y
}

just_dnf_update(){
    sudo dnf check-update
}

##RPM SOFTWARES TO INSTALL

PROGRAMAS_PARA_INSTALAR=(
  git
  wget
  vim
  alacritty 
)

install_rpms(){

    # Instalar programas no apt
    echo -e "${VERDE}[INFO] - Instalando pacotes rpm do repositório${SEM_COR}"

    for nome_do_programa in ${PROGRAMAS_PARA_INSTALAR[@]}; do
  
        sudo apt install "$nome_do_programa" -y
        echo "[INSTALADO] - $nome_do_programa"

    done

}

## Instalando pacotes Flatpak ##
install_flatpaks(){

    echo -e "${VERDE}[INFO] - Instalando pacotes flatpak${SEM_COR}"

    flatpak install flathub com.google.Chrome -y
    flatpak install flathub com.visualstudio.code -y

}

# -------------------------------------------------------------------------- #
# ----------------------------- PÓS-INSTALAÇÃO ----------------------------- #

## Finalização, atualização e limpeza##

system_clean(){

    dnf_update -y
    flatpak update -y
    sudo dnf clean all -y
    sudo dnf autoremove -y

}

# -------------------------------------------------------------------------------- #
# -------------------------------EXECUÇÃO----------------------------------------- #

dnf_update
just_dnf_update
install_rpms
install_flatpaks
dnf_update
system_clean

## finalização

  echo -e "${VERDE}[INFO] - Script finalizado, instalação concluída! :)${SEM_COR}"
