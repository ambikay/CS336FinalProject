#create database cs336FinalProjectBuyMe
#use cs336FinalProjectBuyMe
#create table admin_staff_member(aid int, email varchar(50), login_name varchar(50), num_reports int, password varchar(50), primary key (aid))
#create table customer_rep(cid int, aid int, email varchar(50), login_name varchar(50), password varchar(50), primary key (cid), foreign key (aid) references admin_staff_member (aid))
#create table enduser(eid int, login_name varchar(50), email varchar(50), password varchar(50), is_seller boolean, primary key (eid))
#create table assists(cid int, eid int, question varchar(100), answer varchar(100), primary key (cid,eid), foreign key (cid) references customer_rep(cid), foreign key (eid) references enduser(eid))
#create table items(eid int, item_id int, start_date date, start_time time, end_date date, end_time time, min_price double, initial_price double, bid_increment double, primary key (item_id), foreign key (eid) references enduser(eid))
#create table buys(eid int, item_id int, initial_bid double, current_bid double, upper_limit double, alert_message varchar(100), primary key (eid,item_id), foreign key (eid) references enduser(eid), foreign key (item_id) references items(item_id))
#create table car(item_id int, color varchar(20), make varchar(20), model varchar(20), year varchar(4), primary key (item_id), foreign key (item_id) references items(item_id))
#create table motorbike(item_id int, color varchar(20), type varchar(20), company_name varchar(20), primary key (item_id), foreign key (item_id) references items(item_id))
#create table truck(item_id int, capacity int, size int, dimensions varchar(20), primary key (item_id), foreign key (item_id) references items(item_id))
#select * from enduser
#select count(*) from enduser
