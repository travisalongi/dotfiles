#!/bin/sh
# Backs up the project on Drifter external SSD to Wayfarer external HD
# Does not overwrite existing files
# -a = archieve mode ((Faster))
# -v = verbose mode 
# -P = show progress

rsync -a -v -P --ignore-existing -e 'ssh -p 5858' ~/Zephyrus_share/Shallow_damage talongi@174.160.84.110:/share/CACHEDEV3_DATA/All
