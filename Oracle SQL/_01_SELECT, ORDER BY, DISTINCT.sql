-----------------------------------------------------------------
-- ORDER BY 절 : 정렬
-----------------------------------------------------------------
-- ASC : 오름차순, 오래된순, ABC순
-- DESC : 내림차순, 최신순, ABC역순
-- ORDER BY 컬럼명 (ASC 생략가능)

-----------------------------------------------------------------
-- 정렬 방식이 1개 일때 
-----------------------------------------------------------------
-- 사원의 이름, 성, 봉급 조회 
-- 봉급이 낮은 순서로
SELECT FIRST_NAME, LAST_NAME, SALARY FROM EMPLOYEES ORDER BY SALARY ASC;
-- 봉급이 높은 순서로 
SELECT FIRST_NAME, LAST_NAME, SALARY FROM EMPLOYEES ORDER BY SALARY DESC;


-- 날짜 데이터 정렬
-- 직원의 이름, 고용일 조회 < 고용일 순서대로 정렬 >
SELECT FIRST_NAME, HIRE_DATE FROM EMPLOYEES ORDER BY HIRE_DATE ASC;


-- 문자 값 정렬
-- 직원의 이름, 성 데이터 조회 < 성 순서대로 정렬 >
SELECT FIRST_NAME, LAST_NAME FROM EMPLOYEES ORDER BY LAST_NAME ASC;

-----------------------------------------------------------------
-- 정렬 방식이 2개 일때 
-----------------------------------------------------------------
SELECT 
	FIRST_NAME, SALARY,HIRE_DATE
FROM 
	EMPLOYEES 
ORDER BY 
	SALARY ASC, HIRE_DATE ASC;
-- SALARY를 먼저 1차 정렬한 후  SALARY에서 중복 값에 한해서 
-- HIREDATE를 ASC기준으로 2차 정렬
	

-- SALARY 데이터를 조회하지 않아도 정렬만으로도 정렬기준으로 조회하게 됨
SELECT 
	FIRST_NAME, LAST_NAME
FROM 
	EMPLOYEES 
ORDER BY 
	SALARY DESC;



-----------------------------------------------------------------
-- DISTINCT : 중복제거
-----------------------------------------------------------------
-- 회사에 있는 모든 직급(JOB_ID)조회
-- 회사에는 직급이 같은 사람들이 많아서 중복 값이 생기기 때문에 중복 제거를 해주어 조회
SELECT DISTINCT JOB_ID FROM EMPLOYEES;

-- 여러 개의 컬럼을 조회하는데 DISTINCT 사용 시
-- -> JOB_ID & HIRE_DATE 동시에 만족한, 둘 다 동일한 값을 가지고 있는 데이터만 중복 제거됨
SELECT DISTINCT
	JOB_ID, HIRE_DATE
FROM EMPLOYEES;



-----------------------------------------------------------------
-- AS: 별칭 설정
-----------------------------------------------------------------
-- AS 키워드와 큰따움표("") 생략가능
-- 설정한 별칭에 띄어쓰기나 특수문자가 포함되어있다면 "큰따음표"로 감싸줘야 한다.
-- 컬럼에 별칭을 설정했다면 별칭으로 ORDER_BY(정렬) 가능

-- 사원의 이름, 성, 봉급 조회 
-- < 1. 봉급 기준 내림차순 정렬 2. 별명사용 >
SELECT 
	FIRST_NAME AS "이름",
	LAST_NAME 성,
	SALARY "봉급",
	EMPLOYEE_ID "사원 번호"
FROM 
	EMPLOYEES
ORDER BY
	봉급 DESC;


-----------------------------------------------------------------
-- [실습]
-----------------------------------------------------------------
-- EMPLOYEES 테이블에서 사원의 이름, 성, 전화번호, 이메일, 봉급을 각각 별칭을 설정하여 조회
-- 봉급 내림차순으로 조회
SELECT 
	FIRST_NAME 이름,
	LAST_NAME 성,
	PHONE_NUMBER 전화번호,
	EMAIL 이메일,
	SALARY 봉급
FROM 
	EMPLOYEES
ORDER BY 
	봉급 DESC;
