#!/usr/bin/bash
# Copyright ©2020 by Tech-X. All Right Reserved

# Website : https://www.mrtechx.com

# ColorsNames

red='\033[1;31m'
blue='\033[1;34m'
green='\033[1;92m'
orange='\033[38;5;214m'
dg='\033[38;5;29m'
yellow='\033[1;93m'
reset='\033[0m'

# Banner for Hide & Seek tool

banner () {
	clear

printf "${orange}         ██╗  ██╗    ${reset}███╗   ██╗    ${dg}███████╗\n"
printf "${orange}         ██║  ██║    ${reset}████╗  ██║    ${dg}██╔════╝\n"
printf "${orange}         ███████║    ${reset}██╔██╗ ██║    ${dg}███████╗\n"
printf "${orange}         ██╔══██║    ${reset}██║╚██╗██║    ${dg}╚════██║\n"
printf "${orange}         ██║  ██║    ${reset}██║ ╚████║    ${dg}███████║\n"
printf "${orange}         ╚═╝  ╚═╝    ${reset}╚═╝  ╚═══╝    ${dg}╚══════╝\n"
printf "${yellow}  	  	  version 1.0		\n"
printf "${green}              Based on Steganography    \n"

printf "${reset}"

}

# Checking Hide and Seek directory path and Create Hns Directory fucntion

checkDir () {

#HNS DIRECTORY PATH

	if [ -d $PREFIX/share/hns ]; then
		echo ""
		printf "${green}HNS directory ok${reset}"
		echo ""
	else
		echo ""
		printf "${red}[*]${blue}Creating HNS directory${reset}\n"
		mkdir $PREFIX/share/hns
		echo""
		printf "${green}HNS directory created${reset}\n"
		echo ""
	fi


}

# Check and install required package for hns tool

checkRequirement () {
	if [ -e $PREFIX/bin/zip ]; then
		echo ""
		printf "${green}Zip is installed${reset}\n"
		echo""
	else
		echo ""
		printf "${red}[*]${blue}Installing zip${reset}\n"
		echo ""
		apt install -y zip
		echo ""
	fi


}

# Downloading hns.sh script to HNDIR

DownlHns () {
	if [ -f $PREFIX/share/hns/hns.sh ]; then
		echo ""
		printf "${green}HHNS file is Ok${reset}\n"
		echo ""
	else
		echo ""
		printf "${red}[*]${blue}Downloading Hns file${reset}\n"
		cd $PREFIX/share/hns && curl -LO https://raw.githubusercontent.com/1Tech-X/HideNseek/master/hns/hns.sh
		echo ""
		printf "${green}Hns file is downloaded Successfully${reset}\n"
		echo ""
	fi


}
hnsStart () {
	if [ -e $PREFIX/bin/hns ]; then
		echo ""
		printf "${green}Hns tool is installed${reset}\n"
		echo ""
	else
		echo ""
		printf "${red}[*]${blue}Installing hns toolstartup${reset}\n"
		cd $PREFIX/bin && curl -LO https://raw.githubusercontent.com/1Tech-X/HideNseek/master/hns/hns && chmod +x hns
		echo ""
		printf "${green}Installed successfully${reset}\n"
		echo ""
		printf "${yellow}Now you can start Hide N seek tool by typing ${red}hns${reset}\n"
	fi


}

# For kali linux users

checkPack () {
	if [ -e /bin/zip ]; then
		echo ""
		printf "${green}zip is installed${reset}\n"
		echo ""
	else
		printf "${red}[*]${blue}Installing zip$reset}\n"
		sudo apt install -y zip || { 
			printf "${red}"
		        echo ""
			echo "ERROR:: Check your internet connection"
			printf "${reset}"
		}
	fi

}

createDir () {
	if [ -d /etc/hns ]; then
		echo ""
		printf "${green}Hns Directory is ok${reset}\n"
		echo ""
	else
		echo ""
		printf "${red}[*]${blue}Creating Hns Directory${reset}\n"
		sudo mkdir /etc/hns
		echo ""
		printf "${green}Hns directory created${reset}\n"
		echo ""
	fi



}
downLHns () {
	if [ -f /etc/hns/hns.sh ]; then
		echo ""
		printf "${green}Hns file is ok${reset}\n"
		echo ""
	else
		echo ""
		printf "${red}[*]${blue}Downloading hns file${reset}\n"
		cd /etc/hns && sudo curl -LO https://raw.githubusercontent.com/1Tech-X/HideNseek/master/hnsKali/hns.sh && sudo chmod +x hns.sh
		echo ""
		printf "${green}Hns file downloaded successfully${reset}\n"
		echo ""
	fi

}
startHnsKali () {
	if [ -e /bin/hns ]; then
		echo ""
		printf "${green}Hns tool is installed${reset}\n"
		echo ""
	else
		echo ""
		printf "${red}[*]${blue}Installing Hns tool${reset}\n"
		cd /bin && sudo curl -LO https://raw.githubusercontent.com/1Tech-X/HideNseek/master/hnsKali/hns && sudo chmod +x hns
		echo ""
		printf "${green}Hns tool is installed successfully${reset}\n"
		echo ""
		printf "${yellow}Now you can start Hide N seek tool by typing ${red}hns${reset}\n"
	fi


}

# Checking operating system and install HNS tool according to os.

detectOs () {
	unamestr=`uname -o`
	if [[ "$unamestr" == 'Android' ]]; then
		banner
		checkRequirement
		checkDir
	        DownlHns
		hnsStart
	elif [[ "$unamestr" == 'GNU/Linux' ]]; then
		banner
		checkPack
		createDir
	        downLHns
		startHnsKali
	elif [[ "$unamestr" == 'Linux' ]]; then
		banner
		checkRequirement
		checkDir
		downlHns
		hnsStart
	else
		echo ""
		printf "${red}Unkown Os${reset}\n"
		echob ""
	fi
		



}
detectOs
