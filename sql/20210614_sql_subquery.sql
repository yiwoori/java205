
--20210614

-- sub query

-- 스칼라 부속 질의 : select 절 이후에 사용
-- 단일 행 단일 열 값이 사용된다.
select o.custid, (select )
from orders o;