
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



-- (7) 박지성이구매하지않은도서의이름





-- 2 마당서점의운영자와경영자가요구하는다음질문에대해SQL 문을작성하시오.

-- (8) 주문하지않은고객의이름(부속질의사용)



-- (9) 주문금액의 총액과 주문의 평균금액




-- (10) 고객의 이름과 고객별 구매액



-- (11) 고객의 이름과 고객이 구매한 도서 목록



-- (12) 도서의 가격(Book 테이블)과
--  판매가격(Orders 테이블)의 차이가 가장 많은 주문



-- (13) 도서의 판매액 평균보다 자신의 구매액 평균이 더 높은 고객의 이름





-- 3. 마당서점에서 다음의 심화된 질문에 대해 SQL 문을 작성하시오.

-- (1) 박지성이 구매한 도서의 출판사와 같은 출판사에서 도서를 구매한 고객의 이름



-- (2) 두 개 이상의 서로 다른 출판사에서 도서를 구매한 고객의 이름






