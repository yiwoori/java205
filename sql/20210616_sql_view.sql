
-- 2021.06.16

-- view


-- 자주 사용되는
-- 30번 부서에 소속된 사원들의 사번과 이름과 부서번호를 출력하기 위한
-- select 문을 하나의 뷰로 정의

create or replace view emp_view30
as
select empno, ename, deptno
from emp
where deptno=30;

select * from emp_view30
where ename = 'JAMES'
;

-- view 삭제
drop view emp_view30;


-- 인라인 뷰를 이용한 top3 구하기
select rownum, ename
from emp
--order by hiredate
;

select ROWNUM, ename
from (select * from emp order by ename)
;



-- 입사일이 빠른 사람 5명만 (top-n)을 얻어오기
select ROWNUM, ename, hiredate
from (select * from emp order by hiredate)
where ROWNUM<6
;

-- -- 입사일이 최근인 사람 5명만 (top-n)을 얻어오기
select ROWNUM, ename, hiredate
from (select * from emp order by hiredate desc)
where ROWNUM<6
;

create or replace view view_HIR
as
select * from emp order by hiredate
;

select ROWNUM, ename, hiredate from view_hir;

select ROWNUM, ename, hiredate
from view_hir
where ROWNUM<6 --top5
--order by ename  --top5 데이터를 이름순으로 정렬해 출력
;


