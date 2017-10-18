COPY dwdate from '/mapd-storage/ingest/dwdate.tbl' WITH (delimiter = '|', header = 'false') ;
COPY customer from '/mapd-storage/ingest/customer0002_part_00' WITH (delimiter = '|', header = 'false') ;
COPY lineorder from '/mapd-storage/ingest/lineorder0000_part_00' WITH (delimiter = '|', header = 'false') ;
COPY lineorder from '/mapd-storage/ingest/lineorder0001_part_00' WITH (delimiter = '|', header = 'false') ;
COPY lineorder from '/mapd-storage/ingest/lineorder0002_part_00' WITH (delimiter = '|', header = 'false') ;
COPY lineorder from '/mapd-storage/ingest/lineorder0003_part_00' WITH (delimiter = '|', header = 'false') ;
COPY lineorder from '/mapd-storage/ingest/lineorder0004_part_00' WITH (delimiter = '|', header = 'false') ;
COPY lineorder from '/mapd-storage/ingest/lineorder0005_part_00' WITH (delimiter = '|', header = 'false') ;
COPY lineorder from '/mapd-storage/ingest/lineorder0006_part_00' WITH (delimiter = '|', header = 'false') ;
COPY lineorder from '/mapd-storage/ingest/lineorder0007_part_00' WITH (delimiter = '|', header = 'false') ;
COPY part from '/mapd-storage/ingest/part0000_part_00' WITH (delimiter = '|', header = 'false') ;
COPY part from '/mapd-storage/ingest/part0001_part_00' WITH (delimiter = '|', header = 'false') ;
COPY part from '/mapd-storage/ingest/part0002_part_00' WITH (delimiter = '|', header = 'false') ;
COPY part from '/mapd-storage/ingest/part0003_part_00' WITH (delimiter = '|', header = 'false') ;

