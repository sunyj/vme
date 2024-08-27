.PHONY: all dist clean

.DEFAULT_TARGET = all

all: vme.py

vme.py: vme/__init__.py vme/__main__.py
	./all-in-one

dist:
	./env/bin/python -m build --no-isolation --wheel && rm -rf vme.egg-info

clean:
	rm -rf vme.egg-info dist
