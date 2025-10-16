SHOW DATABASES;
create database insurance;
use insurance;

create table person(driver_id varchar(20), name varchar(20), address varchar(20), primary key(driver_id));
desc person;
insert into person values("A01", "Ram", "Srinivas Nagar");
insert into person values("A02", "Lakshman", "JP Nagar");
insert into person values("A03", "Bharath", "Whitefield");
insert into person values("A04", "Shatru", "Basavangudi");
insert into person values("A05", "Shatru", "Rajaji Nagar");

create table car(reg_num varchar(20), model varchar(20), year int(4), primary key(reg_num));
desc car;
insert into car values("KA052250", "Indica", 1990);
insert into car values("KA031180", "lancer", 1957);
insert into car values("KA095477", "Toyota", 1998);
insert into car values("KA053408", "Honda", 2008);
insert into car values("KA041702", "Audi", 2005);

create table accident(report_num int(5), accident_date date, location varchar(20), primary key(report_num));
desc accident;
insert into accident values(11, "2003-01-01", "Mysore Road");
insert into accident values(12, "2004-02-02", "South End Circle");
insert into accident values(13, "2003-01-21", "Bull Temple Road");
insert into accident values(14, "2008-02-17", "Mysore Road");
insert into accident values(15, "2004-03-05", "Kanakpura Road");

create table owns(driver_id varchar(20), reg_num varchar(20), primary key(driver_id, reg_num), foreign key(driver_id) references person(driver_id));
desc owns;
insert into owns values("A01", "KA052250");
insert into owns values("A02", "KA053408");
insert into owns values("A03", "KA031180");
insert into owns values("A04", "KA095477");
insert into owns values("A05", "KA041702");

create table participated(driver_id varchar(20), reg_num varchar(20), report_num int(5), damage_amt int(5), primary key(driver_id, reg_num, report_num), foreign key(driver_id) references person(driver_id));
desc participated;
insert into participated values("A01", "KA052250", 11, 10000);
insert into participated values("A02", "KA053408", 12, 50000);
insert into participated values("A03", "KA031180", 13, 25000);
insert into participated values("A04", "KA095477", 14, 3000);
insert into participated values("A05", "KA041702", 15, 5000);

UPDATE person
SET name = 'Arjun'
WHERE driver_id = 'A05';

select * from person;

select * from car;
select * from car order by year;

select * from participated order by damage_amt desc;#todo1
select avg(damage_amt) from participated where damage_amt is not null;#todo2-18600.00
select max(damage_amt) from participated;
select count(distinct model) from car;

select name from person p, participated q where p.driver_id = q.driver_id and q.damage_amt > (select avg(damage_amt) from participated where damage_amt is not null);

select * from person;
select * from car;
select * from accident;
select * from owns;
select * from participated;
