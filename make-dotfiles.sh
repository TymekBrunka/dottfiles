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

copylisted ~/.config/ ~/dottfiles/config ~/dottfiles/config-dirs ".config/"
copylisted /usr/share/themes/ ~/dottfiles/themes ~/dottfiles/themes-tcp "themes/"
copylisted /usr/share/icons/ ~/dottfiles/icon-themes ~/dottfiles/icon-themes-tcp "icons/"
