#!/bin/bash
pandoc --standalone --smart \
	--biblatex --bibliography=bibliography.bib \
	--template template-uchile.tex \
	--from  markdown+raw_tex md/*.md metadata.yaml \
	--to latex \
	-o output.tex 
pdflatex output.tex && biber output && biber output && pdflatex output.tex && biber output && pdflatex output.tex
