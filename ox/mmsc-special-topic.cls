\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{prettytex/ox/mmsc-special-topic}[MMSC Special Topic Template]

\LoadClass[12pt, a4paper]{article}
\PassOptionsToPackage{sharp}{prettytex/boxes}
\usepackage{prettytex/base}

\setlength{\topmargin}{0.0in}
\setlength{\oddsidemargin}{0.33in}
\setlength{\textheight}{9.0in}
\setlength{\textwidth}{6.0in}
\renewcommand{\baselinestretch}{1.25}

\usepackage{prettytex/math}
\usepackage[nameinlink]{cleveref}
\usepackage[cleveref]{prettytex/math-theorems}
\usepackage{prettytex/gfx}
\usepackage{prettytex/code}
\usepackage{prettytex/pseudo}
\usepackage{prettytex/thesis}

\newcommand{\mmscSpecialHeader}[1][]{
  \begin{center}
    \vspace*{-2.5cm}
    \Large \topictitle \\
    \vspace{.3cm}

    \normalsize An \ifthenelse{\equal{#1}{casestudy}}{MMSC Case Study}{MMSC Special Topic}
    on \textcolor{themecolor3}{\textsc{\course}}\\
    \normalsize Candidate Number: \textcolor{themecolor3}{\candidatenumber}
    \vspace{.3cm}
  \end{center}
}
