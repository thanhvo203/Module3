use
case_study_furama;

-- task16: 16.	Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2019 đến năm 2021.
delete
from nhan_vien
where ma_nhan_vien not in (
    select *
    from (
             select nv.ma_nhan_vien
             from nhan_vien nv
                      left join hop_dong hd
                                on hd.ma_nhan_vien = nv.ma_nhan_vien
             where year (hd.ngay_lam_hop_dong) between 2019 and 2021) as T
);

-- task 17:	Cập nhật thông tin những khách hàng có ten_loai_khach từ Platinum lên Diamond,
-- chỉ cập nhật những khách hàng đã từng đặt phòng với Tổng Tiền thanh toán trong năm 2021 là lớn hơn 10.000.000 VNĐ.

update khach_hang kh
set kh.ma_loai_khach = 1
where kh.ma_khach_hang in (
    select *
    from (
             select kh.ma_khach_hang
             from loai_khach lk
                      join khach_hang kh
                           on kh.ma_loai_khach = lk.ma_loai_khach
                      join hop_dong hd
                           on hd.ma_khach_hang = kh.ma_khach_hang
                      join hop_dong_chi_tiet hdct
                           on hdct.ma_hop_dong = hd.ma_hop_dong
                      join dich_vu dv
                           on dv.ma_dich_vu = hd.ma_dich_vu
                      join dich_vu_di_kem dvdk
                           on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
             where year (hd.ngay_lam_hop_dong) = 2021 and kh.ma_loai_khach = 2
             group by kh.ma_khach_hang
             having sum (dv.chi_phi_thue + hdct.so_luong * dvdk.gia) >= 10000000) as tong_tien
);

-- task 18:18.	Xóa những khách hàng có hợp đồng trước năm 2021 (chú ý ràng buộc giữa các bảng).
set
foreign_key_checks = 0;

delete
from khach_hang
where ma_khach_hang in (
    select *
    from (
             select kh.ma_khach_hang
             from khach_hang kh
                      left join hop_dong hd
                                on hd.ma_khach_hang = kh.ma_khach_hang
             where year (hd.ngay_lam_hop_dong)<2021) as T
);

-- task 19: 19.	Cập nhật giá cho các dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2020 lên gấp đôi.
set
sql_safe_updates = 0;
update dich_vu_di_kem dvdk
set dvdk.gia = gia * 2
where dvdk.ma_dich_vu_di_kem in (
    select *
    from (
             select dvdk.ma_dich_vu_di_kem
             from dich_vu_di_kem dvdk
                      join hop_dong_chi_tiet hdct
                           on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
                      join hop_dong hd
                           on hd.ma_hop_dong = hdct.ma_hop_dong
             where year (hd.ngay_lam_hop_dong) = 2020
             group by dvdk.ma_dich_vu_di_kem
             having sum (hdct.so_luong) > 10) as T
);
-- task 20 :Hiển thị thông tin của tất cả các nhân viên và khách hàng có trong hệ thống,
-- thông tin hiển thị bao gồm id (ma_nhan_vien, ma_khach_hang), ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi.
select nv.ma_nhan_vien, nv.ho_ten, nv.email, nv.so_dien_thoai, nv.ngay_sinh, nv.dia_chi
from nhan_vien nv
union
select kh.ma_khach_hang, kh.ho_ten, kh.email, kh.so_dien_thoai, kh.ngay_sinh, kh.dia_chi
from khach_hang kh;

 

