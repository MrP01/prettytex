\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{prettytex/assignment}[2000/03/25 Common Latex Class for my assignments]

\newcommand{\lang}{en}
\DeclareOption{de}{\renewcommand{\lang}{de}}
\ProcessOptions\relax

\LoadClass{article}

\RequirePackage[singlelinecheck,\lang]{prettytex/base}
\RequirePackage{prettytex/math}
\RequirePackage[external]{prettytex/gfx}
\RequirePackage{prettytex/gfx-circuits}
\RequirePackage{prettytex/gfx-components}
\RequirePackage{prettytex/boxes}
\RequirePackage{prettytex/math-sigtrans}
\RequirePackage{prettytex/math-theorems}
\RequirePackage{tikz-cd}
\RequirePackage{titlesec, varwidth,lastpage}
\usepackage{mathdots}
\usepackage{cleveref}

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
\newcommand{\taskcolor}{green}

\fancyhf{}
\fancyhead[R]{\name\\\matrnum}
\fancyhead[L]{\class\\\classid, \term}
\fancyhead[C]{\bfseries \assname\hspace{0.1cm}\numsymb \assnum\\\duedate}
\fancyfoot[C]{\thepage~/~\pageref{LastPage}}
\renewcommand{\headrulewidth}{.25pt}
\renewcommand{\footrulewidth}{.25pt}
\pagestyle{fancy}
\usepackage{esvect}

\allowdisplaybreaks
\titleformat{\section}[block]{\Large\bfseries\filcenter}{\assname\hspace{0.2cm}\numsymb\hspace{0.2cm}\assnum}{1em}{}

\setlength{\headheight}{25pt}
\setlength{\headsep}{1.5em}

\DeclareOption{section}{%
\BeforeBeginEnvironment{#1}{\savenotes}%
  \AfterEndEnvironment{#1}{\spewnotes}%
  \newtcbtheorem[number within=section]{task}{\taskname}{%
      enhanced, frame empty, interior empty, colframe=\taskcolor!50!white,%
      coltitle=\taskcolor,fonttitle=\bfseries,colbacktitle=\taskcolor!20,%
      borderline={0.5mm}{0mm}{\taskcolor!20},top=3.2mm,%
      attach boxed title to top center={yshift=-2.5mm},%
      varwidth boxed title%
  }{task}%
}
\DeclareOption{ssection}{%
\BeforeBeginEnvironment{#1}{\savenotes}%
  \AfterEndEnvironment{#1}{\spewnotes}%
  \newtcbtheorem[number within=subsection]{task}{\taskname}{%
      enhanced, frame empty, interior empty, colframe=\taskcolor!50!white,%
      coltitle=\taskcolor,fonttitle=\bfseries,colbacktitle=\taskcolor!20,%
      borderline={0.5mm}{0mm}{\taskcolor!20},top=3.2mm,%
      attach boxed title to top center={yshift=-2.5mm},%
      varwidth boxed title%
  }{task}%
}
\DeclareOption{count}{%
  \newtcbtheorem{task}{\taskname}{%
      enhanced, frame empty, interior empty, colframe=\taskcolor!50!white,%
      coltitle=\taskcolor,fonttitle=\bfseries,colbacktitle=\taskcolor!20,%
      borderline={0.5mm}{0mm}{\taskcolor!20},top=3.2mm,%
      attach boxed title to top center={yshift=-2.5mm},%
      varwidth boxed title%
  }{task}%
}
\DeclareOption{sharp}{
  \newtcbtheorem{task}{\taskname}{%
      enhanced, frame empty, interior empty, colframe=\taskcolor!50!white,%
      coltitle=\taskcolor,fonttitle=\bfseries,colbacktitle=\taskcolor!20,%
      borderline={0.5mm}{0mm}{\taskcolor!20},%
      sharp corners, colback=white,
      % before skip=2mm,
      % after skip=2mm,
      % attach boxed title to top center={yshift=-2.5mm},%
      varwidth boxed title%
  }{task}%
}
\ProcessOptions\relax

\newcommand{\tcb@cnt@taskautorefname}{\taskname}

\newtheorem{ex}{Task}[section]
\setcounter{section}{\assnum}

\makeatletter
\crefname{tcb@cnt@task}{task}{tasks}
\Crefname{tcb@cnt@task}{Task}{Tasks}
\makeatother