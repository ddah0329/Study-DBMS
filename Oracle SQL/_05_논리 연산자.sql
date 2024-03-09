-----------------------------------------------------------------
-- 논리 연산자 : AND, OR, NOT
-----------------------------------------------------------------

-- EMPLOYEES 테이블에서 부서가 영업부서(department_id = 80)이면서,
-- 봉급이 10,000 이상인 직원들의 이름, 봉급, 영업부서 조회
SELECT 
	FIRST_NAME,
	SALARY,
	DEPARTMENT_ID
FROM
	EMPLOYEES
WHERE
	DEPARTMENT_ID = 80 AND SALARY >= 10000;
	
-- 이름이 David가 아닌 직원의 이름 조회
SELECT
	FIRST_NAME
FROM
	EMPLOYEES
WHERE NOT
	FIRST_NAME = 'David';

-- WHERE
--	FIRST_NAME <> 'David';


-----------------------------------------------------------------
-- [실습]
-----------------------------------------------------------------

-- 1. 직원의 이름,성, 봉급 조회 
-- 봉급이 10000 이상이거나 입사일이 2007년 1월 1일 이후인 직원만 조회
SELECT
	FIRST_NAME,
	LAST_NAME,
	SALARY
FROM
	EMPLOYEES
WHERE 
	SALARY >= 10000 OR HIRE_DATE >= '2007-01-01'

-- 2. 직원의 이름, 성, 봉급, 상사번호 조회
-- 상사번호 100 이고, 봉급이 12000이상인 직원만 조회
SELECT
	FIRST_NAME,
	LAST_NAME,
	SALARY,
	MANAGER_ID
FROM
	EMPLOYEES
WHERE 
	MANAGER_ID = 100 AND SALARY >= 12000
