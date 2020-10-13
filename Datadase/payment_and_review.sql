-- 결제
ALTER TABLE PAYMENT
	DROP FOREIGN KEY FK_RDV_TO_PAYMENT; -- 확정된예약 -> 결제

-- 결제
ALTER TABLE PAYMENT
	DROP PRIMARY KEY; -- 결제 기본키

-- 결제
DROP TABLE IF EXISTS PAYMENT RESTRICT;

-- 결제
CREATE TABLE PAYMENT (
	payidx      INT(7)       NOT NULL, -- 결제번호
	r_idx       INT(10)      NOT NULL, -- 확정예약번호
	serdate     DATE         NOT NULL, -- 운행날짜
	sertime     INT(10)      NOT NULL, -- 총운행시간
	serdistance INT(20)      NOT NULL, -- 총운행거리
	serprice    INT(10)      NOT NULL, -- 총금액
	dtime       INT(10)      NOT NULL, -- 출발시간
	dplace      VARCHAR(255) NOT NULL, -- 출발지
	atime       INT(10)      NOT NULL, -- 도착시간
	aplace      VARCHAR(255) NOT NULL  -- 도착지
);

-- 결제
ALTER TABLE PAYMENT
	ADD CONSTRAINT PK_PAYMENT -- 결제 기본키
		PRIMARY KEY (
			payidx -- 결제번호
		);

-- 결제
ALTER TABLE PAYMENT
	ADD CONSTRAINT FK_RDV_TO_PAYMENT -- 확정된예약 -> 결제
		FOREIGN KEY (
			r_idx -- 확정예약번호
		)
		REFERENCES RDV ( -- 확정된예약
			r_idx -- 확정예약번호
		);
        
SELECT * FROM PAYMENT;
DESC PAYMENT;

drop table PAYMENT;
SELECT * FROM RDV;
SELECT * FROM P_RESERVATION;
INSERT INTO PAYMENT VALUES(NULL, 1, '2019-09-07', 900-800,  30, 6000, 800, '서울시 강남구', 900, '서울시 종로구');
SELECT * FROM RDV WHERE R_IDX=1; 
select pr_idx from P_RESERVATION where p_idx=1;
select * from RDV where pr_idx=1;


-- ---------------------------------------------------------------------------------------------------------------------------------
-- 리뷰
ALTER TABLE REVIEW
	DROP FOREIGN KEY FK_PAYMENT_TO_REVIEW; -- 결제 -> 리뷰

-- 리뷰
ALTER TABLE REVIEW
	DROP FOREIGN KEY FK_PASSENGER_TO_REVIEW; -- 탑승자 -> 리뷰

-- 리뷰
ALTER TABLE REVIEW
	DROP FOREIGN KEY FK_DRIVER_TO_REVIEW; -- 운전자 -> 리뷰

-- 리뷰
ALTER TABLE REVIEW
	DROP PRIMARY KEY; -- 리뷰 기본키

-- 리뷰
DROP TABLE IF EXISTS REVIEW RESTRICT;
SELECT * FROM REVIEW;
DESC REVIEW;

-- 리뷰
CREATE TABLE REVIEW (
	rv_idx     INT(7)       NOT NULL, -- 리뷰번호
	payidx     INT(7)       NOT NULL, -- 결제번호
	p_idx      INT(10)      NOT NULL, -- 탑승자번호
	d_idx      INT(10)      NOT NULL, -- 운전자번호
	pr_content VARCHAR(255) , -- 탑승자리뷰내용
	pr_star    INT(10)      , -- 탑승자별점
	dr_content VARCHAR(255) , -- 운전자리뷰내용
	dr_star    INT(10)       -- 운전자별점
);

-- 리뷰
ALTER TABLE REVIEW
	ADD CONSTRAINT PK_REVIEW -- 리뷰 기본키
		PRIMARY KEY (
			rv_idx -- 리뷰번호
		);

-- 리뷰
ALTER TABLE REVIEW
	ADD CONSTRAINT FK_PAYMENT_TO_REVIEW -- 결제 -> 리뷰
		FOREIGN KEY (
			payidx -- 결제번호
		)
		REFERENCES PAYMENT ( -- 결제
			payidx -- 결제번호
		);

-- 리뷰
ALTER TABLE REVIEW
	ADD CONSTRAINT FK_PASSENGER_TO_REVIEW -- 탑승자 -> 리뷰
		FOREIGN KEY (
			p_idx -- 탑승자번호
		)
		REFERENCES PASSENGER ( -- 탑승자
			p_idx -- 회원번호
		);

-- 리뷰
ALTER TABLE REVIEW
	ADD CONSTRAINT FK_DRIVER_TO_REVIEW -- 운전자 -> 리뷰
		FOREIGN KEY (
			d_idx -- 운전자번호
		)
		REFERENCES DRIVER ( -- 운전자
			d_idx -- 회원번호
		);

-- 데이터 추가, 삭제, 수정 후 idx 재정렬해주는 쿼리문    
SET @COUNT = 1; UPDATE REVIEW SET rv_idx = @COUNT:=@COUNT+1;
SET @COUNT = 1; UPDATE PAYMENT SET payidx = @COUNT:=@COUNT+1;
        
        
SELECT * FROM REVIEW;
DESC REVIEW;
select * from P_RESERVATION;
SELECT * FROM RDV;

update REVIEW set pr_content = '생각해보니 차가 더러웠어요', pr_star=2 where rv_idx=31;
update REVIEW set dr_content = '차에서 과자먹음...', dr_star=2 where rv_idx=31;

INSERT INTO REVIEW VALUES (NULL, 17, 1, 1, '운전자 분이 엄청 친절해서 좋았어요! ', 10, '탑승자 분은 조용한 편이어서 운전하기 편했어요 ', 9);
INSERT INTO REVIEW VALUES (NULL, 19, 1, 1, null, null, '대박조음', 10);

update REVIEW set pr_content='차는 괜춘했어요 ', pr_star=6 where rv_idx=31;
delete from REVIEW where rv_idx=32;
delete from REVIEW where rv_idx=30;
select * from REVIEW where payidx=19;
update REVIEW set dr_content='탑승자분은 너무 졸았어요!', dr_star=10 where payidx=19;
select rv_idx, PASSENGER.nickname as p_nickname, pr_content, pr_star, DRIVER.nickname as d_nickname, dr_content, dr_star from REVIEW join DRIVER using(d_idx) join PASSENGER using(p_idx) where p_idx=1;
select * from REVIEW where rv_idx=31;

select * from PAYMENT;
select payidx from PAYMENT where r_idx=1;
delete from PAYMENT where payidx=17;

select dr_idx, pr_idx from RDV where r_idx=1;

select * from PAYMENT, RDV, P_RESERVATION, D_RESERVATION where (PAYMENT.r_idx = RDV.r_idx = 1) and (P_RESERVATION.pr_idx = RDV.pr_idx) and (D_RESERVATION.dr_idx=RDV.dr_idx);
select payidx, d_idx, p_idx from PAYMENT join RDV using (r_idx) join P_RESERVATION using(pr_idx) join D_RESERVATION using(dr_idx) where r_idx=1;
insert into REVIEW (payidx, p_idx, d_idx, pr_content, pr_star) values (11, 1, 1, 'good', 9);
select * from REVIEW;
delete from REVIEW where rv_idx=3;


select r_idx, dr_idx, pr_idx, r_date, rs_time, re_time, r_commute, r_startpoint, r_endpoint, r_fee, r_distance from P_RESERVATION join RDV using (pr_idx) where p_idx=1; 

select * from PAYMENT where r_idx = 1;



select payidx, r_idx, serdate, sertime, serdistance, serprice, dtime, dplace, atime, aplace from P_RESERVATION join RDV using(pr_idx) join PAYMENT using(r_idx) where p_idx = 1;
select payidx, r_idx, serdate, sertime, serdistance, serprice, dtime, dplace, atime, aplace from D_RESERVATION join RDV using(dr_idx) join PAYMENT using(r_idx) where d_idx = 1;

-- RDV -----------------------------------------------------------------------------------------------------------
-- 확정된예약
ALTER TABLE RDV
	DROP FOREIGN KEY FK_D_RESERVATION_TO_RDV; -- 운전자예약리스트 -> 확정된예약

-- 확정된예약
ALTER TABLE RDV
	DROP FOREIGN KEY FK_P_RESERVATION_TO_RDV; -- 탑승자예약리스트 -> 확정된예약

-- 확정된예약
ALTER TABLE RDV
	DROP PRIMARY KEY; -- 확정된예약 기본키

-- 확정된예약
DROP TABLE IF EXISTS RDV RESTRICT;
select * from RDV;
desc RDV;


drop table P_RESERVATION;
DESC P_RESERVATION;
select * from P_RESERVATION;
SELECT * FROM D_RESERVATION;
insert into RDV VALUES (NULL, 1, 1, '2019-09-06', 700, 1000, '출근', '서울시 마포구 합정동', '서울시 종로구 종로2가', 5000, 10);
insert into RDV VALUES (NULL, 3, 3, '2019-09-06', 715, 1000, '출근', '서울시 마포구 합정동', '서울시 종로구 종로2가', 5000, 10);
insert into RDV VALUES (NULL, 4, 4, '2019-09-06', 1800, 1900, '퇴근', '서울시 종로구 종로2가', '서울시 마포구 합정동', 6000, 15);
DELETE FROM RDV WHERE R_IDX=2;
SELECT * FROM RDV;
DESC RDV;

-- 확정된예약
CREATE TABLE RDV (
	r_idx        INT(10)      NOT NULL, -- 확정예약번호
	dr_idx       INT(10)      NULL,     -- 운전자 예약번호
	pr_idx       INT(10)      NULL,     -- 탑승자 예약번호
	r_date       DATE         NULL,     -- 날짜
	rs_time      INT(10)      NULL,     -- 출발시간
	re_time      INT(10)      NULL,     -- 도착시간
	r_commute    VARCHAR(4)   NULL,     -- 출퇴근
	r_startpoint VARCHAR(255) NULL,     -- 출발지
	r_endpoint   VARCHAR(255) NULL,     -- 도착지
	r_fee        INT(10)      NULL,     -- 확정요금
	r_distance   INT(20)      NULL      -- 총 운행거리
);

-- 확정된예약
ALTER TABLE RDV
	ADD CONSTRAINT PK_RDV -- 확정된예약 기본키
		PRIMARY KEY (
			r_idx -- 확정예약번호
		);

-- 확정된예약
ALTER TABLE RDV
	ADD CONSTRAINT FK_D_RESERVATION_TO_RDV -- 운전자예약리스트 -> 확정된예약
		FOREIGN KEY (
			dr_idx -- 운전자 예약번호
		)
		REFERENCES D_RESERVATION ( -- 운전자예약리스트
			dr_idx -- 운전자 예약번호
		);

-- 확정된예약
ALTER TABLE RDV
	ADD CONSTRAINT FK_P_RESERVATION_TO_RDV -- 탑승자예약리스트 -> 확정된예약
		FOREIGN KEY (
			pr_idx -- 탑승자 예약번호
		)
		REFERENCES P_RESERVATION ( -- 탑승자예약리스트
			pr_idx -- 탑승자 예약번호
		);
        
        
        
-- ---------------------------------------------------P_RESERVATION --------------------------------------------------------
-- 탑승자예약리스트
ALTER TABLE P_RESERVATION
	DROP FOREIGN KEY FK_PASSENGER_TO_P_RESERVATION; -- 탑승자 -> 탑승자예약리스트

-- 탑승자예약리스트
ALTER TABLE P_RESERVATION
	DROP PRIMARY KEY; -- 탑승자예약리스트 기본키

-- 탑승자예약리스트
DROP TABLE IF EXISTS P_RESERVATION RESTRICT;

-- 탑승자예약리스트
CREATE TABLE P_RESERVATION (
	pr_idx       INT(10)      NOT NULL, -- 탑승자 예약번호
	p_idx        INT(10)      NOT NULL, -- 회원번호
	p_date       DATE         NULL,     -- 날짜
	p_time       INT(10)      NULL,     -- 출발시간
	p_commute    VARCHAR(4)   NULL,     -- 출퇴근
	p_startpoint VARCHAR(255) NULL,     -- 출발지
	p_endpoint   VARCHAR(255) NULL,     -- 도착지
	p_fee        INT(10)      NULL,     -- 예상요금
	p_distance   INT(20)      NULL,     -- 예상 운행거리
	p_confirm    VARCHAR(1)   NULL      -- 예약확정여부
);

-- 탑승자예약리스트
ALTER TABLE P_RESERVATION
	ADD CONSTRAINT PK_P_RESERVATION -- 탑승자예약리스트 기본키
		PRIMARY KEY (
			pr_idx -- 탑승자 예약번호
		);

-- 탑승자예약리스트
ALTER TABLE P_RESERVATION
	ADD CONSTRAINT FK_PASSENGER_TO_P_RESERVATION -- 탑승자 -> 탑승자예약리스트
		FOREIGN KEY (
			p_idx -- 회원번호
		)
		REFERENCES PASSENGER ( -- 탑승자
			p_idx -- 회원번호
		);
        
SELECT * FROM P_RESERVATION;
DESC P_RESERVATION;
							
-- 2	4	2019-09-11	800	출근	경기도 고양시 일산동구 	서울시 강남구 삼성1동	12000	
-- 3	5	2019-09-06	2000	퇴근	서울시 종로구 종로2가	경기도 의정부시	7000	

INSERT INTO P_RESERVATION 
VALUES (NULL, 1, '2019-09-06', 700, '출근', '서울시 마포구 합정동', '서울시 종로구 종로2가', 5000, 10, 'N');

INSERT INTO P_RESERVATION 
VALUES (NULL, 4, '2019-09-06', 800, '출근', '서울시 마포구 합정동', '서울시 종로구 종로5가', 5000, 10, 'N');

INSERT INTO P_RESERVATION 
VALUES (NULL, 5, '2019-09-07', 730, '출근', '서울시 마포구 합정동', '서울시 종로구 종로3가', 5000, 10, 'N');

select * from P_RESERVATION;
