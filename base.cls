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
	margin=2.1cm,
	includeheadfoot
]{geometry}
\usepackage{parskip}
\setlength{\parindent}{0em}
\setlength{\parskip}{0.5em}
\setlength{\headsep}{3em}

% Font
\usepackage{amsfonts}
\usepackage{kpfonts}

% Figures
\usepackage{graphicx}
\usepackage{subcaption}
\usepackage{float}
\usepackage[singlelinecheck=false]{caption}

% Lists
\usepackage{enumitem}

% Tables
\usepackage{tabularx}

% Hyper stuff
\usepackage{url}
\usepackage[
	colorlinks=true,
	urlcolor=blue,
	linkcolor=black
]{hyperref}

% Headings
\usepackage{titling}

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
\usepackage{cite}  % numeric citation

% Macros, Commands helper
\usepackage{xparse}  % \NewDocumentCommand, etc.
