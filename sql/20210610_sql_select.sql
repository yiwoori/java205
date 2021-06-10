
--2021.06.10

--Ư�� ������ �˻� : �� �˻� -> �÷� �˻�

--10�� �μ��� ��� ����Ʈ ���
select *
from emp
where deptno = 10;

--�̸��� 'SCOTT'�� ��� ���
SELECT *
FROM EMP
WHERE ENAME = 'SCOTT';

SELECT *
FROM EMP
WHERE ENAME = 'scott'; --�����ʹ� ��ҹ��� ����

--��¥ Ÿ���� ������ �񱳽ÿ��� ���� ����ǥ �̿�
select *
from emp
where hiredate = '96-11-17';



--���������� : and, or, not
--10�� �μ��� ������(MANAGER)�� ã�� ���
select *
from emp
where deptno=10 and job='MANAGER';

select ename, deptno, job
from emp
where deptno=10 and job='MANAGER';

--10�� �μ��� ������� �����ڵ��� ����Ʈ�� ���
select *
from emp
where deptno=10 or job='MANAGER';

--10�� �μ��� ������ ������ ������ �������� ���
-- 20, 30, 40�� �μ��� ���� ���� ���
select *
from emp
where not deptno=10;



--���� ������ �� �� -> ���������� �̿�(�̸�/�ʰ�/�Ҽ���), between a and b
-- between a and b : a �̻� ~ b ����
-- 2000 �̻� 3000 ������ �޿��� �޴� ���� ����Ʈ
select *
from emp
where sal BETWEEN 2000 and 3000;
select *
from emp
where 2000<=sal and sal<=3000;
--select ename, job, sal, sal*1.2, as upsal
--from emp
--where sal BETWEEN 2000 and 3000;

--between �����ڴ� ��¥�� ���굵 ����
--1981�� �Ի� ��� ����Ʈ ���
select *
from emp
--where hiredate >= '81.1.1' and hiredate <= '81.12.31'
where hiredate between '81.1.1' and '81.12.31'
order by hiredate; --��������


--������ in -> �������� or ������ ���� ��ü�� �� �ִ�
select *
from emp
--where comm=300 or comm=500 or comm=1400;
where comm in(300, 500, 1400);



-- ���� �˻� : Ű���� �˻� ���� ��� (�Խ���)
-- �÷� like '%'
-- ename like 'F%' -> F�� �����ϴ� ���ڿ�(��� �̸� ename)
-- ename like '%F' -> F�� ������ ���ڿ�
-- ename like '%F%' -> F�� �����ϴ� ���ڿ�
-- 'java' �ܾ �����ϴ��� -> title like '%java%'

--F�� �����ϴ� ��� �̸� �˻�
select *
from emp
where ename like 'F%';

--�̸��� A�� �����ϴ� ��� �˻�
select *
from emp
where ename like '%A%';

--�̸��� EN���� ������ ���
select *
from emp
where ename like '%EN';

--�ڸ��� ���� : �÷��� ���� �ڸ����� ������ �ְ� ���� ������ �ִ� ���
--��� �̸� �� �ι�° �ڸ��� A�� �����ϴ� ����� ����Ʈ
select *
from emp
where ename like '_A%';
--����° �ڸ��� A�� �������� �ʴ� ����� ����Ʈ
select *
from emp
where ename not like '__A%';

--null ���� Ȯ���ϴ� ������ -> is null, is not null
--Ŀ�̼��� ��ϵǾ� ���� ���� ����� ����Ʈ (0 != null)
select *
from emp
where comm is null;
--where comm is not null
--order by comm;

--��� ���� ���� : order by �÷� [asc|desc] (asc �Ǵ� desc)
--�޿��� ���� ������� ��� : �������� asc
select ename, sal
from emp
--order by sal asc;
order by sal; --������ �⺻�� �������� (���� ����)

--�޿��� ū ������� ��� : ��������
select ename, sal
from emp
order by sal desc;

--�޿��� ū ������� ����ϰ� ���� ��� �̸��� �������� �������� ���
select ename, sal
from emp
order by sal desc, ename;







