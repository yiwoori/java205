
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
