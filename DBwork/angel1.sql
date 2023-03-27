    --���� 
    --���̺� ���� (student) : num ����(5),name ���ڿ�(10),height ���� (5,1),
    --java ����(3) �⺻�� 10 ,spring ���� (3) �⺻�� 10,ban ���ڿ�(20)
     create table student(
     num number(5),name varchar2(10),height number(5,1),
     java number(3) default 10,spring number(3) default 10,
     ban varchar2(20)
     );
    
    --������ ���� seq_stu �⺻ (1���� 1������) , nocache �߰�
    CREATE SEQUENCE SEQ_stu START WITH 1 INCREMENT BY 1 nocache;
    --�������ǵ� �߰�
    --num�� primary key  �߰�
     alter table student add constraint STUDENT_PK_NUM primary key(NUM);
    --java��  spring�� 1~100�� �����ϵ��� check�������� �߰�
    alter table student add constraint STUDENT_CK_JAVA CHECK(JAVA>=1 AND JAVA<=100);
    alter table student add constraint STUDENT_CK_SPRING CHECK(SPRING>=1 AND SPRING<=100);
    --ban�� '�޴Թ�','�޴Թ�','���Թ�' �� �߰��ϵ��� check ���� ���� �߰�
    alter table student add constraint STUDENT_CK_BAN CHECK(BAN IN('�޴Թ�','�޴Թ�','���Թ�'));
    --5�� ���� ������ �߰�
    INSERT INTO STUDENT (NUM,NAME,JAVA,HEIGHT,BAN) VALUES(SEQ_STU.NEXTVAL,'������',89,167.5,'�޴Թ�');
    INSERT INTO STUDENT VALUES(SEQ_STU.NEXTVAL ,'��ȿ��',178.6,70,88,'�޴Թ�');
    INSERT INTO STUDENT VALUES(SEQ_STU.NEXTVAL ,'������',160.6,100,88,'���Թ�');
    INSERT INTO STUDENT VALUES(SEQ_STU.NEXTVAL ,'�躴��',158.6,60,66,'�޴Թ�');
    INSERT INTO STUDENT VALUES(SEQ_STU.NEXTVAL ,'�̼���',160.6,60,68,'�޴Թ�');
    COMMIT;
    
    --NUM�� 3�� ����� JAVA������ 99�� , BAN �� '�޴Թ�'���� ����
    UPDATE STUDENT SET JAVA=99,BAN='�޴Թ�' WHERE NUM=3;
    --NUM�� 5�� ����� Ű�� 188.9�� ����
    UPDATE STUDENT SET HEIGHT=188.9 WHERE NUM=5;
    --NUM�� 2�� ����� ������ ����
     delete from STUDENT where NUM=2;
     
    --��ȸ �̸� �� �ڹ� ������ ���� ���   ���-������ ����������� ���
    select name �̸�, ban �� ,java �ڹ�,spring ������, java+spring ����,
    (java+spring)/2 ��� from student order by ���� desc;
    
    commit;
    --DB ����ȭ(Nomalization)
    --����ȭ��? �Ѹ���� DB������ �޸𸮸� �������� �ʱ� ���ؼ�
    --� ���̺��� �ĺ��ڸ� ������ �������� ���̺�� ������ ������ ����ȭ�����
    --����ȭ�� �����ͺ��̽��� �ߺ��� �ּ�ȭ �ǵ��� ����� �����ͺ��̽��̴�.
    --����:�޸� ����,����ȭ�� �ý������� ���Ͽ� �����ϱ� ���ϴ�
    --����:��ȸ������ �ſ� ���� �ý����� ��쿡�� ���̺��� join������ �ݺ������� 
    --�̷����� ������ ���� ���� �ӵ��� �ణ ���������ִ�
    
    --student �� num�� �ܺ�Ű�� ���� ���ο� ���̺� stuinfo�� ������
    --�ܺ�Ű�� ���̺� ������ �����ص��ǰ�  ������ ���̺�������� �߰��ص���
    --ppt29p
    create table stuinfo(
        idx number(5) constraint info_pk_idx primary key,
        num number(5),
        addr varchar2(20),
        hp varchar(15)
    );
    --�ܺ�Ű ��������
    --stuinfo�� num �� student�� num���� ���� �� �ֵ��� ����
    alter table stuinfo add constraint info_fk_num foreign key(num) references student(num);
    --stuinfo �� num�� ���� 3�� �߰��ߴٸ� student table���� num�� 3�� �����ʹ� ������ �� ����
    --�� �������� �߰��� on delete cascade�� �߰�������� �θ����̺��� num=3�� �����͸� ������
    --stuinfo�� num=3,�� ��絥���ʹ� �ڵ����� �����ȴ�.
    --stuinfo��  ������ �߰��ϱ�
    insert into stuinfo values(seq_stu.nextval,3,'����� ������','010-2222-3333');
    --student�� ���� 2�� �߰�
   -- ORA-02291: ���Ἲ ��������(ANGEL.INFO_FK_NUM)�� ����Ǿ����ϴ�- �θ� Ű�� �����ϴ�
     insert into stuinfo values(seq_stu.nextval,2,'����� ������','010-2345-6789');
    --4���߰�
    insert into stuinfo values(seq_stu.nextval,4,'����� ������','010-2345-6789');
    insert into stuinfo values(seq_stu.nextval,1,'���ֵ� �ֿ���','010-7777-7777');
    commit;
    
    --��ȸ
    --���� ��ȸ �Ұ�� ��� ������ �˼� ����
    select * from stuinfo;
    --join���� �����̺��� ���ļ� �ʿ��� ���� ��������
    --ppt43p
    --inner join or equi join�̶�� �Ѵ�. ���� num���� ���� ��쿡�� ������
    select sd.num ������ ,sd.name �л���, sd.height Ű, sd.ban ��, si.addr �ּ�, si.hp �ڵ���,
    sd.java �ڹ�,sd.spring ������
    from student sd,stuinfo si
    where sd.num=si.num;
    
    --�̶� ���� ���̺� ���������� �������ִ� �÷� �����ϰ�� �տ� ���̺�� ��������
     select sd.num ������ ,name �л���, height Ű, ban ��, addr �ּ�, hp �ڵ���,
    java �ڹ�,spring ������
    from student sd,stuinfo si
    where sd.num=si.num;
    
    --outer join ���� �߰� �������� �����͸� ã�ƺ���
    --�ܺ�Ű�� ����� �������̺��ʿ� (+)
     select sd.num ������ ,name �л���, height Ű, ban ��, addr �ּ�, hp �ڵ���,
    java �ڹ�,spring ������
    from student sd,stuinfo si
    where sd.num=si.num(+) and addr is null;
    
    --student table�� num=1 �� ������ ����
   -- ORA-02292: ���Ἲ ��������(ANGEL.INFO_FK_NUM)�� ����Ǿ����ϴ�- �ڽ� ���ڵ尡 �߰ߵǾ����ϴ�
   -- ������ �Ϸ��� stuinfo�� �����͸� ���� ������ �� student ������ ��������
    delete from student where num=1;
    --sub table�� num=1�� ������ student table num=1 ���� 
    delete from stuinfo where num=1;
    delete from student where num=1;
    
    --���̺� ���Ž� �������̺��� ���� ������ �θ� ���̺� ����
    drop table stuinfo;
    drop table student;
    -----------------------------------------------------------------------------
    --�̹�����  �θ����̺��� ������ ������ �������̺��� �����͵� �ڵ����� ���� �ǵ��� 
    --�ܺ�Ű�� �����غ���
    --������ ����
    create sequence seq_shop;
    --shop, cart
create table shop(
sang_no number(3) constraint shop_pk_no primary key,
sang_name varchar2(30), sang_price number(10)
);
--�ܺ�Ű ������ on delete cascade �� ���̸� �θ����̺� ������ �ڽ����̺� �߰���
--�����͵� ���� ������
create table cart(
    cart_no number(3) constraint cart_pk_no primary key,
    sang_no number(3),
    cnt number(3),
    cartday date,
    constraint cart_fk_no foreign key(sang_no)references shop(sang_no) on delete cascade
);
--5���� ��ǰ  ���
insert into shop values(seq_shop.nextval,'���콺',12000);
insert into shop values(seq_shop.nextval,'����',19000);
insert into shop values(seq_shop.nextval,'û����',25000);
insert into shop values(seq_shop.nextval,'üũ��Ʈ',99000);
insert into shop values(seq_shop.nextval,'Ƽ����',11000);
commit;

--3���� ��ǰ�� īƮ�� ��ƺ���
insert into cart values(seq_shop.nextval,2,3,sysdate);
insert into cart values(seq_shop.nextval,3,1,'2023-01-13');
insert into cart values(seq_shop.nextval,5,3,sysdate);
commit;
--��ȸ
--sang_no ��ǰ��ȣ, ��ǰ��, �ܰ�, ����, ������(��4-��2-��2 ����) ���
select 
s.sang_no ��ǰ��ȣ,sang_name ��ǰ��,
to_char(sang_price,'L999,999') �ܰ�, cnt ����,
to_char(cartday,'YYYY-MM-DD')������
from shop s,cart c
where s.sang_no=c.sang_no;
--cart �� ����� ���� ��ǰ�� ��ǰ��ȣ�� ��ǰ�� ���
select
s.sang_no ��ǰ��ȣ,sang_name ��ǰ��
from shop s,cart c
where s.sang_no=c.sang_no(+)and cnt is null;
--����Ȯ�� (2,3,5 �� ��ǰ�� cart�� �������)
--shop�� 2,3 �� ������ cart ���̺� Ȯ��
delete from shop where sang_no=2 or sang_no=3;

--���� ������ ��� ���̺�� ������ ����
drop sequence seq_shop;
drop sequence seq_stu;
drop sequence seq1;
drop sequence seq3;

drop table cart;
drop table shop1;
drop table person;