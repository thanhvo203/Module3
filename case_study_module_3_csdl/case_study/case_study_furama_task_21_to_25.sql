use
case_study_furama;

-- task 11: 21.	Tạo khung nhìn có tên là v_nhan_vien để lấy được thông tin của tất cả các nhân viên
-- có địa chỉ là “Hải Châu” và đã từng lập hợp đồng cho một hoặc nhiều khách hàng bất kì với ngày lập hợp đồng là “12/12/2019”.
create view v_nhan_vien as
select nv.ma_nhan_vien, nv.ho_ten, nv.ngay_sinh, nv.so_cmnd, nv.so_dien_thoai, nv.email, nv.dia_chi
from nhan_vien nv
where nv.dia_chi like '% Đà Nẵng';

drop view v_nhan_vien;
-- task 22: 22.	Thông qua khung nhìn v_nhan_vien thực hiện cập nhật địa chỉ thành “Liên Chiểu” đối với tất cả các nhân viên được nhìn thấy bởi khung nhìn này.

update v_nhan_vien
set dia_chi = 'Huế'
where ma_nhan_vien = 2;

-- task 23: 23.	Tạo Stored Procedure sp_xoa_khach_hang dùng để xóa thông tin của một khách hàng
-- nào đó với ma_khach_hang được truyền vào như là 1 tham số của sp_xoa_khach_hang.
DELIMITER
//
CREATE PROCEDURE sp_xoa_khach_hang(id_khach_hang int)
BEGIN
delete
from khach_hang khsp_xoa_khach_hang
where kh.ma_khach_hang = id.khach_hang;
END;
//
DELIMITER ;

-- task 24: 24.	Tạo Stored Procedure sp_them_moi_hop_dong dùng để thêm mới vào bảng hop_dong với yêu cầu sp_them_moi_hop_dong
-- phải thực hiện kiểm tra tính hợp lệ của dữ liệu bổ sung,
-- với nguyên tắc không được trùng khóa chính và đảm bảo toàn vẹn tham chiếu đến các bảng liên quan.

delimiter
//
create procedure sp_them_moi_hop_dong(ma_hop_dong int, ngay_hop_dong datetime, ngay_ket_thuc datetime,
                                      tien_dat_coc double, ma_nhan_vien int, ma_khach_hang int, ma_dich_vu int)
begin
   if
((select ma_hop_dong from hop_dong) in (sp_them_moi_hop_dong.ma_hop_dong)) then
   signal sqlstate "10000"
   set message_text =  "Mã đã trùng lăp. Vui lòng nhập vào mã khác";
else
      insert into hop_dong
      values(ma_hop_dong , ngay_hop_dong,ngay_ket_thuc,tien_dat_coc,ma_nhan_vien,ma_khach_hang,ma_dich_vu);
end if;
end;
//
delimiter // ;

drop procedure sp_them_moi_hop_dong;

-- task 25: 25.	Tạo Trigger có tên tr_xoa_hop_dong khi xóa bản ghi trong bảng hop_dong thì 
-- hiển thị tổng số lượng bản ghi còn lại có trong bảng hop_dong ra giao diện console của database.
-- Lưu ý: Đối với MySQL thì sử dụng SIGNAL hoặc ghi log thay cho việc ghi ở console.
