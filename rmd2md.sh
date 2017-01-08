#!/bin/bash
#RMDFILE=appendix
# transforms Rmd to md
Rscript -e \ 
"require(knitr); require(markdown); knit('$RMDFILE.Rmd', '$RMDFILE.md');"
# converts md to tex for the appendix
pandoc -f markdown -t latex -o appendix.tex -i $RMDFILE.md 
