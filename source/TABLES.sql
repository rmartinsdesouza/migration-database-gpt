/* author */
CREATE TABLE author (
    author_id NUMBER PRIMARY KEY,
    name VARCHAR2(100),
    birth_date DATE
);

/* publisher */
CREATE TABLE publisher (
    publisher_id NUMBER PRIMARY KEY,
    name VARCHAR2(100),
    location VARCHAR2(255)
);

/* book */
CREATE TABLE book (
    book_id NUMBER PRIMARY KEY,
    title VARCHAR2(255),
    author_id NUMBER,
    publisher_id NUMBER,
    publication_year NUMBER,
    FOREIGN KEY (author_id) REFERENCES author (author_id),
    FOREIGN KEY (publisher_id) REFERENCES publisher (publisher_id)
);

/* genre */
CREATE TABLE genre (
    genre_id NUMBER PRIMARY KEY,
    name VARCHAR2(100)
);

/* book_genre */
CREATE TABLE book_genre (
    book_id NUMBER,
    genre_id NUMBER,
    PRIMARY KEY (book_id, genre_id),
    FOREIGN KEY (book_id) REFERENCES book (book_id),
    FOREIGN KEY (genre_id) REFERENCES genre (genre_id)
);
