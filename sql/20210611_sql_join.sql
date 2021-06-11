
-- 2021.06.11
-- JOIN

-- Cross join
-- 스키마의 합 :  집합의 합 연산과 같다
select *
from emp, dept
where emp.deptno=dept.deptno;

--
-- 이름이 SCOTT인 사람의  -->where e.ename='SCOTT'
-- 부서명을 출력해봅시다.
-- 1.출력해야 하는 컬럼을 가지는 테이블 확인
-- 이름 : emp, 부서명 : dept
select e.ename, d.dname
from emp e, dept d
where e.deptno=d.deptno --모든 사람
--where e.deptno=d.deptno and ename='SCOTT' --scott 한정
order by d.dname, e.ename;




