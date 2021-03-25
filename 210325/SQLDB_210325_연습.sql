/*
    <연습 문제>
    
    1. 고객 테이블에서 고객명, 생년월일, 성별 출력
    2. 고객 테이블에서 주소만 검색하여 출력 (중복되는 튜플은 한번만 출력)
    3. 고객 테이블에서 취미가 '축구'이거나 '등산'인 고객의 고객명, 취미 출력
    4. 도서 테이블에서 저자의 두 번째 위치에 '길'이 들어 있는 저자명 출력 (중복되는 튜플은 한번만 출력)
    5. 도서 테이블에서 발행일이 2018년인 도서의 도서명, 저자, 발행일 출력
    6. 도서판매 테이블에서 고객번호1, 2를 제외한 모든 튜플 출력
    7. 고객 테이블에서 취미가 NULL이 아니면서 주소가 '서울'인 고객의 고객명, 주소, 취미 출력
    8. 도서 테이블에서 가격이 25000 이상이면서 저자 이름에 '길동'이 들어가는 도서의 도서명, 저자, 가격, 재고 출력
    9. 도서 테이블에서 가격이 20,000 ~25,000원인 모든 튜플 출력 
    10. 도서 테이블에서 저자명에 '길동'이 들어 있지 않는 도서의 도서명, 저자 출력

*/

    -- 1. 고객 테이블에서 고객명, 생년월일, 성별 출력
        SELECT clientName, clientBirth, clientGender FROM client;
        
    -- 2. 고객 테이블에서 주소만 검색하여 출력 (중복되는 튜플은 한번만 출력)
        SELECT DISTINCT clientAddress FROM client;
        
    -- 3. 고객 테이블에서 취미가 '축구'이거나 '등산'인 고객의 고객명, 취미 출력
        SELECT clientName, clientHobby FROM client
        WHERE clientHobby = '축구' OR clientHobby = '등산' ;
        
    -- 4. 도서 테이블에서 저자의 두 번째 위치에 '길'이 들어 있는 저자명 출력 (중복되는 튜플은 한번만 출력)
        SELECT DISTINCT bookAuthor FROM book
        WHERE bookAuthor LIKE '_길%';
        
    --5. 도서 테이블에서 발행일이 2018년인 도서의 도서명, 저자, 발행일 출력
        SELECT bookName, bookAuthor, bookDate FROM  book
        WHERE bookDate LIKE  '2018%';
        
    -- 6. 도서판매 테이블에서 고객번호1, 2를 제외한 모든 튜플 출력
        SELECT * FROM bookSale
        WHERE clientNo NOT IN ('1', '2');
        
   -- 7. 고객 테이블에서 취미가 NULL이 아니면서 주소가 '서울'인 고객의 고객명, 주소, 취미 출력
        SELECT clientName, clientAddress, clientHobby FROM client
        WHERE clientHobby IS NOT NULL AND clientAddress LIKE '%서울%';
        
   -- 8. 도서 테이블에서 가격이 25000 이상이면서 저자 이름에 '길동'이 들어가는 도서의 도서명, 저자, 가격, 재고 출력
        SELECT bookName, bookAuthor, bookPrice, bookStock FROM book
        WHERE bookPrice >= 25000 AND bookAuthor LIKE '%길동%';
        
   -- 9. 도서 테이블에서 가격이 20,000 ~25,000원인 모든 튜플 출력 
        SELECT * FROM book
        WHERE bookPrice BETWEEN 20000 AND 25000;
        
   -- 10. 도서 테이블에서 저자명에 '길동'이 들어 있지 않는 도서의 도서명, 저자 출력
        SELECT bookName, bookAuthor FROM book
        WHERE bookAuthor NOT LIKE ('%길동%');
