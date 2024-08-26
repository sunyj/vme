.PHONY: dist clean

.DEFAULT_TARGET = dist

dist:
	./env/bin/python -m build --no-isolation --wheel && rm -rf vme.egg-info

clean:
	rm -rf vme.egg-info dist
