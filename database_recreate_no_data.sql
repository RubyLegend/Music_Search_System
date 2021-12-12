use Music_Search_System;

-- Drop all tables before creating it (BE CAREFULL, IT WILL REMOVE ALL DATA)
-- Backup your data before using this script
drop table if exists Songs_in_albums;
drop table if exists Songs;
drop table if exists Lyrics;
drop table if exists Albums;
drop table if exists Authors;
drop table if exists Genres;
drop table if exists Users;
drop table if exists Access_Rights;

create table Authors
(
	ID int not null auto_increment,
	Name varchar(100),
	primary key(ID)
);

-- lock table Authors write;
-- 
-- unlock tables;

create table Albums
(
	ID int not null auto_increment,
	ID_Author int,
	Name varchar(100),
	Release_date Date,
	primary key(ID),
	foreign key(ID_Author) references Authors(ID)
);

-- lock table Albums write;
-- 
-- unlock tables;


create table Genres
(
	ID int not null auto_increment,
	Genre_name varchar(15),
	primary key(ID)
);

lock table Genres write;
insert into Genres value (1, 'Not set'); 
unlock tables;

create table Lyrics
(
	ID int not null auto_increment,
	URL varchar(200),
	primary key(ID)
);

create table Songs
(
	ID int not null auto_increment,
	Name varchar(100),
	ID_Author int,
	ID_Lyrics int,
	ID_Genre int,
	Release_date Date,
	primary key(ID),
	foreign key(ID_Author) references Authors(ID) on delete cascade,
	foreign key(ID_Genre) references Genres(ID) on delete cascade,
	foreign key(ID_Lyrics) references Lyrics(ID) on delete cascade 
);

-- lock table Songs write;
-- 
-- unlock tables;

create table Access_Rights
(
	ID int not null auto_increment,
	Name varchar(20),
	primary key(ID)
);

lock table Access_Rights write;
insert into Access_Rights values
(1, 'Administrator'),
(2, 'User');
unlock tables;

create table Users
(
	ID int not null auto_increment,
	Nickname varchar(30),
	Email varchar(30),
	Password varchar(30),
	User_Mode int,
	Phone BigInt,
	Last_login datetime,
	primary key(ID),
	foreign key(User_Mode) references Access_Rights(ID)
);

-- lock table Users write;
-- 
-- unlock tables;

create table Songs_in_albums
(
	ID int not null auto_increment,
	ID_Song int unique,
	ID_Album int,
	primary key(ID),
	foreign key(ID_Song) references Songs(ID) on delete cascade,
	foreign key(ID_Album) references Albums(ID) on delete cascade
);

-- lock table Songs_in_albums write;
-- 
-- unlock tables;
