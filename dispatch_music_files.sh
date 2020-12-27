#!/bin/bash

copy_nb=$(echo {1..3})

for nb in $copy_nb ; do
echo $(printf "* %s\.m4a" $nb)
done

