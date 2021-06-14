
-- 2021.06.14

-- 32. EQUI 조인을 사용하여 SCOTT사원의 부서번호와 이름을 출력하시오
select d.deptno, e.ename
from emp e, dept d
where e.deptno=d.deptno
    and e.ename='SCOTT';


-- 33. INNER JOIN과 ON 연산자를 사용해
-- 사원이름, 그 사원이 소속된 부서 이름, 지역명 출력
select e.ename, d.dname, d.loc
from emp e inner join dept d
on e.deptno=d.deptno
order by d.dname;


-- 36. 조인과 WildCARD를 사용하여
-- 이름에 'A'가 포함된 모든 사원의 이름과 부서명 출력
select e.ename, d.dname
from emp e inner join dept d
on e.deptno=d.deptno
where e.ename like '%A%';

select e.ename, d.dname
from emp e inner join dept d
using (deptno)
where e.ename like '%A%';

select e.ename, d.dname
from emp e, dept d
where e.deptno=d.deptno
    and e.ename like '%A%'
order by e.ename;


-- 37. JOIN을 이용하여 NEWYORK에서 근무하는
-- 모든 사원의 이름, 업무, 부서번호, 부서명 출력
select e.ename, e.job, deptno, d.dname
from emp e inner join dept d
using (deptno)
where d.loc='NEW YORK';


-- 38. SELF JOIN을 사용하여
-- 사원의 이름, 사원번호, 관리자 이름 출력
select e.ename, e.empno, m.ename
from emp e, emp m
where e.mgr=m.empno;


-- 39. OUTER JOIN, SELF JOIN을 사용하여
-- 관리자가 없는 사원을 포함하여
-- 사원번호를 기준으로 내림차순 정렬 후 출력
select e.empno, e.ename, m.ename --m.ename***
from emp e, emp m
where e.mgr=m.empno(+)
order by e.empno desc;


-- 40. SELF JOIN을 사용하여 지정한 사원의 이름, 부서번호,
-- 지정한 사원과 동일한 부서에서 근무하는 사원 출력
-- (SCOTT)
select e.ename, e.deptno
from emp e, emp s
where e.deptno=s.deptno
    and s.ename='SCOTT'; --***


-- 41. SELF JOIN을 사용하여
-- WARD 사원보다 늦게 입사한 사원의 이름과 입사일 출력
select e.ename, e.hiredate
from emp e, emp w
where w.ename='WARD' and e.hiredate>w.hiredate
order by e.hiredate;


-- 42. SELF JOIN을 사용하여
-- 관리자보다 먼저 입사한 모든 사원의 이름, 입사일을
-- 관리자의 이름, 입사일과 함께 출력
select e.ename, e.hiredate as "E_HIREDATE",
        m.ename as "MGR", m.hiredate as "MGR_HIREDATE"
from emp e, emp m
where e.mgr=m.empno and m.hiredate > e.hiredate
;

