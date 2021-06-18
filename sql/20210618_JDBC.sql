
-- 2021.06.18

--JDBC

select * from dept01;

insert into dept01 values (dept01_deptno_seq.nextval, 'dev', 'SEOUL');

-- dept01 - deptno에 입력할 일련 번호 sequence로 생성
create sequence dept01_deptno_seq
start with 10 --10으로 시작
increment by 10 --10씩 증가
;

update dept01 set dname=?, loc=? where deptno=?;

select * from dept;

select dept01_deptno_seq.nextval from dual;




