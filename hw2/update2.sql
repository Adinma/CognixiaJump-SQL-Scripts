-- Update Script defininig tables edition, reviewer and review

SET search_path TO chidua, public;

-- The following statment(s) changes the name of the table books to edition using the alter statement
ALTER TABLE IF EXISTS book
RENAME TO edition;

--The following statment(s) deletes a record from the edition table using the records ASIN
DELETE FROM edition
WHERE ASIN = 'bad';

--The following statment(s) updates a record from the edition table using the records ASIN
UPDATE edition
SET pages = 50
WHERE ASIN = '0000000016';

UPDATE edition
SET pages = 900
WHERE ASIN = '0000000017';

UPDATE edition
SET title = 'This mean war'
WHERE ASIN = '0000000018';

UPDATE edition
SET title = 'Its done'
WHERE ASIN = '0000000019';

--The following statment(s) adds new columns and specifys constraints to the ASIN and pages columns of the edition table.
ALTER TABLE edition 
	ADD PRIMARY KEY (ASIN),
	ADD CONSTRAINT positive CHECK (pages >= 0),
	ADD COLUMN format VARCHAR (10),
	ADD COLUMN language VARCHAR (20),
	ADD COLUMN price NUMERIC(5,2);

--The following statement(s) updates previously added records by adding values for format, language and price.
UPDATE edition SET format = 'Audiobook', language ='Arabic', price = 56.23 WHERE ASIN = '0000000001';
UPDATE edition SET format = 'Paperback', language ='French', price = 14.389 WHERE ASIN = '0000000002';
UPDATE edition SET format = 'Hardcover', language ='English', price = 98.28 WHERE ASIN = '0000000003';
UPDATE edition SET format = 'Kindle', language ='Polish', price = 100.00 WHERE ASIN = '0000000004';
UPDATE edition SET format = 'Paperback', language ='English', price = 72.50 WHERE ASIN = '0000000005';
UPDATE edition SET format = 'Audiobook', language ='French', price = 60.35 WHERE ASIN = '0000000006';
UPDATE edition SET format = 'Hardcover', language ='Spanish', price = 89.12 WHERE ASIN = '0000000007';
UPDATE edition SET format = 'kindle', language ='Dutch', price = 8.50 WHERE ASIN = '0000000008';
UPDATE edition SET format = 'Audiobook', language ='Dutch', price = 10.38 WHERE ASIN = '0000000009';
UPDATE edition SET format = 'Hardcover', language ='Arabic', price = 55.50 WHERE ASIN = '0000000010';
UPDATE edition SET format = 'Paperback', language ='English', price = 70.00 WHERE ASIN = '0000000011';
UPDATE edition SET format = 'Kindle', language ='German', price = 53.23 WHERE ASIN = '0000000012';
UPDATE edition SET format = 'Paperback', language ='Polish', price = 99.99 WHERE ASIN = '0000000013';
UPDATE edition SET format = 'Audiobook', language ='French', price = 77.00 WHERE ASIN = '0000000014';
UPDATE edition SET format = 'Paperback', language ='Spanish', price = 86.70 WHERE ASIN = '0000000015';
UPDATE edition SET format = 'Audiobook', language ='Tagalog', price = 85.00 WHERE ASIN = '0000000016';
UPDATE edition SET format = 'HardCover', language ='Chinese', price = 15.20 WHERE ASIN = '0000000017';
UPDATE edition SET format = 'Paperback', language ='English', price = 86.25 WHERE ASIN = '0000000018';
UPDATE edition SET format = 'Kindle', language ='Chinese', price = 0.00 WHERE ASIN = '0000000019';

--The following statement(s) adds the not null constraint to the forma,language and price columns of the edition table
ALTER TABLE edition
	ALTER COLUMN format SET NOT NULL,
	ALTER COLUMN language SET NOT NULL,
	ALTER COLUMN price SET NOT NULL;


--The following statment(s) creates a reviewer table with three columns(id(primary key),name,country)
CREATE TABLE reviewer(
	id BIGSERIAL PRIMARY KEY,
	name VARCHAR (50) not null,
	country VARCHAR (30) not null
);


--The following statement(s) creates a review table, where detailed about a reviews are stored.
CREATE TABLE review(
	id BIGSERIAL PRIMARY KEY,
	comments VARCHAR not null,
	review_date date not null,
	reviewer_id int not null REFERENCES reviewer(id),
	reviewedid VARCHAR not null REFERENCES edition(ASIN),
	rating int not null
);