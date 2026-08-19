# Conventions for prettytex

* maximum line width: 120 characters (it's 2026, not 1982)
* tabs: 4 spaces
* avoid very short names (i.e. one and two letter macros, options etc)
* use xkeyval for pacakge options
* avoid redundant options (i.e. if we set lang in base, we need not set it again in math)
* separate files into meaningful blocks (see prettytex/base for an example)
* give descriptions/reasons for loaded packages and their options
* keep todos located to sections, if it takes more work make an issue
* give top-level descriptions for package
* write disclaimers if necessary



## Naming things

| type           | convention                 |
|----------------|----------------------------|
| package        | `prettytex/<package-name>` |
| settings macro | `prettytex<setting>`       |
