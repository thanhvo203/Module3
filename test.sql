Create database test;
use test;

create table class(
id int primary key auto_increment,
name varchar(20)
);
create table room(
id int primary key auto_increment,
name varchar(20),
class_id int,
foreign key(class_id) references class(id)
);
create table jame(
`account` varchar(50) primary key,
`password` varchar(50)
);
create table student(
id int primary key auto_increment,
name varchar(50),
birthday date,
gender boolean,
email varchar(50),
`point` float,
class_id int,
`account` varchar(50) unique,
foreign key (class_id) references class(id),
foreign key (`account`) references jame(`account`)
);

create table instructor(
id int primary key auto_increment,
name varchar(50),
birthday date,
salary double
);

create table instructor_class(
 class_id int,
 instructor_id int,
 start_time date,
 end_time date,
 primary key (class_id, instructor_id),
 foreign key(class_id) references class(id),
 foreign key(instructor_id) references instructor(id)
);

insert into class (name) values ('c1121g1'), ('c1221g1'),('a0821i1'),('a0921i1');
insert into room(name,class_id) values ('Ken',1), ('Jame',1),('Ada',2),('Andy',2);

insert into jame(`account`,`password`)
 values('cunn','12345'),('chunglh','12345'),('hoanhh','12345'),('dungd','12345'),('huynhtd','12345'),
 ('hainm','12345'),('namtv','12345'),('hieuvm','12345'),('kynx','12345'),('vulm','12345');

insert into jame(`account`,`password`)
 values('anv','12345'),('bnv','12345');

 
insert into instructor(`name`,birthday, salary)
 values('tran van chanh','1985-02-03',100),('tran minh chien','1985-02-03',200),('vu thanh tien','1985-02-03',300);
insert into instructor(`name`,birthday, salary)
 values('tran van nam','1989-12-12',100);

 
 insert into student(`name`,birthday, gender,`point`, class_id,`account`) 
 values ('nguyen ngoc cu','1981-12-12',1,8,1,'cunn'),('le hai chung','1981-12-12',1,5,1,'chunglh'),
 ('hoang huu hoan','1990-12-12',1,6,2,'hoanhh'),('dau dung','1987-12-12',1,8,1,'dungd'),
 ('ta dinh huynh','1981-12-12',1,7,2,'huynhtd'),('nguyen minh hai','1987-12-12',1,9,1,'hainm'),
 ('tran van nam','1989-12-12',1,4,4,'namtv'),('vo minh hieu','1981-12-12',1,3,1,'hieuvm'),
 ('le xuan ky','1981-12-12',1,7,3,'kynx'),('le minh vu','1981-12-12',1,7,1,'vulm');

 insert into student(`name`,birthday, gender,`point`, class_id,`account`) 
 values ('nguyen van a','1981-12-12',1,8,null,'anv'),('tran van b','1981-12-12',1,5,null,'bnv');

 insert into instructor_class(class_id,instructor_id) values (1,1),(1,2),(2,1),(2,2),(3,1),(3,2);


select * from student,class where student.class_id = class.id; 
select  student.`name` , class.`name` from student,class where student.class_id = class.id or student.class_id = null; 

select * from student  where student.`name` like '%hai' or student.`name` like '%huynh';

select * from student where student.`point` > 5;

select * from student where student.`name` like 'nguyen%';
select `point`, count(`point`) from student group by `point`;

select `point`, count(`point`) from student where `point` >5  group by `point` having count(`point`) >= 2;

select * from student where class_id = (select id from class where `name` = 'c1121g1') order by `name` asc;

select student.`name` , class.`name` from class  right join student on class.id = student.class_id;

select c.name, count(s.id) as "số lượng học viên"
from student s
join class c
on c.id = s.class_id
group by c.id;
-- 2.             Tính điểm lớn nhất của mỗi các lớp ( yêu cầu viết code ra giấy )
select c.name, max(s.point) as "điểm cao nhất"
from student s
join class c
on c.id = s.class_id
group by c.id;

-- 3.             Tình điểm trung bình  của từng lớp ( yêu cầu viết code ra giấy )
select c.name, avg(s.point) as "điểm trung bình"
from student s
join class c
on c.id = s.class_id
group by c.id;

-- 4.             Lấy ra toàn bộ tên và ngày sinh các instructor và student ở CodeGym. ( yêu cầu viết code ra giấy )
select name, birthday
from instructor
union
select name, birthday
from student;
-- 5.             Lấy ra top 3 học viên có điểm cao nhất của trung tâm. ( yêu cầu viết code ra giấy )
select id, name,point
from student
limit 3 offset 2;
-- order by point desc
-- limit 3;
-- 6.             Lấy ra các học viên có điểm số là cao nhất của trung tâm. ( yêu cầu viết code ra giấy )
select * 
from student
where point = (
select max(point)
from student);

-- ============ Bài 5 ===============

-- Câu 1: đánh và xóa index cho cột name
explain select * 
from student
where name = "nguyen ngoc cu";
create unique index index_name on student(name);
explain select * 
from student
where name = "nguyen ngoc cu";
drop index index_name on student;

-- Câu 2: Tạo view chỉ chứa thông tin id và name của student

create view view_student(id,name,birthday) as
select id,name,birthday
from student;
insert into view_student(name,birthday)
values ("công","1991-10-09");
drop view view_student;
create view view_student_class(id,name,class_name) as
select student.id,student.name,class.name
from student
join class
on student.class_id = class.id;

-- 4. Stored Procedure ==========
-- Java: viết hàm void có tên là findByName, có tham số truyền vào là name
-- void findByName(String name) {
--   // Body
-- }
-- ========== IN ==========
delimiter //
create procedure find_by_name(in name varchar(50)) -- mặc định tham số là in
begin
	select * from student s
    where s.name = name;
end //
delimiter ;

call find_by_name('nguyen ngoc cu'); -- Tái sử dụng mã nguồn
-- call find_by_name('Nguyễn Văn A'); -- Tái sử dụng mã nguồn

-- ========== OUT ==========
delimiter //
create procedure find_by_name_out(in name varchar(50), out count int)
begin
    select count(*) into count from student s 
    where s.name = name;
end //
delimiter ;

call find_by_name_out('le van hung', @count);
select @count;


-- ========== INOUT ==========
delimiter //
create procedure find_by_name_inout(inout name varchar(50))
begin
	set name = (
    select count(*) from student s
    where s.name = name
    );
end //
delimiter ;

set @abc = 'Nguyễn Văn A';
select @abc;
call find_by_name_inout(@abc);
select @abc;



-- 5 tạo trigger tự động tạo tài khoản jame trước khi thêm mới một học viên
 select * from student;
 select * from jame;

DELIMITER //
CREATE TRIGGER tr_auto_create_jame 
BEFORE INSERT ON student
FOR EACH ROW
BEGIN
insert into jame(`account`, `password`) values ( new.email, '123');
END //
DELIMITER ;

insert into student(`name`,birthday, email, gender,`point`, class_id,`account`) 
 values ('Bùi minh tiến','1990-12-12','tienb@gmail.com',1,8,1,'tienb@gmail.com');
 
-- 6 viêt 1 function xếp loại học lưc theo point
delimiter //
create function f_xep_loai(diem int)
returns varchar(50)
deterministic
begin
	declare loai varchar(50);
	if diem>=8 then
	set loai ='giỏi';
	elseif diem>=7 then
	set loai='khá';
	else
	set loai='trung bình';
	end if;
	return loai;
end //
delimiter ;

-- sử dụng function
select s.name, f_xep_loai(s.point) 
from student s;
