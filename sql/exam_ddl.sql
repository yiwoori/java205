
--2021.06.15 테이블 정의서

create table phoneInfo_Basic (
    idx NUMBER(6) CONSTRAINT PIB_idx_pk PRIMARY KEY,
    fr_name VARCHAR2(20) NOT NULL,
    fr_phonenumber VARCHAR2(20) NOT NULL,
    fr_email VARCHAR2(20),
    fr_address VARCHAR2(20),
    fr_regdate DATE DEFAULT sysdate    
);
desc phoneInfo_Basic;

create table phoneInfo_univ (
    idx NUMBER(6) CONSTRAINT PIU_idx_pk PRIMARY KEY,
    fr_u_major VARCHAR2(20) DEFAULT 'N' NOT NULL,
    fr_u_year NUMBER(1) DEFAULT 1 CHECK (fr_u_year BETWEEN 0 and 5),
    fr_u_ref NUMBER(7) REFERENCES phoneInfo_Basic(idx) NOT NULL
);
desc phoneInfo_univ;

create table phoneInfo_com (
    idx NUMBER(6) CONSTRAINT PIC_idx_pk PRIMARY KEY,
    fr_c_company VARCHAR2(20) DEFAULT 'N' NOT NULL,
    fr_ref NUMBER(6) REFERENCES phoneInfo_Basic(idx) NOT NULL
);
desc phoneInfo_com;





-- 2021.06.16 DML 작성

-- 1. phoneInfo_basic 테이블의 SELECT, UPDATE, DELETE, INSERT 하는 SQL

    --INSERT
    insert into phoneInfo_Basic (idx, fr_name, fr_phonenumber, fr_regdate)
        VALUES (01, '친구1', '010-1234-5678', sysdate);
    insert into phoneInfo_Basic (idx, fr_name, fr_phonenumber)
        VALUES (02, '친구2', '010-1234-5678');
    insert into phoneInfo_Basic (idx, fr_name, fr_phonenumber, fr_address)
        VALUES (03, '친구3', '010-1234-5678', '부산');
    insert into phoneInfo_Basic (idx, fr_name, fr_phonenumber, fr_address)
        VALUES (04, '친구4', '010-1234-5678', '제주');
    insert into phoneInfo_Basic (idx, fr_name, fr_phonenumber)
        VALUES (05, '친구5', '010-1234-5678');
    insert into phoneInfo_Basic (idx, fr_name, fr_phonenumber, fr_regdate)
        VALUES (06, '친구6', '010-1234-5678', sysdate);
    
    --UPDATE
    update phoneInfo_Basic set fr_phonenumber = '010-8765-4321', fr_name = '사과' where idx=01;
    update phoneInfo_Basic set fr_regdate = sysdate, fr_name = '바나나' where idx=02;
    update phoneInfo_Basic set fr_email = '3@Gmail.com' where idx=03;
    update phoneInfo_Basic set fr_name='수박', fr_email = '4@Gmail.com' where idx=04;
    
    --DELETE
    delete from phoneInfo_Basic where fr_name='친구3';
    
    --SELECT
    select idx, fr_name from phoneInfo_Basic order by idx;
    select fr_name, fr_regdate from phoneInfo_Basic where idx=1;



-- 2. phoneinfo_univ 테이블의 SELECT, UPDATE, DELETE, INSERT 하는 SQL

    --INSERT
    insert into phoneInfo_univ (idx, fr_u_major, fr_u_ref)
        VALUES (01, '경영학과', 01);
    insert into phoneInfo_univ (idx, fr_u_major, fr_u_ref, fr_u_year)
        VALUES (02, '디자인과', 02, 3);
    insert into phoneInfo_univ (idx, fr_u_major, fr_u_ref, fr_u_year)
        VALUES (04, '서양학과', 04, 2);
    
    --UPDATE
    update phoneInfo_univ set fr_u_year = 1 where idx = 01;
    update phoneInfo_univ set fr_u_major = '서양학과' where idx = 02;
    
    --DELETE
    delete from phoneInfo_univ where idx = 04;
    
    --SELECT
    select * from phoneInfo_univ where fr_address = '제주'; --x
    select * from phoneInfo_univ order by idx;
    
    

-- 3. phoneinfo_com 테이블의 SELECT, UPDATE, DELETE, INSERT 하는 SQL
    --INSERT
    insert into phoneinfo_com
        values (05, '회사1', 05);
    insert into phoneinfo_com
        values (06, '회사2', 06);
    
    --UPDATE
    update phoneinfo_com set fr_c_company = '회사3';
    update phoneinfo_com set fr_c_company = '회사2' where idx = 05;
    
    --DELETE
    delete from phoneinfo_com where fr_ref = 05 and fr_c_company = '회사2';
    
    --SELECT
    select fr_c_company from phoneinfo_com;




-- 전체 친구 정보
select *
from phoneInfo_basic pb, phoneinfo_univ pu, phoneinfo_com pc
--where pb.idx=pu.fr_u_ref and pb.idx=pc.fr_ref;
where pb.idx=pu.fr_u_ref(+) and pb.idx=pc.fr_ref(+)
order by pb.idx;



-- 대학 친구, 회사 친구 테이블 -> 기본키(대리키) -> 시퀀스 생성 -> insert 개선 

-- sequence : 번호 재생기
create sequence pi_idx_pk;
create sequence pi_u_idx_pk start with 7 increment by 1; --중복되지 않는 위치에서 시작
create sequence pi_c_idx_pk start with 7 increment by 1;






select * from phoneInfo_Basic;
rollback;

drop table phoneInfo_Basic;