#!/bin/bash
DEST=${1:-.}
mkdir -p "$DEST"
for i in {0..7}
do
    aws s3 cp "s3://awssampledbuswest2/ssbgz/lineorder000${i}_part_00.gz" "$DEST"
done

