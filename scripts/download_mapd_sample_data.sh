#!/bin/bash
DEST=${1:-.}
mkdir -p "$DEST"
cd "$DEST"
for i in {0..7}
do
    curl "http://awssampledbuswest2.s3.amazonaws.com/ssbgz/lineorder000${i}_part_00.gz" | \
        gunzip > "${DEST}/lineorder000${i}_part_00"
done

