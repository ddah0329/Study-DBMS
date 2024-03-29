--where 서브쿼리절 사용
-- 1. PLAYER테이블에서 송종국 선수가 포함된 팀의 선수들의 모든정보 조회
SELECT *
FROM PLAYER
WHERE TEAM_ID = 
(SELECT TEAM_ID FROM PLAYER WHERE PLAYER_NAME = '송종국');


-- 2. 메뉴얼 커밋으로 변경후 진행
-- 2-1) PLAYER테이블에서 NICKNAME이 NULL인 선수들을 정태민 선수의 닉네임으로 수정

UPDATE PLAYER
SET NICKNAME = (SELECT NICKNAME FROM PLAYER WHERE PLAYER_NAME = '정태민')
WHERE NICKNAME IS NULL;

SELECT NICKNAME 
FROM PLAYER
WHERE PLAYER_NAME = '정태민';

SELECT * FROM PLAYER;

-- 2-2)  EMPLOYEES 테이블에서 평균 급여보다 낮은 사원들의 급여를 10%인상된 급여로 수정
UPDATE EMPLOYEES
SET SALARY = SALARY * 1.1
WHERE SALARY < (SELECT AVG(SALARY) FROM EMPLOYEES);

SELECT AVG(SALARY) FROM EMPLOYEES;

SELECT * FROM EMPLOYEES;

-- 2-3) PLAYER 테이블에서 평균 키보다 큰 선수들을 삭제
SELECT AVG(HEIGHT) FROM PLAYER; -- 179cm

DELETE FROM PLAYER
WHERE HEIGHT > (SELECT AVG(HEIGHT) FROM PLAYER);

SELECT * FROM PLAYER;

ROLLBACK;

-------------------------------------------------------------
--ROWNUM

SELECT ROWNUM,	FIRST_NAME FROM	EMPLOYEES;

-- *을 다른 컬럼과 함께 조회하게 되면 *의 소속을 명시해줘야한다. 
SELECT ROWNUM, * FROM EMPLOYEES; -- error

SELECT ROWNUM, EMPLOYEES.* FROM EMPLOYEES;

-- 테이블에 별칭을 부여하고 별칭을 사용할 수 있다.
-- 테이블에 별칭 부여시 as사용 안함
SELECT ROWNUM, E.* FROM EMPLOYEES E;

-- EMPLOYEES 테이블에서 SALARY를 내림차순으로 정렬한 후 ROWNUM을 붙혀서 조회한다. 
SELECT ROWNUM, SALARY 
FROM EMPLOYEES
ORDER BY SALARY DESC;

-- 서브쿼리를 사용하여 정렬을 먼저하고 ROWNUM을 붙혀준다. 
SELECT ROWNUM, SALARY
FROM (SELECT SALARY FROM EMPLOYEES ORDER BY SALARY DESC);

-- 서브쿼리에도 별칭을 붙혀줄 수 있다. 
SELECT ROWNUM, E.*
FROM (SELECT * FROM EMPLOYEES ORDER BY SALARY DESC) E;

-- 실습
-- EMPLOYEES 테이블에서 SALARY가 높은 1위~5위까지 직원의 모든 정보 조회

SELECT * FROM EMPLOYEES;

SELECT *
FROM EMPLOYEES
ORDER BY SALARY DESC;


SELECT ROWNUM, *
FROM EMPLOYEES;


SELECT ROWNUM, E.*
FROM (SELECT * FROM EMPLOYEES ORDER BY SALARY DESC) E
WHERE ROWNUM BETWEEN 1 AND 5;

--------------------------------------------------------------------------
-- 내부조인
-- EMP테이블에서 사원번호로 DEPT테이블의 지역 검색
SELECT * FROM EMP;
SELECT * FROM DEPT;

-- DEPT테이블의 PK와 EMP테이블의 FK가 같은 데이터만 뽑아와라
SELECT *
FROM EMP E INNER JOIN DEPT D
ON E.DEPTNO = D.DEPTNO 

-- 조인을 진행한 후 원하는 데이터만 뽑아올 수 있다. 
-- JOIN = INNER JOIN DEFAULT 값
SELECT LOC
-- 선행테이블       후행테이블
FROM EMP E JOIN DEPT D
ON E.DEPTNO = D.DEPTNO;

-- 선행테이블에는 칼럼수가 적은게 좋다. 

-----------------
DROP TABLE TBL_;

-- SCHOOL테이블
CREATE TABLE TBL_SCHOOL(
	SCHOOL_NUMBER NUMBER CONSTRAINT PK_SCHOOL PRIMARY KEY,
	SCHOOL_NAME VARCAHR2(500)
);

-- SCHOOL테이블

CREATE TABLE TBL_STUDENT(
	STUDENT_NUMBER NUMBER CONSTRAINT PK_SCHOOL PRIMARY KEY,
	STUDENT_NAME VARCAHR2(500)
);
-- 외부조인



---- 실습 1.
SELECT * FROM PLAYER;
SELECT * FROM TEAM;

SELECT T.TEL
FROM PLAYER P JOIN TEAM T
ON P.TEAM_ID = T.TEAM_ID
WHERE P.TEAM_ID = (SELECT TEAM_ID FROM PLAYER WHERE PLAYER_NAME = '송종국');

SELECT T.TEAM_ID, TEL
FROM TEAM T JOIN PLAYER P
ON T.TEAM_ID = P.TEAM_ID
WHERE PLAYER_NAME =('송중국')

-- >>??
-- 온절만 사용하는게 성능적으로 좋다. 
SELECT T.TEAM_ID, TEL
FROM TEAM T JOIN PLAYER P
ON T.TEAM_ID = P.TEAM_ID AND PLAYER_NAME =('송중국')
--- 실습 2
SELECT * FROM EMPLOYEES e;

SELECT * FROM JOBS j ;

SELECT JOB_TITLE, EMAIL, FIRST_NAME , LAST_NAME
FROM JOBS j JOIN EMPLOYEES e
ON j.JOB_ID = e.JOB_ID;


---- 실습 3
SELECT * FROM EMPLOYEES e ;
SELECT * FROM DEPARTMENTS d;

SELECT e.*, d.DEPARTMENT_NAME
FROM DEPARTMENTS d JOIN EMPLOYEES e 
ON d.DEPARTMENT_ID = e.DEPARTMENT_ID;


----- 실습 4
SELECT * FROM EMP e2;
SELECT * FROM DEPT d ;

SELECT d.DNAME, d.LOC
FROM DEPT d JOIN EMP e
ON d.DEPTNO = e.EMPNO
WHERE ENAME LIKE 'L%';
