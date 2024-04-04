-- Problem 1
select distinct station_id, chinese_name from stations where chinese_name like '%海%' order by station_id asc;

-- Problem 2
select district, ROUND((max(latitude) - min(latitude)) * 111) as 南北跨度km from stations where district != '' group by district;

-- Problem 3
select distinct station_id from bus_lines where bus_line = '103' or bus_line = '104' order by station_id desc;

-- Problem 4
select distinct station_id from bus_lines where bus_line = '103' or bus_line = '104' group by station_id having count(bus_line) > 1;

-- Problem 5
select bus_line, COUNT(station_id) as cnt from bus_lines group by bus_line having COUNT(station_id) > 9 order by COUNT(station_id) desc;

-- Problem 6
select station_id, count(bus_line) as cnt from bus_lines group by station_id 
	having count(bus_line) = (select max(temp.cnt) 
	from (select station_id, count(bus_line) as cnt from bus_lines group by station_id) temp)

-- Problem 7
select bus_line, COUNT(station_id) as count from bus_lines group by bus_line;

-- Problem 8
select distinct COUNT(station_id) as max from bus_lines group by bus_line 
	having COUNT(station_id) = (select max(temp.cnt) 
	from (select count(station_id) as cnt from bus_lines group by bus_line)temp)

-- Problem 9
select bus_line as bs, COUNT(station_id) as cnt from bus_lines group by bus_line 
	having COUNT(station_id) = (select max(temp.cnt) 
	from (select count(station_id) as cnt from bus_lines group by bus_line)temp) order by bus_line asc;

-- Problem 10
select bus_line, COUNT(station_id) as count from bus_lines where bus_line similar to 'N[0-9]%' group by bus_line;
