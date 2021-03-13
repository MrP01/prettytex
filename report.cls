\LoadClass{../prettytex/base}

% Adjust geometry to include head and foot
\newgeometry{
    margin=2.1cm,
    includeheadfoot
}

% Headings
\usepackage{lastpage}
\usepackage{fancyhdr}
\pagestyle{fancy}
\fancyhf{}
\fancyhead[R]{\@author \enspace \textcolor{themecolor3}{\textbullet}}
\fancyhead[L]{\leftmark}
\fancyfoot[C]{\thepage\  \text{ / } \pageref{LastPage}}
\renewcommand\headrule{\color{headrulecolor}\hrulefill}

% Language
\usepackage[ngerman]{babel}
\addto\extrasngerman{\def\figureautorefname{Abbildung}}
\addto\extrasngerman{\def\tableautorefname{Tabelle}}
\addto\extrasngerman{\def\equationautorefname{Gleichung}}
\addto\extrasngerman{\def\sectionautorefname{Abschnitt}}
\addto\extrasngerman{\def\subsectionautorefname{Unterabschnitt}}
\addto\extrasngerman{\def\subsubsectionautorefname{Unterunterabschnitt}}

