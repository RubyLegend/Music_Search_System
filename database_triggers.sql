use Music_Search_System;

drop trigger if exists block_access_rights;

delimiter //

create trigger block_access_rights before insert on Access_Rights
for each row
begin
    SIGNAL SQLSTATE '45000' 
       set MESSAGE_TEXT = 'Changes inside this table are disabled.';
end//

delimiter ;