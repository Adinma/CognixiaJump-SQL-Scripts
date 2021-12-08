--InsertMore Script by Adinma
--This script inserts new records into the reviewer and review tables
--Records are inserted by first specifiying the columns of the table
--Followed by the values to be inserted.

SET search_path TO chidua, public;

--Inserts records into the reviewer table by specifiying name and country columns
--Note: id not specified because it is automatically generated
INSERT INTO reviewer(name, country)
	VALUES('Lara Croft', 'USA'),
	('Jake Kenny', 'Germany'),
	('Carl Resse', 'Kenya'),
	('Homer', 'Japan');

--Inserts records into the review table by specifiying Comments, Reviewdate, Reviewer_id, Reviewdid and Rating
--Note: id not specified because it is automatically generated
--reviewer_id and reviewdid point to reviewer and edition table respectively
INSERT INTO review(Comments, review_date, reviewer_id, reviewedid, rating)
	VALUES('Nice read', '1998/1/21', '3', '0000000003', 3),
	('I have read better books.', '2007/3/09', '6', '0000000009', 1),
	('Redundant.', '1999/8/21', '5', '0000000007', 2),
	('Best book ever made', '2021/11/21', '4', '0000000005', 5),
	('Lacking content', '2008/8/28', '2', '0000000009', 1),
	('Great book', '2010/10/15', '3', '0000000020', 4),
	('Excellent', '2015/4/15', '2', '0000000017', 3),
	('Good learning Resource', '2017/1/17', '5', '0000000012', 3),
	('No comment', '2020/3/21', '1', '0000000018', 0),
	('Can not get enough', '1858/1/12', '4', '0000000011', 5),
	('Good read', '1990/11/4', '6', '0000000005', 3),
	('Amazing Subject', '2001/1/9', '2', '0000000008', 4),
	('Cant get better', '2009/12/2', '3', '0000000009', 5);

