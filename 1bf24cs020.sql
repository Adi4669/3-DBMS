show databases;
use newdatabase;

create table product(prodID int(4), prodCode varchar(10), name varchar(20), quantity int(5), price float);

insert into product(prodID, prodCode, name, quantity, price)
values(1001, "PEN", "Pen Red", 5000, 1.23);

insert into product(prodID, prodCode, name, quantity, price)
values(1002, "PEN", "Pen Blue", 8000, 1.25);

insert into product(prodID, prodCode, name, quantity, price)
values(1003, "PEN", "Pen Black", 2000, 1.25);

insert into product(prodID, prodCode, name, quantity, price)
values(1004, "PEC", "Pencil 2B", 10000, 0.48);

insert into product(prodID, prodCode, name, quantity, price)
values(1004, "PEC", "Pencil 2H", 8000, 0.49);

insert into product(prodID, prodCode, name, quantity, price)
values(1004, "PEC", "Pencil HB", 0, 9999999.99);

select * from product;