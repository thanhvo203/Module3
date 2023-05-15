create database ss2;
use ss2;

create table phieu_xuat(
 so_px int primary key auto_increment,
 ngay_xuat date
);
create table vat_tu(
ma_vat_tu int primary key auto_increment,
ten_vat_tu varchar(50) not null

);
create table phieuxuat_vattu(
don_gia_xuat int,
so_luong_xuat int,
ma_vat_tu int,
so_px int,
primary key (ma_vat_tu , so_px),
foreign key (ma_vat_tu) references vat_tu(ma_vat_tu),
foreign key (so_px) references phieu_xuat(so_px)
);
create table phieu_nhap(
so_pn int primary key auto_increment,
ngay_nhap date 
);
create table phieunhap_vattu(
don_gia_nhap int,
so_luong_nhap int,
ma_vat_tu int,
so_pn int,
primary key (ma_vat_tu , so_pn),
foreign key (ma_vat_tu) references vat_tu(ma_vat_tu),
foreign key (so_pn) references phieu_nhap(so_pn)
);
create table nha_cc(
ma_cung_cap int primary key auto_increment,
ten_ncc varchar(50) not null,
dia_chi varchar(50) not null
);
create table so_dien_thoai(
so_dien_thoai varchar(13) primary key,
ma_cung_cap int,
foreign key(ma_cung_cap) references nha_cc(ma_cung_cap)
);

create table don_dh(
so_don_hang int primary key auto_increment,
ngay_don_hang date,
ma_cung_cap int,
foreign key (ma_cung_cap) references nha_cc(ma_cung_cap)
);
create table dondh_vattu(
so_don_hang int,
ma_vat_tu int,
primary key (ma_vat_tu , so_don_hang),
foreign key (ma_vat_tu) references vat_tu(ma_vat_tu),
foreign key (so_don_hang) references don_dh(so_don_hang)
);


