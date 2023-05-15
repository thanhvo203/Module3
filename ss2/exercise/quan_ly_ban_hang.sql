create database quan_ly_ban_hang;
use quan_ly_ban_hang;

create table customer(
cID int primary key auto_increment,
cName varchar(50) not null,
cAge int
);
create table `order`(
oID int primary key auto_increment,
oDate date,
oTotalPrice int,
cID int,
foreign key (cID) references customer(cID)
);
create table product(
pID int primary key auto_increment,
pName varchar(50) not null,
pPrice int
);
create table orderdetail(
odQTY int,
oID int,
pID int,
primary key(oID,pID),
foreign key (oID) references `order`(oID),
foreign key (pID) references product(pId)
);