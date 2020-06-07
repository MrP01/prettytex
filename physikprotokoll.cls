\LoadClass[12pt,a4paper,oneside]{scrartcl}
\usepackage[utf8]{inputenc}
\usepackage[ngerman]{babel}
\usepackage{graphicx}
\usepackage{subcaption}
\usepackage[T1]{fontenc}
\usepackage{amsmath}
\usepackage{amsfonts}
\usepackage{amssymb}
\usepackage{lmodern}
\usepackage[left=2cm,right=2cm,top=2cm,bottom=1.5cm, includeheadfoot]{geometry}
\usepackage[automark]{scrpage2} 
\usepackage{lastpage}
\usepackage{url}
\usepackage{siunitx}
\usepackage{cite}
\usepackage[singlelinecheck=false]{caption}
\usepackage{float}
\usepackage[
	colorlinks=true,
	urlcolor=blue,
	linkcolor=black
]{hyperref}
\usepackage{siunitx}
\sisetup{separate-uncertainty,  locale = DE ,  per-mode = fraction}
\usepackage{enumitem}
\usepackage{gensymb}
% \si[hoptionsi]{huniti}
% \SI[hoptionsi]{hnumberi}[hpre-uniti]{huniti}

\renewcaptionname{ngerman}{\figurename}{Abb.}
\renewcaptionname{ngerman}{\tablename}{Tab.}

\setlength{\parindent}{0em}
\setlength{\parskip}{0.5em}
\setlength{\headsep}{3em}

\pagestyle{scrheadings}
\clearscrheadfoot
\setheadsepline{0.4pt}
\cfoot[\pagemark \text{ / } \pageref{LastPage}]{\pagemark\  \text{ / } \pageref{LastPage}}

\usepackage{titling}
\ihead{\theauthor}
\chead{\thetitle}
\ohead{\thedate}
