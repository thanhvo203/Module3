create
database quan_ly_ban_hang;
use
quan_ly_ban_hang;

create table khach_hang
(
    id_khach_hang   int primary key auto_increment,
    name_khach_hang varchar(50) not null,
    tuoi_khach_hang int
);
create table dat_hang
(
    id_dat_hang        int primary key auto_increment,
    ngay_dat_hang      date,
    tong_tien_dat_hang int,
    id_khach_hang      int,
    foreign key (id_khach_hang) references khach_hang (id_khach_hang)
);
create table san_pham
(
    id_san_pham  int primary key auto_increment,
    ten_san_pham varchar(50) not null,
    gia_san_pham int
);
create table chi_tiet_dat_hang
(
    hoa_don_chi_tiet_dat_hang int,
    id_dat_hang               int,
    id_san_pham               int,
    primary key (id_dat_hang, id_san_pham),
    foreign key (id_dat_hang) references dat_hang (id_dat_hang),
    foreign key (id_san_pham) references san_pham (id_san_pham)
);