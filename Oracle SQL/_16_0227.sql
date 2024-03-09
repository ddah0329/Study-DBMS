------------------------------------------------
-- 집계함수
------------------------------------------------


------------------------------------------------
-- AVG()
------------------------------------------------
-- Player 테이블의 모든 선수의 평균 키를 조회
SELECT AVG(HEIGHT) FROM PLAYER;


------------------------------------------------
-- MAX()
------------------------------------------------
-- Player 테이블에서 가장 큰 키를 조회
SELECT MAX(HEIGHT) FROM PLAYER;

-- 오류 : 행 갯수 차이
SELECT PLAYER_NAME, MAX(HEIGHT) FROM PLAYER;


------------------------------------------------
-- MIN()
------------------------------------------------
-- Player 테이블에서 가장 큰 키를 조회
SELECT MIN(HEIGHT) FROM PLAYER;


------------------------------------------------
-- SUM()
------------------------------------------------
-- Player 테이블에서 모든 선수들의 키 총 합 조회
SELECT SUM(HEIGHT) FROM PLAYER;


------------------------------------------------
-- COUNT()
------------------------------------------------
-- Player 테이블에서 키 데이터의 갯수를 조회
-- 집계함수는 NULL값 제외
SELECT COUNT(HEIGHT) FROM PLAYER; -- 447개

SELECT HEIGHT FROM PLAYER; -- 480개

-- NULL 값 포함
SELECT COUNT(NVL(HEIGHT,0)) FROM PLAYER; -- 480개



------------------------------------------------
-- GROUP BY : 000 별 ex) 포지션 별
------------------------------------------------

-- PLAYER 테이블을 포지션 별로 그룹화하기
SELECT POSITION FROM PLAYER GROUP BY POSITION;


--포지션 별 평균 키
SELECT 
	POSITION, 
	AVG(HEIGHT) 
FROM 
	PLAYER 
GROUP BY
	POSITION;

-- PLAYER 테이블에서 
-- 몸무게가 80이상인 선수들의 평균 키가 185초과인 포지션 검색

-- 오류: 집계함수는 WHERE절에서 사용 불가
SELECT 
	POSITION
FROM 
	PLAYER
WHERE
	WEIGHT >= 80 AND AVG(HEIGHT) > 185;

-- 정답
SELECT
	POSITION,
	AVG(HEIGHT)
FROM 
	PLAYER
WHERE
	WEIGHT >= 80
GROUP BY POSITION HAVING AVG(HEIGHT) > 185;


-- EMPLOYEES 테이블에서 JOB_ID별 평균 SALARY가
-- 10000미만인 JOB_ID 조회
SELECT JOB_ID
FROM EMPLOYEES
GROUP BY JOB_ID
HAVING AVG(SALARY) < 10000;


-- PLAYER_ID가 2007로 시작하는 선수 중 포지션별 평균 키 조회
SELECT 
	POSITION,
	AVG(HEIGHT) 
FROM
	PLAYER
WHERE 
	PLAYER_ID LIKE '2007%'
GROUP BY
	POSITION;
	
-- 입단연도별 평균 몸무게와 평균 키 조회
SELECT 
	PLAYER_ID
FROM
	PLAYER
WHERE
	POSITION = 'MF' -- 1. MF애들 먼저 뽑고
GROUP BY
	PLAYER_ID; -- 2. 입단연도별 그룹화
	
-- PLAYER 테이블에서 포지션이 DF인 선수들의 평균 키를 TEAM_ID별로 조회
?
-- EMPLOYEES 테이블에서 COMMISSION_PCT별 평균 급여 조회
?
-- 핸드폰 번호가 515로 시작하는 사원들의 JOB_ID별 평균 SALARY 조회
?


-- SCALAR 서브쿼리
-- PLAYER 테이블에서 전체 평균키와 포지션 별 평균 키
SELECT 
	AVG(HEIHGT)
FROM PLAYER;

SELECT
	POSITION,
	AVG(HEIGHT)
FROM PLAYER
GROUP BY "POSITION";


SELECT 
	POSITION,
	AVG (HEIGHT),
	(SELECT AVG(HEIGHT) FROM PLAYER)
FROM PLAYER
GROUP BY
	POSITION;
	
-- SCALAR 서브쿼리는 서브쿼리로 결과를 도출해내서 메인 쿼리의 컬럼처럼 사용한다. 
-- 서브쿼리가 반환하는 결과의 행의 수가 메인 쿼리의 행의 수보다  많으면 안된다. 
SELECT POSITION, AVG(HEIGHT), (SELECT AVG(HEIGHT) FROM PLAYER)
FROM PLAYER
GROUP BY "POSITION";


--IN LINE VIEW 서브쿼리
-- PLAYER 테이블에서 TEAM+ID가 'K01'인 선수중 포지션 GK인 선수 조회
SELECT * FROM PLAYER
WHERE TEAM_ID = 'K01' AND POSITION ='GK';

-- INLINE 써서
SELECT *
FROM PLAYER
WHERE TEAM_ID = 'K01';

SELECT *
FROM PLAYER
WHERE POSITION = 'GK';


SELECT * 
FROM (SELECT * FROM PLAYER WHERE TEAM_ID = 'K01')
WHERE POSITION = 'GK'


-- 조건에 사용한느 SUB QUERY
-- PLAYER테이블에서 평균 몸무게 보다 더 많이 나가는 선수의 이름과 몸무게 조회

-- ERROR
SELECT PLAYER_NAME, WEIGHT
FROM PLAYER
WHERE WEIGHT > AVG(WEIGHT) --집계함수 사용 불가


-- 
SELECT PLAYER_NAME, WEIGHT
FROM PLAYER
WHERE WEIGHT > (SELECT AVG(WEIGHT) FROM PLAYER);


--[실습]
--PLAYER테이블에서 정남일 선수가 소속된 팀의 선수정보 조회 (모든 정보)
SELECT *
FROM PLAYER
WHERE TEAM_ID = (SELECT TEAM_ID FROM PLAYER WHERE PLAYER_NAME ='정남일');


--PLAYER테이블에서 평균 키보다 작은 선수들의 모든 정보 조회
SELECT * FROM PLAYER
WHERE HEIGHT < (SELECT AVG(HEIGHT) FROM PLAYER)
