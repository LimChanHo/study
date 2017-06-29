
create table user_info
as select * from user;

select num, id, pwd, name, age from user
order by name desc;
;
select count(*) from user_info;

select sum(age), avg(age),count(1) from user;

drop table user_info;

create table user_info(
num int(7) AUTO_INCREMENT primary key,
id varchar(30) not null,
pwd varchar(30) not null,
name varchar(100) not null,
age int(3) not null);

alter table user_info
add column class_num int(5) not null;

create table class_info(
class_num int(5) AUTO_INCREMENT primary key,
class_name varchar(100) not null);

select * from class_info;

insert into class_info(class_name)
values('3D프린터반');

insert into user_info(id, pwd, name, age, class_num)
values('red','red','홍길동',30, 1);
insert into user_info(id, pwd, name, age, class_num)
values('yellow','yellow','황길동',21, 4);

select ui.num, ui.name, ui.id, ui.pwd, ui.age, ci.class_name, ci.class_num
from user_info as ui, class_info as ci
where ci.class_num=ui.class_num;
