    --ppt 23p table
    --table 생성 (person): 번호,이름,나이,성별,지역,현재날짜
    create table person(
        num number(3) primary key,
        name varchar2(15) not NULL,
        age number(3),
        gender varchar2(10) default '남자',
        city varchar2(15) default '서울',
        today date
    );
    
    --데이터 조회
    select * from person;    
    
     --insert 컬럼데이터 일부만 추가할 경우
     insert into person(num,name,today) values(1,'홍길동',sysdate);
     --pk(primary key),nn(not null)이경우 값을 안넣어주면 오류 발생-확인
     --ORA-01400: NULL을 ("ANGEL"."PERSON"."NUM") 안에 삽입할 수 없습니다
     insert into person(name,age,today) values('강철수',23,'2022-10-10');
     --nn 속성이 들어간 컬럼은 무조건 넣어줘야된다, 이번에는 num에 같은 데이터 넣어보자
     --ORA-00001: 무결성 제약 조건(ANGEL.SYS_C008318)에 위배됩니다
      insert into person(num,name,age,today) values(1,'강철수',23,'2022-10-10');
      insert into person(num,name,age,today) values(2,'강철수',23,'2022-10-10');
      --일부 컬럼이 아니라 순서대로 모든 컬럼값을 넣을 경우 컬럼값 생략가능
      insert into person values(3,'강호순',34,'여자','제주도','2020-02-02');
      --각각 7개  정도 추가
      insert into person values(4,'이효리',30,'여자','부산','2019-01-02');
      insert into person values(5,'김진수',40,'남자','대구',sysdate);
      insert into person values(6,'이진',39,'여자','뉴옥','2020-11-22');
      insert into person values(7,'강호동',50,'남자','서울','2023-01-01');
      insert into person values(8,'김00',50,'여자','서울','2023-02-01');
      insert into person values(9,'박00',50,'남자','서울','2022-12-20');
      insert into person values(10,'이00',50,'남자','서울','2023-03-01');
      commit;
      
      --박00 의 age와 city 수정
      update person set age=29,city='제주도' where name='박00';
      --홍길동의 나이수정
      update person set age=29 where name='홍길동';
      --이진의 today를 현재날짜로 수정
      update person set today=sysdate where name = '이진';
      commit;
      --delete: where 조건을 안쓰면 전체가 삭제됨
      delete from person;
      --다시 살리기
      rollback;--마지막 커밋 이후까지만 롤백가능
      delete from person where name='홍길동';
      --나이가 30 미만인 경우  모두 삭제
     delete from person where age<30;
     rollback;
     --지금부터는 테이블 구조 수정 연습
     --테이블에 컬럼 추가
     alter table person add score number(3) default 50;
     --방금 추가한 score 컬럼 제거하기
     alter table person drop column score; 
     --컬럼 타입 수정
     alter table person modify city varchar2(20);
     --컬럼명 수정
     alter table person rename column today to ipsaday;
     --제약조건 제거: name 에 not null 제약조건이 들어있다(제약조건 이름을 안줘서 기본이름으로 들어가있다.)
     --SYS_C008317제거
     alter table person drop constraint SYS_C008317;
      --name에 새로운 제약조건을 추가해보자 (unique)
      alter table person add constraint PERSON_UQ_NAME UNIQUE(NAME);
      --이름에 같은 이름을 넣으면 이제 오류가 발생함
      insert into person (num,name) values (11,'강호동');--오류
      --gender 에 '남자', '여자' 외의 데이터를 넣으면 오류 발생되도록 check 제약조건 사용
      alter table person add constraint PERSON_CK_GENDER check(GENDER in('남자','여자'));
      --age 에 10~50세만 추가 가능하도록 제약조건을 추가
      alter table person add constraint PERSON_CK_AGE check(AGE>=10 AND AGE<=50);
      --제약 조건을 위배하도록 출력
      --ORA-02290: 체크 제약조건(ANGEL.PERSON_CK_AGE)이 위배되었습니다
      insert into person (num,name,age) values(100,'유아인',60);--오류발생4
      --문제 
      --PK 제약조건을 제거후 PERSON_PK_NUM 이라는 새로운 제약조건을 추가해보자
      alter table person drop constraint SYS_C008318;
      alter table person add constraint PERSON_PK_NUM primary key(NUM);
      --문제2
      --buseo  라는 컬럼 추가 varchar2(10) 기본값을 '교육부'
      alter table person add buseo varchar2(10) default '교육부';
      --buseo에 제약조건 추가 '교육부','홍보부','인사부' 3개만 추가가 가능하도록 설정
      alter table person add constraint PERSON_CK_BUSEO CHECK(BUSEO IN ('교육부','홍보부','인사부'));
      --문제3
      --강씨,이씨 성을 가진 사람들은 모두 '인사부'로 데이터 수정
       update person set BUSEO='인사부' WHERE NAME LIKE '강%' OR NAME LIKE'이%';
      --박씨,김씨는 '홍보부'로 데이터 수정
      update person set BUSEO='홍보부' WHERE NAME LIKE '박%' OR NAME LIKE'김%';
      --문제4
      --남자 여자 성별로 인원수와 평균나이 (정수) 구하기-인원수가 많은것 부터 출력
      select GENDER 성별,COUNT(*) 인원수 , CEIL(avg(AGE)) 평균나이 from PERSON
      GROUP BY GENDER ORDER BY 2 DESC;
      --부서별 인원수와 평균나이 구하기-부서명의 오름차순 출력
      select BUSEO 부서명,COUNT(*) 인원수 , CEIL(avg(AGE)) 평균나이 from PERSON
      GROUP BY BUSEO ORDER BY 1 ;
      
      --시퀀스 생성
      --가장 많이 사용하는 기본 시퀀스 : 1부터 1씩 증가하는 시퀀스
      CREATE SEQUENCE SEQ1;
      CREATE SEQUENCE SEQ2 START WITH 1 INCREMENT BY 1;-- 위와 같음
      CREATE SEQUENCE SEQ3 START WITH 10 INCREMENT BY 5 NOCACHE;-- NOCACHE: CACHE를 0으로 설정
       CREATE SEQUENCE SEQ4 MAXVALUE 100;-- MAX값 100까지만 발생
      --시퀀스 조회
      SELECT * FROM SEQ;
      
      --테이블 조회
      SELECT * FROM TAB;
      
      --시퀀스 제거
      DROP SEQUENCE SEQ2;
      DROP SEQUENCE SEQ4;
      
      --다음값 발생 NEXTVAL, 현재값 CURRVAL
      SELECT SEQ1.NEXTVAL,SEQ3.NEXTVAL FROM DUAL; --반복해서 실행해보자
      SELECT SEQ1.CURRVAL,SEQ3.CURRVAL FROM DUAL;-- 마지막 발생값
 COMMIT;     