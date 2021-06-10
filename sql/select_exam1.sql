
-- 1.
select ename, sal, sal+300
from emp;

-- 2.
select ename, sal, sal*12+100 as saly
from emp
order by saly desc;

-- 3.
select ename, sal
from emp
where sal >= 2000
order by sal desc;

-- 4.
select ename, empno
from emp
where empno=7788;

-- 5.
select ename, sal
from emp
where sal not between 2000 and 3000
order by sal;

-- 6.
select ename, job, hiredate
from emp
where hiredate between '81.2.20' and '81.5.1';

-- 7.
select ename, deptno
from emp
where deptno=20 or deptno=30
order by ename desc;

-- 8.
select ename, sal, deptno
from emp
where (sal between 2000 and 3000) and (deptno in(20,30))
order by ename;

-- 9.
select ename, hiredate
from emp
where hiredate like '81%'
order by hiredate;

-- 10.
select ename, job
from emp
where not job='MANAGER'
order by job;

-- 11.
select ename, sal, comm
from emp
where comm is not null
order by comm desc;

-- 12.
select ename
from emp
where ename like '__R%';

-- 13.
select ename
from emp
where (ename like '%A%') and (ename like '%E%');

-- 14.
select ename, job, sal
from emp
where (job in('CLERK', 'SALESMAN')) and (sal not in(1600,950,1300))
order by job;

-- 15.
select ename, comm
from emp
where comm>=500;



