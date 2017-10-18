#!/bin/bash
DEST=${1:-.}
mkdir -p "$DEST"
cd "$DEST"
for i in {0..7}
do
    curl "http://awssampledbuswest2.s3.amazonaws.com/ssbgz/lineorder000${i}_part_00.gz" | \
        gunzip > "${DEST}/lineorder000${i}_part_00"
done
for i in {0..3}
do
    curl "http://awssampledbuswest2.s3.amazonaws.com/ssbgz/part000${i}_part_00.gz" | \
        gunzip > "${DEST}/part000${i}_part_00" 
done
curl "http://awssampledbuswest2.s3.amazonaws.com/ssbgz/customer0002_part_00.gz" | \
    gunzip > "${DEST}/customer0002_part_00"

cp dwdate.tbl "$DEST"
cp load_files.sql "$DEST"
cp create_tables.sql "$DEST"

