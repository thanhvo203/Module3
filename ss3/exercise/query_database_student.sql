create
database query_database_student;
use
query_database_student;

create table class
(
    class_id   int primary key auto_increment,
    class_name varchar(60) not null,
    start_date datetime    not null,
    `status`   bit
);
create table student
(
    student_id   int primary key auto_increment,
    student_name varchar(30) not null,
    address      varchar(50),
    phone        varchar(20),
    `status`     bit,
    class_id     int         not null,
    foreign key (class_id) references class (class_id)
);

create table `subject`
(
    subject_id   int primary key auto_increment,
    subject_name varchar(30) not null,
    credit       tinyint     not null default 1,
    check (credit >= 1),
    status       bit                  default 1
);
create table mark
(
    mark_id    int not null primary key auto_increment,
    subject_id int not null,
    student_id int not null,
    unique (subject_id, student_id),
    mark       float   default 0 check ( mark between 0 and 100),
    exam_times tinyint default 1,
    foreign key (subject_id) references `subject` (subject_id),
    foreign key (student_id) references student (student_id)
);

insert into class
values (1, 'A1', '2008-12-20', 1),
       (2, 'A2', '2008-12-22', 1),
       (3, 'B3', current_date, 0);

insert into student(student_name, address, phone, `status`, class_id)
values ('Hung', 'Ha Noi', '0912113113', 1, 1),
       ('Hoa', 'Hai phong', null, 1, 1),
       ('Manh', 'HCM', '0123123123', 0, 2);

insert into `subject`
values (1, 'CF', 5, 1),
       (2, 'C', 6, 1),
       (3, 'HDJ', 5, 1),
       (4, 'RDBMS', 10, 1);

insert into mark(subject_id, student_id, mark, exam_times)
values (1, 1, 8, 1),
       (1, 2, 10, 2),
       (2, 1, 12, 1);

-- hiển thị tên bắt đầu bằng chữ h;
select student_name
from student
where student_name like 'h%';
-- hHiển thị các thông tin lớp học có thời gian bắt đầu vào tháng 12.

select *
from class
where month (start_date) = 12;

-- Hiển thị tất cả các thông tin môn học có credit trong khoảng từ 3-5.
select *
from `subject`
where `subject`.credit between 3 and 5;
-- Thay đổi mã lớp(ClassID) của sinh viên có tên ‘Hung’ là 2.

update student
set class_id = 2
where student_name = 'Hung'
  and class_id = 1;

-- Hiển thị các thông tin: StudentName, SubName, Mark. Dữ liệu sắp xếp theo điểm thi (mark) giảm dần. nếu trùng sắp theo tên tăng dần.
select student.student_name, `subject`.subject_name, mark.mark
from student
         join mark on student.student_id = mark.student_id
         join `subject` on `subject`.subject_id = mark.subject_id
order by mark.mark desc;

