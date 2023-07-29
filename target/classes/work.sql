create table maeil_working_status(

working_id int primary key auto_increment,

employee_id int not null,

working_status varchar(10),

start_work_time timestamp,

leave_work_time timestamp,

working_date timestamp not null,

foreign key (employee_id) references maeil_member(employee_id)

);

select * from maeil_member

select * from maeil_working_status

select * from maeil_announcement



delete
from maeil_working_status
where working_id=16

insert into maeil_working_status
values(null, 2, "in", '2023-07-11 09:00:00', '2023-07-11 18:00:00', '2023-07-11 09:00:00'); 
insert into maeil_working_status
values(null, 2, "in", '2023-07-03 09:00:00', '2023-07-03 18:00:00', '2023-07-03 09:00:00'); 
insert into maeil_working_status
values(null, 2, "in", '2023-07-06 09:00:00', '2023-07-06 18:00:00', '2023-07-06 09:00:00'); 
insert into maeil_working_status
values(null, 2, "in", '2023-07-21 09:00:00', '2023-07-21 18:00:00', '2023-07-21 09:00:00'); 
insert into maeil_working_status
values(null, 2, "in", '2023-07-22 09:00:00', '2023-07-22 18:00:00', '2023-07-22 09:00:00'); 