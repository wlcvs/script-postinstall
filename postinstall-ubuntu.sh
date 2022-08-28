#!/bin/bash

# Ubuntu de inicio

# Agora eu tenho que fazer ele identificar o sistema e executar 
# um determinado grupo de comandos 

# so vo testar uns bagui primeiro

# Tornando o arquivo executável eu suponho
set -e

#CORES
VERMELHO='\e[1;91m'
VERDE='\e[1;92m'
SEM_COR='\e[0m'

# Atualizando repositório e fazendo atualização do sistema
apt_update(){

  sudo apt update && sudo apt dist-upgrade -y

}

## Removendo travas eventuais do apt ##
travas_apt(){

  sudo rm /var/lib/dpkg/lock-frontend
  sudo rm /var/cache/apt/archives/lock

}

## Adicionando/Confirmando arquitetura de 32 bits ##
add_archi386(){

  sudo dpkg --add-architecture i386

}
## Atualizando o repositório ##
just_apt_update(){

  sudo apt update -y

}

##DEB SOFTWARES TO INSTALL

PROGRAMAS_PARA_INSTALAR=(
  git
  wget
  vim
  alacritty
  flatpak
)

install_debs(){

  # Instalar programas no apt
  echo -e "${VERDE}[INFO] - Instalando pacotes apt do repositório${SEM_COR}"

  for nome_do_programa in ${PROGRAMAS_PARA_INSTALAR[@]}; do
    if ! dpkg -l | grep -q $nome_do_programa; then # Só instala se já não estiver instalado
      sudo apt install "$nome_do_programa" -y
    else
      echo "[INSTALADO] - $nome_do_programa"
    fi
  done

}

## Adicionando repositório Flathub ##

flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo && 


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

apt_update -y
flatpak update -y
sudo apt autoclean -y
sudo apt autoremove -y

}

# -------------------------------------------------------------------------------- #
# -------------------------------EXECUÇÃO----------------------------------------- #

travas_apt
apt_update
travas_apt
add_archi386
just_apt_update
install_debs
install_flatpaks
apt_update
system_clean

## finalização

  echo -e "${VERDE}[INFO] - Script finalizado, instalação concluída! :)${SEM_COR}"
