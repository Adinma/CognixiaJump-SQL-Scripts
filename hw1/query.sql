--query by Adinma
--This scripts contains a list of queries that display records or fields from the book table.

SET search_path TO chidua, public;

--1
--This query lists all publishers from the book table.
select * from edition;
--SELECT publisher from book;

--2
--This query list all title and page number from the book table whose autor name is Homer
--SELECT title, pages from book where name = 'Homer';

--3
--This query list all authors who published books in 2021
--SELECT name from book where EXTRACT(YEAR FROM pubdate) = '2021';