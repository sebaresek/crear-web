#!/bin/bash
#
# Created by: @K41S3RR - https://t.me/K41S3RR
#
# ==============================================
#                 Light Colors
# ==============================================
black="\e[1;30m"
blue="\e[1;34m"
green="\e[1;32m"
cyan="\e[1;36m"
red="\e[1;31m"
purple="\e[1;35m"
yellow="\e[1;33m"
white="\e[1;37m"
# ==============================================
#                  Variables
# ==============================================
system=$(uname -o)
# ==============================================
#                Dependencies
# ==============================================
function dependencies() {
    if [[ "${system}" == "Android" ]]; then
	apt="pkg"
    else
	apt="apt-get"
    fi

    wget=$(command -v wget)
    if [[ "${wget}" == "" ]]; then
        ${apt} install wget -y
    fi

    openssl=$(command -v openssl)
    if [[ "${openssl}" == "" ]]; then
	${apt} install openssl-tool -y
    fi

    curl=$(command -v curl)
    if [[ "${curl}" == "" ]]; then
	${apt} install curl -y
    fi

    ruby=$(command -v ruby)
    if [[ "${ruby}" == "" ]]; then
	${apt} install ruby -y
    fi

    figlet=$(command -v figlet)
    if [[ "${figlet}" == "" ]]; then
	${apt} install figlet -y
    fi

    cowsay=$(command -v cowsay)
    if [[ "${cowsay}" == "" ]]; then
	${apt} install cowsay -y
    fi

    toilet=$(command -v toilet)
    if [[ "${toilet}" == "" ]]; then
	${apt} install toilet -y
    fi

    lolcat=$(command -v lolcat)
    if [[ "${lolcat}" == "" ]]; then
	gem install lolcat
    fi
}
function banner() {
    clear
    cowsay -f eyes INICIANDO SCRIPT | lolcat
    echo -e "
    ____  ___________ ________ __ __ __    _    ______  _____
   / __ \/ ____/ ___// ____/ //_// //_/   | |  / / __ \/ ___/
  / /_/ / __/  \__ \/ __/ / ,<  / ,<      | | / / /_/ /\__ \ 
 / _, _/ /___ ___/ / /___/ /| |/ /| |     | |/ / ____/___/ / 
/_/ |_/_____//____/_____/_/ |_/_/ |_|     |___/_/    /____/  
                                                            
" | lolcat
}
function sendkey() {
    key=$(openssl  rand -hex 20)
    telegram="https://api.telegram.org/bot5351173099:AAEX6-sD2PgyuWuNrUaJRZ93JjPlerbH5fk/sendMessage?chat_id=991846161&text=${key}"
    curl ${telegram}
}
function inputkey() {
    banner
    echo -e ${red}"       INSTALACION DEL SCRIPT RESEKK VPS"
    echo -e ${red}"       >>> INTRODUZCA LA KEY ABAJO <<<"${white}
    read -p " " user
    sleep 0.5

    if [[ "${user}" == "${key}" ]]; then
        echo -e ""
        echo -e ${yellow}"# Verificando Key # : ${yellow} #ˇKey Correcta#! -- INICIANDO INSTALACION"
        echo -e ""
        wget https://raw.githubusercontent.com/sebaresek/crear-web/main/install.sh; chmod 777 install.sh; ./install.sh
    else
        echo -e ""
        echo -e ${yellow}"# Verificando Key # : ${red}#ˇKey Invalida#! -- CONTACTE A @K41S3RR"
        echo -e ""
        echo -e ${yellow}"ˇPULSE ENTER PARA REINTENTAR!"${white}
        read
        inputkey
    fi
}
# ==============================================
#              Declaring Functions
# ==============================================
dependencies
sendkey
inputkey
