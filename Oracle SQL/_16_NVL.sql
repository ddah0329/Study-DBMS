-- NVL()
SELECT BOOK_NAME , NVL(MEMBER_NUMBER , 0) -- MEMBER_NUMBER 컬럼이 NUMBER 타입이라서 오류난다.
FROM TBL_BOOK;

INSERT INTO TBL_MEMBER
VALUES(1,'신짱구',20,'010-1234-1234','서울시');

UPDATE TBL_BOOK
SET MEMBER_NUMBER = 1
WHERE BOOK_NUMBER = 2;

-- NVL2()
SELECT BOOK_NAME , NVL2(MEMBER_NUMBER , '대여 중' , '대여 가능')
FROM TBL_BOOK;

SELECT * FROM PLAYER;

-- 롤백 테스트
-- PLAYER 테이블에서 TEAM_ID가 'K01'인 선수 이름을 ㅋㅋ로 바꾸기
UPDATE PLAYER
SET PLAYER_NAME = 'ㅋㅋ'
WHERE TEAM_ID = 'K01';


SELECT * FROM PLAYER WHERE TEAM_ID = 'K01';

ROLLBACK;
COMMIT; -- 저장
