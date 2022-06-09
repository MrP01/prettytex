\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{prettytex/assignment}[2000/03/25 Common Latex Class for my assignments]

\newcommand{\lang}{en}
\DeclareOption{de}{\renewcommand{\lang}{de}}
\ProcessOptions\relax

\LoadClass{article}


\RequirePackage[singlelinecheck,\lang]{prettytex/base}
\RequirePackage{prettytex/math}
\RequirePackage{prettytex/gfx}
\RequirePackage{prettytex/gfx-circuits}
\RequirePackage{prettytex/gfx-components}
\RequirePackage{prettytex/boxes}
\RequirePackage{prettytex/math-theorems}
\RequirePackage{prettytex/math-sigtrans}
\RequirePackage{tikz-cd}
\RequirePackage{titlesec, varwidth,lastpage}

\newcommand{\name}{}
\newcommand{\matrnum}{}
\newcommand{\class}{}
\newcommand{\classid}{}
\newcommand{\term}{}
\newcommand{\assname}{Assignment}
\newcommand{\assnum}{1}
\newcommand{\duedate}{\today}
\newcommand{\numsymb}{\textnumero}
\newcommand{\taskname}{Task}
\newcommand{\taskcolor}{orange}

\fancyhf{}
\fancyhead[LE,RO]{\name\\\matrnum}
\fancyhead[RE,LO]{\class\hspace{0.2cm}\term\\\classid}
\fancyhead[C]{\bfseries \assname\hspace{0.1cm}\numsymb \assnum\\\duedate}
\fancyfoot[LE,RO]{\thepage / \pageref{LastPage}}
\renewcommand{\headrulewidth}{.25pt}
\renewcommand{\footrulewidth}{.25pt}
\pagestyle{fancy}
\usepackage{esvect}

\allowdisplaybreaks
\titleformat{\section}[block]{\Large\bfseries\filcenter}{\assname\hspace{0.2cm}\numsymb\hspace{0.2cm}\assnum}{1em}{}

\setlength{\headheight}{25pt}

\newtheorem{ex}{Task}[section]
\setcounter{section}{\assnum}
