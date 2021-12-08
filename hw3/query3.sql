--Query3 Script by Adinma.
--Note there is a sepearate script (insertmore.sql) written which adds more records to reviewer and reviews
--Kindly run the (insertmore.sql) script to get correct results.
--This script utilizes the edition, reviewer and review tables and produces a wide range of Queries.

SET search_path TO chidua, public;

/*
--1 
In order to display the  Titles of all books 
reviewed by a particular reviewer name (Homer),
the edition table was joined to the review table 
with the review.reviewedid and  edition.asin column and 
the review table was joined to the reviewer table
with the review.reviewer_id and reviewer.id column.
The WHERE keyword with the condition 'Homer' was used to filter records.
*/
SELECT title FROM edition
   JOIN
   review
   ON review.reviewedid = edition.asin
   JOIN
   reviewer
   ON review.reviewer_id = reviewer.id
   WHERE reviewer.name = 'Homer';

/*
--2 
In order to display the Names of reviewers who have 
reviewed books that are in Dutch,
the edition table was joined to the review table 
with the review.reviewedid and  edition.asin column and 
the review table was joined to the reviewer table
with the review.reviewer_id and reviewer.id column.
The WHERE keyword with the condition 'Dutch' was used to filter records.
*/
SELECT reviewer.name FROM reviewer
   JOIN
   review
   ON review.reviewer_id = reviewer.id
   JOIN
   edition
   ON edition.asin = review.reviewedid
   WHERE edition.language = 'Dutch';

/*
--3
In order to display the  Reviewer name,  rating, comment and 
date of review for all reviews of War and Peace, ordered by date of review,
the edition table was joined to the review table 
with the review.reviewedid and  edition.asin column and 
the review table was joined to the reviewer table
with the review.reviewer_id and reviewer.id column.
The WHERE and ORDER BY keywords with the
condition 'War and Peace' were used to filter records .
*/
SELECT  reviewer.name, review.rating, review.comments, review.review_date FROM review
	JOIN
   	reviewer
   	ON reviewer.id = review.reviewer_id
	JOIN
   	edition
   	ON edition.asin = review.reviewedid
	WHERE edition.title = 'War and Peace'
	ORDER BY review_date;

/*
--4 
In order to display the Reviewer name, country of reviewer, rating and comment 
for all reviews if a given title is from Germany,
the edition table was joined to the review table 
with the review.reviewedid and  edition.asin column and 
the review table was joined to the reviewer table
with the review.reviewer_id and reviewer.id column.
The WHERE keyword with the condition 'Germany' was used to filter records.
*/
SELECT reviewer.name, reviewer.country, review.rating, review.comments FROM review
   JOIN
   reviewer
   ON reviewer.id = review.reviewer_id
   JOIN
   edition
   ON  review.reviewedid = edition.asin
   WHERE reviewer.country = 'Germany';

/*
--5 
In order to display the Names of any reviewers who review books 
by an author with the same name, plus the title of such a book,
the edition table was joined to the review table 
with the review.reviewedid and  edition.asin column and 
the review table was joined to the reviewer table
with the review.reviewer_id and reviewer.id column.
The WHERE keyword and IN clause were used to filter records.
--Note: This Query Produces duplicates and this is because reviewers who
--have the same name reviewed more than one book.
*/
SELECT reviewer.name, edition.title FROM reviewer
	JOIN
	review
	ON reviewer.id = review.reviewer_id
	JOIN
	edition
	ON  review.reviewedid = edition.asin
	WHERE reviewer.name IN (select edition.name from edition);

/*
--6
In order to display the Titles of books without reviews,
The where keyword and the NOT IN clause were used to filter records.
--The not in clause selected all records that were not in the intersection
--between the edition.asin and review.reviewedid columns of the editon and review table respectively.
*/	
SELECT edition.title FROM edition
	WHERE edition.asin NOT IN (select review.reviewedid from review);

/*
--7
In order to display the Titles of books with only 5 star reviews 
reviewed by a particular reviewer name (Homer),
the edition table was joined to the review table 
with the review.reviewedid and  edition.asin column and
The WHERE keyword was used and the select rating = 5 condition filtered records.
*/
SELECT edition.title FROM edition
   JOIN
   review
   ON review.reviewedid = edition.asin
   WHERE review.rating = 5;

/* 
--8	
In order to display the 3 most recently published books
The ORDER BY and DESC keywords were used to display records in descending order
and the LIMIT keyword with the number 3 to specify only the first 3 records was used.
*/
SELECT edition.title, edition.pubdate FROM edition
   ORDER BY pubdate DESC
   LIMIT 3;

/*
--9
In order to display Title of highest-scoring book in database, 
as determined by an average of the scores by the different votes
The edition table was joined to the review table 
with the review.reviewedid and  edition.asin column and
The ORDER BY, AVG, JOIN, GROUP BY and DESC keywords were used to display records in descending order.
The LIMIT keyword with the number 1 to specify only the first 3 records was used.
*/
SELECT edition.title, AVG(review.rating) AS avgRating
	FROM edition
	JOIN
   	review
   	ON  review.reviewedid = edition.asin
	GROUP BY edition.title
	ORDER BY avgRating DESC LIMIT 1;