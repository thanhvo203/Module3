create
database view_index_store_procedure;
use
view_index_store_procedure;

create table products
(
    id_product          int primary key auto_increment,
    product_code        int         not null,
    product_name        varchar(50) not null,
    product_price       double      not null,
    product_amount      int,
    product_description varchar(50),
    product_status      bit(1)
);
insert into products (product_code, product_name, product_price, product_amount, product_description, product_status)
    value (1,"Giày",2000,3,"Vans",1),
(2,"Dép",2000,5,"LuisVuitton",1),
(3,"Áo",2000,10,"Gucci",1);

explain
select *
from products;

-- Tạo Unique Index trên bảng Products (sử dụng cột productCode để tạo chỉ mục)     
create unique index index_code on products (product_code);

-- Tạo Composite Index trên bảng Products (sử dụng 2 cột productName và productPrice)
create index index_name_price on products (product_name, product_price);

-- Sử dụng câu lệnh EXPLAIN để biết được câu lệnh SQL của bạn thực thi như nào
explain
select *
from products;

-- Tạo view lấy về các thông tin: productCode, productName, productPrice, productStatus từ bảng products.
create view view_product (product_code, product_name, product_price, product_status) as
select product_code, product_name, product_price, product_status
from products;

-- Tiến hành sửa đổi view
update view_product
set product_name = "Đồng Hồ"
where product_code = 2;

select *
from view_product;

-- Tiến hành xoá view
drop view view_product;

-- Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product
delimiter
//
create procedure products_store_procedure()
begin
select *
from products;
end
// delimiter ;

call products_store_procedure;

-- Tạo store procedure thêm một sản phẩm mới
delimiter
//
create procedure add_product(product_code int, product_name varchar (20), product_price double)
begin
insert into products(product_code, product_name, product_price) value(product_code,product_name,product_price);
end
//
delimiter ;

call add_product(4,'Dep',200);

-- Tạo store procedure sửa thông tin sản phẩm theo id

delimiter
//
create procedure edit_product(id_product int, product_code int, product_name varchar (50), product_price double,
                              product_amount int, product_description varchar (50), product_status bit (1))
begin
update products
set product_code        = product_code,
    product_name        = product_name,
    product_price       = product_price,
    product_amount      = product_amount,
    product_description = product_description,
    product_status      = product_status
where id_product = id_product;
end
// delimiter ;

-- Tạo store procedure xoá sản phẩm theo id
delimiter
//
create procedure delete_product(id_product int)
begin
delete
from products
where id_product = id_product;
end
// delimiter ;

