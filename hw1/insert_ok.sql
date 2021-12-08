--Insert_ok Script by Adinma
--This script inserts 15 records
--Records are inserted by first specifiying the columns of the table
--Followed by the values to be inserted.

SET search_path TO chidua, public;

INSERT INTO book(ASIN, title, name, publisher, pubdate, pages)
VALUES	('0000000001', 'The Dunes', 'John Frank', 'Haper Collins', '1990/1/21', 350),
		('0000000002', 'Rich Dad Poor Dad', 'Robert Kiyosaki', 'Amazon', '1997/1/1', 336),
		('0000000003', 'One More', 'Homer', 'Amazon', '1913/2/10', 350),
		('0000000004', 'Ulysses', 'James Joyce', 'Haper Collins', '1904/6/16', 350),
		('0000000005', 'Don Quixote', 'Miguel de Cervantes', 'Haper Collins', '1990/8/2', 200),
		('0000000006', 'One Hundred Years of Solitude ', ' Gabriel Garcia Marquez', 'Simon and Schuster', '2021/5/25', 20),
		('0000000007', 'The Great Gatsby ', 'F. Scott Fitzgerald', 'Haper Collins', '2021/12/30', 100),
		('0000000008', 'Moby Dick', 'Herman Melville', 'Haper Collins', '2012/7/24', 134),
		('0000000009', 'War and Peace', 'Leo Tolstoy', 'Amazon', '1994/4/20', 1009),
		('0000000010', 'Hamlet', 'William Shakespeare', 'Simon and Schuster', '2021/5/14', 209),
		('0000000011', 'The Odyssey', 'Homer', 'Haper Collins', '2008/4/7', 956),
		('0000000012', 'Madame Bovary', 'Gustave Flaubert', 'Haper Collins', '2021/7/19', 1370),
		('0000000013', 'The Brothers Karamazov ', 'Fyodor Dostoyevsky', 'Macmillan', '2003/9/30', 13),
		('0000000014', 'Crime and Punishment ', 'Fyodor Dostoyevsky', 'Haper Collins', '2021/3/5', 750),
		('0000000015', 'Mine', 'Homer', 'Macmillan', '2007/9/17', 9);
