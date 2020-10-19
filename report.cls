\LoadClass{base}

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
\fancyhead[R]{\@author \enspace \textcolor{themecolor}{\textbullet}}
\fancyhead[L]{\leftmark}
\fancyfoot[C]{\thepage\  \text{ / } \pageref{LastPage}}
\renewcommand\headrule{\color{headrulecolor}\hrulefill}
