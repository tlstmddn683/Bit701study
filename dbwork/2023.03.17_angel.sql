-- sawon에 제약조건 추가하기
-- score는 0~100 만 추가가능하도록 제약조건 추가
alter table sawon add constraint sawon_ck_score check(score between 0 and 100);
-- gender 에 '남자',''여자' 만 가능하도록 check 제약조건을 추가
alter table sawon add constraint sawon_ck_gender check(gender in ('남자','여자'));
-- mysql 에서 제약조건 확인하는 방법
select * from information_schema.table_constraints where table_name='sawon';

-- 데이터 추가
insert into sawon values (null,'이상아',78,'여자','홍보부');
insert into sawon(name,score,gender) values('강호동',89,'남자');
insert into sawon values (null,'이수근',99,'남자','인사부');
insert into sawon values (null,'이진아',77,'여자','홍보부');
insert into sawon values (null,'강민호',80,'남자','교육부');

-- 쿼리문 연습
-- 강씨 성을 가진 사람의 인원수 구하기
select count(*) from sawon where name like '강%';

-- 평균 점수보다 높은 사람 출력
select * from sawon where score>(select avg(score) from sawon);
-- 부서별 인원수와 평균점수 최고점수 최저점수 구하기 (제목까지 수정)
select buseo 부서명, count(*) 인원수, round(avg(score),1) 평균점수, max(score) 최고점수,
min(score) 최저점수 from sawon group by buseo;

-- 인사부에서 이씨성을 가진사람이 누가 있는지 출력
select * from sawon where buseo='인사부' and name like '이%';


-- 이수근의 부서를 관리부로 수정
update sawon set buseo='관리부' where name='이수근';

-- join 연습용 서브 테이블 생성 
-- sawoninfo idx,num(외부키),addr,hp,age 컬럼주기 
-- 부모테이블을 지우면 서브 테이블 까지 지울수 있도록 설정 on delete cascade
create table sawoninfo(
idx smallint auto_increment primary key,
num smallint,
addr varchar(30),
hp varchar(20),
age smallint,
constraint info_fk_num foreign key(num) references sawon(num)
);

desc sawoninfo;
-- 제약조건  확인
select * from information_schema.table_constraints where table_name='sawoninfo';
-- sawoninfo 에 데이터 추가하기(반드시 sawon의 num에 있는 값만 넣을수 있다.)

insert into sawoninfo values(null,2,'강남구','010-1111-2222',30); 
insert into sawoninfo values(null,1,'강서구','010-2222-2222',27);  
insert into sawoninfo values(null,3,'강동구','010-3333-2222',32);  
insert into sawoninfo values(null,4,'영등포구','010-4444-2222',25);

-- sawoninfo 만 데이터 확인하기
select * from sawoninfo;

-- sawon 테이블과 join으로 사원정보 모두 출력alter
-- join 방법 1
select 
sawon.num,name,gender,buseo,age,hp,score
from sawon,sawoninfo info
where sawon.num=info.num;

-- 컬럼명 대신에 *도 가능
select 
	*
from sawon,sawoninfo info
where sawon.num=info.num;

-- join 방법 2 
select sawon.num,name,gender,buseo,age,hp,addr,score
from sawon
inner join sawoninfo info on sawon.num=info.num;

-- on delete cascade: sawon에서 2번 데이터 삭제시 sawoninfo에서도 삭제
-- 문제
-- 기존 외부키 제약조건 제거후 다시주기 (on delete cascade 추가)
alter table sawoninfo drop constraint info_fk_num;
alter table sawoninfo add constraint info_fk_num foreign key(num) 
references sawon(num) on delete cascade;

delete from sawon where num=2;

-- join 으로 데이터 다시 확인
select sawon.num,name,gender,buseo,age,hp,score
from sawon
inner join sawoninfo info on sawon.num=info.num;

-- mysql 함수들 연습
select now() from dual;-- 현재 날짜와 시간
select year(now()) from dual;-- 연도만 출력
select month(now()) from dual;-- 월만 출력 3
select monthname(now()) from dual;-- 월을 영어로 출력
select dayname(now()) from dual;-- 요일을 영어로 출력
select dayofmonth(now()) from dual;-- 일만 출력

-- 문자함수
select concat('happy','day','!!') from dual; -- concat 문자열나열(갯수상관없음)
select replace('hello','e','*') from dual; -- 대치, 변경
select instr('happy day','day') from dual;-- 7 위치 찾기 
select left('Bitcamp 701 Class',7)from dual;-- 왼쪽에서 7글자 추출
select right('Bitcamp 701 Class',9)from dual;-- 오른쪽에서 9글자 추출
select mid('Bitcamp 701 Class',9,3)from dual;-- 9번째 부터 3글자 추출
select substring('Bitcamp 701 Class',9,3)from dual;-- 9번째 부터 3글자 추출
select concat('*',trim('       hello       '),'*') from dual;-- 양쪽 공백제거
select concat('*',ltrim('       hello       '),'*') from dual;-- 왼쪽 공백제거
select concat('*',rtrim('       hello       '),'*') from dual;-- 오른쪽 공백제거
select ucase('Happy'),upper('Happy') from dual;-- 두개 전부 대문자로 변환
select lcase('Happy'),lower('Happy') from dual;-- 두개 전부 소문자로 변환
select reverse('Happy') from dual; -- 거꾸로 출력


-- 숫자 함수
select ceiling(7.1),ceil(7.1) from dual;-- 무조건 올림
select floor(7.9)from dual; -- 무조건 내림
select round(7.47,1)from dual;-- 반올림
select round(7.42,1)from dual;-- 반올림
select mod(7,2)from dual;-- 나머지
select greatest(12,34,56,100,66)from dual;-- 가장 큰 숫자
select least(12,34,56,100,66) from dual;-- 가장 작은 숫자

select count(*) cnt from sawon, sawoninfo where sawon.num=sawoninfo.num;

select buseo, count(*) count, round(avg(score),1) avgscore, max(score) maxscore,
min(score) minscore from sawon group by buseo;



select * from bitcamp;

alter table bitcamp add constraint bitcamp_ck_java check(java between 1 and 100);
alter table bitcamp add constraint bitcamp_ck_spring check(java between 1 and 100);
insert into bitcamp values(1,'김성민',99,66,now());
insert into bitcamp values(2,'박신혜',100,60,now());
insert into bitcamp values(3,'김병만',50,80,now());
insert into bitcamp values(4,'이수근',55,88,now());
insert into bitcamp values(5,'이지은',90,100,now());
insert into bitcamp values(6,'이성민',96,65,now());
insert into bitcamp values(7,'박효신',59,26,now());
insert into bitcamp values(8,'김코크',99,99,now());
insert into bitcamp values(9,'김펩시',44,55,now());
insert into bitcamp values(10,'김사이다',91,26,now());


