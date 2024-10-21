.PHONY: all dist clean

.DEFAULT_TARGET = all

dist:
	./env/bin/python -m build --no-isolation --wheel && rm -rf vme.egg-info build

clean:
	rm -rf vme.egg-info build dist
