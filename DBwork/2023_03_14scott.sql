--��ҹ��� �������ص���
--EMP ���̺� ��ü �÷� ��ȸ
SELECT * from emp;
--emp ���̺� �ִ� ������ ������ ��� (���� ������ �ѹ���)
SELECT DISTINCT job from emp;
--�÷��� ��Ī�� ����
select ename as "�����",job as "����" from emp;
-- as ���� ����,  ��Ī�� ���� �߰��� ������ ������ " ������ �����ϴ�
select ename "���� �����", job ���� from emp;
--���� emp number 7369,7566 �ΰ��� ������ Ȯ��
select * from emp where empno=7369 or empno=7566;
--SMITH,WARD �� ������ ���
select * from emp where ENAME='SMITH' or ENAME='WARD';
--IN ������(OR �����ڷ� ��ȸ�ϴ� ��� IN���ε� �����ϴ�)
SELECT * FROM EMP WHERE ENAME IN('SMITH','WARD','SCOTT','FORD');
--7369 7654 7788 7876 ������ ��ȸ
SELECT * FROM EMP WHERE EMPNO IN(7369,7654,7788,7876);
--AND �������� ��ȸ
SELECT ENAME,JOB,SAL,COMM FROM EMP WHERE SAL >=1500 AND SAL<=3000;
--���� SQL ���� BETWEEN ���� ��ȸ
SELECT ENAME,JOB,SAL,COMM FROM EMP WHERE SAL BETWEEN 1500 AND 3000;
--������ MANAGER �� ����� SAL�� 2000 �̻��� ���
SELECT *FROM EMP WHERE JOB='MANAGER' AND SAL>=2000;
--COMM �� NULL �� ��츸 ���
SELECT * FROM EMP WHERE COMM IS NULL;
--NULL�� �ƴѰ�츸 ���
SELECT * FROM EMP WHERE COMM IS NOT NULL;
-- ENAME�� A�� �����ϴ� ������ ��ȸ
SELECT * FROM EMP WHERE ENAME LIKE 'A%';
--ENAME �� S�� ������ ������ ��ȸ
SELECT * FROM EMP WHERE ENAME LIKE '%S';
-- ENAME�� A�� S�� �����ϴ� ������ ��ȸ
SELECT * FROM EMP WHERE ENAME LIKE 'A%'OR ENAME LIKE 'S%';
--ENAME�� 2��°�� 3��° ���ڰ� A�� ��� ��ȸ '_'���
SELECT * FROM EMP WHERE ENAME LIKE '_A%' OR ENAME LIKE '__A%';
--JOB�� MANAGER �� ANALYST �߿� SAL�� 2500 �̻��� ����� ��ȸ
SELECT *FROM EMP WHERE (JOB='MANAGER'OR JOB='ANALYST') AND SAL>=2500;
--IN ���� ����
SELECT *FROM EMP WHERE JOB IN ('MANAGER','ANALYST') AND SAL>=2500;
--SCOTT�� ������ ���� ������ �޴� ��� ��ȸ-��������(SUBQUERY)
SELECT * FROM EMP WHERE SAL=(SELECT SAL FROM EMP WHERE ENAME='SCOTT');
--ALLEN �� ������ ���� ������ ���� ����� ��ȸ-��������(SUBQUERY)
SELECT * FROM EMP WHERE JOB=(SELECT JOB FROM EMP WHERE ENAME='ALLEN');
--CONSOLE �� ��½� ���̺���� DUAL
--PPT 48P �����Լ�-�����Լ�
SELECT ABS(-6),ABS(6) FROM DUAL;--ABS : ���밪, ������ ���
SELECT CEIL(2.75),CEIL(2.11) FROM DUAL;--������ �ø��� �� ������ ��ȯ��
SELECT FLOOR(2.75),FLOOR(2.11) FROM DUAL;-- ������ ������ �� ������ ��ȯ
SELECT ROUND(2.356,1),ROUND(2.22,1) FROM DUAL;--�Ҽ��� 1��° �ڸ����� �ݿø�
SELECT TRUNC(2.356,1),TRUNC(2.22,1) FROM DUAL;--�Ҽ��� 1��° �ڸ����� �ݳ���
SELECT ROUND(235678,-1),ROUND(235678,-2) FROM DUAL;--235680,235700
SELECT POWER(2,3),POWER(3,4) FROM DUAL;--������ ���ϱ�
SELECT MOD(7,2),MOD(10,2) FROM DUAL;-- ������ ���ϱ� 1,0
--49P ���ڿ� �Լ�
SELECT CONCAT('JAVA','SPRING') FROM DUAL;--���ڿ� ��ġ��
--���ڿ� ��ĥ ��� || ����
SELECT 'JAVA'||'SPRING' FROM DUAL;
--TABLE EMP�� �غ���
SELECT ENAME||'���� ������'||JOB||'�Դϴ�' MESSAGE FROM EMP;--MESSAGE�� �÷���

SELECT ENAME||'���� ������'||SAL||'���� �Դϴ�' SAL FROM EMP;
SELECT INITCAP(ENAME) FROM EMP;--ù���ڸ� �빮�� ���
SELECT UPPER(ENAME),LOWER(ENAME) FROM EMP;--��,�ҹ��� ��ȯ�� ���
--LPAD,RPAD:Ư�����ڷ� ä���
SELECT LPAD('HAPPY',10,'*')FROM DUAL;
SELECT RPAD('HAPPY',10,'*')FROM DUAL;
SELECT ENAME, LPAD(SAL,10,'0')SAL FROM EMP;
--SUBSTR: ���ڿ� �����Լ�
SELECT SUBSTR('HAPPY DAY',3,3),SUBSTR('HAPPY DAY',-3,3) FROM DUAL;
--ENAME ���� �� 2���ڸ� ������ * 3�� �޾Ƽ� ���
SELECT SUBSTR(ENAME,1,2)||'***' ENAME FROM EMP;
SELECT RPAD(SUBSTR(ENAME,1,2),5,'*')ENAME FROM EMP;
--LENGTH ���ϱ�
SELECT ENAME||'���� �̸����� ���̴�'|| LENGTH(ENAME)||'�����Դϴ�' MASSEGE FROM EMP;
--REPLACE: ��ġ
SELECT REPLACE ('HELLO KITTY','T','*')REPLACE FROM DUAL;
--INSTR:Ư�����ڿ��� ��ġ ���ϱ� 
SELECT INSTR('GOOD DAY','DAY') FROM DUAL;--6:  6��°���� �߰�
SELECT INSTR('HAPPY','DAY') FROM DUAL;--0: ������� 0

SELECT '*'||TRIM('          HELLO        ')||'*' FROM DUAL;--TRIM ���� ���� ����
SELECT '*'||LTRIM('          HELLO        ')||'*' FROM DUAL;--LTRIM ���� ���� ����
SELECT '*'||RTRIM('          HELLO        ')||'*' FROM DUAL;--RTRIM ������ ���� ����

--sysdate �� ���� ��¥ ���ϱ�*
--����
select sysdate from dual;
--����
select sysdate+1 from dual;
--�����ϵ�
select sysdate+7 from dual;

--to-char *
select to_char(sysdate,'yyyy-mm-dd')today from  dual;  
select to_char(sysdate,'yyyy-mm-dd am hh:mi:ss')today from  dual; --���� ���� ǥ��
select to_char(sysdate,'yyyy-mm-dd hh24:mi:ss')today from  dual;--24��
select to_char(2345678,'L999,999,999')from dual;--��(�������� �ٸ� ȭ������� ��µ�)
select to_char(2345678,'$999,999,999')from dual;--�޷�
select to_char(2.3,'0.00') from dual;--2.30

--NVL: �ΰ��� ��� Ư�������� ���(Mysql ������ ifnull)
select NVL(mgr,1000),NVL(comm,0) from emp;
select sal+comm from emp; -- comm�� null�� ��� ���ϸ� null
--comm �� null�� ��� 10���� ���
select sal+NVL(comm,10)pay from emp;

--decode: ���� ���� ���� �ٸ� �� ���
select ename,deptno,decode(deptno,10,'����',20,'������',30,'��⵵',40,'���ֵ�') city from emp;
--order ������� ���
select ename,sal from emp order by ename asc; --ename �� �������� (asc��������)
select ename,sal from emp order by sal desc; --sal �� ��������
--������ ���,���� ������ ��� ������ ��������
select ename,job,sal from emp order by job,sal desc;
--sal �� �������� ��½� sal�� 3��° ����ϹǷ� ����ȣ 3���� ����
select ename,job,sal from emp order by 3;
--���� 1500~3000 ������ ����ϴµ� �̸��� ��������
select ename,sal from emp where sal between 1500 and 3000 order by ename;

--�׷��Լ� : PPT 57P


--count,max,min,sum,avg
select count (*) from emp;--emp�� ������ ����
select max(sal) from emp;--�ִ�޿�
select min(sal) from emp;--�����޿� 
select sum(sal) from emp;--�޿��� ��
select round(avg(sal),-1)salavg from emp;--��� �޿�,�Ͽ� �������� �ݿø�
--group �� �Լ� ����
--�� ���� �� �ο����� sal�� ��� ���ϱ�
select job ����,count(*)�ο���,round(avg(sal),-1)��տ��� from emp group by job;
--���� ���������� �ο����� ������ ���� ���
select job ����,count(*)�ο���,round(avg(sal),-1)��տ��� from emp group by job order by �ο���;
--���� ���������� �������� �ο����� 3�� �̻��� �����͸� ��� (having)
--�׷��Լ��� �̿��ؼ� ������ ��Ÿ������ having���� �ش�
select job ����,count(*)�ο���,round(avg(sal),-1)��տ��� from emp 
group by job having count(*) >=3 order by �ο���;
--�� �������� �ο����� �ְ� ���� ���� ������ ���( ������ ��������) 
select job ����,count(*)�ο���,max(sal)�ְ���,min(sal)�������� 
from emp group by job order by 1; --1 �÷���ȣ ��� ������ ����ȴ�
--���� �������� �ݾ׾� ȭ������� ���̰� 3�ڸ� �ĸ� �߰�
select job ����,count(*)�ο���,to_char (max(sal),'L999,999')�ְ���,to_char(min(sal),'L999,999')�������� 
from emp group by job order by 1;


--����1. emp���̺��� ename a�� s�� �����ϴ»�� ���(��ҹ��� �������)
  select * from emp where upper(ename) like 'A%' or upper(ename) like 'S%';
  
--2. emp���̺��� ename ���� �ι�° ���ڰ� 'A' �λ�� ���
   select * from emp where ename like '_A%';
   
--3. job ���� ���� �������ϰ�� �ѹ����� ����Ͻÿ�
    select DISTINCT job from emp;
    
--4. job �������� �ο����� ���Ͻÿ�
    select job ���� ,count(*) �ο��� from emp group by job;
    
--5. job �������� sal �� ��ձ޿��� ���Ͻÿ�
    select job ����, round(avg(sal),-1)��տ��� from emp group by job;
    
--6. job �������� sal �� �ִ밪�� �ּҰ��� ���Ͻÿ�
    select job ����, max(sal)�ִ뿬��, min(sal)�������� from emp group by job;
    
--7. deptno �� 10�ΰ�� 'ȫ����' 20 �ΰ�� '���ߺ�' 30�ΰ�� '������' �μ��� ���Ͽ�
-- ename, �μ� �� ����Ͻÿ�
   select ename,deptno,decode(deptno,10,'ȫ����',20,'���ߺ�',30,'������') �μ� from emp;
   
--8. �޿�(sal)�� sal �� ��պ��� �� ���� ����� ename �� sal �� ����Ͻÿ�
   select ename,sal from emp where sal>(select avg(sal)from emp);
   
--9. hiredate ���� ���� 5���� ����� ename �� hiredate �� ����Ͻÿ�
    select ename,hiredate from emp where to_char(hiredate,'mm')='05';
    select ename,hiredate from emp where to_char(hiredate,'mm')=5;--��� �Ȱ���

--10. SCOTT �� �޿��� �����ϰų� �� ���� �޴� ������ �޿��� ����϶�
    SELECT ename �����,sal �޿� FROM EMP WHERE SAL>=(SELECT SAL FROM EMP WHERE ENAME='SCOTT');
    
 
