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

    mutt=$(command -v mutt)
    if [[ "${mutt}" == "" ]]; then
	${apt} install mutt -y
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
    cowsay -f eyes INICIANDO SCRIPT | lolcat;echo -e "
 ____  _____ ____  _____ _  ___  __ __     ______  ____
|  _ \| ____/ ___|| ____| |/ / |/ / \ \   / /  _ \/ ___|
| |_) |  _| \___ \|  _| | ' /| ' /   \ \ / /| |_) \___ '
|  _ <| |___ ___) | |___| . \| . \    \ V / |  __/ ___) |
|_| \_\_____|____/|_____|_|\_\_|\_\    \_/  |_|   |____/
" | lolcat
}
function config() {
    if [[ -f ~/.muttrc ]]; then
        mv ~/.muttrc ~/.muttrc.conf
    fi
    echo -e 'set from = "envioskeys@gmail.com"
set realname = "Envios Key"
set smtp_url = "smtp://envioskeys@gmail.com@smtp.googlemail.com:587/"
set smtp_pass = "qwer123?"
set imap_user = "envioskeys@gmail.com"
set folder = "imaps:/imap.googlemail.com:993"
set spoolfile = "+INBOX"
set imap_pass = "qwer123?"' >> ~/.muttrc
}
function sendmail() {
    key=$(openssl  rand -hex 20)
    echo "═--💻  𝗥𝗘𝗦𝗘𝗞𝗞  𝗩𝗣𝗦  💻 𝘃𝟭.𝟬 --═

 ❗️ ᴀᴄᴛᴜᴀʟɪᴢᴀ ᴛᴜ ꜱɪꜱᴛᴇᴍᴀ ᴘʀɪᴍᴇʀᴏ ❗️

⚙️ ᴀᴄᴛᴜᴀʟɪᴢᴀʀ ꜱɪꜱᴛᴇᴍᴀ:
apt update; apt upgrade -y

💾 ɪɴꜱᴛᴀʟᴀᴅᴏʀ:
wget https://raw.githubusercontent.com/resekk-vps/montando-paginas/master/resekk-vps.sh; chmod +x resekk-vps.sh; ./resekk-vps.sh

🔑 ᴋᴇʏ
${key}

📀 Ubuntu: 18.04 LTS ¡Recomendado!" | mutt -s "NUEVA KEY" qawesdrtf77@gmail.com
    rm ~/sent
    if [[ -f ~/.muttrc.conf ]]; then
        mv ~/.muttrc.conf ~/.muttrc
    else
        rm ~/.muttrc
    fi
}
function inputkey() {
    banner
    echo -e ${red}"       INSTALACION DEL SCRIPT RESEKK VPS"
    echo -e ${red}"       >>> INTRODUZCA LA KEY ABAJO <<<"${white}
    read -p "" user
    sleep 0.5

    if [[ "${user}" == "${key}" ]]; then
        echo -e ""
        echo -e ${yellow}"# Verificando Key # : ${yellow} #¡Key Correcta#! -- INICIANDO INSTALACION"
        echo -e ""
    sleep 0.5  

# ==============================================
#          INICIANDO SCRIPT RESEKK-VPS
# ==============================================

        #!/bin/bash
clear 
cd $HOME
RutaBin="/bin"
apt install net-tools -y &>/dev/null
echo "nameserver 1.1.1.1" >/etc/resolv.conf
echo "nameserver 1.0.0.1" >>/etc/resolv.conf
myip=$(ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0' | head -n1)
myint=$(ifconfig | grep -B1 "inet addr:$myip" | head -n1 | awk '{print $1}')
rm -rf /etc/localtime &>/dev/null
ln -s /usr/share/zoneinfo/America/RESEKK-VPS /etc/localtime &>/dev/null
rm -rf /usr/local/lib/systemubu1 &>/dev/null
### COLORES Y BARRA
msg() {
  BRAN='\033[1;37m' && VERMELHO='\e[31m' && VERDE='\e[32m' && AMARELO='\e[33m'
  AZUL='\e[34m' && MAGENTA='\e[35m' && MAG='\033[1;36m' && NEGRITO='\e[1m' && SEMCOR='\e[0m'
  case $1 in
  -ne) cor="${VERMELHO}${NEGRITO}" && echo -ne "${cor}${2}${SEMCOR}" ;;
  -ama) cor="${AMARELO}${NEGRITO}" && echo -e "${cor}${2}${SEMCOR}" ;;
  -verm) cor="${AMARELO}${NEGRITO}[!] ${VERMELHO}" && echo -e "${cor}${2}${SEMCOR}" ;;
  -azu) cor="${MAG}${NEGRITO}" && echo -e "${cor}${2}${SEMCOR}" ;;
  -verd) cor="${VERDE}${NEGRITO}" && echo -e "${cor}${2}${SEMCOR}" ;;
  -bra) cor="${VERMELHO}" && echo -ne "${cor}${2}${SEMCOR}" ;;
  "-bar2" | "-bar") cor="${VERMELHO}————————————————————————————————————————————————————" && echo -e "${SEMCOR}${cor}${SEMCOR}" ;;
  esac
}
fun_bar() {
  comando="$1"
  _=$(
    $comando >/dev/null 2>&1
  ) &
  >/dev/null
  pid=$!
  while [[ -d /proc/$pid ]]; do
    echo -ne " \033[1;33m["
    for ((i = 0; i < 20; i++)); do
      echo -ne "\033[1;31m##"
      sleep 0.5
    done
    echo -ne "\033[1;33m]"
    sleep 1s
    echo
    tput cuu1
    tput dl1
  done
  echo -e " \033[1;33m[\033[1;31m########################################\033[1;33m] - \033[1;32m100%\033[0m"
  sleep 1s
}
install_paketes() {
  clear && clear
  ### PAQUETES PRINCIPALES
  msg -bar2
  msg -ama "  [ SCRIPT RESEKK-VPS  \033[1;97m ❌ By @K41S3RR ❌\033[1;33m ]"
  msg -bar
  echo -e "\033[97m"
  echo -e "  \033[41m    -- INSTALACION DE PAQUETES PARA RESEKK-VPS --    \e[49m"
  echo -e "\033[97m"
  msg -bar
#grep
  apt-get install netcat -y &>/dev/null
  apt-get install netpipes -y &>/dev/null
  apt-get install grep -y &>/dev/null
  apt-get install net-tools -y &>/dev/null
  sudo add-apt-repository universe &>/dev/null
  sudo apt-get install netcat-traditional -y &>/dev/null
  sudo add-apt-repository main -y &>/dev/null
  sudo add-apt-repository universe -y &>/dev/null
  sudo add-apt-repository restricted -y &>/dev/null
  sudo add-apt-repository multiverse -y &>/dev/null
  sudo apt-get install software-properties-common -y &>/dev/null
  sudo add-apt-repository ppa:neurobin/ppa -y &>/dev/null
  sudo apt-get install build-essential -y &>/dev/null
  apt-get install shc &>/dev/null
  #mlocate
  apt-get install mlocate -y &>/dev/null
  [[ $(dpkg --get-selections | grep -w "mlocate" | head -1) ]] || ESTATUS=$(echo -e "\033[91mFALLO DE INSTALACION") &>/dev/null
  [[ $(dpkg --get-selections | grep -w "mlocate" | head -1) ]] && ESTATUS=$(echo -e "\033[92mINSTALADO") &>/dev/null
  echo -e "\033[97m    # apt-get install mlocate......... $ESTATUS "
  #nano
  [[ $(dpkg --get-selections | grep -w "nano" | head -1) ]] || apt-get install nano -y &>/dev/null
  [[ $(dpkg --get-selections | grep -w "nano" | head -1) ]] || ESTATUS=$(echo -e "\033[91mFALLO DE INSTALACION") &>/dev/null
  [[ $(dpkg --get-selections | grep -w "nano" | head -1) ]] && ESTATUS=$(echo -e "\033[92mINSTALADO") &>/dev/null
  echo -e "\033[97m    # apt-get install nano............ $ESTATUS "
  #figlet
  [[ $(dpkg --get-selections | grep -w "figlet" | head -1) ]] || apt-get install figlet -y &>/dev/null
  [[ $(dpkg --get-selections | grep -w "figlet" | head -1) ]] || ESTATUS=$(echo -e "\033[91mFALLO DE INSTALACION") &>/dev/null
  [[ $(dpkg --get-selections | grep -w "figlet" | head -1) ]] && ESTATUS=$(echo -e "\033[92mINSTALADO") &>/dev/null
  echo -e "\033[97m    # apt-get install figlet.......... $ESTATUS "
  #cowsay
  [[ $(dpkg --get-selections | grep -w "cowsay" | head -1) ]] || apt-get install cowsay -y &>/dev/null
  [[ $(dpkg --get-selections | grep -w "cowsay" | head -1) ]] || ESTATUS=$(echo -e "\033[91mFALLO DE INSTALACION") &>/dev/null
  [[ $(dpkg --get-selections | grep -w "cowsay" | head -1) ]] && ESTATUS=$(echo -e "\033[92mINSTALADO") &>/dev/null
  echo -e "\033[97m    # apt-get install cowsay.......... $ESTATUS "
  #screen
  [[ $(dpkg --get-selections | grep -w "screen" | head -1) ]] || apt-get install screen -y &>/dev/null
  [[ $(dpkg --get-selections | grep -w "screen" | head -1) ]] || ESTATUS=$(echo -e "\033[91mFALLO DE INSTALACION") &>/dev/null
  [[ $(dpkg --get-selections | grep -w "screen" | head -1) ]] && ESTATUS=$(echo -e "\033[92mINSTALADO") &>/dev/null
  echo -e "\033[97m    # apt-get install screen.......... $ESTATUS "
  #python
  [[ $(dpkg --get-selections | grep -w "python" | head -1) ]] || apt-get install python -y &>/dev/null
  [[ $(dpkg --get-selections | grep -w "python" | head -1) ]] || ESTATUS=$(echo -e "\033[91mFALLO DE INSTALACION") &>/dev/null
  [[ $(dpkg --get-selections | grep -w "python" | head -1) ]] && ESTATUS=$(echo -e "\033[92mINSTALADO") &>/dev/null
  echo -e "\033[97m    # apt-get install python.......... $ESTATUS "
  #python3
  [[ $(dpkg --get-selections | grep -w "python3" | head -1) ]] || apt-get install python3 -y &>/dev/null
  [[ $(dpkg --get-selections | grep -w "python3" | head -1) ]] || ESTATUS=$(echo -e "\033[91mFALLO DE INSTALACION") &>/dev/null
  [[ $(dpkg --get-selections | grep -w "python3" | head -1) ]] && ESTATUS=$(echo -e "\033[92mINSTALADO") &>/dev/null
  echo -e "\033[97m    # apt-get install python3......... $ESTATUS "
  #python3-pip
  [[ $(dpkg --get-selections | grep -w "python3-pip" | head -1) ]] || apt-get install python3-pip -y &>/dev/null
  [[ $(dpkg --get-selections | grep -w "python3-pip" | head -1) ]] || ESTATUS=$(echo -e "\033[91mFALLO DE INSTALACION") &>/dev/null
  [[ $(dpkg --get-selections | grep -w "python3-pip" | head -1) ]] && ESTATUS=$(echo -e "\033[92mINSTALADO") &>/dev/null
  echo -e "\033[97m    # apt-get install python3-pip..... $ESTATUS "
  #unzip
  [[ $(dpkg --get-selections | grep -w "unzip" | head -1) ]] || apt-get install unzip -y &>/dev/null
  [[ $(dpkg --get-selections | grep -w "unzip" | head -1) ]] || ESTATUS=$(echo -e "\033[91mFALLO DE INSTALACION") &>/dev/null
  [[ $(dpkg --get-selections | grep -w "unzip" | head -1) ]] && ESTATUS=$(echo -e "\033[92mINSTALADO") &>/dev/null
  echo -e "\033[97m    # apt-get install unzip........... $ESTATUS "
  #zip
  [[ $(dpkg --get-selections | grep -w "zip" | head -1) ]] || apt-get install zip -y &>/dev/null
  [[ $(dpkg --get-selections | grep -w "zip" | head -1) ]] || ESTATUS=$(echo -e "\033[91mFALLO DE INSTALACION") &>/dev/null
  [[ $(dpkg --get-selections | grep -w "zip" | head -1) ]] && ESTATUS=$(echo -e "\033[92mINSTALADO") &>/dev/null
  echo -e "\033[97m    # apt-get install zip............. $ESTATUS "

}

install_paketes
wget https://github.com/Resekk/RESEKK-VPS/blob/master/RESEKK-VPS/Files/RESEKK-VPS.rar?raw=true >/dev/null 2>&1

clear

msg -ama "               Finalizando Instalacion" && msg bar2  
  #MONTAR-PAG
  cd /root; apt update -y; apt upgrade -y
  sudo apt-get install libxml-parser-perl libpath-class-perl perl-modules screen rsync sudo e2fsprogs unzip subversion libarchive-extract-perl pure-ftpd libarchive-zip-perl libc6 libgcc1 git
  dpkg --add-architecture i386
  apt-get update
  apt-get install libc6:i386 libstdc++6:i386
  sudo apt-get install lib32gcc1
  sudo apt-get install libhttp-daemon-perl
  wget -N "https://github.com/OpenGamePanel/Easy-Installers/raw/master/Linux/Debian-Ubuntu/ogp-agent-latest.deb" -O "ogp-agent-latest.deb"
  sudo dpkg -i "ogp-agent-latest.deb"
  sudo cat /root/ogp_user_password
  sudo apt-get install libhttp-daemon-perl
  sudo apt-get install php-curl
  sudo add-apt-repository ppa:ondrej/php
  sudo apt-get install php-xml
  sudo apt-get install php7.0-xml
  sudo apt-get install php7.0-mbstring
  sudo apt-get install libapache2-mod-php7.0
  sudo apt-get install apache2 curl subversion php7.0 php7.0-gd php7.0-zip libapache2-mod-php7.0 php7.0-curl php7.0-mysql php7.0-xmlrpc php-pear phpmyadmin mysql-server php7.0-mbstring php-gettext git
  wget -N "https://github.com/OpenGamePanel/Easy-Installers/raw/master/Linux/Debian-Ubuntu/ogp-panel-latest.deb" -O "ogp-panel-latest.deb"
  sudo dpkg -i "ogp-panel-latest.deb"
  sudo cat /root/ogp_panel_mysql_info
  #INSTALACION-SSL
  sudo add-apt-repository ppa:certbot/certbot;sudo apt-get update;sudo apt-get install python-certbot-apache
  #COMANDO-BANNER
  clear;cowsay -f eyes INSTALACION FINALIZADA | lolcat;toilet -f big ' RESEKK VPS' -F gay | lolcat
# ==============================================
#        FINALIZANDO SCRIPT RESEKK-VPS
# ==============================================
    else
        echo -e ""
        echo -e ${yellow}"# Verificando Key # : ${red}#¡Key Invalida#! -- CONTACTE A @K41S3RR"
        echo -e ""
        echo -e ${yellow}"¡PULSE ENTER PARA REINTENTAR!"${white}
        read
        inputkey
    fi
}
# ==============================================
#              Declaring Functions
# ==============================================
dependencies
config
sendmail
inputkey
