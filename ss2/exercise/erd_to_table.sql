create
database ss2;
use
ss2;

create table phieu_xuat
(
    so_phieu_xuat int primary key auto_increment,
    ngay_xuat     date
);
create table vat_tu
(
    ma_vat_tu  int primary key auto_increment,
    ten_vat_tu varchar(50) not null

);
create table phieu_xuat_vat_tu
(
    don_gia_xuat  int,
    so_luong_xuat int,
    ma_vat_tu     int,
    so_phieu_xuat int,
    primary key (ma_vat_tu, so_phieu_xuat),
    foreign key (ma_vat_tu) references vat_tu (ma_vat_tu),
    foreign key (so_phieu_xuat) references phieu_xuat (so_phieu_xuat)
);
create table phieu_nhap
(
    so_phieu_nhap int primary key auto_increment,
    ngay_nhap     date
);
create table phieu_nhap_vat_tu
(
    don_gia_nhap  int,
    so_luong_nhap int,
    ma_vat_tu     int,
    so_phieu_nhap int,
    primary key (ma_vat_tu, so_phieu_nhap),
    foreign key (ma_vat_tu) references vat_tu (ma_vat_tu),
    foreign key (so_phieu_nhap) references phieu_nhap (so_phieu_nhap)
);
create table nha_cung_cap
(
    ma_cung_cap      int primary key auto_increment,
    ten_nha_cung_cap varchar(50) not null,
    dia_chi          varchar(50) not null
);
create table so_dien_thoai
(
    so_dien_thoai varchar(13) primary key,
    ma_cung_cap   int,
    foreign key (ma_cung_cap) references nha_cung_cap (ma_cung_cap)
);

create table don_dat_hang
(
    so_don_hang   int primary key auto_increment,
    ngay_don_hang date,
    ma_cung_cap   int,
    foreign key (ma_cung_cap) references nha_cung_cap (ma_cung_cap)
);
create table don_dat_hang_vat_tu
(
    so_don_hang int,
    ma_vat_tu   int,
    primary key (ma_vat_tu, so_don_hang),
    foreign key (ma_vat_tu) references vat_tu (ma_vat_tu),
    foreign key (so_don_hang) references don_dat_hang (so_don_hang)
);


