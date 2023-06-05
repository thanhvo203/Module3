use
case_study_furama;
-- Câu 2:
select *
from nhan_vien
where (ho_ten like 'H%' or ho_ten like 'K%' or ho_ten like 'T%')
  and char_length(ho_ten) <= 15;
-- Câu 3: 	
select *
from khach_hang
where timestampdiff(year,khach_hang.ngay_sinh, curtime()) >= 18 and
      timestampdiff(year,khach_hang.ngay_sinh, curtime()) <= 50 and
      dia_chi like '% Đà Nẵng%'
   or dia_chi like '% Quảng Trị%';
-- Câu 4:
select khach_hang.ma_khach_hang, khach_hang.ho_ten, count(khach_hang.ma_khach_hang) as 'so_lan_dat_phong'
from khach_hang
         join hop_dong
              on khach_hang.ma_khach_hang = hop_dong.ma_khach_hang
         join loai_khach
              on loai_khach.ma_loai_khach = khach_hang.ma_loai_khach
where loai_khach.ten_loai_khach = 'Diamond'
group by ma_khach_hang
order by count(ma_khach_hang);

-- Câu 5: 
select kh.ma_khach_hang,
       kh.ho_ten,

       lk.ten_loai_khach,
       hd.ma_hop_dong,

       dv.ten_dich_vu,
       hd.ngay_lam_hop_dong,
       hd.ngay_ket_thuc,

       (dv.chi_phi_thue + hdct.so_luong * dvdk.gia) as tong_tien
from khach_hang kh

         join hop_dong hd
              on hd.ma_khach_hang = kh.ma_khach_hang

         join loai_khach lk
              on lk.ma_loai_khach = kh.ma_loai_khach

         join dich_vu dv
              on dv.ma_dich_vu = hd.ma_dich_vu

         join hop_dong_chi_tiet hdct
              on hdct.ma_hop_dong = hd.ma_hop_dong

         join dich_vu_di_kem dvdk
              on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem

order by kh.ma_khach_hang;

	
	