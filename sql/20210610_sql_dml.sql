
-- 2021.06.16

-- DML



-- 테스트 테이블 생성
create table dept01
as
select * from dept where 1=0;



-- 데이터 입력 : 행단위 입력
-- insert into 테이블명 (컬럼명, ...) values (데이터, ...)
-- 컬럼명 : 테이블이 가지고 있는 컬럼명
-- 입력하고자 하는 컬럼과 입력 데이터의 개수 반드시 일치
-- 컬럼의 도메인과 입력 데이터의 타입 반드시 일치
-- 기본키와 같이 not null의 경우 컬럼 생략 불가능

desc dept01;
select * from dept01;

-- 1번부서 개발팀 서울 위치
insert into dept01 (deptno, dname, loc) values (1, '개발팀', '서울');

insert into dept01 (dname, loc) values ('개발팀', '서울');




-- 데이터 저장할 컬럼 기술 생략 가능 : 모든 컬럼의 데이터를 입력할 때
-- values 절의 데이터 순서 : 테이블이 생성될 때 정의된 컬럼의 순서 (desc 테이블명;으로 확인)
desc dept01;
insert into dept01 VALUES (20, '마케팅', '부산');


desc emp;

insert into emp (empno, deptno) values (7777, 60);
select * from emp;
ROLLBACK;



desc orders;

insert into orders ( orderid, custid, bookid ) values ( 11, 6, 11 );



-- 서브 쿼리를 이용한 데이터 입력
drop table dept02;
create table dept02
as select * from dept where 1=0;
select * from dept02;

-- 데이터 입력
insert into dept02 
select * from dept; --서브쿼리

insert into dept02 
select * from dept02; --자기 자신도 가능




-- 데이터 변경 : 행단위로 선택하고 변경하고자하는 컬럼을 기술
--      update 테이블명 set 컬럼이름=새로운데이터, 컬럼이름=새로운데이터, ...
--      where 행을 선택하는 조건

create table dept03
as select * from dept; --데이터까지
select * from dept03;

-- 모든 부서의 위치 SEOUL로 이동
update dept03
set loc='SEOUL';

-- 10번 부서 위치를 BUSAN으로 이동, 부서 이름도 DEV로 변경
update dept03
set loc='BASAN', dname='DEV'
where deptno=10;



-- emp01 테이블을 새롭게 생성하고 update
drop table emp01;
create table emp01
as select * from emp;
select * from emp01;

-- 모든 사원의 부서 번호를 30번으로 수정
update emp01
set deptno = 30;

-- 모든 사원의 급여를 10% 인상
update emp01
set sal = sal*1.1;

-- 모든 사원의 입사일을 오늘로 지정
update emp01
set hiredate = sysdate;

-- 부서번호가 10번인 사원의 부서번호를 30번으로 수정
update emp01
set deptno = 30
where deptno = 10;

-- 급여가 3000 이상인 사원만 급여를 10% 인상
update emp01
set sal = sal*1.1
where sal >= 3000;


-- 81년에 입사한 사원의 입사일을 오늘로 수정
update emp01
set hiredate = sysdate
where substr(hiredate, 1, 2) = '81'; --substr 문자열로 변환

--SCOTT의 부서번호는 20번으로, 직급은 MANAGER로 한꺼번에 수정
update emp01
set deptno=20, job='MANAGER'
where ename='SCOTT';

-- SCOTT 사원의 입사일자는 오늘로,
-- 급여는 50으로 커미션을 4000으로 수정
update emp01
set hiredate=sysdate, sal=50, comm=4000
where ename='SCOTT';






