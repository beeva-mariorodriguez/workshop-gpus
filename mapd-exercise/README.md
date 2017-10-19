## 01 MapD
* Launch the service:
```bash
~/workshop-gpus/scripts/start_mapd.sh
```

* Notes on the container:
  * Ports: MapD Web 9092. Hence the SSH tunnel.
  * Mounted folders: /mapd-storage/data and /mapd-storage/ingest.

* Download data (_slow, ~10 min_).
```bash
sudo ~/workshop-gpus/scripts/download_mapd_sample_data.sh /mapd-storage/data
```
* Connect to the container:

	`docker exec -ti mapd bash`

* Now you are inside the container. There is a file called `create_tables.sql`. Use it for creating the tables.
	`/mapd/bin/mapdql -u mapd -p HyperInteractive < create_tables.sql`

* There is another file called `load_files.sql`. Use it for loading the data into mapd (slow, ~15 mins).
	`/mapd/bin/mapdql -u mapd -p HyperInteractive < load_files.sql`


* Open a mapd terminal. 
	`/mapd/bin/mapdql -u mapd -p HyperInteractive`

* Launch the first query.
        ```sql
        select sum(lo_extendedprice*lo_discount) as revenue
        from lineorder, dwdate
        where lo_orderdate = d_datekey
        and d_year = 1997 
        and lo_discount between 1 and 3 
        and lo_quantity < 24;
```

* Launch again the query with a different threshold.
        ```sql
        select sum(lo_extendedprice*lo_discount) as revenue
        from lineorder, dwdate
        where lo_orderdate = d_datekey
        and d_year = 1997 
        and lo_discount between 1 and 3 
        and lo_quantity < 2000;
```

* What happened?

* Launch the second query.
        ```sql
        select sum(lo_revenue), d_year, p_brand1
        from lineorder, dwdate, part, supplier
        where lo_orderdate = d_datekey
        and lo_partkey = p_partkey
        and lo_suppkey = s_suppkey
        and p_category = 'MFGR#12'
        and s_region = 'AMERICA'
        group by d_year, p_brand1
        order by d_year, p_brand1;
```

* Launch the third query.
        ```sql
        select c_city, s_city, d_year, sum(lo_revenue) as revenue 
        from customer, lineorder, supplier, dwdate
        where lo_custkey = c_custkey
        and lo_suppkey = s_suppkey
        and lo_orderdate = d_datekey
        and (c_city='UNITED KI1' or
        c_city='UNITED KI5')
        and (s_city='UNITED KI1' or
        s_city='UNITED KI5')
        and d_yearmonth = 'Dec1997'
        group by c_city, s_city, d_year
        order by d_year asc, revenue desc;
```


* Open a local browser and get into http://127.0.0.1:9092 .
