
create table maeil_department_calendar(
	seq int auto_increment primary key,
    employee_id int not null,
	title varchar(200) not null,
    content varchar(4000),
    rdate varchar(12) not null,
    wdate timestamp  not null    
);

select*
from maeil_department_calendar;

alter table maeil_department_calendar
add
share int(3);


delete from maeil_department_calendar
where seq=21;
