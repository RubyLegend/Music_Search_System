use Music_Search_System;

drop procedure if exists search_song;

delimiter //

create procedure search_song(
    in _Author varchar(100), 
    in _Album varchar(100), 
    in _Song varchar(100),
    in _Release_date date,
    in _Genre varchar(15)
)
begin
    set _Album = Replace(_Album, '\(', '\\\\('); /*That quadro backslash is hella scary*/
    set _Album = Replace(_Album, '\)', '\\\\)');
    set _Author = Replace(_Author, '\(', '\\\\(');
    set _Author = Replace(_Author, '\)', '\\\\)');
    set _Song = Replace(_Song, '\(', '\\\\(');
    set _Song = Replace(_Song, '\)', '\\\\)');
    /*select _Album, _Author, _Song, _Release_date, _Genre; /* For input debugging */
    set @input = 'select s.* from Songs s';
    set @a = " join Authors a on s.ID_Author = a.ID";
    set @b = " join Songs_in_albums sia on sia.ID_Song = s.ID join Albums al on sia.ID_Album = al.ID";
    set @c = " join Genres g on g.ID = s.ID_Genre";
    set @first_param = 0;

    /*`Join` zone*/
    if _Author is not NULL then 
        set @input = concat(@input, @a);
        /*select 'Author detected' as '';*/
    end if;
    if _Album is not NULL then 
        set @input = concat(@input, @b);
        /*select 'Album detected' as '';*/
    end if;
    if _Genre is not NULL then 
        set @input = concat(@input, @c);
        /*select 'Genre detected' as '';*/
    end if;

    /*`Where` zone*/
    if _Author is not NULL then 
        if @first_param = 0 then
            set @input = concat(@input, " where regexp_like(a.Name, '.*(", _Author, ").*')");
            set @first_param = 1;
        else
            set @input = concat(@input, " and regexp_like(a.Name, '.*(", _Author, ").*')");
        end if;
    end if;
    if _Album is not NULL then 
        if @first_param = 0 then
            set @input = concat(@input, " where regexp_like(al.Name, '.*(", _Album, ").*')");
            set @first_param = 1;
        else
            set @input = concat(@input, " and regexp_like(al.Name, '.*(", _Album, ").*')");
        end if;
    end if;
    if _Genre is not NULL then 
        if @first_param = 0 then
            set @input = concat(@input, " where regexp_like(g.Name, '.*(", _Genre, ").*')");
            set @first_param = 1;
        else
            set @input = concat(@input, " and regexp_like(g.Name, '.*(", _Genre, ").*')");
        end if;
    end if;
    if _Song is not NULL then
        if @first_param = 0 then
            set @input = concat(@input, " where regexp_like(s.Name, '.*(", _Song, ").*')");
            set @first_param = 1;
        else
            set @input = concat(@input, " and regexp_like(s.Name, '.*(", _Song, ").*')");
        end if;
        /*select 'Song name detected' as '';*/
    end if;
    if _Release_date is not NULL then
        if @first_param = 0 then
            set @input = concat(@input, " where regexp_like(s.Release_date, '.*(", _Release_date, ").*')");
            set @first_param = 1;
        else
            set @input = concat(@input, " and regexp_like(s.Release_date, '.*(", _Release_date, ").*')");
        end if;
        /*select 'Release date detected' as '';*/
    end if;

    /*select @input as '';*/
    prepare stmt from @input;
    execute stmt;
    deallocate prepare stmt;
end//

delimiter ;

drop procedure if exists search;

delimiter //

create procedure search(
    in _Author varchar(100), 
    in _Album varchar(100), 
    in _Song varchar(100),
    in _Release_date date,
    in _Genre varchar(15)
)
begin
    set _Album = Replace(_Album, '\(', '\\\\('); /*That quadro backslash is hella scary*/
    set _Album = Replace(_Album, '\)', '\\\\)');
    set _Author = Replace(_Author, '\(', '\\\\(');
    set _Author = Replace(_Author, '\)', '\\\\)');
    set _Song = Replace(_Song, '\(', '\\\\(');
    set _Song = Replace(_Song, '\)', '\\\\)');
    /*select _Album, _Author, _Song, _Release_date, _Genre; /* For input debugging */
    set @input = 'select * from song_data';
    set @first_param = 0;

    /*`Where` zone*/
    if _Author is not NULL then 
        if @first_param = 0 then
            set @input = concat(@input, " where regexp_like(Artists, '.*(", _Author, ").*')");
            set @first_param = 1;
        else
            set @input = concat(@input, " and regexp_like(Artists, '.*(", _Author, ").*')");
        end if;
    end if;
    if _Album is not NULL then 
        if @first_param = 0 then
            set @input = concat(@input, " where regexp_like(Album, '.*(", _Album, ").*')");
            set @first_param = 1;
        else
            set @input = concat(@input, " and regexp_like(Album, '.*(", _Album, ").*')");
        end if;
    end if;
    if _Genre is not NULL then 
        if @first_param = 0 then
            set @input = concat(@input, " where regexp_like(Genre, '.*(", _Genre, ").*')");
            set @first_param = 1;
        else
            set @input = concat(@input, " and regexp_like(Genre, '.*(", _Genre, ").*')");
        end if;
    end if;
    if _Song is not NULL then
        if @first_param = 0 then
            set @input = concat(@input, " where regexp_like(Name, '.*(", _Song, ").*')");
            set @first_param = 1;
        else
            set @input = concat(@input, " and regexp_like(Name, '.*(", _Song, ").*')");
        end if;
        /*select 'Song name detected' as '';*/
    end if;
    if _Release_date is not NULL then
        if @first_param = 0 then
            set @input = concat(@input, " where regexp_like(`Release date`, '.*(", _Release_date, ").*')");
            set @first_param = 1;
        else
            set @input = concat(@input, " and regexp_like(`Release date`, '.*(", _Release_date, ").*')");
        end if;
        /*select 'Release date detected' as '';*/
    end if;

    /*select @input as '';*/
    prepare stmt from @input;
    execute stmt;
    deallocate prepare stmt;
end//

delimiter ;