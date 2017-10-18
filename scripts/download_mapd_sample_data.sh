#!/bin/bash
DEST=${1:-.}
mkdir -p "$DEST"
for i in {0..7}
do
    wget -P "$DEST" "http://awssampledbuswest2.s3.amazonaws.com/ssbgz/lineorder000${i}_part_00.gz"
done

