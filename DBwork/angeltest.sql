CREATE SEQUENCE seq_food START WITH 1 INCREMENT BY 1 nocache;

create table restaurant(
food_num number(5) constraint restaurant_pk_food_num primary key,
food_name varchar2(30),
food_price number(7)
);

create table resorder(
order_num number(5) constraint resorder_pk_order_num primary key,
order_name varchar2(20),
food_num number(5),
constraint resorder_fk_num foreign key(food_num)references restaurant(food_num) on delete cascade,
order_day date,
jumun_day date,
inwon number(3)
);
insert into restaurant values(seq_food.nextval,'���İ�Ƽ',23000);
insert into restaurant values(seq_food.nextval,'���캺����',11000);
insert into restaurant values(seq_food.nextval,'������',19000);
insert into restaurant values(seq_food.nextval,'����Ƣ��',10000);
insert into restaurant values(seq_food.nextval,'¥���',6000);

insert into resorder values(seq_food.nextval,'�̻��',1,'2022-11-20',sysdate,4);
insert into resorder values(seq_food.nextval,'��ȣ��',2,'2022-12-25',sysdate,3);
insert into resorder values(seq_food.nextval,'��ȣ��',3,'2022-12-20',sysdate,3);
insert into resorder values(seq_food.nextval,'�̿���',1,'2023-3-10',sysdate,2);

select
rt.food_num ���Ĺ�ȣ, order_name �ֹ���, order_day ������,
food_name ���ĸ�, food_price ����, to_char(jumun_day, 'YYYY-MM-DD')�ֹ���,
inwon �ο�
from restaurant rt,resorder ro
where rt.food_num=ro.food_num;

delete from restaurant where food_num=3;

drop sequence seq_food;
drop table resorder;
drop table restaurant;

commit;