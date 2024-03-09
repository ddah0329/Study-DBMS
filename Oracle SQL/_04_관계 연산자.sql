-----------------------------------------------------------------
-- 관계 연산자
-----------------------------------------------------------------
-- 별칭은 ORDER BY에만 사용 가능하므로 
-- WHERE 봉급 >= 10000 이라고 하면 에러 발생
SELECT
	FIRST_NAME,
	LAST_NAME,
	SALARY 봉급
FROM 
	EMPLOYEES
WHERE
	SALARY >= 10000
ORDER BY
	SALARY;


-- WHERE절로 날짜 값 비교
-- 날짜값을 표현할 때는 ''(작은따음표)에 YYYY-MM-DD로 표시해야한다.
SELECT
	FIRST_NAME,
	HIRE_DATE 
FROM 
	EMPLOYEES
WHERE
	HIRE_DATE > '2004-01-01'
ORDER BY
	HIRE_DATE;
	

-- 문자값 비교
-- 'John': 테이블에 문자열로 저장되어있는 데이터 값이기 때문에 대소문자 주의 해야함!
SELECT *
FROM EMPLOYEES
WHERE FIRST_NAME = 'John'; 


-----------------------------------------------------------------
-- [실습]
-----------------------------------------------------------------
-- 1. 입사일이 2005년 9월 21일인 직원의 이름, 성, 입사일을 조회
SELECT
	FIRST_NAME,
	LAST_NAME,
	HIRE_DATE
FROM
	EMPLOYEES
WHERE
	HIRE_DATE = '2005-09-21';

-- 2. 이름이 David인 직원의 이름, 성을 조회한다. 
SELECT
	FIRST_NAME,
	LAST_NAME,
	HIRE_DATE
FROM
	EMPLOYEES
WHERE
	FIRST_NAME  = 'David';

-- 3. 상사번호가 100인 직원들의 이름,성,이메일,전화번호,상사번호를 별칭을 붙혀 조회한다.
SELECT
	FIRST_NAME 이름,
	LAST_NAME 성,
	EMAIL 이메일,
	PHONE_NUMBER 전화번호,
	MANAGER_ID 상사번호
FROM
	EMPLOYEES
WHERE
	MANAGER_ID = 100;
