    --문제 
    --테이블 생성 (student) : num 숫자(5),name 문자열(10),height 숫자 (5,1),
    --java 숫자(3) 기본값 10 ,spring 숫자 (3) 기본값 10,ban 문자열(20)
     create table student(
     num number(5),name varchar2(10),height number(5,1),
     java number(3) default 10,spring number(3) default 10,
     ban varchar2(20)
     );
    
    --시퀀스 생성 seq_stu 기본 (1부터 1씩증가) , nocache 추가
    CREATE SEQUENCE SEQ_stu START WITH 1 INCREMENT BY 1 nocache;
    --제약조건들 추가
    --num에 primary key  추가
     alter table student add constraint STUDENT_PK_NUM primary key(NUM);
    --java나  spring은 1~100만 가능하도록 check제약조건 추가
    alter table student add constraint STUDENT_CK_JAVA CHECK(JAVA>=1 AND JAVA<=100);
    alter table student add constraint STUDENT_CK_SPRING CHECK(SPRING>=1 AND SPRING<=100);
    --ban은 '햇님반','달님반','별님반' 만 추가하도록 check 제약 조건 추가
    alter table student add constraint STUDENT_CK_BAN CHECK(BAN IN('햇님반','달님반','별님반'));
    --5개 정도 데이터 추가
    INSERT INTO STUDENT (NUM,NAME,JAVA,HEIGHT,BAN) VALUES(SEQ_STU.NEXTVAL,'김진아',89,167.5,'햇님반');
    INSERT INTO STUDENT VALUES(SEQ_STU.NEXTVAL ,'이효리',178.6,70,88,'달님반');
    INSERT INTO STUDENT VALUES(SEQ_STU.NEXTVAL ,'이진아',160.6,100,88,'별님반');
    INSERT INTO STUDENT VALUES(SEQ_STU.NEXTVAL ,'김병만',158.6,60,66,'햇님반');
    INSERT INTO STUDENT VALUES(SEQ_STU.NEXTVAL ,'이수근',160.6,60,68,'달님반');
    COMMIT;
    
    --NUM이 3인 사람의 JAVA점수를 99로 , BAN 을 '달님반'으로 수정
    UPDATE STUDENT SET JAVA=99,BAN='달님반' WHERE NUM=3;
    --NUM이 5인 사람의 키를 188.9로 수정
    UPDATE STUDENT SET HEIGHT=188.9 WHERE NUM=5;
    --NUM이 2인 사람의 데이터 삭제
     delete from STUDENT where NUM=2;
     
    --조회 이름 반 자바 스프링 총점 평균   출력-총점이 높은사람부터 출력
    select name 이름, ban 반 ,java 자바,spring 스프링, java+spring 총점,
    (java+spring)/2 평균 from student order by 총점 desc;
    
    commit;
    --DB 정규화(Nomalization)
    --정규화란? 한마디로 DB서버의 메모리를 낭비하지 않기 위해서
    --어떤 테이블을 식별자를 가지는 여러개의 테이블로 나누는 과정을 정규화라고함
    --정규화된 데이터베이스는 중복이 최소화 되도록 설계된 데이터베이스이다.
    --장점:메모리 절약,구조화된 시스템으로 인하여 관리하기 편하다
    --단점:조회비율이 매우 높은 시스템의 경우에는 테이블간의 join연산이 반복적으로 
    --이뤄지기 때문에 질의 응답 속도가 약간 느려질수있다
    
    --student 의 num을 외부키로 갖는 새로운 테이블 stuinfo를 만들어보자
    --외부키는 테이블 생성시 설정해도되고  생성후 테이블수정으로 추가해도됨
    --ppt29p
    create table stuinfo(
        idx number(5) constraint info_pk_idx primary key,
        num number(5),
        addr varchar2(20),
        hp varchar(15)
    );
    --외부키 제약조건
    --stuinfo의 num 은 student의 num값만 넣을 수 있도록 설정
    alter table stuinfo add constraint info_fk_num foreign key(num) references student(num);
    --stuinfo 의 num에 만약 3을 추가했다면 student table에서 num이 3인 데이터는 삭제할 수 없다
    --단 제약조건 추가시 on delete cascade를 추가했을경우 부모테이블의 num=3인 데이터를 삭제시
    --stuinfo의 num=3,인 모든데이터는 자동으로 삭제된다.
    --stuinfo에  데이터 추가하기
    insert into stuinfo values(seq_stu.nextval,3,'서울시 강남구','010-2222-3333');
    --student에 없는 2번 추가
   -- ORA-02291: 무결성 제약조건(ANGEL.INFO_FK_NUM)이 위배되었습니다- 부모 키가 없습니다
     insert into stuinfo values(seq_stu.nextval,2,'서울시 강동구','010-2345-6789');
    --4번추가
    insert into stuinfo values(seq_stu.nextval,4,'서울시 강동구','010-2345-6789');
    insert into stuinfo values(seq_stu.nextval,1,'제주도 애월읍','010-7777-7777');
    commit;
    
    --조회
    --각각 조회 할경우 모든 정보를 알수 없다
    select * from stuinfo;
    --join으로 두테이블을 합쳐서 필요한 정보 가져오기
    --ppt43p
    --inner join or equi join이라고 한다. 서로 num값이 같을 경우에만 가져옴
    select sd.num 시퀀스 ,sd.name 학생명, sd.height 키, sd.ban 반, si.addr 주소, si.hp 핸드폰,
    sd.java 자바,sd.spring 스프링
    from student sd,stuinfo si
    where sd.num=si.num;
    
    --이때 양쪽 테이블에 공통적으로 가지고있는 컬럼 제외하고는 앞에 테이블명 생략가능
     select sd.num 시퀀스 ,name 학생명, height 키, ban 반, addr 주소, hp 핸드폰,
    java 자바,spring 스프링
    from student sd,stuinfo si
    where sd.num=si.num;
    
    --outer join 으로 추가 되지않은 데이터를 찾아보자
    --외부키로 연결된 서브테이블쪽에 (+)
     select sd.num 시퀀스 ,name 학생명, height 키, ban 반, addr 주소, hp 핸드폰,
    java 자바,spring 스프링
    from student sd,stuinfo si
    where sd.num=si.num(+) and addr is null;
    
    --student table의 num=1 인 데이터 삭제
   -- ORA-02292: 무결성 제약조건(ANGEL.INFO_FK_NUM)이 위배되었습니다- 자식 레코드가 발견되었습니다
   -- 삭제를 하려면 stuinfo의 데이터를 먼저 삭제한 후 student 데이터 삭제가능
    delete from student where num=1;
    --sub table의 num=1을 삭제후 student table num=1 삭제 
    delete from stuinfo where num=1;
    delete from student where num=1;
    
    --테이블 제거시 서브테이블을 먼저 제거후 부모 테이블 제거
    drop table stuinfo;
    drop table student;
    -----------------------------------------------------------------------------
    --이번에는  부모테이블의 데이터 삭제시 서브테이블의 테이터도 자동으로 삭제 되도록 
    --외부키를 설정해보자
    --시퀀스 생성
    create sequence seq_shop;
    --shop, cart
create table shop(
sang_no number(3) constraint shop_pk_no primary key,
sang_name varchar2(30), sang_price number(10)
);
--외부키 설정시 on delete cascade 를 붙이면 부모테이블 삭제시 자식테이블에 추가된
--데이터도 같이 삭제됨
create table cart(
    cart_no number(3) constraint cart_pk_no primary key,
    sang_no number(3),
    cnt number(3),
    cartday date,
    constraint cart_fk_no foreign key(sang_no)references shop(sang_no) on delete cascade
);
--5개의 상품  등록
insert into shop values(seq_shop.nextval,'블라우스',12000);
insert into shop values(seq_shop.nextval,'조끼',19000);
insert into shop values(seq_shop.nextval,'청바지',25000);
insert into shop values(seq_shop.nextval,'체크코트',99000);
insert into shop values(seq_shop.nextval,'티셔츠',11000);
commit;

--3개의 상품을 카트에 담아보자
insert into cart values(seq_shop.nextval,2,3,sysdate);
insert into cart values(seq_shop.nextval,3,1,'2023-01-13');
insert into cart values(seq_shop.nextval,5,3,sysdate);
commit;
--조회
--sang_no 상품번호, 상품명, 단가, 수량, 구입일(년4-월2-일2 형식) 출력
select 
s.sang_no 상품번호,sang_name 상품명,
to_char(sang_price,'L999,999') 단가, cnt 수량,
to_char(cartday,'YYYY-MM-DD')구입일
from shop s,cart c
where s.sang_no=c.sang_no;
--cart 에 담기지 않은 상품의 상품번호와 상품명 출력
select
s.sang_no 상품번호,sang_name 상품명
from shop s,cart c
where s.sang_no=c.sang_no(+)and cnt is null;
--삭제확인 (2,3,5 번 상품이 cart에 담겨있음)
--shop의 2,3 번 삭제후 cart 테이블 확인
delete from shop where sang_no=2 or sang_no=3;

--오늘 연습한 모든 테이블과 시퀀스 제거
drop sequence seq_shop;
drop sequence seq_stu;
drop sequence seq1;
drop sequence seq3;

drop table cart;
drop table shop1;
drop table person;