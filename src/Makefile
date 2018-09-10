all: frame_top.stl frame_motor.stl carriage.stl endstop.stl effector.stl \
     frame_extruder.stl m5_internal.stl hotend_fan.stl ramps_bracket.stl \
     belt_clip.stl

.SECONDARY:

# Explicit wildcard expansion suppresses errors when no files are found.
include $(wildcard *.deps)

%.stl: %.ascii.stl
	meshlabserver -i $< -o $@ -s meshclean.mlx

%.ascii.stl: %.scad
	openscad -m make -d $*.deps -o $@ $<

%.gcode: %.stl
	slic3r --load ../slic3r/config.ini -o $@ $<

# Replace tabs with spaces.
%.tab: %.scad
	cp $< $@
	expand $@ > $<
