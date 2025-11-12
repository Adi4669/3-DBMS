create database supplier;
use supplier;

create table supplier(sid int primary key, sname varchar(255), city varchar(255));
desc supplier;
insert into supplier values
(10001, "Acme Widget", "Bengaluru"),
(10002, "Johns", "Kolkata"),
(10003, "Vimal", "Mumbai"),
(10004, "Reliance", "Delhi");

create table parts(pid int primary key, pname varchar(255), color varchar(255));
desc parts;
insert into parts values
(20001, "Book", "Red"),
(20002, "Pen", "Red"),
(20003, "Pencil", "Green"),
(20004, "Mobile", "Green"),
(20005, "Charger", "Black");

create table catalog(sid int, pid int, cost decimal(10, 2), foreign key(sid) references supplier(sid), foreign key(pid) references parts(pid));
desc catalog;
insert into catalog values
(10001, 20001, 10),
(10001, 20002, 10),
(10001, 20003, 30),
(10001, 20004, 10),
(10001, 20005, 10),
(10002, 20001, 10),
(10002, 20002, 20),
(10003, 20003, 30),
(10004, 20003, 40);

select * from supplier;
select * from parts;
select * from catalog;

-- query 3
select distinct p.pname
from parts p
join catalog c
on p.pid = c.pid;

-- query 4
select s.sname
from supplier s
join catalog c
on s.sid = c.sid
group by s.sid, s.sname
having count(distinct c.pid) = (select count(*) from parts);

-- query 5
select s.sname as supplier_supplying_all_red_parts
from supplier s
join catalog c on s.sid = c.sid
join parts p on c.pid = p.pid
where p.color = "red"
group by s.sid
having count(p.color) = (select count(*) from parts where color = "red");

-- query 6
select p.pname from parts p
join catalog c on p.pid = c.pid
group by p.pid, p.pname
having count(distinct c.sid) = 1
and max(c.sid) = (select sid from supplier where sname = "Acme Widget");