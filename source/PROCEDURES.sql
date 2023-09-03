/* author */
CREATE OR REPLACE PROCEDURE insert_author (
    p_name VARCHAR2(100),
    p_birth_date DATE
) AS
BEGIN
    INSERT INTO author (author_id, name, birth_date)
    VALUES (author_seq.NEXTVAL, p_name, p_birth_date);
    COMMIT;
END insert_author;

CREATE OR REPLACE PROCEDURE update_author (
    p_author_id NUMBER,
    p_name VARCHAR2(100),
    p_birth_date DATE
) AS
BEGIN
    UPDATE author
    SET name = p_name,
        birth_date = p_birth_date
    WHERE author_id = p_author_id;
    COMMIT;
END update_author;

CREATE OR REPLACE PROCEDURE delete_author (
    p_author_id NUMBER
) AS
BEGIN
    DELETE FROM author WHERE author_id = p_author_id;
    COMMIT;
END delete_author;

/* publisher */
CREATE OR REPLACE PROCEDURE insert_publisher (
    p_name VARCHAR2(100),
    p_location VARCHAR2(255)
) AS
BEGIN
    INSERT INTO publisher (publisher_id, name, location)
    VALUES (publisher_seq.NEXTVAL, p_name, p_location);
    COMMIT;
END insert_publisher;

CREATE OR REPLACE PROCEDURE update_publisher (
    p_publisher_id NUMBER,
    p_name VARCHAR2(100),
    p_location VARCHAR2(255)
) AS
BEGIN
    UPDATE publisher
    SET name = p_name,
        location = p_location
    WHERE publisher_id = p_publisher_id;
    COMMIT;
END update_publisher;


CREATE OR REPLACE PROCEDURE delete_publisher (
    p_publisher_id NUMBER
) AS
BEGIN
    DELETE FROM publisher WHERE publisher_id = p_publisher_id;
    COMMIT;
END delete_publisher;

/* genre */
CREATE OR REPLACE PROCEDURE insert_genre (
    p_name VARCHAR2(100)
) AS
BEGIN
    INSERT INTO genre (genre_id, name)
    VALUES (genre_seq.NEXTVAL, p_name);
    COMMIT;
END insert_genre;

CREATE OR REPLACE PROCEDURE update_genre (
    p_genre_id NUMBER,
    p_name VARCHAR2(100)
) AS
BEGIN
    UPDATE genre
    SET name = p_name
    WHERE genre_id = p_genre_id;
    COMMIT;
END update_genre;

CREATE OR REPLACE PROCEDURE delete_genre (
    p_genre_id NUMBER
) AS
BEGIN
    DELETE FROM genre WHERE genre_id = p_genre_id;
    COMMIT;
END delete_genre;

/* book_genre */
CREATE OR REPLACE PROCEDURE insert_book_genre (
    p_book_id NUMBER,
    p_genre_id NUMBER
) AS
BEGIN
    INSERT INTO book_genre (book_id, genre_id)
    VALUES (p_book_id, p_genre_id);
    COMMIT;
END insert_book_genre;

CREATE OR REPLACE PROCEDURE update_book_genre (
    p_book_id NUMBER,
    p_old_genre_id NUMBER,
    p_new_genre_id NUMBER
) AS
BEGIN
    -- Primeiro, exclua a associação antiga
    DELETE FROM book_genre WHERE book_id = p_book_id AND genre_id = p_old_genre_id;

    -- Em seguida, insira a nova associação
    INSERT INTO book_genre (book_id, genre_id)
    VALUES (p_book_id, p_new_genre_id);

    COMMIT;
END update_book_genre;

CREATE OR REPLACE PROCEDURE delete_book_genre (
    p_book_id NUMBER,
    p_genre_id NUMBER
) AS
BEGIN
    DELETE FROM book_genre WHERE book_id = p_book_id AND genre_id = p_genre_id;
    COMMIT;
END delete_book_genre;

