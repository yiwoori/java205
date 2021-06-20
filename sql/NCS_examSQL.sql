
--#1.

--1.
CREATE TABLE CONTACT (

    PIDX NUMBER(5) CONSTRAINT CONTACT_PIDX_PK PRIMARY KEY,
    NAME VARCHAR2(10) CONSTRAINT CONTACT_NAME_NN NOT NULL,
    PHONENUMBERM VARCHAR2(20) CONSTRAINT CONTACT_PN_NN NOT NULL,
    ADDRESS VARCHAR2(20) DEFAULT 'NON' CONSTRAINT CONTACT_AD_NN NOT NULL,
    EMAIL VARCHAR2(20) DEFAULT 'NON' CONSTRAINT CONTACT_EM_NN NOT NULL, 
    FTYPE VARCHAR2(4) CONSTRAINT CONTACT_F_CK CHECK (FTYPE IN('UNIV', 'COM', 'CAFE')) NOT NULL,

    MAJOR VARCHAR2(10),
    GRADE NUMBER(1),
    CNAME VARCHAR2(10),
    DNAME VARCHAR2(10),
    DGRADE VARCHAR2(10),
    TNAME VARCHAR2(20),
    NICKNAME VARCHAR2(20)
    
);

--2.
INSERT INTO DEPT VALUES (50, 'MARKETING', 'SEOUL');
INSERT INTO DEPT (DEPTNO, DNAME, LOC) VALUES (60, 'DESIGN', 'JEJU');

--3.
UPDATE DEPT
SET DNAME = 'PR', LOC = 'BASAN'
WHERE DEPTNO = 50;

--4.
DELETE FROM DEPT WHERE DEPTNO = 50;
DELETE FROM DEPT WHERE DEPTNO = 60;

--5.
SELECT * FROM TAB;

--6.
DESC EMP;

--7.
SELECT * FROM ALL_CONSTRAINTS
WHERE TABLE_NAME = 'CONTACT';


--#2.

--1.
CREATE INDEX EMP_INDEX
ON EMP(ENAME);

--2.
CREATE VIEW EMP_VIEW
AS
SELECT *
FROM EMP E, DEPT D
WHERE E.DEPTNO=D.DEPTNO;

--3.
UPDATE EMP
SET DEPTNO = (
    SELECT DEPTNO
    FROM EMP
    WHERE ENAME = 'SCOTT');

