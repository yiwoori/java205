
-- 2021.06.11

-- JOIN : 스키마의 합



-- Cross join
-- 스키마의 합 :  집합의 합 연산과 같다
select *
from emp, dept
where emp.deptno=dept.deptno;


--EQUI JOIN
-- 이름이 SCOTT인 사람의  -->where e.ename='SCOTT'
-- 부서명을 출력해봅시다.
-- 1.출력해야 하는 컬럼을 가지는 테이블 확인
-- 이름 : emp, 부서명 : dept
select e.ename, d.dname
from emp e, dept d --별칭
where e.deptno=d.deptno --공통 컬럼 묶기
--where e.deptno=d.deptno and ename='SCOTT' --scott 한정
order by d.dname, e.ename; --별칭으로 해달 컬럼 지정


--NON EQUI JOIN
-- 동등비교가 아닌 크다 작다와 같은 비교로 조인의 조건을 작성
select * from salgrade;

select e.ename, e.sal, s.grade, s.losal, s.hisal
from emp e, salgrade s --새로운 table
--where e.sal >= s.losal and e.sal <= s.hisal
where e.sal between s.losal and s.hisal
order by e.ename;


-- ANSI CROSS JOIN
select *
from emp cross join dept; 

select *
from emp, dept                  --외래키와 참조하는 R PK(기본키)
where emp.deptno=dept.deptno;   --'   ' -> 참조 Table 기본키 도메인과 외래키의 도메인을 같게

select * from orders;
select * from customer;
select * from book;

select 
from orders o, customer c, book b
where o.custid=c.custid and o.bookid=b.bookid 
order by o.orderid;



