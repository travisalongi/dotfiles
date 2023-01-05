#!/bin/sh
# Backs up the project on Drifter external SSD to Gypsy external HD
# Does not overwrite existing files
# -a = archieve mode ((Faster))
# -v = verbose mode 
# -P = show progress

rsync -a -v -P --ignore-existing $HOME/Drifter/Project $HOME/Gypsy
