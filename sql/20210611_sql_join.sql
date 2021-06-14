
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

select o.orderid, c.name, b.bookname
from orders o, customer c, book b
where o.custid=c.custid and o.bookid=b.bookid
    --왼쪽 테이블을 기준으로 몇개의 테이블을 붙이든 공통된 조건을 찾아 묶을 수 있다
order by o.orderid;


-- ANSI -> INNER JOIN
-- 오라클 EQUI JON
select *
from emp, dept
where emp.deptno=dept.deptno;
--inner join 사용
select *
from emp e inner join dept d
on e.deptno=d.deptno;

-- 이름이 SCOTT인 사람의  -->where e.ename='SCOTT'
-- 부서명을 출력해봅시다.
select *
from emp e inner join dept d
on e.deptno=d.deptno
where e.ename='SCOTT';
---------------------------------------------------

--USING
--on 절을 생략하고 -> using을 이용하면 조건식 더 간략하게 처리 가능
--단, 비교하는 컬럼의 이름이 같을 때
select *
from emp e inner join dept d
--on e.deptno=d.deptno
using(deptno)
where e.ename='SCOTT';


--NATURAL JOIN
select *
from emp natural join dept;


--OUTER JOIN
select e.empno, e.ename, e.mgr, m.ename
from emp e, emp m
where e.mgr=m.empno(+); -->표현하고자하는 컬림이 테이블의 반대쪽, null값을 가지는 위치
----------------------------------

-- [left | right | full] OUTER JOIN
select e.ename, e.mgr, m.ename as"관리자"
--from emp e left outer join emp m
from emp m right outer join emp e
on e.mgr=m.empno
;


-- 회원별 구매내역 출력
select c.name, o.orderid
from orders o, customer c
where o.custid=c.custid
order by c.name; --박세리는 출력x

select c.name, o.orderid
from orders o, customer c
where o.custid(+)=c.custid --회원 아이디는 모두 출력(orderid가 null이어도 출력)
order by c.name;

select c.name, count(*) as "구매회수", avg(saleprice)
from orders o, customer c
where o.custid=c.custid
group by c.name
order by c.name;

select c.name, count(o.orderid) as "구매회수", avg(saleprice)
from orders o, customer c
where o.custid(+)=c.custid
group by c.name
order by c.name;


