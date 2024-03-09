-- ON DELETE CASCADE
SELECT * FROM TBL_MEMBER;
SELECT * FROM TBL_BOOK;

UPDATE TBL_BOOK
SET MEMBER_NUMBER = 1
WHERE BOOK_NAME = '셜록';

UPDATE TBL_BOOK
SET MEMBER_NUMBER = 2
WHERE BOOK_NAME LIKE '%정복';

DELETE FROM TBL_MEMBER
WHERE MEMBER_NAME = '홍길동';

DROP TABLE TBL_BOOK;
DROP TABLE TBL_MEMBER;

CREATE TABLE TBL_MEMBER(
   MEMBER_NUMBER NUMBER CONSTRAINT PK_MEMBER PRIMARY KEY,
   MEMBER_NAME VARCHAR2(500),
   MEMBER_AGE NUMBER,
   MEMBER_PHONE_NUMBER VARCHAR2(500) UNIQUE,
   MEMBER_ADDRESS VARCHAR2(500)
);

-- ON DELETE CASCADE 옵션 적용
CREATE TABLE TBL_BOOK(
   BOOK_NUMBER NUMBER CONSTRAINT PK_BOOK PRIMARY KEY,
   BOOK_NAME VARCHAR2(500),
   BOOK_CATEGORY VARCHAR2(500) CHECK(
      BOOK_CATEGORY IN('인문학','추리','IT','로맨스') 
   ),
   MEMBER_NUMBER NUMBER,
   CONSTRAINT FK_MEMBER FOREIGN KEY(MEMBER_NUMBER) REFERENCES TBL_MEMBER(MEMBER_NUMBER) 
   ON DELETE CASCADE
);

INSERT INTO TBL_MEMBER
VALUES(1,'홍길동',20,'010-1234-1234','서울시');

INSERT INTO TBL_BOOK
VALUES(1,'오이대왕','인문학',1);

SELECT * FROM TBL_MEMBER;
SELECT * FROM TBL_BOOK;

DELETE FROM TBL_MEMBER
WHERE MEMBER_NAME = '홍길동';

INSERT INTO TBL_BOOK
VALUES(1, 'DBMS 완전 정복', 'IT', NULL);

INSERT INTO TBL_BOOK
VALUES(2, 'PYTHON 완전 정복', 'IT', NULL);

INSERT INTO TBL_BOOK
VALUES(3, 'JAVA 완전 정복', 'IT' , NULL);

SELECT * FROM TBL_BOOK ORDER BY BOOK_NUMBER;