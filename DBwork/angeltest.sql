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
insert into restaurant values(seq_food.nextval,'스파게티',23000);
insert into restaurant values(seq_food.nextval,'새우볶음밥',11000);
insert into restaurant values(seq_food.nextval,'전복죽',19000);
insert into restaurant values(seq_food.nextval,'새우튀김',10000);
insert into restaurant values(seq_food.nextval,'짜장면',6000);

insert into resorder values(seq_food.nextval,'이상아',1,'2022-11-20',sysdate,4);
insert into resorder values(seq_food.nextval,'강호동',2,'2022-12-25',sysdate,3);
insert into resorder values(seq_food.nextval,'강호동',3,'2022-12-20',sysdate,3);
insert into resorder values(seq_food.nextval,'이영자',1,'2023-3-10',sysdate,2);

select
rt.food_num 음식번호, order_name 주문자, order_day 예약일,
food_name 음식명, food_price 가격, to_char(jumun_day, 'YYYY-MM-DD')주문일,
inwon 인원
from restaurant rt,resorder ro
where rt.food_num=ro.food_num;

delete from restaurant where food_num=3;

drop sequence seq_food;
drop table resorder;
drop table restaurant;

commit;