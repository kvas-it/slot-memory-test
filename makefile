.PHONY: yes no both clean

both: yes no

yes: env
	env/bin/python -m memory_profiler slots.py yes

no: env
	env/bin/python -m memory_profiler slots.py no

env:
	virtualenv env
	env/bin/pip install memory_profiler psutil

clean:
	rm -Rf env
