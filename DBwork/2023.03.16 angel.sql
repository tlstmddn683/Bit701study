        --plsql ������ ���̺�� ������ ������ ����
        create sequence seq_test nocache;--1���� 1�� �����ϴ� ������ (cache size:0)
        create table shop(
            num number(3) constraint shop_pk_num primary key,
            sangpum varchar2(30),
            su number(3),
            dan number(7),
            today date
        );
        --�⺻������ 5�� �߰�
        insert into shop values (seq_test.nextval,'û����',2,19000,sysdate);
        insert into shop values (seq_test.nextval,'���콺',1,22000,sysdate);
        insert into shop values (seq_test.nextval,'�����',3,21000,sysdate);
        insert into shop values (seq_test.nextval,'Ƽ����',2,10000,sysdate);
        insert into shop values (seq_test.nextval,'����',1,20000,sysdate);
        commit;
        
        --pl-sql: sql����� ������ ��Ҹ� �߰��ؼ�  ���α׷����� ���� plsql�̶�� �Ѵ�
        --����
        --DECLARE
        --  ��������, Ŀ�� ����
        --BEGIN
        -- ���� ��� �Ǵ� ������..
        --	DBMS_OUTPUT_PUT_LINE(); ���� ��� ��ɾ�(JAVA PLINTLN ���� ����)
        --END;
        
        
        --set serveroutput on-- �ܼ�â���� ����� ������ �ϱ� (�⺻�� off)
        --set serveroutput off --�ܼ�â���� ����� �ȳ����� �ϱ�
        
        DECLARE
            v_no number(4,1);--4�ڸ� ����,�Ҽ��� ���� 1�ڸ�
            
        BEGIN
            v_no:=10;--�� ����
            DBMS_OUTPUT.PUT_LINE('���ڴ�'||v_no||'�Դϴ�');--���
            
        END;
        /
        
        
        --shop table���� Ư�� ��ǰ���� ��������
        DECLARE
            v_sangpum varchar2(30);
            v_su number(3);
            v_dan number(7);
            v_num number(3):=1;--�˻��ؼ� ������ num��
        BEGIN
            select sangpum,su,dan
            into v_sangpum,v_su,v_dan
            from shop where num=v_num;
            
            DBMS_OUTPUT.PUT_LINE(v_num||'�� ��ǰ ����');
            DBMS_OUTPUT.PUT_LINE('��ǰ��: '||v_sangpum);
            DBMS_OUTPUT.PUT_LINE('�� ��: '||v_su);
            DBMS_OUTPUT.PUT_LINE('�� ��: '||v_dan);
            DBMS_OUTPUT.PUT_LINE('�ѱݾ�: '||v_su*v_dan);
        END;
        /
        -- ��ǰ������ �˻��ؼ� ������ ���
       DECLARE
            v_sangpum varchar2(30):='û����';--�˻��ؼ� ������ sangpum�̸�
            v_su number(3);
            v_dan number(7);
            v_num number(3);
        BEGIN
            select num,su,dan
            into v_num,v_su,v_dan
            from shop where sangpum=v_sangpum;
            
            DBMS_OUTPUT.PUT_LINE(v_sangpum||'��ǰ ����');
            DBMS_OUTPUT.PUT_LINE('��������: '||v_num);
            DBMS_OUTPUT.PUT_LINE('�� ��: '||v_su);
            DBMS_OUTPUT.PUT_LINE('�� ��: '||v_dan);
            DBMS_OUTPUT.PUT_LINE('�ѱݾ�: '||v_su*v_dan);
        END;
        / 
        
        --���ǹ�
        /*
        if ���ǽ� then
            ����1;
        else
            ����2;
        end if;
        
    ���� ���ǹ�
        if ���ǽ�1 then
            ����1;
        elsif ���ǽ�2 then
            ����2;
        else
            ����n;
        .......
        end if;
        
        */
        --Ư���⵵�� ���������� ���ϱ�
    DECLARE
        v_year number(4):=2023;
        v_mod number(2):=mod(v_year,12);--�⵵�� 12�� ���� ������
        v_ddi varchar2(10);--�츦 ���ؼ� ����
        
    BEGIN
            if v_mod=0 then v_ddi:='������';
            elsif v_mod=1 then v_ddi:='��';
            elsif v_mod=2 then v_ddi:='��';
            elsif v_mod=3 then v_ddi:='����';
            elsif v_mod=4 then v_ddi:='��';
            elsif v_mod=5 then v_ddi:='��';
            elsif v_mod=6 then v_ddi:='ȣ����';
            elsif v_mod=7 then v_ddi:='�䳢';
            elsif v_mod=8 then v_ddi:='��';
            elsif v_mod=9 then v_ddi:='��';
            elsif v_mod=10 then v_ddi:='��';
            else v_ddi:='��';
            end if;
            DBMS_OUTPUT.PUT_LINE(v_year||'�����'||v_ddi||'�� �Դϴ�');
    END;
    /
    
    --Ư���⵵�� ���������� ���ϱ�
    --�⵵�� Ű����� �Է¹޾Ƽ� �츦 �˾ƺ� �� �ֵ��� �����غ���
    
    accept K_year prompt '�⵵ 4�ڸ��� �Է����ּ���!';--Ű����� �Է¹��� �����͸� ����
    DECLARE
        v_year number(4):='&k_year';--Ű����� �Է¹��� accept������ ��������� �����Ѵ�
        v_mod number(2):=mod(v_year,12);--�⵵�� 12�� ���� ������
        v_ddi varchar2(10);--�츦 ���ؼ� ����
        
    BEGIN
            if v_mod=0 then v_ddi:='������';
            elsif v_mod=1 then v_ddi:='��';
            elsif v_mod=2 then v_ddi:='��';
            elsif v_mod=3 then v_ddi:='����';
            elsif v_mod=4 then v_ddi:='��';
            elsif v_mod=5 then v_ddi:='��';
            elsif v_mod=6 then v_ddi:='ȣ����';
            elsif v_mod=7 then v_ddi:='�䳢';
            elsif v_mod=8 then v_ddi:='��';
            elsif v_mod=9 then v_ddi:='��';
            elsif v_mod=10 then v_ddi:='��';
            else v_ddi:='��';
            end if;
            DBMS_OUTPUT.PUT_LINE(v_year||'�����'||v_ddi||'�� �Դϴ�');
    END;
    /
    --����� �����͸� ���
    
    
    --���ڸ� �Է¹޾� 12 �Է½� 12�� ¦���Դϴ�, 11�Է½� 11�� Ȧ���Դϴ�
    accept k_su prompt '�����Է�';
    DECLARE
    v_su number(5):='&k_su';
    BEGIN
    if mod(v_su,2)=0 then
        DBMS_OUTPUT.PUT_LINE(v_su||'�� ¦���Դϴ�');
    else 
        DBMS_OUTPUT.PUT_LINE(v_su||'�� Ȧ���Դϴ�');
        end if;
    END;
    /
    
     /* 
        �ݺ���
        loop
            ��ɵ�;
            exit when ����;
        end loop;
    */
    
    
    accept k_dan prompt '������ ���ڸ� �Է����ּ���';
    DECLARE
        v_dan number(3):='&k_dan';
        v_idx number(1):=1;
    BEGIN
        
        DBMS_OUTPUT.PUT_LINE('**['||v_dan||'��]**');
        loop
            DBMS_OUTPUT.PUT_LINE(v_dan||'x'||v_idx||'='||v_dan*v_idx);
            v_idx:=v_idx+1;
            exit when v_idx>9;
        end loop;   
    END;
    /
    
    /*
         �� �ٸ� ���ǹ� case
         
        ����:= 
         case ǥ����
         when ��1 then ���1
         when ��2 then ���2
         when ��3 then ���3
         else ���4
        end;
      
    */
    DECLARE
    v_grade char(1) :='A';
    v_msg varchar2(15);
    BEGIN
        v_msg :=
        case v_grade
        when 'A' then 'Exellent!!!'
        when 'B' then 'Very Good!!'
        when 'C' then 'Nice!!'
       else 'Try!!'
       end;
       DBMS_OUTPUT.PUT_LINE(v_grade||'������ '||v_msg);
    END; 
    /
    --exception ó��
       -- ��ǰ������ �˻��ؼ� ������ ���
       DECLARE
            v_sangpum varchar2(30):='&k_sang';--Ű����� �Է½� ������ sangpum �̸�������
            v_su number(3);
            v_dan number(7);
            v_num number(3);
        BEGIN
            select num,su,dan
            into v_num,v_su,v_dan
            from shop where sangpum=v_sangpum;
            
            DBMS_OUTPUT.PUT_LINE(v_sangpum||'��ǰ ����');
            DBMS_OUTPUT.PUT_LINE('��������: '||v_num);
            DBMS_OUTPUT.PUT_LINE('�� ��: '||v_su);
            DBMS_OUTPUT.PUT_LINE('�� ��: '||v_dan);
            DBMS_OUTPUT.PUT_LINE('�ѱݾ�: '||v_su*v_dan);
            
            
            --����Ŭ������ ����ó�� ���
            exception 
            when NO_DATA_FOUND then
            DBMS_OUTPUT.PUT_LINE(v_sangpum||'��ǰ�� DB�� �����ϴ�!!');
            when TOO_MANY_ROWS then
            DBMS_OUTPUT.PUT_LINE(v_sangpum||'��ǰ�� ������ �ֽ��ϴ�');
            when OTHERS then
            DBMS_OUTPUT.PUT_LINE('���ܹ߻�!');
           
        END;
        / 
        --shop table ����
        --shop table�� color �÷� �߰� �⺻�� 'GREEN'
    alter table shop add color varchar2(20) default 'green';
    --3���� pink 5���� yellow ����
    update shop set color='pink' where num=3;
    update shop set color='yellow' where num=5;
    --������ �߰�: �ߺ��� ��ǰ�� �־��
    insert into shop values(seq_test.nextval,'���콺',1,19000,sysdate,'ORANGE');
    insert into shop values(seq_test.nextval,'�ݹ���',3,25000,sysdate,'BLUE');
    insert into shop values(seq_test.nextval,'���̽�Ƽ����',4,8000,sysdate,'GRAY');
    insert into shop values(seq_test.nextval,'������ û����',1,18000,sysdate,'DARKBLUE');
    COMMIT;
    /*
    for �ݺ���
    for ������ in [reverse] ���۰�... ������ loop
        �����;
    end loop;
    */
    
    DECLARE
        v_bdan number(5) := '&k_bdan';
        v_num number(2);
    BEGIN
        DBMS_OUTPUT.PUT_LINE(v_bdan||'��');
        for v_num in 1..9 loop --1~9���� 
            DBMS_OUTPUT.PUT_LINE(v_bdan||'x'||v_num||'='||v_bdan*v_num);
        end loop;
    END;
    /
    --db�� Ÿ���� �����ϴ� ���
    --db�� �����͸� ���ڵ� ������ �������� ���
    
    DECLARE
        v_sang shop.sangpum%type :='Ƽ����';--db�� sangpum Ÿ���� ����
        v_shop angel.shop%rowtype; -- ���ڵ� ������ �����͸� �б� ���� ����
        
    BEGIN
            select * 
            into v_shop
            from shop
            where sangpum=v_sang;
            
        DBMS_OUTPUT.PUT_LINE('��ǰ��: '||v_shop.sangpum);
        DBMS_OUTPUT.PUT_LINE('����: '||v_shop.color);
        DBMS_OUTPUT.PUT_LINE('����: '||v_shop.su);
        DBMS_OUTPUT.PUT_LINE('�ܰ�: '||v_shop.dan);
        DBMS_OUTPUT.PUT_LINE('������: '||v_shop.today);
    END;
    /
    
    
    /*
    ���� ���ڵ� ��ȸ��
    Cursor Ŀ����
    is
    select ����; --select ��ȸ�� ����� Cursor�� ����
    
    for ���ڵ�� in Ŀ���� loop
        ���;
    end loop;
    
    */
    
    --shop�� ��ü ������ ���
    
    DECLARE
        Cursor s1
        is
        select  * from shop order by dan desc; --dan�� ���������� ���
        
        v_cnt number(5);
    BEGIN
        DBMS_OUTPUT.PUT_LINE('��ȣ   ��ǰ��   ����   ����   �ܰ�   ������');
        for s in s1 loop
        DBMS_OUTPUT.PUT_LINE(s.num||'    '||s.sangpum||'    '||s.color||'   '
        ||s.su||'    '||s.dan||'   '||s.today);
        
        end loop;
        
        select count(*) into v_cnt from shop;
        DBMS_OUTPUT.PUT_LINE('�� '||v_cnt||' ���� ��ǰ�� �ֽ��ϴ�');
    END;
    /
    
    
    /*
    Ű����� ��ǰ�� �Ϻθ� �Է¹޾Ƽ� �ش��ǰ���� ����ϱ�
    
    ���� ��ǰ���� '����' ��� �Է½� 
    �� 4���� ��ǰ�� �ֽ��ϴ� 
    
    ��ǰ�� : û����
    ����: YELLOW
    �ܰ�: 23000
    .
    .
    .
    ��ǰ��:�ݹ���
    ����:BLUE
    �ܰ�:19000
    .
    .
    .
    �������
    ���� ��ǰ�� ��Ͽ� �����ϴ�!
    
    
    */
    
           DECLARE
            v_search shop.sangpum%type :='&sang';
             Cursor s1
            is
            select  * from shop where sangpum like '%'||v_search||'%';--���Ե�
             v_cnt number(5);
            BEGIN
            select count(*) into v_cnt from shop where sangpum like '%'||v_search||'%' ;
            if v_cnt=0 then
            DBMS_OUTPUT.PUT_LINE(v_search||'��ǰ�� ��Ͽ� �����ϴ�');
            else
            DBMS_OUTPUT.PUT_LINE('��'||v_cnt||'���� ��ǰ�� �����մϴ�');   
             for s in s1 loop   
            DBMS_OUTPUT.PUT_LINE('��ǰ��: '||s.sangpum);
            DBMS_OUTPUT.PUT_LINE('����: '||s.color);
            DBMS_OUTPUT.PUT_LINE('�ܰ�: '||TRIM(to_char(s.dan,'L999,999')));
            DBMS_OUTPUT.PUT_LINE('=================');
            end loop;
          end if;
        END;
        /
        /*
        ���ν���(procedure)
    :���ν����� Ư�� �۾��� �����ϴ� ������ ���� ���α׷�����
    ����Ÿ���̽��� ����Ǵ� ��ü�̴�
    �ݺ��Ǵ� �ڵ尰�� ��� ���ν����� �����صξ��ٰ� ȣ���ؼ�
    ���ุ �ϸ� �ǹǷ� ���뼺�� ����
     
    ����
     create: ���� ���� ,���� �̸��� ������ ���� �߻�
     create or replace: ���� ���� , ���� �̸��� ������ �����
    create [or replace] procedure ���ν�����
       [�Ķ���� ��� ����ŸŸ��,....]
    is
            ���� ����
    begin
                    �ڵ�;
    end;
    /
     
    ȣ��:   exec ���ν�����
                    exec ���ν�����(��..)
    
        */
        
--new ���ν��� ����
create or replace procedure mytest
is 
begin
 DBMS_OUTPUT.PUT_LINE('ù ���ν��� ����!!');
end;
/

--mytest ���ν��� ȣ��
exec mytest;
-- ������ ��� ���ν��� ȣ��
create or replace procedure gugu(dan number)
is 
begin
if dan<2 or dan>9 then
    DBMS_OUTPUT.PUT_LINE('�߸��� ���ڸ� �Է��ϼ̽��ϴ�!');
else
 DBMS_OUTPUT.PUT_LINE('**'||dan||'��**');
 DBMS_OUTPUT.PUT_LINE(' ');
 for a in 1..9 loop
 DBMS_OUTPUT.PUT_LINE(dan||' x '||a||' = '||dan*a);
 end loop;
 end if;
end;
/
--gugu ����
exec gugu(5);
exec gugu(10);


--shop �� ��ǰ�� �߰��ϴ� ���ν���
create or replace procedure addshop(
sangpum shop.sangpum%type, su shop.su%type,dan shop.dan%type,
color shop.color%type
)
is 
begin
 DBMS_OUTPUT.PUT_LINE('shop db��'||sangpum||'�����͸� �߰��մϴ�');
 insert into shop values(seq_test.nextval,sangpum,su,dan,sysdate,color);
 DBMS_OUTPUT.PUT_LINE(sql%rowcount||'���� ��ǰ�� �߰��Ǿ����ϴ�');
 commit;
end;
/
--��ǰ �߰�
exec addshop('����',1,200000,'black');

/*
exec searchsangpum('���콺');
��ǰ�� ���� �ܰ�
----------------
���콺 Yellow 33000
���콺 orange 11000

�� 2�� �˻�

������� 
���콺 ��ǰ�� �����ϴ�.
*/
create or replace procedure searchsangpum(v_sang shop.sangpum%type)
is 
Cursor s1
            is
            select  * from shop where sangpum like '%'||v_sang||'%';--���Ե�
             v_cnt number(5);
begin
select count(*) into v_cnt
from shop where sangpum like'%'||v_sang||'%';
if v_cnt=0 then
    DBMS_OUTPUT.PUT_LINE(v_sang||' ���õ� ��ǰ�� �����ϴ�.');
    else
    DBMS_OUTPUT.PUT_LINE(v_sang||'��ǰ�� �� '||v_cnt||'�� ��ȸ �Ϸ�');
    DBMS_OUTPUT.PUT_LINE(' ');
    DBMS_OUTPUT.PUT_LINE('��ǰ��    ����     �ܰ�');
    DBMS_OUTPUT.PUT_LINE('=======================');   
    
    for s in s1 loop
    DBMS_OUTPUT.PUT_LINE(s.sangpum||'    '||s.color||'   '||s.dan);
    end loop;
    end if;
    commit;
end;
/
exec searchsangpum('���콺');
exec searchsangpum('����');