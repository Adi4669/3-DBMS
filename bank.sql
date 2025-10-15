show databases;
create database bank;
use bank;

create table branch(branch_name varchar(255) primary key, branch_city varchar(255), assets real);
desc branch;
insert into branch values
("SBI_Marathalli", "Bengaluru", 60),
("SBI_GB_Road", "Delhi", 30),
("SBI_Bandra", "Mumbai", 15),
("SBI_Pimpri", "Pune", 40),
("SBI_MG_Road", "Bengaluru", 5);

create table bankAccount(acc_no int primary key, branch_name varchar(255), balance real, foreign key(branch_name) references branch(branch_name));
desc bankAccount;
insert into bankAccount values
(1001, "SBI_Marathalli", 540000),
(1002, "SBI_GB_Road", 600000),
(1003, "SBI_Bandra", 30000),
(1004, "SBI_Pimpri", 50000),
(1005, "SBI_MG_Road", 100000);

create table bankCustomer(customer_id int primary key, customer_name varchar(255), customer_street varchar(255), customer_city varchar(255));
desc bankCustomer;
insert into bankCustomer values
(1, "Ram", "1st Street", "Bengaluru"),
(2, "Lakshman", "10th Street", "Delhi"),
(3, "Bharath", "3rd Street", "Mumbai"),
(4, "Shatru", "2nd Street", "Pune"),
(5, "Arjun", "12th Street", "Bengaluru");

create table depositer(customer_id int, customer_name varchar(255), acc_no int primary key, foreign key (acc_no) references bankAccount(acc_no), foreign key(customer_id) references bankCustomer(customer_id));
desc depositer;
insert into depositer values
(1, "Ram", 1001),
(2, "Lakshman",  1002),
(3, "Bharath", 1003),
(4, "Shatru", 1004),
(5, "Arjun", 1005);

create table loan(loan_no int, branch_name varchar(255), amount real, primary key(loan_no), foreign key (branch_name) references branch(branch_name));
insert into loan values
(2001, "SBI_Marathalli", 150000),
(2002, "SBI_GB_Road", 2500000),
(2003, "SBI_Bandra", 300000),
(2004, "SBI_Pimpri", 150000),
(2005, "SBI_MG_Road", 1000000);

select * from branch ;
select * from bankAccount;
select * from bankCustomer;
select * from depositer;
select * from loan;

select branch_name, (assets / 10) as assets_in_lakhs from branch order by assets_in_lakhs desc;
select
	d.customer_id, d.customer_name, b.branch_name, count(d.acc_no) as account_count
from
	depositer d
join
	bankAccount b on d.acc_no = b.acc_no
group by
	d.customer_id, d.customer_name, b.branch_name
having count(d.acc_no) >= 2