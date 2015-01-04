# wildcard expansion supresses erros when no files are found
include $(wildcard *.deps)
#
.PHONY: clean
%.stl: %.scad
	openscad -m make -o $@ -d $@.deps $<

%.png: %.scad
	openscad -o $@ $<

clean : 
	rm -f *.gcode *.png
