#!/usr/bin/env python3

import webbrowser
import sys

terms = sys.argv
if len(terms) == 1:
    print("You need to supply at least 1 search term")
    sys.exit(3)

terms.pop(0)

for term in terms:
    url = "https://www.nihilscio.it/Manuali/Lingua%20latina/Verbi/Coniugazione_latino.asp?verbo=" + term + "&lang=IT_"
    webbrowser.open(url)