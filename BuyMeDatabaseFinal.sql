create database BuyMeDatabaseFinal;
use BuyMeDatabaseFinal;
create table admin_staff_member(aid int, email varchar(50), login_name varchar(50), num_reports int, password varchar(50), primary key (aid));
create table customer_rep(cid int, aid int, email varchar(50), login_name varchar(50), password varchar(50), primary key (cid), foreign key (aid) references admin_staff_member (aid));
create table enduser(eid int, login_name varchar(50), email varchar(50), password varchar(50), is_seller boolean, primary key (eid));
create table assists(cid int, eid int, question varchar(100), answer varchar(100), primary key (cid,eid), foreign key (cid) references customer_rep(cid), foreign key (eid) references enduser(eid));
create table items(eid int, item_id int, start_date date, start_time time, end_date date, end_time time, min_price double, initial_price double, bid_increment double, current_bid double, primary key (item_id), foreign key (eid) references enduser(eid));
create table buys(eid int, item_id int, initial_bid double, current_bid double, upper_limit double, alert_message varchar(100), primary key (eid,item_id), foreign key (eid) references enduser(eid), foreign key (item_id) references items(item_id));
create table bid_history(bid_id int, eid int, item_id int, bid double, primary key (bid_id), foreign key (eid) references enduser(eid));
create table car(item_id int, make varchar(20), model varchar(20), year varchar(4), primary key (item_id), foreign key (item_id) references items(item_id));
create table motorbike(item_id int, color varchar(20), type varchar(20), company_name varchar(20), primary key (item_id), foreign key (item_id) references items(item_id));
create table truck(item_id int, capacity int, size int, dimensions varchar(20), primary key (item_id), foreign key (item_id) references items(item_id));
create table current_users(user_type varchar(20), id int, primary key (id), foreign key (id) references enduser(eid));

-- sample data for testing
insert into enduser(eid,login_name, email, password) values (1,"admin", "admin@gmail.com", "adminuser123");
insert into enduser(eid,login_name, email, password) values (2,"mark", "mark@gmail.com", "markuser123");
insert into items(item_id, current_bid, start_date) values (1,25.50, curdate()), (2,20.0, curdate()), (3,10.0, curdate()), (4,30.0, curdate()), (5,29.0, curdate()), (6,18.0, curdate());
insert into car(item_id, make, model, year) values (1, "Honda", "Civic", "2016"), (2, "Toyota", "Rav4", "2012");
insert into motorbike(item_id, color, type, company_name) values (3, "blue", "bullet", "yamaha"), (4, "red", "speed", "royal enfield");
insert into truck(item_id, capacity, size, dimensions) values (5, 2, 50, "2x3"), (6, 4, 80, "6x4");
