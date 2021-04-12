#!/usr/bin/env python
"""Calculates nlog2n of n."""

import sys
from math import log

argv = sys.argv
argc = len(argv)

if argc != 2:
    print('Enter in value')
    sys.exit(1)

n = argv[1]
if '/' in n:
    numerator = float(n[:n.find('/')])
    denominator = float(n[n.find('/') + 1:])
    nval = numerator / denominator
else:
    nval = float(n)

print('Initial value:', nval)
print(nval * log(nval, 2))
