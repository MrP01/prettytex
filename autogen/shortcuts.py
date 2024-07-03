#!/usr/bin/env python3

"""
The plan for this script is to generate a version of the `shortcut.sty` file, but programmatically, so I never ever
have to write it manually.
"""

import json


def char_range(c1,c2):
    for c in range(ord(c1), ord(c2)+1):
        yield chr(c)

with open('shortcuts.json', 'r') as f:
    data = json.load(f)

def creat_alph():

    data['alphabets']['latin'] = list(char_range('a', 'z'))
    data['alphabets']['Latin'] = list(char_range('A', 'Z'))

    with open('shortcuts.json', 'w') as f:
        json.dump(data, f, indent=4)


def generate_set(prefix,fmt,cmd,alphabet,excludes):
    rval = []

    for x in list(alphabet - excludes):
        rval.append(f'\newcommand\u007b{prefix}{fmt}{x}\u007d\u007b\\{cmd}\u007d')

    return rval

s = generate_set("f", "", set(data["alphabets"]["latin"]), set([]))
print(s)