#!/bin/bash
mapfile -t directorrys < <( ls -d */ )
pwd | read -p workdir

for (( i=0; i<${#directorrys[@]}; i++ ))
do
	cd ${directorrys[i]}
	echo ${directorrys[i]}
       	if [ -d ".git" ]; then
		git pull
	else
		echo "is not a repository"
	fi
	cd ..
done
