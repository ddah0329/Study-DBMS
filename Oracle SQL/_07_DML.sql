-------------------------------------------------------------
-- DML : 데이터를 조작하는 언어
-------------------------------------------------------------
-- CREATE
CREATE TABLE TBL_MEMBER(
	MEMBER_NAME VARCHAR2(500),
	MEMBER_AGE NUMBER
);
-------------------------------------------------------------
-- INSERT : 데이터 삽입
-------------------------------------------------------------
INSERT INTO TBL_MEMBER
VALUES('홍길동', 20);

INSERT INTO TBL_MEMBER
VALUES('김철수', 25);

-- MEMBER_NAME에만 값을 넣을 것이다. 
INSERT INTO TBL_MEMBER(MEMBER_NAME)
VALUES('이유리');


-------------------------------------------------------------
-- UPDATE: 
-------------------------------------------------------------
-- 김철수 -> 신짱구
UPDATE TBL_MEMBER
SET MEMBER_NAME = '신짱구'
WHERE MEMBER_NAME = '김철수'


--이유리 나이 27 수정
UPDATE TBL_MEMBER
SET MEMBER_AGE = 27
WHERE MEMBER_AGE IS NULL;

-------------------------------------------------------------
-- DELETE
-------------------------------------------------------------
-- 테이블 전체 삭제
DELETE FROM TBL_MEMBER;

-- 이유리 데이터 삭제
DELETE FROM TBL_MEMBER
WHERE MEMBER_NAME = '이유리';


-------------------------------------------------------------
-- [실습]
-------------------------------------------------------------
-- 삽입 {1.신라면} {2.아몬드 빼빼로, 1200} 
-- {3.오리지널 빼빼로, 1200} {4.진라면,1100} {5.삼양라면,900}

--상품 테이블 생성
CREATE TABLE TBL_PRODUCT(
	PRODUCT_NUMBER NUMBER, -- 상품번호
	PRODUCT_NAME VARCHAR2(500),
	PRODUCT_PRICE NUMBER
);

INSERT INTO TBL_PRODUCT(PRODUCT_NUMBER,PRODUCT_NAME)
VALUES(1,'신라면');

INSERT INTO TBL_PRODUCT
VALUES(5,'삼양라면', 900);

-- 신라면 가격 1000원으로 수정
UPDATE TBL_PRODUCT
SET PRODUCT_PRICE = 1000
WHERE PRODUCT_PRICE IS NULL;

-- 오리지널 빼빼로 -> 누드 뺴뺴로 이름 변경
UPDATE TBL_PRODUCT 
SET PRODUCT_NAME = '누드 빼빼로'
WHERE PRODUCT_NAME = '오리지널 빼빼로';

-- 삼양라면 가격 10% 인상
UPDATE TBL_PRODUCT 
SET PRODUCT_PRICE = 900 * 1.1
WHERE PRODUCT_NAME = 삼양라면;

-- 빼빼로 가격 10% 인하 (빼뺴로 2개를 한번에 변경)
UPDATE TBL_PRODUCT
SET PRODUCT_PRICE = 1200 * 0.9
WHERE PRODUCT_NAME LIKE '% 빼빼로';

-- 라면 전부 삭제
DELETE FROM TBL_PRODUCT
WHERE PRODUCT_NAME LIKE '%라면';

SELECT * FROM TBL_PRODUCT;
