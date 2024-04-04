1.（10）List all stations whose names contain the Chinese character "海". And please output the id and the chinese name of those stations in ascending order. (Ordered by "station_id" and no duplicate records).

请列举所有站名带“海”的车站（去重），结果请输出“station_id” 和车站的中文名。输出结果请按照“station_id”从小到大排序。

2.（10）Given that a latitude is equivalent to 111km, use table stations to estimate the north-south span of each district(you can round off number just use round)

已知一纬度相当于111km，按照stations表格内容估计各区的南北跨度约多少公里（结果请四舍五入取整）

3.（10）Using the table **bus_lines**, find all the stations that bus 103 and bus 104 pass through and output their ids in descending order

在表格bus_lines中，找到103和104路公交车经过的所有的车站，并输出车站id,按降序排列

4.（10）Using the table **bus_lines**, find the stations that bus 103 and bus 104 both pass through and output their ids in descending order

在表格bus_lines中，找到103和104路公交车经过的相同的车站，并输出车站id

5.（10）Using the table **bus_lines**, which bus lines have more than 10 stations, and how many stations they have, please output results in descending order

在bus_lines表中，拥有站数大于等于10站的线路有哪些，他们的车站数分别是多少站，按照降序排列输出结果。如果出现cnt相同的情况，请根据bus_line降序排列。

6.（10）Using the **bus_lines** table, which bus station has the most bus line stops and how many these bus lines? If there are multiple stations, output all of them, no limit order

在bus_line表格中，最多线路停靠的公交站是哪站，有多少条公交线停靠此站？如果有多个站，请全部输出，不限顺序

7.（10）Please calculate how many stations on each bus line. Please output the **name** of each bus line and the **number of the stations**.

每个公交线路有几个站，请输出公交线路名称以及它所拥有的站点数？ 顺序不限。

8.（10）Which is the max station count of all bus lines? Please output the max station number.

站点最多的一条线上有几个站点？

9.（10）Which bus line has the maximum number of stations? Please output the max station number. Please output the number of the bus line and the max station number. If there is more than one bus line that has the max station number, please output them all in ascending order.

站点最多的一条线的名称是什么？如果有多条线路，请按升序的顺序输出它们。

10.（10）In the new name of the bus, the night bus is named in the form of the letter N connected with the number. Using the table **bus_lines**, output the number of bus stops per night bus line

公交车新的命名规范中，夜班公交的命名为字母N连接数字的形式。在表格bus_lines中，输出每班夜班公交的站数
