-- Problem 1
select distinct line_id from line_detail d, stations s where d.station_id = s.station_id and (s.chinese_name like '%山%' or s.chinese_name like '%海%');

-- Problem 2
select (case when s.latitude is NULL then 
	format('No latitude information for %s station', s.english_name) 
	else format('The latitude of %s station is: %s', s.english_name, s.latitude) end) 
	as latitude_info 
	from line_detail d, stations s where d.station_id = s.station_id and d.line_id = 4; 

-- Problem 3
select d.line_id as line_id, s.chinese_name as chinese_name 
	from line_detail d, stations s, bus_lines b
	where b.bus_line = '2' and b.station_id = d.station_id and d.station_id = s.station_id
	order by d.line_id asc, d.station_id asc;

-- Problem 4
select d.line_id as line_id, s.chinese_name as chinese_name
	from line_detail d, stations s, bus_lines b where b.bus_line = '2' and b.station_id = d.station_id and d.station_id = s.station_id
	order by d.line_id asc, d.station_id asc;

-- Problem 5
select (select chinese_name from stations where station_id = min(d.station_id)) as start,
	(select chinese_name from stations where station_id = max(d.station_id)) as start,
	d.line_id as line_id, l.line_color as line_color,
	c.hex as hex 
	from line_detail d join lines l on d.line_id = l.line_id join color_names c on l.line_color = c.name group by d.line_id,l.line_id,c.name order by d.line_id;

-- Problem 6
select distinct d.line_id as line_id, l.line_color as line_color, g.cnt as num_of_districts  from line_detail d join lines l on d.line_id = l.line_id
	join (select count(r.district) as cnt, r.line_id from (select s.district as district, d.line_id from line_detail d, stations s where d.station_id = s.station_id group by d.line_id, s.district) r group by r.line_id) g 
	on d.line_id = g.line_id and g.cnt in (select max(g.cnt) as max from (select count(r.district) as cnt, r.line_id from (select s.district as district, d.line_id from line_detail d, stations s where d.station_id = s.station_id group by d.line_id, s.district) r group by r.line_id) g);
