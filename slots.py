#!/usr/bin/env python

import sys
from memory_profiler import profile


try:
    range = xrange
except NameError:
    pass  # python 3


def init(self, n):
    self.one = n
    self.two = str(n) + ' little indians'


class NoSlots(object):
    __init__ = init


class YesSlots(object):
    __slots__ = ('one', 'two')
    __init__ = init


@profile
def test(cls):
    return [cls(n) for n in range(100000)]


if __name__ == '__main__':
    flag = sys.argv[1] if len(sys.argv) > 1 else None

    if flag == 'yes':
        cls = YesSlots
    elif flag == 'no':
        cls = NoSlots
    else:
        sys.exit('usage: slots.py yes|no')

    test(cls)
