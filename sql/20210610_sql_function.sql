
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


-- 형변환 함수
--


select orderid, orderdate, to_char(orderdate, 'YYYY.MM.DD')
from orders;



-- 숫자 -> 문자
select to_char(123456, '0000000000'), to_char(123456, '9999999999') --10자리를 만들고 6개까지만 출력되게
from dual;
select to_char(123456, '0,000,000,000'), to_char(123456, 'L9,999,999,999') --L:통화는 현재 위치 기반(시스템 설정)
from dual;

select empno, ename, to_char(sal*1100, 'L999,999,999')
from emp;





--'1,000,000'+100000

-- 문자 -> 숫자, 문자 -> 날짜
-- 1. 문자->숫자
-- to_number(문자열, 패턴)
select to_number('1,000,000', '9,999,999'),
        to_number('1,000,000','9,999,999')+100000 --문자열을 숫자로 변환한후 연산 수행
from dual;

-- 2. 문자->날짜
-- to_date(문자열, 패턴)
select to_date('2012.05.17', 'YYYY.MM.DD'),
    trunc(sysdate-to_date('2012.05.17', 'YYYY.MM.DD')) --trunc:소수점 삭제
from dual;



-- decode 함수 : 분기를 위해 사용. switch-case와 유사
-- decode(컬럼, 조건1 값, 조건1이 참일때 사용할 값
--            , 조건2 값, 조건2가 참이래 사용할 값, ...)
select ename, deptno,
        decode(deptno, 10, 'ACCOUNTING', 20, 'RESEARCH',
                       30, 'SALES', 40, 'OPERATIONS') as DNAME
from emp;


select empno, ename, sal,
    decode(job, 'ANALYST', sal*1.05, 'SALESMAN', sal*1.1,
            'MANAGER', sal*1.15, 'CLERK', sal*1.2) as UPSAL
from emp;



-- case 함수도 분기할 때 사용
-- case when 조건식 then 참일때 값
select ename, deptno,
        case when deptno=10 then 'ACCOUNTING'
             when deptno=20 then 'REARCH'
             when deptno=30 then 'SALES'
             when deptno=40 then 'OPERATIONS'
        End as DNAME
from emp
order by dname desc;
