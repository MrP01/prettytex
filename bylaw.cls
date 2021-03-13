\LoadClass[a4paper,12pt]{article}
\usepackage{times}
\usepackage{t1enc}
\usepackage[ngerman]{babel}
\usepackage[T1]{fontenc}
\usepackage{enumerate}
\usepackage{vmargin}
\setpapersize{A4}
\usepackage[utf8]{inputenc}
\usepackage{xspace}
\usepackage[
    colorlinks=true,
    urlcolor=themecolor,
    linkcolor=black
]{hyperref}

\setmarginsrb{1.75cm}{1.75cm}{1.75cm}{1.75cm}{0pt}{0pt}{\baselineskip}{2.0\baselineskip}
\parindent=1em
\parskip=0pt
\setlength{\marginparwidth}{4.0cm}
\setlength{\marginparsep}{1.25em}

\addto\extrasngerman{\def\sectionautorefname{§}}
\addto\extrasngerman{\def\itemautorefname{Abs.}}

\hyphenation{Ver-einsG be-stim-mten dis-zi-pli-nä-ren}

\makeatletter
\renewcommand{\@seccntformat}[1]{§\,\csname the#1\endcsname:\space}
\renewcommand{\labelenumi}{(\theenumi)}
\renewcommand{\p@enumii}{}
\makeatother

\newcommand{\comment}[1]{{\newline \bf /*Kommentar:} #1 {\bf Ende Kommentar*/}}
% uncomment the following line to get comments:
\def\comment#1{}

\newenvironment{Itemize}{%
    \begin{itemize}
        \setlength{\parsep}{\parskip}\setlength{\itemsep}{0pt}%
        }{
    \end{itemize}}

\newcommand{\SignatureAndDate}[2][2.5in]{%
    \noindent%
    \begin{tabular}{@{}p{#1}@{}}
        \\ \hline \\[-.75\normalbaselineskip]
        #2
    \end{tabular} \hspace{1in}
    \begin{tabular}{@{}p{#1}@{}}
        \\ \hline \\[-.75\normalbaselineskip]
        Ort, Datum
    \end{tabular}
}
