
--2021.06.15 테이블 정의서

create table phoneInfo_Basic (
    idx NUMBER(6) CONSTRAINT PIB_idx_pk PRIMARY KEY,
    fr_name VARCHAR2(20) CONSTRAINT PIB_fname_nn NOT NULL, --notnull은 이름 없어도 오류 찾기 쉬움
    fr_phonenumber VARCHAR2(20) CONSTRAINT PIB_fphone_nn NOT NULL,
    fr_email VARCHAR2(20),
    fr_address VARCHAR2(20),
    fr_regdate DATE DEFAULT sysdate    
);
desc phoneInfo_Basic;

create table phoneInfo_univ (
    idx NUMBER(6) CONSTRAINT PIU_idx_pk PRIMARY KEY,
    fr_u_major VARCHAR2(20) DEFAULT 'N' NOT NULL,
    fr_u_year NUMBER(1) DEFAULT 1 CHECK (fr_u_year BETWEEN 0 and 5),
    fr_u_ref NUMBER(7) REFERENCES phoneInfo_Basic(idx) NOT NULL
);
desc phoneInfo_univ;

create table phoneInfo_com (
    idx NUMBER(6) CONSTRAINT PIC_idx_pk PRIMARY KEY,
    fr_c_company VARCHAR2(20) DEFAULT 'N' NOT NULL,
    fr_ref NUMBER(6) REFERENCES phoneInfo_Basic(idx) NOT NULL
);
desc phoneInfo_com;





drop table phoneInfo_Basic;