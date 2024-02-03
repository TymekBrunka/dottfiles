rm -rf ~/dottfiles/config/*

function copylisted {
	dirs=$(ls -d $1* | grep ".$4") #every folder in .config
	cdirs=$(cat $3)
	inters=""

	#get intersection
	for i in $dirs; do
		for j in $cdirs; do
			inters+=$(echo "$i/" | grep "$j") #if folder is in the list, add it
		done
		inters+=$'\n'
	done
	inters=$(echo "$inters" | grep ".")

	#converting to array
	SAVEIFS=$IFS 
	IFS=$'\n'
	inters=($inters)
	IFS=$SAVEIFS
	
	echo $'\n'
	echo ${inters[@]} | xargs -n 1 echo 
	#using xargs to copy folders to config directory
	echo ${inters[@]} | xargs -n 1 cp -r -t $2 
	echo $'\n'
}

copylisted ~/.config/ ~/dottfiles/.config ~/dottfiles/config-dirs ".config/"
copylisted /usr/share/themes/ ~/dottfiles/themes ~/dottfiles/themes-tcp "themes/"
copylisted /usr/share/icons/ ~/dottfiles/icons ~/dottfiles/icon-themes-tcp "icons/"

rm -rf ~/dottfiles/extras/*

extras=$(cat ~/dottfiles/extra)
echo $extras
# IFS=$'| ' read -r -a extras <<< "$extras"
#converting to array
SAVEIFS=$IFS 
IFS=$'\t'
extras=($extras)
IFS=$SAVEIFS

echo ${extras[@]}
for i in ${extras[@]}; do
	IFS=$';' read -r -a elements <<< "$i" # cutting linse into slicessss
	if [[ ${elements[1]::1} == "~" ]]; then
		elements[1]="/home/$(whoami)${elements[1]:1}" # this bs of ~/... isn't file or directory
	fi

	if [[ ${elements[2]: -1} == $'|' ]]; then
		elements[2]="${elements[2]::(${#elements[2]}-1)}" # cutting off separator
	fi
	echo "name: ${elements[0]}, from: ${elements[1]}, to: ~/dottfiles/extras/${elements[2]}"
	# echo "$(echo $i | awk '{print $2}') to $(echo $i | awk '{print $3}')"
	mkdir -p "/home/$(whoami)/dottfiles/extras/${elements[2]}"
	cp -r -p "${elements[1]}"* "/home/$(whoami)/dottfiles/extras/${elements[2]}"
done
