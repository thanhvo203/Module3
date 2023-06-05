use
case_study_furama;

-- task 6:
select distinct dv.ma_dich_vu, dv.ten_dich_vu, dv.dien_tich, dv.chi_phi_thue, ldv.ten_loai_dich_vu
from dich_vu dv
         left join loai_dich_vu ldv
                   on ldv.ma_loai_dich_vu = dv.ma_loai_dich_vu
         left join hop_dong hd
                   on hd.ma_dich_vu = dv.ma_dich_vu
where hd.ma_dich_vu not in (
    select ma_dich_vu
    from hop_dong
    where (month(ngay_lam_hop_dong) between 1 and 3
              and year (ngay_lam_hop_dong)= 2)
);
-- task 7: 
select distinct dv.ma_dich_vu, dv.ten_dich_vu, dv.dien_tich, dv.chi_phi_thue, ldv.ten_loai_dich_vu
from dich_vu dv
         left join loai_dich_vu ldv
                   on ldv.ma_loai_dich_vu = dv.ma_loai_dich_vu
         left join hop_dong hd
                   on hd.ma_dich_vu = dv.ma_dich_vu
where year (ngay_lam_hop_dong) = 2020
  and hd.ma_dich_vu not in (
    select ma_dich_vu from hop_dong
    where ( year (ngay_lam_hop_dong) = 2021)
    );

-- task 8 :
-- cách 1:
select kh.ho_ten, count(kh.ho_ten)
from khach_hang kh
group by kh.ho_ten;
-- cách 2:
select distinct khach_hang.ho_ten
from khach_hang;
-- cách 3: 
select khach_hang.ho_ten
from khach_hang
union
select khach_hang.ho_ten
from khach_hang;
-- task 9 : 
select month (hop_dong.ngay_lam_hop_dong), count (khach_hang.ma_khach_hang) as 'so_luong_khach_hang'
from hop_dong
    join khach_hang
on khach_hang.ma_khach_hang = hop_dong.ma_khach_hang
where year (hop_dong.ngay_lam_hop_dong) = 2021
group by month (hop_dong.ngay_lam_hop_dong)
order by month (hop_dong.ngay_lam_hop_dong);
-- task 10 :
create view so_luong_dich_vu_di_kem as
select hd.ma_hop_dong,
       hd.ngay_lam_hop_dong,
       hd.ngay_ket_thuc,
       hd.tien_dat_coc,
       ifnull(sum(hdct.so_luong), 0) as 'so_luong_dich_vu_di_kem'
from hop_dong hd
         left join hop_dong_chi_tiet hdct
                   on hdct.ma_hop_dong = hd.ma_hop_dong
         left join dich_vu_di_kem dvdk
                   on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
group by hd.ma_hop_dong
