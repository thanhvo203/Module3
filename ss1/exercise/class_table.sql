create
database ss1;
use
ss1;
create table teacher
(
    id          int primary key auto_increment,
    nameTeacher varchar(55) not null,
    age         int         not null,
    country     varchar(55) not null
);

insert into teacher (nameTeacher, age, country)
values ("Tài", "18", "Huế"),
       ('Thành', '23', 'Đà Nẵng');

create table class
(
    id     int primary key auto_increment,
    `name` varchar(55) not null
);
insert into class(`name`)
values ('Tài'),
       ('Thành');

select *
from teacher;
select *
from class;
