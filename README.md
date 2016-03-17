# Python slots memory consumption test

Test memory consumption of normal (new style) classes vs. classes with slots in python.

    $ ./run.sh
    Running virtualenv with interpreter /Library/Frameworks/Python.framework/Versions/2.7/bin/python
    New python executable in /Users/vkuznetsov/Documents/prog/tmp/test-slots/env/bin/python
    Installing setuptools, pip, wheel...done.
    Collecting memory-profiler
    Collecting psutil
    Installing collected packages: memory-profiler, psutil
    Successfully installed memory-profiler-0.41 psutil-4.1.0

    Running tests with python

    Profiling with slots:
    Filename: slots.py

    Line #    Mem usage    Increment   Line Contents
    ================================================
        27      9.7 MiB      0.0 MiB   @profile
        28                             def test(cls):
        29     24.9 MiB     15.2 MiB       return [cls(n) for n in range(100000)]


    Profiling without slots (normal classes with __dict__):
    Filename: slots.py

    Line #    Mem usage    Increment   Line Contents
    ================================================
        27      9.8 MiB      0.0 MiB   @profile
        28                             def test(cls):
        29     52.7 MiB     42.8 MiB       return [cls(n) for n in range(100000)]

The test above uses default python (python2 in my case) but it's also possible
to specifically test on python3, pypy, or any other interpreter. For example:

    $ ./run.sh python3
