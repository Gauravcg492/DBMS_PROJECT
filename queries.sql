/*1.display no of blood recipients in districts*/
select d.dname, count(r.r_id) as No_of_recipients from district d, blood_recipient r where r.dis_id=d.dis_id group by d.dis_id;

/*2.display no_of_donos in districts*/
select d.dname, count(r.r_id) as No_of_donors from district d, donor do where do.dis_id=d.dis_id group by d.dis_id;

/*3.display no of recipients in each hospital*/
select h.hname, count(r.r_id) as blood_recipients from hospital h, provides p,blood_recipient r where p.r_id=r.r_id and p.h_id=h.h_id group by h.h_id;

/*4.display no of donors donated in each hospital*/
select h.hname, count(d.d_id) as No_of_donors from hospital h, donated_by db, donor d where db.d_id=d.d_id and db.h_id=h.h_id group by h.h_id order by h.h_id;

/*5.bill payment details of a particular recipient*/
select r.rname,h.hname,b.bill_id,b.quantity,b.b_grp,b.total_price from bill_payment b natural join hospital h,blood_recipient r where b.r_id=r.r_id and r.rname like 'Ramesh%';

/*6.Hospitals in a particular district with sufficient amount of a specific blood grp*/
select h.h_id,h.hname,b.blood_grp,b.blood_quantity from hospital h inner join blood b on h.h_id=b.hid,district d where h.dis_id=d.dis_id and d.dis_id = 2 and b.blood_grp = 'A+';

/*7.list of hospitals with insufficient blood of a particular group*/
(select d.dis_id, h.h_id, h.hname from hospital h inner join blood b on h.h_id=b.hid, district d where h.dis_id=d.dis_id) except (select d.dis_id, h.h_id, h.hname from hospital h inner join blood b on h.h_id=b.hid, district d where h.dis_id=d.dis_id and b.blood_grp='A+'); 

/*8.list of donors who are eligible to donate*/
select d.d_id,d.name from donor d inner join phisique p on d.d_id=p.donor_id where p.consumes_alcohol='No' and d.dreg_date-p.last_donated > 90 and p.age > 16;

/*9.blood groups available at that hospital*/
select b.blood_grp,b.blood_quantity from hospital h inner join blood b on h.h_id=b.hid where h.hname like 'Lady%';

/*10.list of donors who donated after a particular date*/
select dis.dname,h.hname,d.d_id,d.name,d.dreg_date from donor d,district dis,hospital h,donated_by db where d.dreg_date > '12/2/2016' and  db.h_id=h.h_id and db.d_id=d.d_id and d.dis_id=dis.dis_id;

/*11.list of donors who have a particular blood grp and belong to a particular district and he is eligible to donate*/
select d.d_id,d.name from donor d inner join phisique p on d.d_id=p.donor_id where p.consumes_alcohol='No' and d.dreg_date-p.last_donated > 90 and p.age > 16 and d.dis_id=4 and d.db_grp='O-';