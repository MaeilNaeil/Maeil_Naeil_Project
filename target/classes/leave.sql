
create table maeil_leave_list(
	seq int auto_increment primary key,
	employee_id int not null,
    leave_start varchar(12) not null,
    leave_end varchar(12) not null,
    leave_type varchar(20) not null,
    leave_period varchar(20) not null,
    status varchar(20) not null
);

select*
from maeil_leave_list;

delete from maeil_leave_list
where seq=27;
