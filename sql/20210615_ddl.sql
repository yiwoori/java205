
-- 2021.06.15

-- DDL : 데이터 정의어

-- 테이블 생성 : create table
-- 테이블 수정 : alter table
-- 테이블 삭제 : drop table





-- 테이블 생성 : create table
-- Create table (
-- 컬럼이름 타입(사이즈) 제약조건정의, --> 각 컬럼의 제약 조건 정의
-- ...
-- )

-- Create tablr (
-- 컬럼이름 타입(사이즈), -->도메인 정의
-- ...,
-- 제약조건 정의, --테이블의 모든 컬럼의 제약 조건 정의
-- ...
-- )



--

create table emp01 (
    empno number(4),
    ename varchar2(20),
    sal number(6,2)
);


-- 서브 쿼리를 이용해 기존 테이블의 구조를 복사하고 해당 튜플도 복사
-- 내용은 모두 복사되지만, 제약 조건까지 복사되진 않는다
create table emp02
as
select * from emp
;
 -- 복사한 내용 확인
select * from emp02;


create table emp03
as
select empno, ename, sal from emp --지정한 컬럼만 복사 
;
 --복사 내용 확인 
select * from emp03;


create table emp04
as
select * from emp where deptno=30 --지정한 조건에 해당하는 내용만 복사 
;
select * from emp04;


create table emp05
as
select * from emp where 1=2
;
select * from emp05; --데이터 없이 구조만 복사 





-- 테이블 변경 : alter table
-- alter table { 테이블 이름 } add
-- alter table { 테이블 이름 } modify
-- alter table { 테이블 이름 } drop



-- emp01 테이블에 job 컬럼 추가
alter table emp01
add (job varchar2(9) )
;
 --확인
desc emp01;



-- emp01 테이블의 job 컬럼 사이즈를 수정 9->130
alter table emp01
modify ( job varchar2(130) not null ) --제약조건 not null
;
desc emp01;



-- emp01 테이블의 job 컬럼 삭제
alter table emp01
drop column job
;
desc emp01;



--테이블 삭제
drop table emp05;
drop table emp04;
drop table emp03;




-- 모든 행을 삭제 truncate : 롤백 불가
truncate table emp02;


-- 테이블 이름 변경 -> rename 현재이름 새로운이름
rename test to emp02;
select * from emp02;




drop table emp02;

create table emp02
as
select empno, ename, sal, job from emp where 1=0 --구조만 복사 
;
desc emp02;



select * from emp02;

drop table emp02;

--컬럼 레벨에서 제약사항 정의 
create table emp02 (
    empno number(4) constraint emp02_empno_pk primary key,
    ename varchar2(20) constraint emp02_ename_nn not null,
    sal number(6,2) constraint emp02_sal_ck check (sal>500 and sal<5000),
    job varchar(20) DEFAULT '미지정', --입력값이 없으면 '미지정'으로
    deptno number constraint emp02_deptno_fk REFERENCES dept(deptno) -- dept 테이블의 deptno 참조 
);
desc emp02;

insert into emp02 (empno, ename, sal, job, deptno) values(2000, 'SON', 4000, 'MANAGER', 40);
insert into emp02 (empno, ename, sal) values(200, 'SON', 3000);


desc dept;







--테이블 레벨에서 제약사항 정의 
create table emp03 (
    empno number(4), -- constraint emp02_empno_pk primary key,
    ename varchar2(20) constraint emp03_ename_nn not null,
    sal number(6,2) constraint emp03_sal_ck check (sal>500 and sal<5000),
    job varchar(20), -- DEFAULT '미지정', --입력값이 없으면 '미지정'으로
    deptno number, -- constraint emp02_deptno_fk REFERENCES dept(deptno) -- dept 테이블의 deptno 참조 
    --------------------------
    --제약 정의
    constraint emp03_empno_pk PRIMARY KEY (empno), --pk제약 
    --constraint emp03_ename_nn not null, --not null은 컬럼 레벨에서만 정의 가능
    --contsraint emp03_sal_ck check (sal>500 and sal<5000), --컬럼레벨에서 정의
    constraint emp03_deptno FOREIGN KEY (deptno) REFERENCES dept(deptno) 
);
