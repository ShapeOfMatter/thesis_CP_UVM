#!/bin/bash

files_to_move=$(find .latex_cache -maxdepth 1 -type f ! -name '.gitignore')

rm $files_to_move

cat .latex_cache_patterns | while read pattern || [[ -n $pattern ]];
do
    if stat -t $pattern >/dev/null 2>&1
    then
        rm $pattern
    fi
done

rm -rf _minted-dissertation/

exit 0

