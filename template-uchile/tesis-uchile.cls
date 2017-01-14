\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{tesis-uchile}[2016/1/11 Custom class for a Universidad de Chile's thesis]

\LoadClass[letterpaper,openany,oneside]{book}
\RequirePackage[utf8]{inputenc}
\RequirePackage[spanish]{babel}
\RequirePackage{longtable}
\RequirePackage[style=spanish]{csquotes}
\RequirePackage[style=apa,sortcites=true,sorting=nyt,backend=biber]{biblatex}
\RequirePackage{fancyhdr}
% \RequirePackage{fancyvrb}
\RequirePackage{helvet}
\RequirePackage{color}
\RequirePackage{booktabs}
\RequirePackage{amssymb,amsmath}
\RequirePackage{listings}
\RequirePackage{framed}
\RequirePackage{tocloft}
\RequirePackage{wrapfig}
\RequirePackage[letterpaper, top=4cm, bottom=2.5cm, left=4cm, right=2.5cm]{geometry}
\RequirePackage{setspace}
\RequirePackage[pdftex]{graphicx}

\DeclareLanguageMapping{spanish}{spanish-apa}

%\makeatletter
\renewcommand\cftchappresnum{Capítulo}
%\makeatother

%\makeatletter
\g@addto@macro\appendix{%
  \addtocontents{toc}{%
    \protect\renewcommand{\protect\cftchappresnum}{\appendixname\space}%
  }%
}
%\makeatother

% Settings 
\doublespacing

% New commands
\newcommand{\HRule}{\rule{\linewidth}{0.5mm}}

\setcounter{secnumdepth}{2}

\renewcommand{\familydefault}{\sfdefault}
\pagestyle{fancyplain}
\fancyhf{}
\fancyfoot[R]{\thepage}
\rfoot{\thepage}
\renewcommand{\headrulewidth}{0pt}

\renewcommand\cftchapaftersnumb{\newline}
\renewcommand\cftchapleader{\cftdotfill{4}}
\setlength{\cftchapnumwidth}{0em}
\setlength{\footskip}{1cm}

\addto\captionsspanish{\renewcommand*\contentsname{TABLA DE CONTENIDOS}}
\renewcommand\cftchapfont{\scshape}

\newcommand{\titulo}[1]{\def\@titulo{#1}}
\newcommand{\autor}[1]{\def\@autor{#1}}
\newcommand{\profesor}[1]{\def\@profesor{#1}}
\newcommand{\extracto}[1]{\def\@extracto{#1}}
