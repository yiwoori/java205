
-- 2021.6.11

-- 그룹 함수
-- 여러 행을 묶어 처리하는 함수
-- sum(합), avg(평균), count(행의 개수), max(최대값), min(최소값)



-- 사원 테이블에서
-- 1. 사원의 수
-- 2. 사원의 급여 총합
-- 3. 급여 평균
-- 4. 최대 급여
-- 5. 최소 급여

select count(*) as "사원의 수",
        sum(sal) as "급여 총합",
        round(avg(sal),2) as "급여 평균",
        max(sal) as "최대 급여",
        min(sal) as "최소 급여",
        sum(comm) as "커미션 총합", --그룹함수는 null값을 제외하고 연산
        avg(comm) as "커미션 평균"
from emp;

-- distinct를 이용해 중복 개수 제거
select distinct job from emp;
select count(job) from emp;
select count(DISTINCT job)
from emp;



-- 마당서적에 납품하는 출판사
select count(distinct publisher)
from book;



-- 특정 컬럼을 이용해서 그룹핑하기 -> group by
-- select
-- from 테이블
-- where
-- group by 그룹핑할 기준의 칼럼

-- 부서별
select deptno, count(*), sum(sal), trunc(avg(sal)), max(sal),min(sal)
from emp
group by deptno
order by deptno;

-- 직급별
select distinct job
from emp;
select job, count(*)
from emp
group by job
order by job;

-- 부서별로 사원 수와 커미션을 받는 사원의 수를 계산해 출력
select deptno, count(*), count(comm)
from emp
group by deptno
order by deptno;



-- group by의 그룹함수의 결과 비교시에는 having절 사용
-- select
-- from
-- where
-- gruop by
-- having 그룹함수 연산자 값 / 연산자 : = != > < >= <=

-- 각 부서별 평균 급여가 2000이상인
-- 부서번호와 부서별 평균 급여 출력
select deptno, round(avg(sal)) as svg
from emp
group by deptno
having avg(sal)>=2000
order by deptno;



-- 각 부서 급여의 최대값 최소값을 구하되
-- 최대 급여가 2900인 부서만 출력
select deptno, max(sal), min(sal)
from emp
group by deptno
having max(sal)>2900;


