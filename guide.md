
# Connect to the machine

1. Download the key `workshop2017.pem`
1. Open a terminal
1. Set read-only permission for the key.
```bash
chmod 400 Descargas/workshop2017.pem
```

1. Connect to the machine.
```bash
ssh -L 8888:127.0.0.1:8888 -L 9092:127.0.0.1:9092 ubuntu@13.58.115.202 -i Descargas/workshop2017.pem
```

1. Update the repo.
```bash
cd ~/workshop-gpus; git pull
```

# Module 1

## 01  RGB2Gray
1. Launch the program.
```bash
cd ~/workshop-gpus/minpy-exercise
python rgb2gray.py
```

# Module 2

## 01 CUDA
Compile the code.
```bash
cd ~/workshop-gpus/Cuda_exercises
chmod +x execute.sh
./execute.sh
```
Profile the code.
```bash
cd build
time ./rgb2gray ../cat.jpg ../cat2.jpg MODE_GPU DISPLAY_OFF
nvprof ./rgb2gray ../cat.jpg ../cat2.jpg MODE_GPU DISPLAY_OFF # Export to file nvprof -o rgb2gray.nvprof ./rgb2gray ../cat.jpg ../cat2.jpg MODE_GPU DISPLAY_OFF
```

# Module 3

## 01 MapD
1. Launch the service:
```bash
~/workshop-gpus/scripts/start_mapd.sh
```

1. Notes on the container:
  * Ports: MapD Web 9092. Hence the SSH tunnel.
  * Mounted folders: /mapd-storage/data and /mapd-storage/ingest.

1. Download data (_slow, ~10 min_).
```bash
sudo ~/workshop-gpus/scripts/download_mapd_sample_data.sh /mapd-storage/data
```
1. Connect to the container:

	`docker exec -ti mapd bash`

1. Now you are inside the container. Create a file called `create_tables.sql` with the following content.
	```sql
	CREATE TABLE part
	(
	  p_partkey     INTEGER NOT NULL,
	  p_name        VARCHAR(22) NOT NULL,
	  p_mfgr        VARCHAR(6) NOT NULL,
	  p_category    VARCHAR(7) NOT NULL,
	  p_brand1      VARCHAR(9) NOT NULL,
	  p_color       VARCHAR(11) NOT NULL,
	  p_type        VARCHAR(25) NOT NULL,
	  p_size        INTEGER NOT NULL,
	  p_container   VARCHAR(10) NOT NULL
	);

	CREATE TABLE supplier
	(
	  s_suppkey   INTEGER NOT NULL,
	  s_name      VARCHAR(25) NOT NULL,
	  s_address   VARCHAR(25) NOT NULL,
	  s_city      VARCHAR(10) NOT NULL,
	  s_nation    VARCHAR(15) NOT NULL,
	  s_region    VARCHAR(12) NOT NULL,
	  s_phone     VARCHAR(15) NOT NULL
	);

	CREATE TABLE customer
	(
	  c_custkey      INTEGER NOT NULL,
	  c_name         VARCHAR(25) NOT NULL,
	  c_address      VARCHAR(25) NOT NULL,
	  c_city         VARCHAR(10) NOT NULL,
	  c_nation       VARCHAR(15) NOT NULL,
	  c_region       VARCHAR(12) NOT NULL,
	  c_phone        VARCHAR(15) NOT NULL,
	  c_mktsegment   VARCHAR(10) NOT NULL
	);

	CREATE TABLE dwdate
	(
	  d_datekey            INTEGER NOT NULL,
	  d_date               VARCHAR(19) NOT NULL,
	  d_dayofweek          VARCHAR(10) NOT NULL,
	  d_month              VARCHAR(10) NOT NULL,
	  d_year               INTEGER NOT NULL,
	  d_yearmonthnum       INTEGER NOT NULL,
	  d_yearmonth          VARCHAR(8) NOT NULL,
	  d_daynuminweek       INTEGER NOT NULL,
	  d_daynuminmonth      INTEGER NOT NULL,
	  d_daynuminyear       INTEGER NOT NULL,
	  d_monthnuminyear     INTEGER NOT NULL,
	  d_weeknuminyear      INTEGER NOT NULL,
	  d_sellingseason      VARCHAR(13) NOT NULL,
	  d_lastdayinweekfl    VARCHAR(1) NOT NULL,
	  d_lastdayinmonthfl   VARCHAR(1) NOT NULL,
	  d_holidayfl          VARCHAR(1) NOT NULL,
	  d_weekdayfl          VARCHAR(1) NOT NULL
	);
	CREATE TABLE lineorder
	(
	  lo_orderkey          INTEGER NOT NULL,
	  lo_linenumber        INTEGER NOT NULL,
	  lo_custkey           INTEGER NOT NULL,
	  lo_partkey           INTEGER NOT NULL,
	  lo_suppkey           INTEGER NOT NULL,
	  lo_orderdate         INTEGER NOT NULL,
	  lo_orderpriority     VARCHAR(15) NOT NULL,
	  lo_shippriority      VARCHAR(1) NOT NULL,
	  lo_quantity          INTEGER NOT NULL,
	  lo_extendedprice     INTEGER NOT NULL,
	  lo_ordertotalprice   INTEGER NOT NULL,
	  lo_discount          INTEGER NOT NULL,
	  lo_revenue           INTEGER NOT NULL,
	  lo_supplycost        INTEGER NOT NULL,
	  lo_tax               INTEGER NOT NULL,
	  lo_commitdate        INTEGER NOT NULL,
	  lo_shipmode          VARCHAR(10) NOT NULL
	);
```
1. Create the tables from the previous file.
	`/mapd/bin/mapdql -u mapd -p HyperInteractive < create_tables.sql`

1. Create a file called `load_files.sql` with the following content.
```sql
COPY lineorder from '/mapd-storage/ingest/lineorder0000_part_00' WITH (delimiter = '|', header = 'false') ;
COPY lineorder from '/mapd-storage/ingest/lineorder0001_part_00' WITH (delimiter = '|', header = 'false') ;
COPY lineorder from '/mapd-storage/ingest/lineorder0002_part_00' WITH (delimiter = '|', header = 'false') ;
COPY lineorder from '/mapd-storage/ingest/lineorder0003_part_00' WITH (delimiter = '|', header = 'false') ;
COPY lineorder from '/mapd-storage/ingest/lineorder0004_part_00' WITH (delimiter = '|', header = 'false') ;
COPY lineorder from '/mapd-storage/ingest/lineorder0005_part_00' WITH (delimiter = '|', header = 'false') ;
COPY lineorder from '/mapd-storage/ingest/lineorder0006_part_00' WITH (delimiter = '|', header = 'false') ;
COPY lineorder from '/mapd-storage/ingest/lineorder0007_part_00' WITH (delimiter = '|', header = 'false') ;
```

1. asd


1. Open a local browser and get into http://127.0.0.1:9092 .



# Module 4

## 01
# Module 5

## 01
