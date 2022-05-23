# Write prettier LaTeX

Some LaTeX templates and base classes for university, formal letters, legal things, etc.
You can find the documentation [here](./docs/prettytex.pdf).

Also, have a look at the [provided templates](./templates/).

## Usage

In almost all cases, use an article base document, like so:

```latex
\documentclass{article}

\usepackage{prettytex/base}
\usepackage{prettytex/math}

% or rather, if you use another language:
\usepackage[de]{prettytex/base}
\usepackage[de]{prettytex/math}
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
\usepackage{prettytex/thesis}  % scientific thesis options (pre-defined bibliography, typing)
```

Please be curious about the source code, you will find all answers inside.

Have fun! If you find a problem, please open a corresponding issue.

## Global installation on your Unix-based system

In the future, you might be able to install the package from CTAN.

For now, on Debian-based distributions, you need to clone this repository, link it and have tex know that something changed:

```bash
git clone git@github.com:MrP01/prettytex.git /path/to/your/repo
sudo ln -s /path/to/your/repo /usr/share/texlive/texmf-dist/tex/latex/prettytex
sudo texhash
```

## Getting minted to work

Based on a sample-size of two (Kubuntu and Arch Linux) operating systems, the `minted` package can cause some problems
when compiling, usually with the package `pygmentize` being missing on your system. You may install it with

```bash
sudo apt-get install pygmentize
```

on Debian based systems or:

```bash
sudo pacman -S pygmentize
```

on Arch Linux based systems. Now you only need to pass the `-shell-escape` flag to your latex-compiler. If you
are using the VSCode extension _Latex Workshop_, you need to edit the `settings.json` and add the flag to the
`args` of the recipe you are using. For example:

```json
"latex-workshop.latex.tools": [
        {
            "name": "latexmk",
            "command": "latexmk",
            "args": [
                "-shell-escape", // <-- added the flag here
                "-synctex=1",
                "-interaction=nonstopmode",
                "-file-line-error",
                "-pdf",
                "-outdir=%OUTDIR%",
                "%DOC%"
            ],
            "env": {}
        },
        {
            "name": "pdflatex",
            "command": "pdflatex",
            "args": [
                "-shell-escape", // <-- added the flag here
                "-synctex=1",
                "-interaction=nonstopmode",
                "-file-line-error",
                "%DOC%"
            ],
            "env": {}
        }
    ]
```

Keep in mind, that you have to pass `-shell-escape` before the `%DOC%` argument.

## math-theorems

In the file `math-theorems.sty` a few common mathematical environments are defined:

- definition
- theorem
- remark
- lemma
- corollary

These are based on `tcolorbox` and are used like so:

```latex
\begin{<env name>}{<optional env title>}{<optional reference key>}
    <text>
\end{<env name>}
```

An example:

```latex
\begin{definition}{Convergence}{convergence}

    Let $(a_n)_{n\in\mathbb{N}}$ be a sequence. We call it convergent, if the following
    condition is met:
    \begin{align*}
        \forall\varepsilon>0\colon \exists N\in\mathbb{N}\colon n\geq N
        \Rightarrow |a_n-a|<\varepsilon
    \end{align*}
    Where $a$ is the limit of the sequence.
\end{definition}

...

As stated in \autoref{def:convergence}, we see that ... in \ref{def:convergence}
```

Prettytex provides two thmbox styles, `round` (the default) and `sharp`.
In order to use the `sharp` style, please

```latex
\PassOptionsToPackage{sharp}{prettytex/boxes}
```

### The provided math theorem environments

| environment name | en_UK      | de_DE      | reference base |
| ---------------- | ---------- | ---------- | -------------- |
| `definition`     | Definition | Definition | `def`          |
| `theorem`        | Theorem    | Satz       | `thm`          |
| `lemma`          | Lemma      | Lemma      | `lemma`        |
| `remark`         | Remark     | Bemerkung  | `remark`       |
| `corollary`      | Corollary  | Korollar   | `corollary`    |

## VSCode Snippets

The file `vscode_snippets.json` provides valid snippets for vscode for use in latex-documents. Just copy the contents
into your snippets file, or save it under `~/.config/Code/User/snippets/` with the name `latex.json`.
