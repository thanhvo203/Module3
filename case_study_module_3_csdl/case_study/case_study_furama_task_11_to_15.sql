use case_study_furama;
-- task 11:
select dvdk.ma_dich_vu_di_kem, dvdk.ten_dich_vu_di_kem
from dich_vu_di_kem dvdk
left join hop_dong_chi_tiet hdct
on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
left join hop_dong hd
on hd.ma_hop_dong = hdct.ma_hop_dong
left join khach_hang kh
on kh.ma_khach_hang = hd.ma_khach_hang
left join loai_khach lk
on lk.ma_loai_khach = kh.ma_loai_khach
where lk.ten_loai_khach = 'Diamond'
and (kh.dia_chi like '% Vinh' or kh.dia_chi like '% Quảng Ngãi');

-- task 12:Hiển thị thông tin ma_hop_dong, ho_ten (nhân viên), ho_ten (khách hàng), so_dien_thoai (khách hàng),
-- ten_dich_vu, so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem),
-- tien_dat_coc của tất cả các dịch vụ đã từng được khách hàng đặt vào 3 tháng cuối năm 2020 

select hd.ma_hop_dong , nv.ho_ten, kh.ho_ten, kh.so_dien_thoai,dv.ma_dich_vu, dv.ten_dich_vu,
       sldvdk.so_luong_dich_vu_di_kem, hd.tien_dat_coc
from hop_dong hd
left join nhan_vien nv
on nv.ma_nhan_vien = hd.ma_nhan_vien
left join khach_hang kh
on kh.ma_khach_hang = hd.ma_khach_hang
left join dich_vu dv
on dv.ma_dich_vu = hd.ma_dich_vu
left join so_luong_dich_vu_di_kem sldvdk
on sldvdk.ma_hop_dong = hd.ma_hop_dong
where (quarter(hd.ngay_lam_hop_dong) = 4 
and year(hd.ngay_lam_hop_dong) = 2020);
-- and (month((hd.ngay_lam_hop_dong) not between 1 and 6 and year(hd.ngay_lam_hop_dong) = 2021)); 

-- task 13:Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng đã đặt phòng.
-- (Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau)
select dvdk.ma_dich_vu_di_kem, dvdk.ten_dich_vu_di_kem, sum(hdct.so_luong)
from dich_vu_di_kem dvdk
left join hop_dong_chi_tiet hdct
on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
group by dvdk.ma_dich_vu_di_kem;

-- task 14:	Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất.
 -- Thông tin hiển thị bao gồm ma_hop_dong, ten_loai_dich_vu, ten_dich_vu_di_kem, so_lan_su_dung (được tính dựa trên việc count các ma_dich_vu_di_kem).
 
 select hd.ma_hop_dong,ldv.ten_loai_dich_vu,dvdk.ten_dich_vu_di_kem,count(dvdk.ma_dich_vu_di_kem)
 from hop_dong hd
 left join dich_vu dv
 on dv.ma_dich_vu = hd.ma_dich_vu
 left join loai_dich_vu ldv
 on ldv.ma_loai_dich_vu = dv.ma_loai_dich_vu
 left join hop_dong_chi_tiet hdct
 on hdct.ma_hop_dong = hd.ma_hop_dong
 left join dich_vu_di_kem dvdk
 on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
 group by hd.ma_hop_dong,ldv.ten_loai_dich_vu,dvdk.ten_dich_vu_di_kem
 having  count(dvdk.ma_dich_vu_di_kem) = 1;
 
  -- task 15: Hiển thi thông tin của tất cả nhân viên bao gồm 
 -- ma_nhan_vien, ho_ten, ten_trinh_do, ten_bo_phan, so_dien_thoai, dia_chi mới chỉ lập được tối đa 3 hợp đồng từ năm 2020 đến 2021.
 select nv.ma_nhan_vien, nv.ho_ten, td.ten_trinh_do,bp.ten_bo_phan ,nv.so_dien_thoai, nv.dia_chi ,count(hd.ma_nhan_vien)
 from nhan_vien nv
 left join hop_dong hd
 on nv.ma_nhan_vien=hd.ma_nhan_vien
 left join trinh_do td
 on td.ma_trinh_do = nv.ma_trinh_do
 left join bo_phan bp
 on bp.ma_bo_phan = nv.ma_bo_phan
 where year(hd.ngay_lam_hop_dong) between 2020 and 2021
 group by nv.ma_nhan_vien
 having count(hd.ma_nhan_vien) <= 3
order by nv.ma_nhan_vien;
 