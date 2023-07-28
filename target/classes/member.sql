
create table maeil_member(
	employee_id int primary key auto_increment, 
	employee_name varchar(30) not null,
	employee_password varchar(20) not null,
	employee_email varchar(50),
	department_id int(8),
	department_name varchar(30),
	auth int(4) not null,
	edate timestamp not null,
	erank varchar(8)
)

alter table maeil_member
add
newfilename varchar(100)

alter table maeil_announcement
add
employee_name varchar(30) not null

foreign key (employee_id) references maeil_member(employee_id)



select * from maeil_member

select * from maeil_announcement

INSERT INTO maeil_member (employee_id, employee_name, employee_password, employee_email, department_id, department_name, auth, edate, erank)
VALUES (6, '홍길동11', '1111', 'aaa@hong11.com', 111, 'IT 1팀', 3, '2011-11-11', '사원11');

create table maeil_announcement(
	seq int primary key auto_increment,
	employee_id int not null,
	title varchar(200) not null,
	content varchar(4000) not null,
	writing_period timestamp,
	auth int not null
)