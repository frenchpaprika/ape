#!/bin/zsh

#SEASON = $1
#WEAPON = $2
#LEGEND = $3
#MAP    = $4

#seperate options for legend, season, weapon and map

#don't shift lines or rename the file, there are dependencies on both
START=8
YEAR=2022

TEMPFILE="temp-"`date +%m%d%Y%H%M%S`".txt"
OUTFILE="results-"`date +%m%d%Y%H%M%S`".txt"
APECLONE="clone-"`date +%m%d%Y%H%M%S`".sh"
APEPATH="ape.sh"

if [ "$1" = "-h" ]
then
	echo "Usage:  --help, -h 				Display this help message"
	echo "	--date <month> <year> 			Set the season start date (default at 08/2022)"
	echo "	--season <filename>			Bruteforce the season name with a wordlist"
	echo "	<season> <weapon> <legend> <map-name> 	Run script with attributes"
	
elif [ "$1" = "--help" ]
then
	echo "Usage:  --help, -h 				Display this help message"
	echo "	--date <month> <year> 			Set the season start date (default at 08/2022)"
	echo "	--season <filename>			Bruteforce the season name with a wordlist"
	echo "	<season> <weapon> <legend> <map-name> 	Run script with attributes"
elif [ "$1" = "--season" ]
then
	if [[ -z "$2" ]]
	then
		echo "E: invalid number of arguments"
	elif [[ -z "$3" ]]
	then
		PRINT="https://media.contentapi.ea.com/content/dam/apex-legends/common"
		PREFIX="https://media.contentapi.ea.com/content/dam/apex-legends/common/"
		gobuster -q -u $PREFIX -w $2 -o $TEMPFILE


		while read -r line; do
			list=($(echo $line | tr "(" "\n"))#string replace from '(' to '\n' 
			x=0
			for i in "${list[@]}"  
			do  
				if [ "$x" -eq 0 ]
				then
					OUTSTRING+=$PRINT$i 
					OUTSTRING+="\n"
					x+=1
				fi
			done  
		done < $TEMPFILE


		echo $OUTSTRING > $OUTFILE
		rm $TEMPFILE
		echo "\e[1m[WEB APE] \e[0mview output at "$OUTFILE
	else
		echo "E: invalid number of arguments"

	fi
elif [ "$1" = "--date" ]
then
	if [[ -z "$2" ]]
	then
		echo "E: invalid number of arguments"
	elif [[ -z "$3" ]]
	then
		echo "E: invalid number of arguments"
	elif [[ -z "$4" ]]
	then
		sed -i "11s/.*/START=$2/" $APEPATH
		sed -i "12s/.*/YEAR=$3/" $APEPATH
	else
		echo "E: invalid number of arguments"
	fi


else
	if [[ -z "$4" ]]
	then
		echo "E: invalid number of arguments"
	elif [[ -z "$5" ]]
	then
		
		#set url prefix here
		PREFIX="https://media.contentapi.ea.com/content/dam/apex-legends/"
		PRINT="https://media.contentapi.ea.com/content/dam/apex-legends"


		#convert map-name to mapname
		array=($(echo $4 | tr "-" "\n"))#string replace from '-' to '\n' 
		for i in "${array[@]}"  
		do  
			MAPMERGED+=$i 
		done  

		#for path based files: read wordlist file
		#for each line replace KEYWORD with program argument



		#path based files
		out+="common/"$1"/apex-"$1"-season-logo.png\ncommon/"$1"/apex-embed-"$1"-season-ranked-mode.png\n"
		out+="common/"$1"/apex-section-bg-"$1"-season-keyart-xl.jpg.adapt.1920w.jpg\n"
		out+="common/"$1"/apex-embed-"$1"-season-battlepass.png\n"
		out+="common/"$1"/apex-embed-"$1"-season-pack.png\n"
		out+="common/"$1"/apex-section-bg-"$1"-season-"$2"-xl.jpg.adapt.320w.jpg\n"

		#date based files
		i=1
		while [ $i -le $START ]
		do
			out+="images/"$YEAR"/"$i"/apex-hero-medium-"$1"-season-"$3"-7x2-xl.jpg.adapt.crop7x2.1920w.jpg\n"
			out+="images/"$YEAR"/"$i"/apex-hero-medium-"$3"-7x2-xl.jpg.adapt.crop7x2.1920w.jpg\n"
			out+="images/"$YEAR"/"$i"/apex-hero-medium-"$MAPMERGED"-map-bg-7x2-xl.jpg.adapt.crop7x2.1920w.jpg\n"
			out+="images/"$YEAR"/"$i"/apex-hero-medium-"$4"-map-bg-7x2-xl.jpg.adapt.crop7x2.1920w.jpg\n"
			out+="images/"$YEAR"/"$i"/apex-hero-medium-"$1"-season-"$2"-7x2-xl.jpg.adapt.crop7x2.1920w.jpg\n"
			((i++))
		done


		echo $out > wordlist-randomstring9273017249.txt

		echo "\e[1m[WEB APE] \e[0mwordlist created"

		cat wordlist-randomstring9273017249.txt

		echo "\e[1m[WEB APE] \e[0mstarting gobuster"

		gobuster -q -u $PREFIX -w wordlist-randomstring9273017249.txt -o $TEMPFILE

		rm wordlist-randomstring9273017249.txt

		echo "\n\e[1m[WEB APE] \e[0mcompleted"




		#read file
		#split each line
		#for each first part: add to string
		#ya



		while read -r line; do
			list=($(echo $line | tr "(" "\n"))#string replace from '(' to '\n' 
			x=0
			for i in "${list[@]}"  
			do  
				if [ "$x" -eq 0 ]
				then
					OUTSTRING+=$PRINT$i 
					OUTSTRING+="\n"
					x+=1
				fi
			done  
		done < $TEMPFILE


		echo $OUTSTRING > $OUTFILE
		rm $TEMPFILE
		echo "\e[1m[WEB APE] \e[0mview output at "$OUTFILE
	fi
fi