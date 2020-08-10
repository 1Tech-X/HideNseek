#!/bin/bash
# Copyright © 2020 by Tech-x. All Right Reserved

# Website: https://www.mrtechx.com

# colorsName

red='\033[1;31m'
yellow='\033[1;33m'
blue='\033[1;34m'
green='\033[1;92m'
reset='\033[0m'

# media1 variable store the value of file which user want to show

media1=""

# media2 variable store the value file which user want to hide inside the media1

media2=""



# Function for taking value media1 given by user (photo,video,audio,pdf any type of file)

addFile () {

	printf "${blue}Enter the name of first file  which you want show\n${yellow}[${green}Photo , Video , Audio , Mp3 , Mp4 , Pdf${yellow}]${reset}\n"
	echo ""
	echo "(e.g: photoName.jpg/videoName.mp4)"
	echo ""
	printf "${red}[*]${blue}Enter File Name${red}:${green}> ${reset}"
	read media1
	echo ""
	echo ""
	printf "${green}[+]$media1 is  Added${reset}\n"




}

# function for ziping the media2 file

zipFile () {
	choice=""
	echo ""

	printf "${blue}Enter the name of second file  which you want hide inside the first file\n${yellow}[${green}Photo , Video , Audio , Mp3 , Mp4 , Pdf${yellow}]${reset}\n"
	echo ""
	echo "(eg: photoName.jpg/videoName.mp4)"
	echo ""
	printf "${red}[*]${blue}Enter File Name${red}:${green}> ${reset}"
	read media2
	echo ""
	printf "${green}[+]$media2 is  Added\n"
	sleep 2
	clear
	printf "${yellow}Choose Hidding  method:${reset}\n"
	echo ""
	printf "${green}[1]${blue}Normal Hidding${reset}\n"
	echo ""
	printf "${green}[2]${blue}Password Protected Hidding${reset}\n"
	echo ""
	printf "${blue}Enter${red}:~ ${reset}"
	read choice

	if [ "${choice}" = "1" ]; then
		printf "${blue}[*]Creating zip file for${green} $media2${reset}\n"
		sleep 1
		zip hns.zip $media2
		echo ""
		printf "${green}Done:${reset}"
	elif [ "${choice}" = "2" ]; then
		zip -e hns.zip $media2
		printf "${blue}[*]Creating password protected zip file for second media${reset}\n"
		sleep 1
		printf "${green}Done:${reset}"

	else
		printf "${red}[!]Wrong Input${reset}\n"
		exit 1
	
	fi



}

hideFile () {
	clear
	ls
	echo ""
	printf "${green}Enter new Name for creating new file with same extension which you used during adding first file${reset}\n"
	echo ""
	echo ""
	echo "(eg: Anyname.jpg/jpeg/png/mp3/mp4)"
	echo ""
	printf "${blue}Enter${red}:~ ${reset}"
	read newfile
	clear
	printf "${red}[*]${blue}concatenating ${green}$media2${blue} to ${green}$media1${reset}\n"
	sleep 1
	cat $media1 hns.zip >$newfile
	rm hns.zip
	echo ""
	printf "${green}[+]${yellow}$newfile ${red}generated successfully${reset}\n"
	echo ""
	echo ""
	printf "${yellow}Use Rar application or unzip package of linux/termux to extract the ${green}$newfile${reset}\n"
	echo ""
	printf "${red}THANKS AND SHARE THIS TOOL\n"
	echo ""
	printf "${green}CREATER Tech-X${reset}\n"


}

insertText () {
	choice=""
	clear
	printf "${blue}Enter Your message${green}\n"
	read msg
	touch hns.txt
	echo "$msg" > hns.txt
	echo ""
	printf "${green}Text file created${reset}\n"

# creating hns text file to hns zip file

        clear
        printf "${yellow}Choose Hidding method:\n"
	echo ""
	printf "${green}[1]${blue}Normal Hidding\n"
	echo ""
	printf "${green}[2]${blue}Password Protected Hidding\n"
	echo ""
	printf "${blue}Enter${red}:~ ${reset}"
	read choice

	if [ "${choice}" = "1" ]; then
		zip hns.zip hns.txt
	elif [ "${choice}" = "2" ]; then
		zip -e hns.zip hns.txt
	else 
		printf "${red}Wrong Input${reset}\n"
		exit 1
	fi


}

# Function for hidding hns zip file to media 1

hideText () {
	clear
	ls
	echo ""
	printf "${green}Enter new Name for creating a new file with same extension which you used during adding first file${reset}\n"
        echo ""
	echo "(eg: Anyname.jpg/jpeg/png/mp4/mp3/pdf)"
	echo ""
	printf "${blue}Enter${red}:~ ${reset}"
	read newName
	cat $media1 hns.zip >$newName
	rm hns.zip
	rm hns.txt
	sleep 1
	echo ""
	printf "${green}[+]${yellow}$newName ${red}is created successfully${reset}\n"
	echo ""
	printf "${yellow}Use Rar application or unzip package of linux/termux to extract ${green}$newName${reset}\n"
	echo ""
	printf "${red}THANKS AND SHARE THIS TOOL\n"
	echo ""
	printf "${green}CREATER Tech-X${reset}\n"

}

# Main Function of Hide and Seek tool
hns () {
	ch=""
	clear
	printf "${yellow}Select Stegano type:\n"
	echo ""
	printf "${red}[1]${green}Media inside text\n"
	echo ""
	printf "${red}[2]${green}Media inside another media${reset}\n"
	echo ""
	printf "${blue}Enter${red}:~ ${reset}"
	read ch
	if [ "${ch}" = "1" ]; then
		clear
		ls
		echo ""
		addFile
		sleep 2
		insertText
		hideText
	elif [ "${ch}" = "2" ]; then
		clear
		ls
		echo ""
		addFile
		echo ""
		ls
		zipFile
		hideFile
	else
		printf "${red}Wrong Input${reset}\n"
	
	fi




}
hns
