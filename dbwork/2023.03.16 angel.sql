        --plsql 연습용 테이블과 연습용 시퀀스 생성
        create sequence seq_test nocache;--1부터 1씩 증가하는 시퀀스 (cache size:0)
        create table shop(
            num number(3) constraint shop_pk_num primary key,
            sangpum varchar2(30),
            su number(3),
            dan number(7),
            today date
        );
        --기본데이터 5개 추가
        insert into shop values (seq_test.nextval,'청바지',2,19000,sysdate);
        insert into shop values (seq_test.nextval,'블라우스',1,22000,sysdate);
        insert into shop values (seq_test.nextval,'통바지',3,21000,sysdate);
        insert into shop values (seq_test.nextval,'티셔츠',2,10000,sysdate);
        insert into shop values (seq_test.nextval,'모자',1,20000,sysdate);
        commit;
        
        --pl-sql: sql언어의 절차적 요소를 추가해서  프로그래밍한 것을 plsql이라고 한다
        --형식
        --DECLARE
        --  변수선언, 커서 선언
        --BEGIN
        -- 각종 출력 또는 로직들..
        --	DBMS_OUTPUT_PUT_LINE(); 한줄 출력 명령어(JAVA PLINTLN 같은 느낌)
        --END;
        
        
        --set serveroutput on-- 콘솔창에서 결과값 나오게 하기 (기본이 off)
        --set serveroutput off --콘솔창에서 결과값 안나오게 하기
        
        DECLARE
            v_no number(4,1);--4자리 숫자,소숫점 이하 1자리
            
        BEGIN
            v_no:=10;--값 대입
            DBMS_OUTPUT.PUT_LINE('숫자는'||v_no||'입니다');--출력
            
        END;
        /
        
        
        --shop table에서 특정 상품정보 가져오기
        DECLARE
            v_sangpum varchar2(30);
            v_su number(3);
            v_dan number(7);
            v_num number(3):=1;--검색해서 가져올 num값
        BEGIN
            select sangpum,su,dan
            into v_sangpum,v_su,v_dan
            from shop where num=v_num;
            
            DBMS_OUTPUT.PUT_LINE(v_num||'번 상품 설명');
            DBMS_OUTPUT.PUT_LINE('상품명: '||v_sangpum);
            DBMS_OUTPUT.PUT_LINE('수 량: '||v_su);
            DBMS_OUTPUT.PUT_LINE('단 가: '||v_dan);
            DBMS_OUTPUT.PUT_LINE('총금액: '||v_su*v_dan);
        END;
        /
        -- 상품명으로 검색해서 데이터 출력
       DECLARE
            v_sangpum varchar2(30):='청바지';--검색해서 가져올 sangpum이름
            v_su number(3);
            v_dan number(7);
            v_num number(3);
        BEGIN
            select num,su,dan
            into v_num,v_su,v_dan
            from shop where sangpum=v_sangpum;
            
            DBMS_OUTPUT.PUT_LINE(v_sangpum||'상품 설명');
            DBMS_OUTPUT.PUT_LINE('시퀀스값: '||v_num);
            DBMS_OUTPUT.PUT_LINE('수 량: '||v_su);
            DBMS_OUTPUT.PUT_LINE('단 가: '||v_dan);
            DBMS_OUTPUT.PUT_LINE('총금액: '||v_su*v_dan);
        END;
        / 
        
        --조건문
        /*
        if 조건식 then
            문장1;
        else
            문장2;
        end if;
        
    다중 조건문
        if 조건식1 then
            문장1;
        elsif 조건식2 then
            문장2;
        else
            문장n;
        .......
        end if;
        
        */
        --특정년도가 무슨띠인지 구하기
    DECLARE
        v_year number(4):=2023;
        v_mod number(2):=mod(v_year,12);--년도를 12로 나눈 나머지
        v_ddi varchar2(10);--띠를 구해서 저장
        
    BEGIN
            if v_mod=0 then v_ddi:='원숭이';
            elsif v_mod=1 then v_ddi:='닭';
            elsif v_mod=2 then v_ddi:='개';
            elsif v_mod=3 then v_ddi:='돼지';
            elsif v_mod=4 then v_ddi:='쥐';
            elsif v_mod=5 then v_ddi:='소';
            elsif v_mod=6 then v_ddi:='호랑이';
            elsif v_mod=7 then v_ddi:='토끼';
            elsif v_mod=8 then v_ddi:='용';
            elsif v_mod=9 then v_ddi:='뱀';
            elsif v_mod=10 then v_ddi:='말';
            else v_ddi:='양';
            end if;
            DBMS_OUTPUT.PUT_LINE(v_year||'년생은'||v_ddi||'띠 입니다');
    END;
    /
    
    --특정년도가 무슨띠인지 구하기
    --년도를 키보드로 입력받아서 띠를 알아볼 수 있도록 수정해보기
    
    accept K_year prompt '년도 4자리를 입력해주세요!';--키보드로 입력받은 데이터를 저장
    DECLARE
        v_year number(4):='&k_year';--키보드로 입력받은 accept변수를 멤버변수에 대입한다
        v_mod number(2):=mod(v_year,12);--년도를 12로 나눈 나머지
        v_ddi varchar2(10);--띠를 구해서 저장
        
    BEGIN
            if v_mod=0 then v_ddi:='원숭이';
            elsif v_mod=1 then v_ddi:='닭';
            elsif v_mod=2 then v_ddi:='개';
            elsif v_mod=3 then v_ddi:='돼지';
            elsif v_mod=4 then v_ddi:='쥐';
            elsif v_mod=5 then v_ddi:='소';
            elsif v_mod=6 then v_ddi:='호랑이';
            elsif v_mod=7 then v_ddi:='토끼';
            elsif v_mod=8 then v_ddi:='용';
            elsif v_mod=9 then v_ddi:='뱀';
            elsif v_mod=10 then v_ddi:='말';
            else v_ddi:='양';
            end if;
            DBMS_OUTPUT.PUT_LINE(v_year||'년생은'||v_ddi||'띠 입니다');
    END;
    /
    --저장된 데이터를 출력
    
    
    --숫자를 입력받아 12 입력시 12는 짝수입니다, 11입력시 11은 홀수입니다
    accept k_su prompt '숫자입력';
    DECLARE
    v_su number(5):='&k_su';
    BEGIN
    if mod(v_su,2)=0 then
        DBMS_OUTPUT.PUT_LINE(v_su||'는 짝수입니다');
    else 
        DBMS_OUTPUT.PUT_LINE(v_su||'는 홀수입니다');
        end if;
    END;
    /
    
     /* 
        반복문
        loop
            명령들;
            exit when 조건;
        end loop;
    */
    
    
    accept k_dan prompt '구구단 숫자를 입력해주세요';
    DECLARE
        v_dan number(3):='&k_dan';
        v_idx number(1):=1;
    BEGIN
        
        DBMS_OUTPUT.PUT_LINE('**['||v_dan||'단]**');
        loop
            DBMS_OUTPUT.PUT_LINE(v_dan||'x'||v_idx||'='||v_dan*v_idx);
            v_idx:=v_idx+1;
            exit when v_idx>9;
        end loop;   
    END;
    /
    
    /*
         또 다른 조건문 case
         
        변수:= 
         case 표현식
         when 값1 then 결과1
         when 값2 then 결과2
         when 값3 then 결과3
         else 결과4
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
       DBMS_OUTPUT.PUT_LINE(v_grade||'학점은 '||v_msg);
    END; 
    /
    --exception 처리
       -- 상품명으로 검색해서 데이터 출력
       DECLARE
            v_sangpum varchar2(30):='&k_sang';--키보드로 입력시 가져올 sangpum 이름데이터
            v_su number(3);
            v_dan number(7);
            v_num number(3);
        BEGIN
            select num,su,dan
            into v_num,v_su,v_dan
            from shop where sangpum=v_sangpum;
            
            DBMS_OUTPUT.PUT_LINE(v_sangpum||'상품 설명');
            DBMS_OUTPUT.PUT_LINE('시퀀스값: '||v_num);
            DBMS_OUTPUT.PUT_LINE('수 량: '||v_su);
            DBMS_OUTPUT.PUT_LINE('단 가: '||v_dan);
            DBMS_OUTPUT.PUT_LINE('총금액: '||v_su*v_dan);
            
            
            --오라클에서의 예외처리 방법
            exception 
            when NO_DATA_FOUND then
            DBMS_OUTPUT.PUT_LINE(v_sangpum||'상품은 DB에 없습니다!!');
            when TOO_MANY_ROWS then
            DBMS_OUTPUT.PUT_LINE(v_sangpum||'상품이 여러개 있습니다');
            when OTHERS then
            DBMS_OUTPUT.PUT_LINE('예외발생!');
           
        END;
        / 
        --shop table 수정
        --shop table에 color 컬럼 추가 기본색 'GREEN'
    alter table shop add color varchar2(20) default 'green';
    --3번은 pink 5번은 yellow 수정
    update shop set color='pink' where num=3;
    update shop set color='yellow' where num=5;
    --데이터 추가: 중복된 상품명도 넣어보기
    insert into shop values(seq_test.nextval,'블라우스',1,19000,sysdate,'ORANGE');
    insert into shop values(seq_test.nextval,'반바지',3,25000,sysdate,'BLUE');
    insert into shop values(seq_test.nextval,'레이스티셔츠',4,8000,sysdate,'GRAY');
    insert into shop values(seq_test.nextval,'찢어진 청바지',1,18000,sysdate,'DARKBLUE');
    COMMIT;
    /*
    for 반복문
    for 변수명 in [reverse] 시작값... 최종값 loop
        문장들;
    end loop;
    */
    
    DECLARE
        v_bdan number(5) := '&k_bdan';
        v_num number(2);
    BEGIN
        DBMS_OUTPUT.PUT_LINE(v_bdan||'단');
        for v_num in 1..9 loop --1~9까지 
            DBMS_OUTPUT.PUT_LINE(v_bdan||'x'||v_num||'='||v_bdan*v_num);
        end loop;
    END;
    /
    --db의 타입을 적용하는 방법
    --db의 데이터를 레코드 단위로 가져오는 방법
    
    DECLARE
        v_sang shop.sangpum%type :='티셔츠';--db의 sangpum 타입을 적용
        v_shop angel.shop%rowtype; -- 레코드 단위로 데이터를 읽기 위한 선언
        
    BEGIN
            select * 
            into v_shop
            from shop
            where sangpum=v_sang;
            
        DBMS_OUTPUT.PUT_LINE('상품명: '||v_shop.sangpum);
        DBMS_OUTPUT.PUT_LINE('색상: '||v_shop.color);
        DBMS_OUTPUT.PUT_LINE('수량: '||v_shop.su);
        DBMS_OUTPUT.PUT_LINE('단가: '||v_shop.dan);
        DBMS_OUTPUT.PUT_LINE('구입일: '||v_shop.today);
    END;
    /
    
    
    /*
    여러 레코드 조회시
    Cursor 커서명
    is
    select 문장; --select 조회의 결과를 Cursor에 저장
    
    for 레코드명 in 커서명 loop
        명령;
    end loop;
    
    */
    
    --shop의 전체 데이터 출력
    
    DECLARE
        Cursor s1
        is
        select  * from shop order by dan desc; --dan이 높은순으로 출력
        
        v_cnt number(5);
    BEGIN
        DBMS_OUTPUT.PUT_LINE('번호   상품명   색상   수량   단가   구입일');
        for s in s1 loop
        DBMS_OUTPUT.PUT_LINE(s.num||'    '||s.sangpum||'    '||s.color||'   '
        ||s.su||'    '||s.dan||'   '||s.today);
        
        end loop;
        
        select count(*) into v_cnt from shop;
        DBMS_OUTPUT.PUT_LINE('총 '||v_cnt||' 개의 상품이 있습니다');
    END;
    /
    
    
    /*
    키보드로 상품명 일부를 입력받아서 해당상품들을 출력하기
    
    만약 상품명을 '바지' 라고 입력시 
    총 4개의 상품이 있습니다 
    
    상품명 : 청바지
    색상: YELLOW
    단가: 23000
    .
    .
    .
    상품명:반바지
    색상:BLUE
    단가:19000
    .
    .
    .
    없을경우
    바지 상품은 목록에 없습니다!
    
    
    */
    
           DECLARE
            v_search shop.sangpum%type :='&sang';
             Cursor s1
            is
            select  * from shop where sangpum like '%'||v_search||'%';--포함된
             v_cnt number(5);
            BEGIN
            select count(*) into v_cnt from shop where sangpum like '%'||v_search||'%' ;
            if v_cnt=0 then
            DBMS_OUTPUT.PUT_LINE(v_search||'상품은 목록에 없습니다');
            else
            DBMS_OUTPUT.PUT_LINE('총'||v_cnt||'개의 상품이 존재합니다');   
             for s in s1 loop   
            DBMS_OUTPUT.PUT_LINE('상품명: '||s.sangpum);
            DBMS_OUTPUT.PUT_LINE('색상: '||s.color);
            DBMS_OUTPUT.PUT_LINE('단가: '||TRIM(to_char(s.dan,'L999,999')));
            DBMS_OUTPUT.PUT_LINE('=================');
            end loop;
          end if;
        END;
        /
        /*
        프로시져(procedure)
    :프로시져는 특정 작업을 수행하는 일종의 서브 프로그램으로
    데이타베이스에 저장되는 객체이다
    반복되는 코드같은 경우 프로시져에 저장해두었다가 호출해서
    실행만 하면 되므로 재사용성이 높다
     
    형식
     create: 새로 생성 ,같은 이름이 있으면 오류 발생
     create or replace: 새로 생성 , 같은 이름이 있으면 덮어쓴다
    create [or replace] procedure 프로시져명
       [파라미터 모드 데이타타입,....]
    is
            변수 선언
    begin
                    코드;
    end;
    /
     
    호출:   exec 프로시져명
                    exec 프로시져명(값..)
    
        */
        
--new 프로시져 생성
create or replace procedure mytest
is 
begin
 DBMS_OUTPUT.PUT_LINE('첫 프로시저 생성!!');
end;
/

--mytest 프로시져 호출
exec mytest;
-- 구구단 출력 프로시저 호출
create or replace procedure gugu(dan number)
is 
begin
if dan<2 or dan>9 then
    DBMS_OUTPUT.PUT_LINE('잘못된 숫자를 입력하셨습니다!');
else
 DBMS_OUTPUT.PUT_LINE('**'||dan||'단**');
 DBMS_OUTPUT.PUT_LINE(' ');
 for a in 1..9 loop
 DBMS_OUTPUT.PUT_LINE(dan||' x '||a||' = '||dan*a);
 end loop;
 end if;
end;
/
--gugu 실행
exec gugu(5);
exec gugu(10);


--shop 에 상품을 추가하는 프로시저
create or replace procedure addshop(
sangpum shop.sangpum%type, su shop.su%type,dan shop.dan%type,
color shop.color%type
)
is 
begin
 DBMS_OUTPUT.PUT_LINE('shop db에'||sangpum||'데이터를 추가합니다');
 insert into shop values(seq_test.nextval,sangpum,su,dan,sysdate,color);
 DBMS_OUTPUT.PUT_LINE(sql%rowcount||'개의 상품이 추가되었습니다');
 commit;
end;
/
--상품 추가
exec addshop('자켓',1,200000,'black');

/*
exec searchsangpum('블라우스');
상품명 색상 단가
----------------
블라우스 Yellow 33000
블라우스 orange 11000

총 2개 검색

없을경우 
블라우스 상품이 없습니다.
*/
create or replace procedure searchsangpum(v_sang shop.sangpum%type)
is 
Cursor s1
            is
            select  * from shop where sangpum like '%'||v_sang||'%';--포함된
             v_cnt number(5);
begin
select count(*) into v_cnt
from shop where sangpum like'%'||v_sang||'%';
if v_cnt=0 then
    DBMS_OUTPUT.PUT_LINE(v_sang||' 관련된 상품이 없습니다.');
    else
    DBMS_OUTPUT.PUT_LINE(v_sang||'상품은 총 '||v_cnt||'개 조회 완료');
    DBMS_OUTPUT.PUT_LINE(' ');
    DBMS_OUTPUT.PUT_LINE('상품명    색상     단가');
    DBMS_OUTPUT.PUT_LINE('=======================');   
    
    for s in s1 loop
    DBMS_OUTPUT.PUT_LINE(s.sangpum||'    '||s.color||'   '||s.dan);
    end loop;
    end if;
    commit;
end;
/
exec searchsangpum('블라우스');
exec searchsangpum('바지');