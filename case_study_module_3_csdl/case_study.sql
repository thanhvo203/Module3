create database case_study;
use case_study;

create table vi_tri(
ma_vi_tri int primary key auto_increment,
ten_vi_tri varchar(45)
);
create table trinh_do(
ma_trinh_do int primary key auto_increment,
ten_trinh_do varchar(45) 
);
create table bo_phan(
ma_bo_phan int primary key auto_increment,
ten_bo_phan varchar(45)
);
create table kieu_thue(
ma_kieu_thue int primary key auto_increment,
ten_kieu_thue varchar(45)
);
create table loai_dich_vu(
ma_loai_dich_vu int primary key auto_increment,
ten_loai_dich_vu varchar(45)
);
create table loai_khach(
ma_loai_khach int primary key auto_increment,
ten_loai_khach varchar(45)
);
create table dich_vu_di_kem(
ma_dich_vu_di_kem int primary key auto_increment,
ten_dich_vu_di_kem varchar(45) not null,
gia double not null,
don_vi varchar(10) not null,
trang_thai varchar(45)
);
create table nhan_vien(
ma_nhan_vien int primary key auto_increment,
ho_ten varchar(45) not null,
ngay_sinh date not null,
so_cmnd varchar(45) not null,
luong double not null,
so_dien_thoai varchar(45) not null,
email varchar(45),
dia_chi varchar(45),
ma_vi_tri int,
foreign key(ma_vi_tri) references vi_tri(ma_vi_tri),
ma_trinh_do int,
foreign key(ma_trinh_do) references trinh_do(ma_trinh_do),
ma_bo_phan int,
foreign key(ma_bo_phan) references bo_phan(ma_bo_phan)
);
create table khach_hang(
ma_loai_khach int primary key auto_increment,
ma_khach_hang int ,
foreign key(ma_khach_hang) references loai_khach(ma_loai_khach),
ho_ten varchar(45) not null,
ngay_sinh date not null,
gioi_tinh bit(1) not null,
so_cmnd varchar(45) not null,
so_dien_thoai varchar(45) not null,
email varchar(45),
dia_chi varchar(45)
);
create table dich_vu(
ma_dich_vu int primary key auto_increment,
ten_dich_vu varchar(45) not null,
dien_tich int,
chi_phi_thue double not null,
so_nguoi_toi_da int,
ma_kieu_thue int,
foreign key(ma_kieu_thue) references kieu_thue(ma_kieu_thue),
ma_loai_dich_vu int,
foreign key(ma_loai_dich_vu) references loai_dich_vu(ma_loai_dich_vu),
tieu_chuan_phong varchar(45),
mo_ta_tien_nghi_khac varchar(45),
dien_tich_ho_boi double,
so_tang int
);
create table hop_dong(
ma_hop_dong int primary key auto_increment,
ngay_lam_hop_dong datetime not null,
ngay_ket_thuc datetime not null,
tien_dat_coc double not null,
ma_nhan_vien int,
foreign key(ma_nhan_vien) references nhan_vien(ma_nhan_vien),
ma_khach_hang int,
foreign key(ma_khach_hang) references khach_hang(ma_khach_hang),
ma_dich_vu int,
foreign key(ma_dich_vu) references dich_vu(ma_dich_vu)
);
create table hop_dong_chi_tiet(
ma_hop_dong_chi_tiet int primary key auto_increment,
ma_hop_dong int,
foreign key(ma_hop_dong) references hop_dong(ma_hop_dong),
ma_dich_vu_di_kem int,
foreign key(ma_dich_vu_di_kem) references dich_vu_di_kem(ma_dich_vu_di_kem),
so_luong int not null
);

insert into vi_tri(ten_vi_tri)
values ('Accountant'),('Service'),('Expert'),('Supervisor'),('Manager'),('Director');

insert into trinh_do(ten_trinh_do)
values ('Medium Education'),('High Education'),('University'),('After university');

insert into bo_phan(ten_bo_phan)
values ('Sale-Marketing'),('Administration'),('Service'),('Manager');

insert into kieu_thue(ten_kieu_thue)
values ('Hours'),('Day'),('Month'),('Year');

insert into loai_dich_vu(ten_loai_dich_vu)
values ('Villa'),('House'),('Room');

insert into loai_khach(ten_loai_khach)
values ('Member'),('Silver'),('Gold'),('Platinum'),('Diamond');

insert into dich_vu_di_kem(ten_dich_vu,gia,don_vi,trang_thai)
values ('Masssage','10000','VND','Still'),
        ('Karaoke','20000','VND','Still'),
        ('Meal','15000','VND','Over'),
        ('Drinks','5000','VND','Still'),
        ('Car rental','4000','VND','Over');

insert into nhan_vien(ho_ten,ngay_sinh,so_cmnd,luong,so_dien_thoai,email,dia_chi,ma_vi_tri,ma_trinh_do,ma_bo_phan)
values ('Thành','19993020','100100100','1000','0909000111','thanh21@gmail.com','Đà Nẵng',1,1,1),
	   ('Tài','20010110','100100100','1000','0909000111','thanh21@gmail.com','Huế',1,2,1),
	   ('Kiệt','19980220','100100100','1000','0909000111','thanh21@gmail.com','Huế',1,2,1),
	   ('Hoàng','19951020','100100100','1000','0909000111','thanh21@gmail.com','Huế',1,2,1),
	   ('Quốc','19954022','100100100','1000','0909000111','thanh21@gmail.com','Huế',1,2,1);
insert into khach_hang(ma_khach_hang,ho_ten,ngay_sinh,gioi_tinh,so_cmnd,so_dien_thoai,email,dia_chi)
values (1,'Tài LGBT','20010202','1','090911100','0909000111','tai@gmail.com','Huế'),      
 (1,'Hường','20010202','0','090911100','0909000111','tai@gmail.com','Đà Nẵng'),      
 (2,'Thành','19992003','1','090911100','0909000111','thanh@gmail.com','Đà Nẵng'),      
 (3,'Nguyên','20041217','0','090911100','0909000111','nguyen@gmail.com','Đà Nẵng'),      
 (4,'Bảo','19990203','1','090911100','0909000111','bao@gmail.com','Quảng Trị'),      
 (5,'Tiến','19961012','1','090911100','0909000111','tien@gmail.com','TP. Hồ Chí Minh');   
 
 insert into dich_vu(ten_dich_vu,dien_tich,chi_phi_thue,so_nguoi_toi_da,ma_kieu_thue,tieu_chuan_phong,mo_ta_tien_nghi_khac,dien_tich_ho_boi,so_tang)
 values ('Dream',100,1000,15,001,'VIP','Comfortable',15,4),
  ('Forest',50,2000,15,002,'VIP','Comfortable',10,2),
  ('Mountain',150,1500,15,003,'VIP','Comfortable',5,10),
  ('Beach',100,3000,15,004,'VIP','Comfortable',20,0);

insert into hop_dong(ngay_lam_hop_dong,ngay_ket_thuc,tien_dat_coc,ma_nhan_vien,ma_khach_hang,ma_dich_vu)
values ('20231012','20231015',10000,1,1,1),
 ('20230912','20230915',10000,2,2,2),
 ('20231112','20231115',10000,3,3,3),
 ('20231212','20231215',10000,4,4,4);
 
 insert into hop_dong_chi_tiet(ma_hop_dong,ma_dich_vu_di_kem,so_luong)
 values
  (1,1,'Meal',10),
  (2,2,'Masssage',10),
  (3,3,'Karaoke',10),
  (4,4,'Drinks',10);