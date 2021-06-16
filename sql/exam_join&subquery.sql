
-- 2021.06.16

-- 1.마당서점의고객이요구하는다음질문에대해SQL 문을작성하시오.

-- (5) 박지성이구매한도서의출판사수
select count(publisher)
from book
where bookid = any (select bookid
                        from orders
                        where custid=1);



-- (6) 박지성이구매한도서의이름, 가격, 정가와판매가격의차이
select DISTINCT(bookname), b.price-o.saleprice as "PRICEGAP"
from book b, orders o
where b.bookid=o.bookid
            and b.bookid = any (select bookid
                        from orders
                        where custid=1);
                        
select DISTINCT(bookname), b.price-o.saleprice as "PRICEGAP"
from book b natural join orders o
where bookid = any (select bookid
                        from orders
                        where custid=1);



-- (7) 박지성이구매하지않은도서의이름
select bookname
from book
where bookid != all (select bookid
                        from orders
                        where custid=1 )
order by bookid;



-- 2 마당서점의운영자와경영자가요구하는다음질문에대해SQL 문을작성하시오.

-- (8) 주문하지않은고객의이름(부속질의사용)
select name
from customer
where custid != all (select custid
                        from orders);



-- (9) 주문금액의 총액과 주문의 평균금액
select sum(saleprice) as "TOTAL", avg(saleprice) as "AVG_SALEPRICE"
from orders;



-- (10) 고객의 이름과 고객별 구매액
select name, sum(saleprice)
from customer c, orders o
where c.custid = o.custid
group by c.name;

select name, sum(saleprice)
from customer c natural join orders o
group by c.name;



-- (11) 고객의 이름과 고객이 구매한 도서 목록
select name, bookname
from customer c, book b, orders o
where c.custid=o.custid and o.bookid=b.bookid
order by name;



-- (12) 도서의 가격(Book 테이블)과
-- 판매가격(Orders 테이블)의 차이가 가장 많은 주문
select *
from orders natural join book 
where price-saleprice = (select MAX(price-saleprice)
            from orders natural join book);



-- (13) 도서의 판매액 평균보다 자신의 구매액 평균이 더 높은 고객의 이름
--*
select name
from customer c natural join orders o
group by name
having avg(saleprice) > (select avg(saleprice) from orders);



-- 3. 마당서점에서 다음의 심화된 질문에 대해 SQL 문을 작성하시오.

-- (1) 박지성이 구매한 도서의 출판사와
-- 같은 출판사에서 도서를 구매한 고객의 이름
-------------------------------------------------------------------------------------------
select name
from book b natural join customer c
--where publisher = any (select publisher
                        --from orders natural join book
                        --where custid=1)
group by name, publisher
having publisher = any (select publisher
                        from orders natural join book
                        where custid=1)
;
select name
from book b, customer c, orders o
where b.bookid=o.bookid and o.custid=c.custid
;



-- (2) 두 개 이상의 서로 다른 출판사에서 도서를 구매한 고객의 이름






