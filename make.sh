#!/bin/bash
pandoc --standalone --smart \
	--biblatex --bibliography=bibliography.bib \
	--template $1 \
	--from  markdown+raw_tex markdown/*.md metadata.yaml \
	--to latex \
	-o output.tex 
#pdflatex output.tex && biber output && biber output && pdflatex output.tex && biber output && pdflatex output.tex
