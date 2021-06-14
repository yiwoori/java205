
-- 2021.06.14

-- 1.마당서점의고객이요구하는다음질문에대해SQL 문을작성하시오.
-- (5) 박지성이구매한도서의출판사수
select count(b.publisher)
from orders o, book b
where o.bookid=b.bookid
    and b.bookid = any (select bookid from orders where custid=1);
--박지성이 구매한 도서
select bookid from orders where custid=1;

select *
from book
where ();
--박지성이 구매한 도서
select *
from orders o, book b
where 





