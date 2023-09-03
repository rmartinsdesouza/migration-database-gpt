/* book_created */
CREATE OR REPLACE TRIGGER book_created
BEFORE INSERT ON book
FOR EACH ROW
BEGIN
    :new.creation_date := SYSDATE;
END;

/* book_updated */
CREATE OR REPLACE TRIGGER book_updated
BEFORE UPDATE ON book
FOR EACH ROW
BEGIN
    :new.modification_date := SYSDATE;
END;

/* calculate_author_age */
CREATE OR REPLACE TRIGGER calculate_author_age
BEFORE INSERT OR UPDATE ON author
FOR EACH ROW
BEGIN
    :new.age := FLOOR(MONTHS_BETWEEN(SYSDATE, :new.birth_date) / 12);
END;

/* prevent_delete_book_with_genre */
CREATE OR REPLACE TRIGGER prevent_delete_book_with_genre
BEFORE DELETE ON book
FOR EACH ROW
BEGIN
    IF EXISTS (SELECT 1 FROM book_genre WHERE book_id = :old.book_id) THEN
        RAISE_APPLICATION_ERROR(-20001, 'Este livro está associado a um gênero e não pode ser excluído.');
    END IF;
END;

