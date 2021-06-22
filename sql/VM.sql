
CREATE TABLE ITEMINFO (

    ITEMCODE NUMBER(4) CONSTRAINT ITEMINFO_ICODE_PF PRIMARY KEY,
    NAME VARCHAR2(20) CONSTRAINT ITEMINFO_NAME_NN NOT NULL,
    PRICE INTEGER CONSTRAINT ITEMINFO_PRICE_NN NOT NULL,
    ITEMQTY INTEGER

);

CREATE SEQUENCE ITEMINFO_ICODE_SEQ
START WITH 1
INCREMENT BY 1;

INSERT INTO ITEMINFO VALUES (ITEMINFO_ICODE_SEQ.NEXTVAL, '콜라', 700, 1);
INSERT INTO ITEMINFO VALUES (ITEMINFO_ICODE_SEQ.NEXTVAL, '사이다', 800, 5);
INSERT INTO ITEMINFO VALUES (ITEMINFO_ICODE_SEQ.NEXTVAL, '마운틴듀', 600, 4);


select * from iteminfo;
