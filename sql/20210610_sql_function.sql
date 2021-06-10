
-- 2021.06.10
-- FUNCTION : 단일행 함수, 집합(다중행) 함수
-- 단일행 함수 : 하나의 행이 포함하는 특정 컬럼의 값 하나를 처리하고 반환
-- 다중행(집합) 함수 : 여러 행의 특정 컬럼 값을 대상으로 연산하고 반환

-- 숫자 함수
select abs(10), abs(-10)
from dual; --dual : 테스트를 위한 테이블

-- floor : 소수점 이하 삭제
select floor(15.7) 
from dual; --15

-- round
-- (+)는 소수점 방향, (-)는 정수방향
select ROUND(15.193,1), ROUND(15.193,-1)
from dual;

-- Trunc : 소수점 아래 삭제
select TRUNC(15.79,1), trunc(15.79)
from dual; --15.7, 15

select MOD(11,5)
from dual;

-- 사원들의 급여 표현
select sal, mod(sal, 2)
from emp   --나머지값
where mod(sal,2)=1;





-- 문자 함수
-- comcat(문자열, 문자열, ...) -> ''||''
select concat('abc','efg'), 'abc'||'efg'
from dual;



-- substr : 문자열 추출
-- substr(문자열, 시작 위치, 길이)
select substr('apple', 1, 3)
from dual; --app 

--뒤에서 3자리 출력
select substr('apple',-3)
from dual; --ple



-- replace : 특정 문자열(패턴) 다른 문자열(패턴)으로 변경
-- '문자열', '변경될 문자', '변경할 문자'
select REPLACE('JACK and JUE','J','BL')
from dual; --BLACK and BLUE

select sysdate
from dual; --오늘 날짜 출력





