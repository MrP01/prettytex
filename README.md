# Write prettier LaTeX

Some LaTeX templates and base classes for university.

## Usage
In almost all cases, use an article base document, like so:
```latex
\documentclass{article}

\usepackage{prettytex/base}
\usepackage{prettytex/math}
```

This package uses a modular approach, you may want to load some of the following packages. Keep in mind that `prettytex/base` always comes first.

```latex
\documentclass{article}

\usepackage{prettytex/base}  % You always want this
\usepackage{prettytex/boxes}  % thmbox and leftbar (box environments)
\usepackage{prettytex/math}  % standard math tools (requires base)
\usepackage{prettytex/math-theorems}  % some theorem-style environments (requires boxes)
\usepackage{prettytex/math-sigtrans}  % utilities for signal transforms (requires math)
\usepackage{prettytex/code}  % configuration for the minted package for including code
\usepackage{prettytex/contract}  % useful commands for contracts and legal stuff
\usepackage{prettytex/gfx}  % base class for grapics related work
\usepackage{prettytex/gfx-components}  % control flow shortcuts
\usepackage{prettytex/gfx-circuits}  % shortcuts for electrical circuits
```

Have fun! If you find a problem, please open a corresponding issue.

## Global installation on your Unix-based system
In the future, you might be able to install the package from CTAN.

For now, on Debian-based distributions, you need to clone this repository, link it and have tex know that something changed:
```bash
git clone git@github.com:MrP01/prettytex.git /path/to/your/repo
sudo ln -s /path/to/your/repo /usr/share/texlive/texmf-dist/tex/latex/prettytex
sudo texhash
```
