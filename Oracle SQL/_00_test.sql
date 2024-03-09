-- 주석처리

-- hr계정에 있는 employees 테이블에서 모든 컬럼(*)에 존재하는 데이터 조회
-- *(에스터리스크) : 모든 칼럼
SELECT * FROM employees;

-- hr계정에 있는 employees 테이블에서 first_name 컬럼에 존재하는 데이터 조회
SELECT first_name FROM EMPLOYEES;

-- 2개 컬럼 안의 데이터를 조회하고 싶을때 ,(콤마) 사용
SELECT FIRST_NAME, LAST_NAME  FROM EMPLOYEES;



-- [실습]
-- 1. EMPLOYEES 테이블에서 직원의 성, 이름, 전화번호, 이메일 한 번에 조회
SELECT FIRST_NAME, LAST_NAME, PHONE_NUMBER, EMAIL FROM EMPLOYEES; 

-- 한 눈에 보기 좋게
SELECT 
	FIRST_NAME, 
	LAST_NAME, 
	PHONE_NUMBER, 
	EMAIL 
FROM 
	EMPLOYEES; 

-- 2. JOBS 테이블에서 모든 칼럼의 데이터 조회
SELECT * FROM JOBS;
