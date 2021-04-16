% Pretty TeX class
% @author Peter Waldert
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{prettytex/base}[2020/06/07 Pretty TeX base class]

% Base class
\LoadClass[
    12pt,
    a4paper,
    oneside
]{article}

% Encoding
\usepackage[utf8]{inputenc}
\usepackage[T1]{fontenc}

% Spacing
\usepackage[
    margin=2.1cm
]{geometry}
\usepackage{parskip}
\setlength{\parindent}{0em}
\setlength{\parskip}{0.5em}
\setlength{\headsep}{3em}

% Colors
\usepackage{xcolor}
\definecolor{themecolor}{HTML}{00A8FF}
\definecolor{themecolor2}{HTML}{659157}
\definecolor{themecolor3}{HTML}{E05263}
\definecolor{lightgreybg}{rgb}{0.97,0.97,0.97}
\definecolor{headrulecolor}{rgb}{0.8,0.8,0.8}

% Font
\usepackage{amsfonts}
%\usepackage{kpfonts}
\usepackage{lmodern}

% Figures
\usepackage{graphicx}
\usepackage{subcaption}
\usepackage{float}
\usepackage[singlelinecheck=false]{caption}
\usepackage{tikz}

% Lists
\usepackage{enumitem}

% Tables
\usepackage{tabularx}

% Hyper stuff
\usepackage{url}
\usepackage[
    colorlinks=true,
    urlcolor=themecolor,
    linkcolor=themecolor2,
    citecolor=themecolor3,
]{hyperref}

% Headings
\usepackage{titling}
\usepackage{titlesec}
\titlelabel{\color{themecolor}\thetitle\quad}

% Math
\usepackage{amsmath}
\usepackage{amstext}
\usepackage{amssymb}
\usepackage{amsthm}  % theorems, lemmas, etc.
\usepackage{bm}  % bold math
\usepackage{esvect}  % vectors
\usepackage{siunitx}
\sisetup{
    separate-uncertainty,
    locale=DE,
    per-mode=fraction,
    number-unit-product=\,\,\,
}

% Code
\usepackage{minted}
\setminted{
    breaklines=true,
    python3=true,
    baselinestretch=1,
    linenos=true
}
\setmintedinline{
    breaklines=true
}

% Citing, References
%\usepackage{cite}  % numeric citation
%\usepackage{pdfpages}
\usepackage[backend=biber]{biblatex}

% Macros, Commands helper
\usepackage{xparse}  % \NewDocumentCommand, etc.
\usepackage{lipsum}

% Include PDFs
\usepackage{pdfpages}

% Leftbar-Frame
\renewenvironment{leftbar}[1][\hsize]{%
    \def\FrameCommand
    {%
            {\color{themecolor}\vrule width 3pt}%
        \hspace{0pt}%must no space.
        \fboxsep=.8cm\colorbox{lightgreybg}%
    }%
    \MakeFramed{\hsize#1\advance\hsize-\width\FrameRestore}%
    }
    {\endMakeFramed}
