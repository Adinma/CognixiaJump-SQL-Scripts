--Insert_bad Script by Adinma
--This script inserts records into the book table that would not be allowed, if proper restrictions are in place.
--Records are inserted by first specifiying the columns of the table
--Followed by the values to be inserted.

SET search_path TO chidua, public;

--This Record is bad because the ASIN is not unique
INSERT INTO book(ASIN, title, name, publisher, pubdate, pages)
	values	('bad', 'The Dunes', 'John Frank', 'Haper Collins', '2Aug1990', '350'),

--This Record is bad because the ASIN is not unique
		('bad', 'Rich Dad Poor Dad', 'Robert Kiyosaki', 'Amazon', '1Jan1997', '336'),
--This Record is bad because the page number is 0
		('0000000016', 'In Search of Lost Time ', 'Marcel Proust', 'Amazon', '10Feb1913', '0'),
		
--This Record is bad because the page number is a negative value
		('0000000017', 'Ulysses', 'James Joyce', 'Haper Collins', '16Jun1904', '-2'),

--This Record is bad because there is no value for the book title
		('0000000018', '', 'Miguel de Cervantes', 'Haper Collins', '2Aug1990', '350'),

--This Record is bad because there is no value for the book title
		('0000000019', '', ' Gabriel Garcia Marquez', 'Simon and Schuster', '2Aug1990', '350');