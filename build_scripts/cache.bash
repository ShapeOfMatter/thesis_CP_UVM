#!/bin/bash

cat .latex_cache_patterns | while read pattern || [[ -n $pattern ]];
do
    if stat -t $pattern >/dev/null 2>&1
    then
        mv -f  -t .latex_cache $pattern
    fi
done

exit 0

