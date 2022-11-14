#!/usr/bin/env bash
# The Unix assignment is almost over: time to create a submission.
# You could create a zip folder by hand. Just place the `.sh` files in there... But where's the fun in that?
# Let's create a script that does this for us.
# This script should take an output name as the first parameter.
# If called in a directory, it should recursively find all the `.sh` files and add them to a zip folder.
# The zip folder should only contain `.sh` files and no folders.

cd ../ 
currentPath="."
paths=""

method() 
{
files=$(ls)
for v in $files
do
    if [[ -d $v ]]; then
        cd $v
        local temp=$currentPath
        currentPath="$currentPath/$v"
        method
        currentPath=$temp
        cd ../
    else
        fileExtension=$(echo $v | cut -d'.' -f2)
        if [[ $fileExtension == "sh" ]]; then
            paths+=" ../$currentPath/$v"
        fi
    fi
done
}

method
cd ./script_creation
zip -rj  $1 $paths