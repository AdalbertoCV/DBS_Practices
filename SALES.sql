create table shop(
shop_id number,
adress varchar2(50),
shop_manager varchar2(50)
);
create table product(
product_id number,
pname varchar2(20),
sale_price number,
purchase_price number,
provider varchar2(20)
);
create table channel(
channel_id number,
cname varchar2(20)
);

create table employee(
emp_id number,
emp_name varchar2(30),
emp_lastn varchar2(25),
boss_id number,
adress varchar2(50),
date_of_birth date,
gender varchar2(10),
beneficiaries varchar2(100)
);
create table sales(
sale_id number,
channel_id number,
product_id number,
shop_id number,
quantity number,
emp_id number,
sale_date date
);

-- constraints
alter table shop add constraint shop_pk primary key (shop_id);
alter table product add constraint product_pk primary key (product_id);
alter table channel add constraint channel_pk primary key (channel_id);
alter table employee add constraint emp_pk primary key (emp_id);
alter table sales add constraint sales_pk primary key (sale_id);
alter table shop add constraint shop_ad_nn check (adress <> null);
alter table product add constraint prod_name_nn check (pname <> null);
alter table product add constraint sp_name_nn check (sale_price <> null);
alter table product add constraint pp_name_nn check (purchase_price <> null);
alter table channel add constraint ch_name_nn check (cname <> null);
alter table employee add constraint emp_name_nn check (emp_name <> null);
alter table employee add constraint emp_lname_nn check (emp_lastn <> null);
alter table sales add constraint sales_qua_ck check (quantity >0);
alter table sales add constraint emp_sales_fk foreign key (emp_id)
references employee(emp_id);
alter table sales add constraint shop_sales_fk foreign key (shop_id)
references shop(shop_id);
alter table sales add constraint product_sales_fk foreign key (product_id)
references product(product_id);
alter table sales add constraint channel_sales_fk foreign key (channel_id)
references channel(channel_id);

-------Sequences
create sequence shop_id_sq
increment by 1
start with 1
nomaxvalue
nominvalue
nocache
nocycle;
create sequence prod_id_sq
increment by 100
start with 1000
nomaxvalue
minvalue 1000
nocache
nocycle;
create sequence chan_id_sq
increment by 1
start with 1
nomaxvalue
nominvalue
nocache
nocycle;
create sequence emp_id_sq
increment by 1
start with 1000
nomaxvalue
minvalue 1000
nocache
nocycle;
create sequence sale_id_sq
increment by 1
start with 1000
nomaxvalue
minvalue 1000
nocache
nocycle;
--- Synonyms
create synonym sp for shop;
create synonym pr for product;
create synonym cn for channel;
create synonym ep for employee;
create synonym sl for sales;


insert into pr values (prod_id_sq.NEXTVAL, 'Almond Milk', 15, 10,'Alpura');
insert into pr values (prod_id_sq.NEXTVAL, 'Water', 10, 7,'Bonafont');
insert into pr values (prod_id_sq.NEXTVAL, 'Fanta', 16, 11,'Coca-Cola');
insert into pr values (prod_id_sq.NEXTVAL, 'Ruffles', 18, 14,'Sabritas');
insert into pr values (prod_id_sq.NEXTVAL, 'Marias Cookies', 9, 5,'Gamesa');

select * from pr;

insert into ep values (emp_id_sq.NEXTVAL, 'Steven', 'King', null,'Roses st. 12', '12/01/98','Male','None');
insert into ep values (emp_id_sq.NEXTVAL, 'Alan', 'Turner', null,'Margaret st. 14', '14/01/99','Male','None');
insert into ep values (emp_id_sq.NEXTVAL, 'Ericka', 'Miles', null,'Park st. 43', '12/09/00','Female','None');
insert into ep values (emp_id_sq.NEXTVAL, 'Axel', 'Steel', null,'Guns st. 34', '23/02/97','Male','None');
insert into ep values (emp_id_sq.NEXTVAL, 'Diana', 'Liam', null,'Pineapple st. 11', '10/04/98','Female','None');

select * from ep;

insert into sp values (shop_id_sq.NEXTVAL, 'P.Sherman Wallaby 42', 'Stephen King');
insert into sp values (shop_id_sq.NEXTVAL, 'Always green 34', 'Alex Turner');
insert into sp values (shop_id_sq.NEXTVAL, 'Zera planet 21', 'Axl Rose');
insert into sp values (shop_id_sq.NEXTVAL, 'Erichson 12', 'Oliver Sykes');
insert into sp values (shop_id_sq.NEXTVAL, 'truman 13', 'Chester Bennington');

select * from sp;
