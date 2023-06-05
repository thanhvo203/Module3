create
database management_sales;
use
management_sales;

create table customer
(
    customer_id   int primary key auto_increment,
    customer_name varchar(50) not null,
    customer_age  tinyint
);
create table `order`
(
    order_id          int primary key auto_increment,
    customer_id       int,
    foreign key (customer_id) references customer (customer_id),
    order_date        datetime,
    order_total_price int
);
create table product
(
    product_id    int primary key auto_increment,
    product_name  varchar(50) not null,
    product_price int
);
create table order_detail
(
    order_id      int,
    product_id    int,
    order_quality int,
    primary key (order_id, product_id),
    foreign key (order_id) references `order` (order_id),
    foreign key (product_id) references product (product_id)
);

insert into customer (customer_name, customer_age)
values ('Minh Quan', 10),
       ('Ngoc Oanh', 20),
       ('Hong Ha', 50);
insert into `order` (customer_id, order_date, order_total_price)
values (1, '2006-3-21 15:45:21', null),
       (2, '2006-3-23 15:45:21', null),
       (1, '2006-3-16 14:56:59', null);


insert into product (product_name, product_price)
values ('May Giat', 3),
       ('Tu Lanh', 5),
       ('Dieu Hoa', 7),
       ('Quat', 2),
       ('Bep Dien ', 1);

insert into order_detail (order_id, product_id, order_quality)
values (1, 1, 3),
       (1, 3, 7),
       (1, 4, 2),
       (2, 1, 1),
       (3, 1, 8),
       (2, 5, 4),
       (2, 3, 3);

-- Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order
select order_id, order_date, order_total_price
from `order`;

-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách
select customer.customer_name, product.product_name, `order`.order_date
from customer
         join `order`
              on customer.customer_id = `order`.customer_id
         join order_detail
              on order_detail.order_id = `order`.order_id
         join product
              on product.product_id = order_detail.product_id;

-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
select customer.customer_name, `order`.order_date
from customer
         left join `order`
                   on customer.customer_id = `order`.customer_id
where `order`.customer_id is null;

-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn
-- (giá một hóa đơn được tính bằng tổng giá bán của từng loại mặt hàng xuất hiện trong hóa đơn. Giá bán của từng loại được tính = odQTY*pPrice)
select `order`.order_id, `order`.order_date, sum(order_quality * product_price) as 'doanh_thu'
from `order`
         join order_detail
              on `order`.order_id = order_detail.order_id
         left join product
                   on order_detail.product_id = product.product_id
group by `order`.order_id;
