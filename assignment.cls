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
\RequirePackage{titlesec, varwidth}

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

\setcounter{section}{\assnum}

\newtcbtheorem[number within=section]{task}{Task}{%
    enhanced, frame empty, interior empty, colframe=green!50!white,%
    coltitle=green,fonttitle=\bfseries,colbacktitle=green!20,%
    borderline={0.5mm}{0mm}{green!20},%
    attach boxed title to top center={yshift=-2.5mm},%
    varwidth boxed title%
}{task}


\fancyhf{}
\fancyhead[LE,RO]{\name\\\matrnum}
\fancyhead[RE,LO]{\class\hspace{0.2cm}\term\\\classid}
\fancyhead[C]{\bfseries \assname \numsymb \assnum\\\duedate}
\fancyfoot[LE,RO]{\thepage}
\renewcommand{\headrulewidth}{.25pt}
\renewcommand{\footrulewidth}{.25pt}
\pagestyle{fancy}
\usepackage{esvect}

\allowdisplaybreaks
\titleformat{\section}[block]{\Large\bfseries\filcenter}{\assname\hspace{0.2cm}\numsymb\hspace{0.2cm}\assnum}{1em}{}

\setlength{\headheight}{25pt}

\newtheorem{ex}{Task}[section]