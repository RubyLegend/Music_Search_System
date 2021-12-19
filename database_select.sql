use Music_Search_System;

select * from Authors;

select Nickname, Last_login from Users;

select Name, Artists, `Release date`
from song_data
order by `Release date` desc;

select Name, Artists, `Release date`
from song_data
where year(`Release date`) between 2019 and 2020
order by Name asc;

select Name, count(*)
from Songs
group by Name;

select Album, count(*)
from song_data
group by Album;

select Name, Artists, `Release date`
from song_data
where day(`Release date`) between 10 and 20;

select Name, Artists, `Release date`
from song_data
where regexp_like(Name, 'B.*');

select s.Name as "Name", 
       group_concat(a.Name separator ', ') as 'Artists',
       count(*) as 'Count'
from Songs s right join Authors a
on a.ID = s.ID_Author
group by s.Name;

select a.Name as 'Artist', al.Name as 'Album name'
from Authors a right join Albums al
on al.ID_Author = a.ID;