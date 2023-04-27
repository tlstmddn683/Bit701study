--대소문자 구별안해도됨
--EMP 테이블 전체 컬럼 조회
SELECT * from emp;
--emp 테이블에 있는 직업의 종류를 출력 (같은 직업은 한번만)
SELECT DISTINCT job from emp;
--컬럼명에 별칭을 지정
select ename as "사원명",job as "직업" from emp;
-- as 생략 가능,  별칭은 제목 중간에 공백이 없을시 " 생략이 가능하다
select ename "은행 사원명", job 직업 from emp;
--조건 emp number 7369,7566 두개의 데이터 확인
select * from emp where empno=7369 or empno=7566;
--SMITH,WARD 의 데이터 출력
select * from emp where ENAME='SMITH' or ENAME='WARD';
--IN 연산자(OR 연산자로 조회하는 경우 IN으로도 가능하다)
SELECT * FROM EMP WHERE ENAME IN('SMITH','WARD','SCOTT','FORD');
--7369 7654 7788 7876 데이터 조회
SELECT * FROM EMP WHERE EMPNO IN(7369,7654,7788,7876);
--AND 연산으로 조회
SELECT ENAME,JOB,SAL,COMM FROM EMP WHERE SAL >=1500 AND SAL<=3000;
--위에 SQL 문을 BETWEEN 으로 조회
SELECT ENAME,JOB,SAL,COMM FROM EMP WHERE SAL BETWEEN 1500 AND 3000;
--직업이 MANAGER 인 사람중 SAL이 2000 이상인 사람
SELECT *FROM EMP WHERE JOB='MANAGER' AND SAL>=2000;
--COMM 이 NULL 인 경우만 출력
SELECT * FROM EMP WHERE COMM IS NULL;
--NULL이 아닌경우만 출력
SELECT * FROM EMP WHERE COMM IS NOT NULL;
-- ENAME이 A로 시작하는 데이터 조회
SELECT * FROM EMP WHERE ENAME LIKE 'A%';
--ENAME 이 S로 끝나는 데이터 조회
SELECT * FROM EMP WHERE ENAME LIKE '%S';
-- ENAME이 A나 S로 시작하는 데이터 조회
SELECT * FROM EMP WHERE ENAME LIKE 'A%'OR ENAME LIKE 'S%';
--ENAME의 2번째나 3번째 글자가 A인 사람 조회 '_'사용
SELECT * FROM EMP WHERE ENAME LIKE '_A%' OR ENAME LIKE '__A%';
--JOB이 MANAGER 나 ANALYST 중에 SAL이 2500 이상인 사람만 조회
SELECT *FROM EMP WHERE (JOB='MANAGER'OR JOB='ANALYST') AND SAL>=2500;
--IN 으로 수정
SELECT *FROM EMP WHERE JOB IN ('MANAGER','ANALYST') AND SAL>=2500;
--SCOTT의 연봉과 같은 연봉을 받는 사람 조회-서브쿼리(SUBQUERY)
SELECT * FROM EMP WHERE SAL=(SELECT SAL FROM EMP WHERE ENAME='SCOTT');
--ALLEN 의 직업과 같은 직업을 가진 사람들 조회-서브쿼리(SUBQUERY)
SELECT * FROM EMP WHERE JOB=(SELECT JOB FROM EMP WHERE ENAME='ALLEN');
--CONSOLE 에 출력시 테이블명을 DUAL
--PPT 48P 내장함수-숫자함수
SELECT ABS(-6),ABS(6) FROM DUAL;--ABS : 절대값, 무조건 양수
SELECT CEIL(2.75),CEIL(2.11) FROM DUAL;--무조건 올림을 한 정수로 반환됨
SELECT FLOOR(2.75),FLOOR(2.11) FROM DUAL;-- 무조건 내림을 한 정수로 반환
SELECT ROUND(2.356,1),ROUND(2.22,1) FROM DUAL;--소수점 1번째 자리까지 반올림
SELECT TRUNC(2.356,1),TRUNC(2.22,1) FROM DUAL;--소수점 1번째 자리까지 반내림
SELECT ROUND(235678,-1),ROUND(235678,-2) FROM DUAL;--235680,235700
SELECT POWER(2,3),POWER(3,4) FROM DUAL;--지수승 구하기
SELECT MOD(7,2),MOD(10,2) FROM DUAL;-- 나머지 구하기 1,0
--49P 문자열 함수
SELECT CONCAT('JAVA','SPRING') FROM DUAL;--문자열 합치기
--문자열 합칠 경우 || 가능
SELECT 'JAVA'||'SPRING' FROM DUAL;
--TABLE EMP로 해보자
SELECT ENAME||'님의 직업은'||JOB||'입니다' MESSAGE FROM EMP;--MESSAGE는 컬럼명

SELECT ENAME||'님의 연봉은'||SAL||'만원 입니다' SAL FROM EMP;
SELECT INITCAP(ENAME) FROM EMP;--첫글자만 대문자 출력
SELECT UPPER(ENAME),LOWER(ENAME) FROM EMP;--대,소문자 변환후 출력
--LPAD,RPAD:특정문자로 채우기
SELECT LPAD('HAPPY',10,'*')FROM DUAL;
SELECT RPAD('HAPPY',10,'*')FROM DUAL;
SELECT ENAME, LPAD(SAL,10,'0')SAL FROM EMP;
--SUBSTR: 문자열 추출함수
SELECT SUBSTR('HAPPY DAY',3,3),SUBSTR('HAPPY DAY',-3,3) FROM DUAL;
--ENAME 에서 앞 2글자만 추출후 * 3개 달아서 출력
SELECT SUBSTR(ENAME,1,2)||'***' ENAME FROM EMP;
SELECT RPAD(SUBSTR(ENAME,1,2),5,'*')ENAME FROM EMP;
--LENGTH 구하기
SELECT ENAME||'님의 이름글자 길이는'|| LENGTH(ENAME)||'글자입니다' MASSEGE FROM EMP;
--REPLACE: 대치
SELECT REPLACE ('HELLO KITTY','T','*')REPLACE FROM DUAL;
--INSTR:특정문자열의 위치 구하기 
SELECT INSTR('GOOD DAY','DAY') FROM DUAL;--6:  6번째에서 발견
SELECT INSTR('HAPPY','DAY') FROM DUAL;--0: 없을경우 0

SELECT '*'||TRIM('          HELLO        ')||'*' FROM DUAL;--TRIM 공백 전부 제거
SELECT '*'||LTRIM('          HELLO        ')||'*' FROM DUAL;--LTRIM 왼쪽 공백 제거
SELECT '*'||RTRIM('          HELLO        ')||'*' FROM DUAL;--RTRIM 오른쪽 공백 제거

--sysdate 가 현재 날짜 구하기*
--오늘
select sysdate from dual;
--내일
select sysdate+1 from dual;
--일주일뒤
select sysdate+7 from dual;

--to-char *
select to_char(sysdate,'yyyy-mm-dd')today from  dual;  
select to_char(sysdate,'yyyy-mm-dd am hh:mi:ss')today from  dual; --오전 오후 표시
select to_char(sysdate,'yyyy-mm-dd hh24:mi:ss')today from  dual;--24시
select to_char(2345678,'L999,999,999')from dual;--원(지역마다 다른 화폐단위가 출력됨)
select to_char(2345678,'$999,999,999')from dual;--달러
select to_char(2.3,'0.00') from dual;--2.30

--NVL: 널값일 경우 특정값으로 출력(Mysql 에서는 ifnull)
select NVL(mgr,1000),NVL(comm,0) from emp;
select sal+comm from emp; -- comm이 null일 경우 더하면 null
--comm 이 null일 경우 10으로 계산
select sal+NVL(comm,10)pay from emp;

--decode: 값에 따라 서로 다른 값 출력
select ename,deptno,decode(deptno,10,'서울',20,'강원도',30,'경기도',40,'제주도') city from emp;
--order 순서대로 출력
select ename,sal from emp order by ename asc; --ename 의 오름차순 (asc생략가능)
select ename,sal from emp order by sal desc; --sal 의 내림차순
--직업순 출력,같은 직업일 경우 연봉의 내림차순
select ename,job,sal from emp order by job,sal desc;
--sal 의 오름차순 출력시 sal이 3번째 출력하므로 열번호 3으로 정렬
select ename,job,sal from emp order by 3;
--연봉 1500~3000 까지만 출력하는데 이름의 오름차순
select ename,sal from emp where sal between 1500 and 3000 order by ename;

--그룹함수 : PPT 57P


--count,max,min,sum,avg
select count (*) from emp;--emp의 데이터 갯수
select max(sal) from emp;--최대급여
select min(sal) from emp;--최저급여 
select sum(sal) from emp;--급여의 합
select round(avg(sal),-1)salavg from emp;--평균 급여,일원 단위에서 반올림
--group 별 함수 적용
--각 직업 별 인원수와 sal의 평균 구하기
select job 직업,count(*)인원수,round(avg(sal),-1)평균연봉 from emp group by job;
--위의 쿼리문에서 인원수가 작은것 부터 출력
select job 직업,count(*)인원수,round(avg(sal),-1)평균연봉 from emp group by job order by 인원수;
--위의 쿼리문에서 직업별로 인원수가 3명 이상인 데이터만 출력 (having)
--그룹함수를 이용해서 조건을 나타낼떄는 having에서 준다
select job 직업,count(*)인원수,round(avg(sal),-1)평균연봉 from emp 
group by job having count(*) >=3 order by 인원수;
--각 직업별로 인원수와 최고 연봉 최저 연봉을 출력( 직업의 오름차순) 
select job 직업,count(*)인원수,max(sal)최고연봉,min(sal)최저연봉 
from emp group by job order by 1; --1 컬럼번호 대신 직업을 적어도된다
--위에 쿼리문에 금액앞 화폐단위를 붙이고 3자리 컴마 추가
select job 직업,count(*)인원수,to_char (max(sal),'L999,999')최고연봉,to_char(min(sal),'L999,999')최저연봉 
from emp group by job order by 1;


--문제1. emp테이블에서 ename a나 s로 시작하는사람 출력(대소문자 상관없음)
  select * from emp where upper(ename) like 'A%' or upper(ename) like 'S%';
  
--2. emp테이블에서 ename 에서 두번째 글자가 'A' 인사람 출력
   select * from emp where ename like '_A%';
   
--3. job 에서 같은 직업군일경우 한번씩만 출력하시오
    select DISTINCT job from emp;
    
--4. job 종류별로 인원수를 구하시오
    select job 직업 ,count(*) 인원수 from emp group by job;
    
--5. job 종류별로 sal 의 평균급여를 구하시오
    select job 직업, round(avg(sal),-1)평균연봉 from emp group by job;
    
--6. job 종류별로 sal 의 최대값과 최소값을 구하시오
    select job 직업, max(sal)최대연봉, min(sal)최저연봉 from emp group by job;
    
--7. deptno 가 10인경우 '홍보부' 20 인경우 '개발부' 30인경우 '관리부' 부서를 구하여
-- ename, 부서 를 출력하시오
   select ename,deptno,decode(deptno,10,'홍보부',20,'개발부',30,'관리부') 부서 from emp;
   
--8. 급여(sal)가 sal 의 평균보다 더 높은 사람만 ename 과 sal 을 출력하시오
   select ename,sal from emp where sal>(select avg(sal)from emp);
   
--9. hiredate 에서 월이 5월인 사람만 ename 과 hiredate 를 출력하시오
    select ename,hiredate from emp where to_char(hiredate,'mm')='05';
    select ename,hiredate from emp where to_char(hiredate,'mm')=5;--결과 똑같음

--10. SCOTT 의 급여와 동일하거나 더 많이 받는 사원명과 급여를 출력하라
    SELECT ename 사원명,sal 급여 FROM EMP WHERE SAL>=(SELECT SAL FROM EMP WHERE ENAME='SCOTT');
    
 
