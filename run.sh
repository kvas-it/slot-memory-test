#!/bin/sh

PYTHON=${1-python}

rm -Rf env

virtualenv -p $PYTHON env
env/bin/pip install memory_profiler psutil

echo
echo "Running tests with $PYTHON"
echo

echo "Profiling with slots:"
env/bin/python -m memory_profiler slots.py yes

echo "Profiling without slots (normal classes with __dict__):"
env/bin/python -m memory_profiler slots.py no

rm -Rf env
