
--2021.06.10
--SELECT

--특정 데이터 검색 : 행 검색 -> 컬럼 검색

--10번 부서의 사원 리스트 출력
--10번 부서 -> deptno 10
select *
from emp
where deptno = 10;

--이름이 'SCOTT'인 사원 출력
SELECT *
FROM EMP
WHERE ENAME = 'SCOTT';

SELECT *
FROM EMP
WHERE ENAME = 'scott'; --데이터는 대소문자 구별

--날짜 타입의 데이터 비교시에도 작은 따옴표 이용
select *
from emp
where hiredate = '96-11-17';



--논리연산자 : and, or, not
--10번 부서의 관리자(MANAGER)를 찾아 출력
select *
from emp
where deptno=10 and job='MANAGER';

select ename, deptno, job
from emp
where deptno=10 and job='MANAGER';

--10번 부서의 직원들과 관리자들의 리스트를 출력
select *
from emp
where deptno=10 or job='MANAGER';

--10번 부서의 직원을 제외한 나머지 직원들을 출력
-- 20, 30, 40번 부서의 직원 정보 출력
select *
from emp
where not deptno=10;



--범위 연산을 할 때 -> 논리연산자 이용(미만/초과/소수점), between a and b
-- between a and b : a 이상 ~ b 이하
-- 2000 이상 3000 이하의 급여를 받는 직원 리스트
select *
from emp
where sal BETWEEN 2000 and 3000;
select *
from emp
where 2000<=sal and sal<=3000;
--select ename, job, sal, sal*1.2, as upsal
--from emp
--where sal BETWEEN 2000 and 3000;

--between 연산자는 날짜의 연산도 가능
--1981년 입사 사원 리스트 출력
select *
from emp
--where hiredate >= '81.1.1' and hiredate <= '81.12.31'
where hiredate between '81.1.1' and '81.12.31'
order by hiredate; --오름차순


--연산자 in -> 여러개의 or 연산자 사용시 대체할 수 있다
select *
from emp
--where comm=300 or comm=500 or comm=1400;
where comm in(300, 500, 1400);



-- 패턴 검색 : 키워드 검색 많이 사용 (게시판)
-- 컬럼 like '%'
-- ename like 'F%' -> F로 시작하는 문자열(사원 이름 ename)
-- ename like '%F' -> F로 끝나는 문자열
-- ename like '%F%' -> F를 포함하는 문자열
-- 'java' 단어를 포함하는지 -> title like '%java%'

--F로 시작하는 사원 이름 검색
select *
from emp
where ename like 'F%';

--이름에 A를 포함하는 사원 검색
select *
from emp
where ename like '%A%';

--이름이 EN으로 끝나는 사원
select *
from emp
where ename like '%EN';

--자리수 패턴 : 컬럼의 값이 자리수가 정해져 있고 값에 패턴이 있는 경우
--사원 이름 중 두번째 자리에 A를 포함하는 사원의 리스트
select *
from emp
where ename like '_A%';
--세번째 자리에 A를 포함하지 않는 사원의 리스트
select *
from emp
where ename not like '__A%';

--null 값을 확인하는 연산자 -> is null, is not null
--커미션이 등록되어 있지 않은 사원의 리스트 (0 != null)
select *
from emp
where comm is null;
--where comm is not null
--order by comm;

--결과 행의 정렬 : order by 컬럼 [asc|desc] (asc 또는 desc)
--급여가 적은 사원부터 출력 : 오름차순 asc
select ename, sal
from emp
--order by sal asc;
order by sal; --정렬의 기본은 오름차순 (생략 가능)

--급여가 큰 사원부터 출력 : 내림차순
select ename, sal
from emp
order by sal desc;

--급여가 큰 사원부터 출력하고 같은 경우 이름을 기준으로 오름차순 출력
select ename, sal
from emp
order by sal desc, ename;







