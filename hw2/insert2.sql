--Insert2 Script by Adinma
--This script inserts 2 new records each into the edition, reviewer and review tables
--Records are inserted by first specifiying the columns of the table
--Followed by the values to be inserted.

SET search_path TO chidua, public;

--New records now including newly added columns
--ASIN increased from hw1
INSERT INTO edition(ASIN, title, name, publisher, pubdate, pages, format, language, price)
	VALUES('0000000020', 'The Eraser', 'Carl Resse', 'Haper Collins', '1998/1/21', 358, 'paperback', 'English', 80.55),
	('0000000021', 'Rich Kids', 'Robert Eric', 'Amazon', '1997/1/1', 336, 'hardcover', 'German', 75.30);

--Inserts records into the reviewer table by specifiying name and country columns
--Note: id not specified because it is automatically generated
INSERT INTO reviewer(name, country)
	VALUES('Jonny English', 'England'),
	('Christian John', 'Portugal');

--Inserts records into the review table by specifiying Comments, Reviewdate, Reviewer_id, Reviewdid and Rating
--Note: id not specified because it is automatically generated
--reviewer_id and reviewdid point to reviewer and edition table respectively
INSERT INTO review(Comments, review_date, reviewer_id, reviewedid, rating)
	VALUES('Wonderful book, inspirational', '2005/7/29', '1', '0000000020', 5),
	('Nice read, could be shorter', '1998/1/21', '2', '0000000001', 3);