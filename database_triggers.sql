use Music_Search_System;

drop trigger if exists block_access_rights_insert;

delimiter //

create trigger block_access_rights_insert before insert on Access_Rights
for each row
begin
    SIGNAL SQLSTATE '45000' 
       set MESSAGE_TEXT = 'Changes inside this table are disabled.';
end//

delimiter ;

drop trigger if exists block_access_rights_update;

delimiter //

create trigger block_access_rights_update before update on Access_Rights
for each row
begin
    SIGNAL SQLSTATE '45000' 
       set MESSAGE_TEXT = 'Changes inside this table are disabled.';
end//

delimiter ;

drop trigger if exists block_access_rights_delete;

delimiter //

create trigger block_access_rights_delete before delete on Access_Rights
for each row
begin
    SIGNAL SQLSTATE '45000' 
       set MESSAGE_TEXT = 'Changes inside this table are disabled.';
end//

delimiter ;