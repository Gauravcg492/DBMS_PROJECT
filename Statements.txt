1.CREATE TABLE District(dis_id int primary key, dname varchar(20) not null);

2.create table Hospital(h_id int primary key, hname varchar(50) not null, dis_id int not null,constraint fk_hd FOREIGN KEY (dis_id) references district(dis_id));

3.create table blood(hid int, blood_grp varchar(5), blood_quantity int not null, constraint pk_hb PRIMARY KEY (hid,blood_grp));

4.create table Donor(d_id int primary key, name varchar(20) not null, phno bigint not   null,sex varchar(5) not null,quantity int not null, db_grp varchar(5) not null,dreg_date date not null, dis_id int not null, constraint fk_dd FOREIGN KEY (dis_id) references district(dis_id));

5.create table Phisique(donor_id int not null, height int not null, weight int not null, age int not null,consumes_alcohol varchar(3) not null, last_donated date not null, check(age>=16), constraint fk_pd FOREIGN KEY (donor_id) references donor(d_id));

6.create table Blood_Recipient(r_id int primary key, rname varchar(20) not null, age int not null, rb_grp varchar(5) not null, qty int not null, r_regdate date not null, sex varchar(5) not null, phno bigint not null, dis_id int not null, constraint fk_rd FOREIGN KEY (dis_id) references district(dis_id));

7.create table Provides(h_id int, r_id int,constraint fk_hp FOREIGN KEY (h_id) references hospital(h_id),constraint fk_hor FOREIGN KEY (r_id) references blood_recipient(r_id), constraint pk_hpr PRIMARY KEY (h_id,r_id));

8.create table Donated_by(h_id int, d_id int,constraint fk_hdb FOREIGN KEY (h_id) references hospital(h_id),constraint fk_ddb FOREIGN KEY (d_id) references donor(d_id), constraint pk_hdd PRIMARY KEY (h_id,d_id));

9.create table Bill_Payment(bill_id int primary key, billdate date not null, quantity int not null,b_grp varchar(5) not null, total_price int not null, r_id int not null, h_id int not null, constraint fk_bh FOREIGN KEY (h_id) references hospital(h_id),constraint fk_br FOREIGN KEY (r_id) references blood_recipient(r_id));