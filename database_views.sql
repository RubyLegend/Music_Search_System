use Music_Search_System;

drop view if exists song_data;

create view song_data as
    select s.Name, group_concat(a.Name separator ', ') as Artists, 
           s.Release_date as 'Release date', al.Name as Album, 
           g.Genre_name as Genre, l.URL as 'Lyrics URL'
    from Songs s, Authors a, Songs_in_albums sia, Albums al, Genres g, Lyrics l
    where a.ID = s.ID_Author 
      and sia.ID_Song = s.ID 
      and sia.ID_Album = al.ID 
      and s.ID_Genre = g.ID 
      and l.ID = s.ID_Lyrics
    group by s.Name, s.Release_date, al.Name, g.Genre_name, l.URL;

drop view if exists song_author;

create view song_author as
    select s.Name, group_concat(a.Name separator ', ') as Artists
      from Songs s, Authors a
     where a.ID = s.ID_Author
  group by s.Name;