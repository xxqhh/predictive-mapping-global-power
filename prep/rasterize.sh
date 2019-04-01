#!/bin/bash
# Rasterize all in dir using targets for shape and extents
# First arg: directory containing files to rasterize
# Second arg: directory for output

for f in $1/*; do
    name=$(echo $f | sed -r "s/.+\/(.+)\..+/\1/");
	targ=~/data/targets/$name.tif;
	gdal_rasterize -at -burn 1 -a_nodata 0 -init 0 -ts $(./getres.sh $targ) -te $(./getextents.sh $targ) $f $2/$name.tif
done

