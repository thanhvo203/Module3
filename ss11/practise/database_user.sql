create database user_dao;
use user_dao;

create table users (
id int primary key not null auto_increment,
`name` varchar(50) not null,
email varchar(50) not null,
country varchar(50)
);

insert into users( `name`,email,country)
values ('Minh','minh@codegym.vn','Viet Nam'),
       ('Kante','kante@che.uk','Kenia');