#!/bin/bash

# from https://tex.stackexchange.com/a/458352

BASE="${1:-dissertation}"  # BASE will be assigned 'dissertation' if arg not set or null.

files_to_move=$(find .latex_cache -maxdepth 1 -type f ! -name '.gitignore')

mv -t . $files_to_move

pdflatex -shell-escape $BASE.tex
if [ $? -ne 0 ]; then
    echo "Compilation error. Check log."
    exit 1
fi


bibtex $BASE
pdflatex -shell-escape $BASE.tex
pdflatex -shell-escape $BASE.tex
pdflatex -shell-escape $BASE.tex

__dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
bash ${__dir}/cache.bash

exit 0

