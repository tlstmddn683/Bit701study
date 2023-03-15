    --ppt 23p table
    --table ���� (person): ��ȣ,�̸�,����,����,����,���糯¥
    create table person(
        num number(3) primary key,
        name varchar2(15) not NULL,
        age number(3),
        gender varchar2(10) default '����',
        city varchar2(15) default '����',
        today date
    );
    
    --������ ��ȸ
    select * from person;    
    
     --insert �÷������� �Ϻθ� �߰��� ���
     insert into person(num,name,today) values(1,'ȫ�浿',sysdate);
     --pk(primary key),nn(not null)�̰�� ���� �ȳ־��ָ� ���� �߻�-Ȯ��
     --ORA-01400: NULL�� ("ANGEL"."PERSON"."NUM") �ȿ� ������ �� �����ϴ�
     insert into person(name,age,today) values('��ö��',23,'2022-10-10');
     --nn �Ӽ��� �� �÷��� ������ �־���ߵȴ�, �̹����� num�� ���� ������ �־��
     --ORA-00001: ���Ἲ ���� ����(ANGEL.SYS_C008318)�� ����˴ϴ�
      insert into person(num,name,age,today) values(1,'��ö��',23,'2022-10-10');
      insert into person(num,name,age,today) values(2,'��ö��',23,'2022-10-10');
      --�Ϻ� �÷��� �ƴ϶� ������� ��� �÷����� ���� ��� �÷��� ��������
      insert into person values(3,'��ȣ��',34,'����','���ֵ�','2020-02-02');
      --���� 7��  ���� �߰�
      insert into person values(4,'��ȿ��',30,'����','�λ�','2019-01-02');
      insert into person values(5,'������',40,'����','�뱸',sysdate);
      insert into person values(6,'����',39,'����','����','2020-11-22');
      insert into person values(7,'��ȣ��',50,'����','����','2023-01-01');
      insert into person values(8,'��00',50,'����','����','2023-02-01');
      insert into person values(9,'��00',50,'����','����','2022-12-20');
      insert into person values(10,'��00',50,'����','����','2023-03-01');
      commit;
      
      --��00 �� age�� city ����
      update person set age=29,city='���ֵ�' where name='��00';
      --ȫ�浿�� ���̼���
      update person set age=29 where name='ȫ�浿';
      --������ today�� ���糯¥�� ����
      update person set today=sysdate where name = '����';
      commit;
      --delete: where ������ �Ⱦ��� ��ü�� ������
      delete from person;
      --�ٽ� �츮��
      rollback;--������ Ŀ�� ���ı����� �ѹ鰡��
      delete from person where name='ȫ�浿';
      --���̰� 30 �̸��� ���  ��� ����
     delete from person where age<30;
     rollback;
     --���ݺ��ʹ� ���̺� ���� ���� ����
     --���̺� �÷� �߰�
     alter table person add score number(3) default 50;
     --��� �߰��� score �÷� �����ϱ�
     alter table person drop column score; 
     --�÷� Ÿ�� ����
     alter table person modify city varchar2(20);
     --�÷��� ����
     alter table person rename column today to ipsaday;
     --�������� ����: name �� not null ���������� ����ִ�(�������� �̸��� ���༭ �⺻�̸����� ���ִ�.)
     --SYS_C008317����
     alter table person drop constraint SYS_C008317;
      --name�� ���ο� ���������� �߰��غ��� (unique)
      alter table person add constraint PERSON_UQ_NAME UNIQUE(NAME);
      --�̸��� ���� �̸��� ������ ���� ������ �߻���
      insert into person (num,name) values (11,'��ȣ��');--����
      --gender �� '����', '����' ���� �����͸� ������ ���� �߻��ǵ��� check �������� ���
      alter table person add constraint PERSON_CK_GENDER check(GENDER in('����','����'));
      --age �� 10~50���� �߰� �����ϵ��� ���������� �߰�
      alter table person add constraint PERSON_CK_AGE check(AGE>=10 AND AGE<=50);
      --���� ������ �����ϵ��� ���
      --ORA-02290: üũ ��������(ANGEL.PERSON_CK_AGE)�� ����Ǿ����ϴ�
      insert into person (num,name,age) values(100,'������',60);--�����߻�4
      --���� 
      --PK ���������� ������ PERSON_PK_NUM �̶�� ���ο� ���������� �߰��غ���
      alter table person drop constraint SYS_C008318;
      alter table person add constraint PERSON_PK_NUM primary key(NUM);
      --����2
      --buseo  ��� �÷� �߰� varchar2(10) �⺻���� '������'
      alter table person add buseo varchar2(10) default '������';
      --buseo�� �������� �߰� '������','ȫ����','�λ��' 3���� �߰��� �����ϵ��� ����
      alter table person add constraint PERSON_CK_BUSEO CHECK(BUSEO IN ('������','ȫ����','�λ��'));
      --����3
      --����,�̾� ���� ���� ������� ��� '�λ��'�� ������ ����
       update person set BUSEO='�λ��' WHERE NAME LIKE '��%' OR NAME LIKE'��%';
      --�ھ�,�达�� 'ȫ����'�� ������ ����
      update person set BUSEO='ȫ����' WHERE NAME LIKE '��%' OR NAME LIKE'��%';
      --����4
      --���� ���� ������ �ο����� ��ճ��� (����) ���ϱ�-�ο����� ������ ���� ���
      select GENDER ����,COUNT(*) �ο��� , CEIL(avg(AGE)) ��ճ��� from PERSON
      GROUP BY GENDER ORDER BY 2 DESC;
      --�μ��� �ο����� ��ճ��� ���ϱ�-�μ����� �������� ���
      select BUSEO �μ���,COUNT(*) �ο��� , CEIL(avg(AGE)) ��ճ��� from PERSON
      GROUP BY BUSEO ORDER BY 1 ;
      
      --������ ����
      --���� ���� ����ϴ� �⺻ ������ : 1���� 1�� �����ϴ� ������
      CREATE SEQUENCE SEQ1;
      CREATE SEQUENCE SEQ2 START WITH 1 INCREMENT BY 1;-- ���� ����
      CREATE SEQUENCE SEQ3 START WITH 10 INCREMENT BY 5 NOCACHE;-- NOCACHE: CACHE�� 0���� ����
       CREATE SEQUENCE SEQ4 MAXVALUE 100;-- MAX�� 100������ �߻�
      --������ ��ȸ
      SELECT * FROM SEQ;
      
      --���̺� ��ȸ
      SELECT * FROM TAB;
      
      --������ ����
      DROP SEQUENCE SEQ2;
      DROP SEQUENCE SEQ4;
      
      --������ �߻� NEXTVAL, ���簪 CURRVAL
      SELECT SEQ1.NEXTVAL,SEQ3.NEXTVAL FROM DUAL; --�ݺ��ؼ� �����غ���
      SELECT SEQ1.CURRVAL,SEQ3.CURRVAL FROM DUAL;-- ������ �߻���
 COMMIT;     