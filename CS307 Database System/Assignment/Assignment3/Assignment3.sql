-- Problem 1
select count(a.station_id) from (select d.station_id from line_detail d, stations s, (select avg(latitude) from stations) v where d.line_id = 3 and d.station_id not in (select station_id from line_detail where line_id = 4) and d.station_id = s.station_id and s.latitude > v.avg) a;

-- Problem 2
select district, count(station_id) as cnt from stations where (english_name like '%S%' or english_name like '%s%') and district != '' group by district order by count(station_id) desc;

-- Problem 3
select a.line_id, a.opening, a.cnt,case when (a.line_id = 1) then null else concat(round((a.cnt - lag(a.cnt,1,null) over ()) * 100.0 / lag(a.cnt,1,null) over (),2), '%') end as variation from (select l.line_id, l.opening, count(d.station_id) as cnt from lines l, line_detail d where d.line_id = l.line_id group by l.line_id order by l.opening,l.line_id) a;

-- Problem 4
select a.year, a.event from (select line_id,opening as year, concat('line ', line_id, ' opened') as event from lines where opening between 2008 and 2021 union select line_id, latest_extension as year, concat('line ', line_id, ' extended') as event from lines where latest_extension between 2008 and 2021 order by year) a where a.line_id in (select distinct line_id from line_detail);

-- Problem 5
select a.station_id, s.chinese_name from (select station_id from line_detail where line_id = 1 intersect select station_id from line_detail where line_id = 5) a, stations s where a.station_id = s.station_id;

-- Problem 6
select a.station_id, s.chinese_name, a.ld1id, a.ld2id
	from ((select station_id, 1 as ld1id, 5 as ld2id from line_detail where line_id = 1 intersect select station_id, 1 as ld1id, 5 as ld2id from line_detail where line_id = 5)
	union
		(select station_id, 1 as ld1id, 11 as ld2id from line_detail where line_id = 1 intersect select station_id, 1 as ld1id, 11 as ld2id from line_detail where line_id = 11) 
	union 
		(select station_id, 5 as ld1id, 11 as ld2id from line_detail where line_id = 5 intersect select station_id, 5 as ld1id, 11 as ld2id from line_detail where line_id = 11)) a, stations s
	where a.station_id = s.station_id order by a.station_id,a.ld1id,a.ld2id;
