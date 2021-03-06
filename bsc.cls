\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{bsc}[2015/07/22 Style for my bachelor thesis]

\newif\if@print
\DeclareOption{print}{\@printtrue}
\DeclareOption{digital}{\@printfalse}

\ProcessOptions\relax


% General
\LoadClassWithOptions{scrreprt}

% Language
\usepackage{polyglossia} % Vgl. http://tex.stackexchange.com/questions/135185
\setmainlanguage{english}
\setotherlanguage[spelling=old,babelshorthands=true]{german}
% \usepackage[ngerman,english]{babel} % all languages being used, with main language last in list

% Geometry
\usepackage[onehalfspacing]{setspace}
\usepackage[a4paper,width=150mm,top=30mm,bottom=30mm, bindingoffset=1cm]{geometry}

% Links
\usepackage{color,xcolor}
\usepackage{hyperref}
\if@print % switch link coloring off for printing
	\hypersetup{colorlinks=false}
\else
	\hypersetup{colorlinks=true}
\fi
\definecolor{uhd}{RGB}{196,19,47} % the red UHD brand color
\hypersetup{
	allcolors=uhd
}
\AtBeginDocument{
	\hypersetup{ % set pdf metadata
	    pdfauthor={\@author},
		pdftitle={\@title}
	}
}

% Fonts
\usepackage{fontspec,xunicode}
\setmainfont{Palatino}
\setsansfont{Optima}
\setmonofont[Scale=MatchLowercase]{Menlo}

% Units
\usepackage[separate-uncertainty]{siunitx}

% Tables
\usepackage{array} % for math mode in tables
\usepackage{booktabs} % for hline rules

% Quotations
\usepackage{epigraph}
\setlength{\epigraphwidth}{.8\textwidth}
\setlength{\epigraphrule}{0pt}

% Page Layout
\usepackage{fancyhdr}
\pagestyle{fancy}
\fancyhf{}
\if@print
\fancyhead[LE]{
	\textit{\nouppercase{\leftmark}}
}
\fancyhead[RO]{
	\textit{\nouppercase{\rightmark}}
}
\fancyfoot[RO,LE]{
	\thepage
}
\else
\fancyhead[L]{
	\textit{\nouppercase{\leftmark}}
}
\fancyfoot[C]{
	\thepage
}
\fi
\renewcommand{\headrulewidth}{0.2pt}
\renewcommand{\footrulewidth}{0pt}
\fancypagestyle{plain}{%
	\fancyhf{}
	\if@print
	\fancyfoot[RO,LE]{
		\thepage
	}
	\else
	\fancyfoot[C]{
		\thepage
	}
	\fi
	\renewcommand{\headrulewidth}{0pt}
	\renewcommand{\footrulewidth}{0pt}
}


% Bibliography
\usepackage[style=numeric-comp,backend=bibtex,maxnames=10,maxcitenames=2,giveninits=true]{biblatex}

%\nocite{*} % print all references, even those not used

% Appendix
\usepackage[toc,page]{appendix}


\endinput
