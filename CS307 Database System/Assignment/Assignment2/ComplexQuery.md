1.（15） Please query the metro line ID which contains station with Chinese characters '山' or '海' in its names.

查询地铁站名字中包含有“山”“海”汉字的地铁线路？

2.（15）List the latitude information of all stations on metro Line 4. For those stations that have latitude information, please output "The latitude of `<English_name_of_the_station>` station is: `<latitude>`"; for those stations that do not have latitude information, please output "No latitude information for `<English_name_of_the_station>` station".

请考虑所有在4号线中的车站，对于有纬度信息的车站，请输出“The latitude of `<English_name_of_the_station>` station is: `<latitude>`”；对于没有纬度信息的车站，请输出“No latitude information for `<English_name_of_the_station>` station”。

如果本地遇到小数点位数过多的情况，可以直接 `select latitude` 来解决，在oj上不会遇到相应的问题。

3.（15）Please find out the metro lines that overlap with bus stops on bus line2, and the corresponding subway stations. Arrange the result in ascending order according to the metro line id. If there is more than one overlapping station on one metro line, arrange them in ascending order according to the station id. Please output the subway line id and the Chinese name of the corresponding station.

请找出与2路公交车站点有重叠的地铁线以及对应的地铁站，按照地铁线id升序排列，若有地铁线路id一致的情况，按照站点id升序排列。请输出地铁线路id以及对应站点的中文名称

4.（15）Find the staions that on metro line 1 and 5, but not on metro line 2. Please output the station id and the corresponding chinese name of the station in ascending order of the station id.

请找出一号线和五号线都经过，但二号线不经过的站点。输出站点id以及对应中文名称，按id升序排列。

5.（20）To map the starting and ending points of each railway line according to the color of the subway station sign, the information of the starting and ending station is needed. Please query and output the starting and ending stations' Chinese name of each railway line,, the metro line it is on, the line color and the HEX code representation in ascending order of the line id. (Please note: we suppose that station with minimum id as the start and maximum id as terminal).

想要在地图上按不同地铁站标志颜色绘制各地铁线起点和终点，请找出各线路的起点站和终点站，输出终点站的中名称，所在线路，线路颜色和hex码表示，请按照线路id升序输出。请注意，我们假设 station id最小的为起点，最大的为重点。

6.（20）If a traveler wants to travel around Shenzhen, which metro line covers the maximum number of districts? Display the line_id, line_color and the number of districts

一位游客想要乘坐地铁游遍深圳，他想知道那条地铁能够经过深圳最多的区。查询此条地铁line_id, line_color ，和经过区的数目
