-- Creates schema
CREATE SCHEMA IF NOT EXISTS chidua;

SET search_path TO chidua, public;

-- Create Script containing book table
-- This script creates a table of books
-- containing key attributes of the book.
CREATE TABLE book(
	ASIN VARCHAR (10) not null,
	title VARCHAR not null,
	name VARCHAR not null,
	publisher VARCHAR,
	pubdate date,
	pages int
);