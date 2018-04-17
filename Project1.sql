USE ctran_db;

SET sql_safe_updates = 0;

DROP TABLE IF EXISTS user;
CREATE TABLE user (user_id INT AUTO_INCREMENT PRIMARY KEY,
				   user_name VARCHAR (256) UNIQUE,
                   password VARCHAR (256),
                   email VARCHAR (256));
                   
INSERT INTO user (user_name, password, email) VALUES ('user_name01', 'password01', 'email01');
INSERT INTO user (user_name, password, email) VALUES ('user_name02', 'password02', 'email02');
INSERT INTO user (user_name, password, email) VALUES ('user_name03', 'password03', 'email03');
INSERT INTO user (user_name, password, email) VALUES ('user_name04', 'password04', 'email04');
INSERT INTO user (user_name, password, email) VALUES ('user_name05', 'password05', 'email05');
INSERT INTO user (user_name, password, email) VALUES ('user_name06', 'password06', 'email06');
INSERT INTO user (user_name, password, email) VALUES ('user_name07', 'password07', 'email07');
INSERT INTO user (user_name, password, email) VALUES ('user_name08', 'password08', 'email08');
INSERT INTO user (user_name, password, email) VALUES ('user_name09', 'password09', 'email09');
INSERT INTO user (user_name, password, email) VALUES ('user_name10', 'password10', 'email10');

SELECT * FROM user;

CREATE TABLE book (book_id INT AUTO_INCREMENT PRIMARY KEY,
				   title VARCHAR (512),
                   author VARCHAR (256),
                   UNIQUE (title, author),
                   genre VARCHAR (256),
                   date_published DATE);

INSERT INTO book (title, author, genre, date_published) VALUES ('title01', 'author01', 'genre01', '2001-06-01');
INSERT INTO book (title, author, genre, date_published) VALUES ('title02', 'author02', 'genre02', '2001-06-11');
INSERT INTO book (title, author, genre, date_published) VALUES ('title03', 'author03', 'genre03', '2001-07-03');
INSERT INTO book (title, author, genre, date_published) VALUES ('title04', 'author03', 'genre04', '2001-06-01');
INSERT INTO book (title, author, genre, date_published) VALUES ('title05', 'author05', 'genre05', '2001-06-01');
INSERT INTO book (title, author, genre, date_published) VALUES ('title06', 'author06', 'genre06', '2001-09-01');
INSERT INTO book (title, author, genre, date_published) VALUES ('title07', 'author07', 'genre07', '2001-06-01');
INSERT INTO book (title, author, genre, date_published) VALUES ('title04', 'author08', 'genre08', '2001-06-01');
INSERT INTO book (title, author, genre, date_published) VALUES ('title09', 'author09', 'genre09', '2001-02-01');
INSERT INTO book (title, author, genre, date_published) VALUES ('title10', 'author10', 'genre10', '2001-06-05');
SELECT * FROM book;

DROP TABLE IF EXISTS ratings;
CREATE TABLE ratings (user_id INT,
					  book_id INT,
                      PRIMARY KEY (user_id, book_id),
                      FOREIGN KEY (user_id) REFERENCES user (user_id) ON DELETE CASCADE,
                      FOREIGN KEY (book_id) REFERENCES book (book_id) ON DELETE CASCADE,
                      rating INT);

INSERT INTO ratings (user_id, book_id, rating) VALUES (1, 1, 4);
INSERT INTO ratings (user_id, book_id, rating) VALUES (1, 4, 2);
INSERT INTO ratings (user_id, book_id, rating) VALUES (2, 1, 3);
INSERT INTO ratings (user_id, book_id, rating) VALUES (1, 2, 3);
INSERT INTO ratings (user_id, book_id, rating) VALUES (2, 1, 2);
INSERT INTO ratings (user_id, book_id, rating) VALUES (2, 3, 1);
INSERT INTO ratings (user_id, book_id, rating) VALUES (3, 1, 1);
INSERT INTO ratings (user_id, book_id, rating) VALUES (4, 1, 5);
INSERT INTO ratings (user_id, book_id, rating) VALUES (6, 1, 4);
INSERT INTO ratings (user_id, book_id, rating) VALUES (10, 1, 3);
SELECT * FROM ratings;
              
DROP TABLE IF EXISTS books_completed;
CREATE TABLE books_completed (user_id INT,
					  book_id INT,
                      PRIMARY KEY (user_id, book_id),
                      FOREIGN KEY (user_id) REFERENCES user (user_id) ON DELETE CASCADE,
                      FOREIGN KEY (book_id) REFERENCES book (book_id) ON DELETE CASCADE);
                      
INSERT INTO books_completed (user_id, book_id) VALUES (1, 1);                      
INSERT INTO books_completed (user_id, book_id) VALUES (1, 5);                      
INSERT INTO books_completed (user_id, book_id) VALUES (1, 9);                      
INSERT INTO books_completed (user_id, book_id) VALUES (2, 2);                      
INSERT INTO books_completed (user_id, book_id) VALUES (2, 3);                      
INSERT INTO books_completed (user_id, book_id) VALUES (2, 7);                      
INSERT INTO books_completed (user_id, book_id) VALUES (3, 2);                      
INSERT INTO books_completed (user_id, book_id) VALUES (7, 6);                      
INSERT INTO books_completed (user_id, book_id) VALUES (9, 2);                      
INSERT INTO books_completed (user_id, book_id) VALUES (10, 1);    

SELECT * FROM books_completed ORDER BY book_id;          
             
DROP TABLE IF EXISTS books_dropped;             
CREATE TABLE books_dropped (user_id INT,
					  book_id INT,
                      PRIMARY KEY (user_id, book_id),
                      FOREIGN KEY (user_id) REFERENCES user (user_id) ON DELETE CASCADE,
                      FOREIGN KEY (book_id) REFERENCES book (book_id) ON DELETE CASCADE);
                      
INSERT INTO books_dropped (user_id, book_id) VALUES (6, 3);                      
INSERT INTO books_dropped (user_id, book_id) VALUES (2, 1);                      
INSERT INTO books_dropped (user_id, book_id) VALUES (9, 9);                      
INSERT INTO books_dropped (user_id, book_id) VALUES (10,1);                      
INSERT INTO books_dropped (user_id, book_id) VALUES (6, 8);                      
INSERT INTO books_dropped (user_id, book_id) VALUES (1, 1);                      
INSERT INTO books_dropped (user_id, book_id) VALUES (9, 7);                      
INSERT INTO books_dropped (user_id, book_id) VALUES (4, 10);                      
INSERT INTO books_dropped (user_id, book_id) VALUES (7, 7);                      
INSERT INTO books_dropped (user_id, book_id) VALUES (6, 4);     

SELECT * FROM books_dropped;                 
                      
DROP TABLE IF EXISTS books_reading;                      
CREATE TABLE books_reading (user_id INT,
					  book_id INT,
                      PRIMARY KEY (user_id, book_id),
                      FOREIGN KEY (user_id) REFERENCES user (user_id) ON DELETE CASCADE,
                      FOREIGN KEY (book_id) REFERENCES book (book_id) ON DELETE CASCADE);
                      
INSERT INTO books_reading (user_id, book_id) VALUES (9, 5);                      
INSERT INTO books_reading (user_id, book_id) VALUES (6, 3);                      
INSERT INTO books_reading (user_id, book_id) VALUES (4, 4);                      
INSERT INTO books_reading (user_id, book_id) VALUES (1, 4);                      
INSERT INTO books_reading (user_id, book_id) VALUES (3, 1);                      
INSERT INTO books_reading (user_id, book_id) VALUES (10, 8);                      
INSERT INTO books_reading (user_id, book_id) VALUES (6, 10);                      
INSERT INTO books_reading (user_id, book_id) VALUES (5, 1);                      
INSERT INTO books_reading (user_id, book_id) VALUES (6, 2);                      
INSERT INTO books_reading (user_id, book_id) VALUES (6, 10);                      

DROP TABLE IF EXISTS books_to_read;                      
CREATE TABLE books_to_read (user_id INT,
					  book_id INT,
                      PRIMARY KEY (user_id, book_id),
                      FOREIGN KEY (user_id) REFERENCES user (user_id) ON DELETE CASCADE,
                      FOREIGN KEY (book_id) REFERENCES book (book_id) ON DELETE CASCADE);
     
INSERT INTO books_to_read (user_id, book_id) VALUES (3, 8);                      
INSERT INTO books_to_read (user_id, book_id) VALUES (6, 4);                      
INSERT INTO books_to_read (user_id, book_id) VALUES (2, 9);                      
INSERT INTO books_to_read (user_id, book_id) VALUES (3, 5);                      
INSERT INTO books_to_read (user_id, book_id) VALUES (1, 9);                      
INSERT INTO books_to_read (user_id, book_id) VALUES (8, 2);                      
INSERT INTO books_to_read (user_id, book_id) VALUES (9, 2);                      
INSERT INTO books_to_read (user_id, book_id) VALUES (10, 9);                      
INSERT INTO books_to_read (user_id, book_id) VALUES (9, 6);                      
INSERT INTO books_to_read (user_id, book_id) VALUES (3, 2);  

SELECT * FROM books_to_read;                    
     
DROP TABLE IF EXISTS reviews;     
CREATE TABLE reviews (user_id INT,
					  book_id INT,
                      PRIMARY KEY (user_id, book_id),
                      FOREIGN KEY (user_id) REFERENCES user (user_id) ON DELETE CASCADE,
                      FOREIGN KEY (book_id) REFERENCES book (book_id) ON DELETE CASCADE,
                      review VARCHAR (10240));    
                      
INSERT INTO reviews (user_id, book_id, review) VALUES (7, 1, 'review05');
INSERT INTO reviews (user_id, book_id, review) VALUES (5, 3, 'review08');
INSERT INTO reviews (user_id, book_id, review) VALUES (4, 8, 'review03');
INSERT INTO reviews (user_id, book_id, review) VALUES (1, 4, 'review09');
INSERT INTO reviews (user_id, book_id, review) VALUES (4, 2, 'review10');
INSERT INTO reviews (user_id, book_id, review) VALUES (1, 5, 'review04');
INSERT INTO reviews (user_id, book_id, review) VALUES (10, 5, 'review05');
INSERT INTO reviews (user_id, book_id, review) VALUES (8, 6, 'review06');
INSERT INTO reviews (user_id, book_id, review) VALUES (2, 2, 'review02');
INSERT INTO reviews (user_id, book_id, review) VALUES (7, 3, 'review10');

SELECT * FROM reviews;


SELECT user_name, title
FROM user 
LEFT JOIN books_completed ON user.user_id = books_completed.user_id
LEFT JOIN book ON books_completed.book_id = book.book_id;

SELECT * FROM user;
SELECT * FROM books_completed;
SELECT * FROM book;

                      
                      
CREATE OR REPLACE VIEW all_users AS
SELECT user_id, user_name
FROM user;

SELECT * FROM all_users;


DROP PROCEDURE IF EXISTS user_getall;

DELIMITER //

CREATE PROCEDURE user_getall()
BEGIN

SELECT * FROM all_users;

END //

DELIMITER ;

CALL user_getall();
                      