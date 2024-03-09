---------------------------------------------------------------------------
-- DDL
---------------------------------------------------------------------------


---------------------------------------------------------------------------
-- CREATE
---------------------------------------------------------------------------
-- USER정보를 담은 TBL_USER테이블 생성
CREATE TABLE TBL_USER(
	USER_NAME VARCHAR2(500),
	USER_AGE NUMBER
)

---------------------------------------------------------------------------
-- ALTER
---------------------------------------------------------------------------
-- 테이블명 변경: TBL_USER -> TBL_MY_USER 
ALTER TABLE TBL_USER
	RENAME TO TBL_MY_USER;

-- 컬럼 추가: USER_GENDER
ALTER TABLE TBL_MY_USER
	ADD(USER_GENDER VARCHAR2(100));

-- 컬럼명 수정 : USER_NAME -> USER_NICKNAME 
ALTER TABLE TBL_MY_USER
	RENAME COLUMN USER_NAME TO USER_NICKNAME;

-- 컬럼 삭제 : USER_GENDER
ALTER TABLE TBL_MY_USER 
	DROP COLUMN USER_GENDER;

--컬럼 타입 수정 : USER_NICKNAME 컬럼을 VARCHAR2(1000)으로 변경
ALTER TABLE TBL_MY_USER 
	MODIFY(USER_NICKNAME VARCHAR2(1000)); -- 칼럼에 데이터가 들어있으면 자료형 수정 불가

INSERT INTO TBL_MY_USER
VALUES('철수', 30);

---------------------------------------------------------------------------
-- TRUNCATE :모든 데이터 삭제
---------------------------------------------------------------------------
TRUNCATE TABLE TBL_MY_USER;

---------------------------------------------------------------------------
-- DROP 테이블 삭제
---------------------------------------------------------------------------
DROP TABLE TBL_MY_USER;

SELECT * FROM TBL_MY_USER;


---------------------------------------------------------------------------
-- [실습]
---------------------------------------------------------------------------
-- TBL_MUSIC 테이블 생성
CREATE TABLE TBL_MUSIC(
	MUSIC_NUMBER NUMBER,
	MUSIC_TITLE VARCHAR2(500),
	MUSIC_SINGER VARCHAR2(500)
);

-- DATE 타입의 MUSIC_DATE 칼럼 추가
ALTER TABLE TBL_MUSIC
	ADD(MUSIC_DATE DATE);

-- 테이블명 TBL_MY_MUSIC으로 수정
ALTER TABLE TBL_MUSIC
	RENAME TO TBL_MY_MUSIC;

-- 컬럼명 MUSIC_NUMBER => MY_MUSIC_NUMBER 으로 수정
ALTER TABLE TBL_MY_MUSIC
	RENAME COLUMN MUSIC_NUMBER TO MY_MUSIC_NUMBER;

-- MY_MUSIC_NUMBER 컬럼의 자료형을 VARCHAR2(500)으로 수정
ALTER TABLE TBL_MY_MUSIC
	MODIFY(MY_MUSIC_NUMBER VARCHAR2(500));

-- MUSIC_DATE 컬럼 삭제
ALTER TABLE TBL_MY_MUSIC 
	DROP COLUMN MUSIC_DATE;

-- TBL_MY_MUSIC 테이블 삭제
DROP TABLE TBL_MY_MUSIC  

SELECT * FROM TBL_MY_MUSIC;
