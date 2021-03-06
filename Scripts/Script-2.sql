-- clnt_code, clnt_name, clnt_addr, clnt_tel, clnt_isExist
CREATE TABLE client (
	clnt_code    VARCHAR(6)  NOT NULL, 
	clnt_name    VARCHAR(20) NOT NULL,
	clnt_addr    VARCHAR(50) NULL,
	clnt_tel     VARCHAR(15) NULL,
	clnt_isExist BOOLEAN     NOT NULL,
	PRIMARY KEY (clnt_code)
);

-- 공급회사
-- comp_code, comp_name, comp_addr, comp_tel, comp_isExist
CREATE TABLE supply_company (
	comp_code    VARCHAR(6)  NOT NULL,
	comp_name    VARCHAR(20) NOT NULL,
	comp_addr    VARCHAR(50) NULL,
	comp_tel     VARCHAR(15) NULL,
	comp_isExist BOOLEAN     NOT NULL,
	PRIMARY KEY (comp_code)
);

-- 분류
-- group_code, group_name
CREATE TABLE category (
	group_code VARCHAR(2)  NOT NULL,   
	group_name VARCHAR(20) NOT NULL,
	PRIMARY KEY (group_code)
);

-- 소프트웨어
-- sw_code, group_code, sw_name, sale_price, sw_inven, sw_img, sw_issale  
CREATE TABLE software (
	sw_code    VARCHAR(6)   NOT NULL,
	group_code VARCHAR(6)   NOT NULL,
	sw_name    VARCHAR(50)  NOT NULL,
	sale_price INTEGER      NOT NULL,
	sw_inven   INTEGER      NOT NULL,
	sw_img	   VARCHAR(100) NOT NULL,
	sw_issale  BOOLEAN      NOT NULL,
	PRIMARY KEY (sw_code),
	FOREIGN KEY (group_code) 
		REFERENCES category(group_code)
		ON UPDATE CASCADE
);

-- 납품
-- del_code, comp_code, sw_code, supply_price, supply_amount, order_date, del_isExist
CREATE TABLE delivery (
	del_code 	  VARCHAR(6) NOT NULL,
	comp_code 	  VARCHAR(6) NOT NULL,
	sw_code   	  VARCHAR(6) NOT NULL,
	supply_price  INTEGER  	 NOT NULL,
	supply_amount INTEGER	 NOT NULL,
	order_date 	  DATE       NOT NULL, 
	del_isExist   BOOLEAN	 NOT NULL,
	PRIMARY KEY (del_code),
	FOREIGN KEY (comp_code) 
		REFERENCES supply_company (comp_code)
		ON UPDATE CASCADE,
	FOREIGN KEY (sw_code)   
		REFERENCES software (sw_code)
		ON UPDATE CASCADE
);

-- 거래내역
-- sale_code, clnt_code, sw_code, sale_amount, isdeposit, order_date, supply_price, sale_price, sale_delete
CREATE TABLE sale (
	sale_code    VARCHAR(6) NOT NULL,
	clnt_code    VARCHAR(6) NOT NULL,
	sw_code      VARCHAR(6) NOT NULL,
	sale_amount  INTEGER    NOT NULL,
	isdeposit    BOOLEAN    NOT NULL,
	order_date   DATE       NOT NULL,
	supply_price INTEGER    NOT NULL,
	sale_price   INTEGER    NOT NULL, 
	sale_isExist BOOLEAN    NOT NULL,
	PRIMARY KEY (sale_code),
	FOREIGN KEY (clnt_code) 
		REFERENCES client (clnt_code)
		ON UPDATE CASCADE,
	FOREIGN KEY (sw_code) 
		REFERENCES software (sw_code)
		ON UPDATE CASCADE
);



-- 거래회사 샘플데이터 입력
INSERT INTO client(clnt_code, clnt_name, clnt_addr, clnt_tel, clnt_isExist) VALUES
	("CL001", "재밌는 게임방",	   "서울시 동대문구 연희동",  "02-111-1111", TRUE),
	("CL002", "좋은 게임방",       "서울시 관악구 봉천동",    "02-222-2222", TRUE),
	("CL003", "친구 게임방",	   "천안시 동남구 신부동",    "041-333-3333",TRUE),
	("CL004", "충청남도 교육청",   "대전광역시 중구 과례2길", "042-444-4444",TRUE),
	("CL005", "대전광역시 교육청", "대전광역시 서구 향촌길",  "042-555-5555",TRUE),
	("CL006", "아산시스템",		   "충청남도 아산시 배방면",  "041-777-7777",TRUE);

-- 공급회사 샘플데이터 입력
INSERT INTO supply_company(comp_code, comp_name, comp_addr, comp_tel, comp_isExist) VALUES
	("SC001", "알럽소프트",   "경기도 부천시 계산동",            "02-930-4551", TRUE),
	("SC002", "인디넷",       "경기도 수원시 제포동",            "032-579-4512",FALSE),
	("SC003", "참빛소프트",   "경기도 파주군 은빛아파트",        "032-501-4503",TRUE),
	("SC004", "소프트마켓",   "서울특별시 관진구 자양동",        "02-802-4564", TRUE),
	("SC005", "크라이스",     "경기도 고양시 대자동 서영아파트", "032-659-3215",FALSE),
	("SC006", "프로그램캠프", "경기도 부천시 오정구",            "032-659-3215",TRUE);

-- 분류 입력
INSERT INTO category(group_code, group_name) VALUES
	("GM", "게임"),
	("OF", "사무"),
	("GR", "그래픽"),
	("ED", "교육");
	
-- 소프트웨어 샘플데이터 입력
INSERT INTO software(sw_code,group_code,sw_name,sale_price,sw_inven, sw_img, sw_issale) VALUES
	("SW001","GM", "바람의제국",40000,   2000, "DGIT_Logo.png", TRUE),
	("SW002","OF", "국제무역", 	48000,   500,  "DGIT_Logo.png", FALSE),
	("SW003","GM", "FIFA2015",	40500, 	 1000, "DGIT_Logo.png", TRUE),
	("SW004","GM", "삼국지",	48000, 	 400,  "DGIT_Logo.png", TRUE),
	("SW005","GM", "아마겟돈",	50750, 	 1000, "DGIT_Logo.png", TRUE),
	("SW006","OF", "한컴오피스",1918000, 2000, "DGIT_Logo.png", TRUE),
	("SW007","GR", "포토샵",	1519000, 400,  "DGIT_Logo.png", TRUE),
	("SW008","ED", "오토캐드",	978000,	 2,	   "DGIT_Logo.png", TRUE),
	("SW009","GM", "인디자인", 	218040,	 4000, "DGIT_Logo.png", TRUE),
	("SW010","OF", "windows10",	333450,	 40000,"DGIT_Logo.png", TRUE);
 
-- 납품현황입력
INSERT INTO delivery(del_code, comp_code, sw_code, supply_price, supply_amount, order_date, del_isExist) VALUES
	("DL001", "SC001", "SW001", 20000, 100, now(), TRUE),
	("DL002", "SC002", "SW002", 30000, 200, now(), TRUE),
	("DL003", "SC003", "SW003", 30000, 100, now(), TRUE),
	("DL004", "SC004", "SW004", 17000, 150, now(), FALSE),
	("DL005", "SC005", "SW005", 25000, 200, now(), TRUE),
	("DL006", "SC006", "SW006", 2000,  100, now(), TRUE),
	("DL007", "SC001", "SW007", 5000,  200, now(), TRUE),
	("DL008", "SC002", "SW008", 30000, 100, now(), TRUE),
	("DL009", "SC003", "SW009", 17000, 150, now(), TRUE),
	("DL010", "SC004", "SW010", 25000, 200, now(), FALSE),
	("DL011", "SC005", "SW001", 25000, 200, now(), TRUE),
	("DL012", "SC006", "SW001", 25000, 200, now(), TRUE);

-- 거래내역 샘플데이터 입력
INSERT INTO sale(sale_code, clnt_code, sw_code, sale_amount, 
				isdeposit, order_date, supply_price, sale_price, sale_isExist) VALUES  
	("SL001","CL001","SW001",25, TRUE, "2017-12-13", 25000  , 40000,   TRUE),
	("SL002","CL002","SW002",25, TRUE, "2017-09-13", 30000  , 48000,   TRUE),
	("SL003","CL003","SW003",20, TRUE, "2017-09-11", 27000  , 40500,   TRUE),
	("SL004","CL004","SW004",25, TRUE, "2017-10-02", 32000  , 48000,   TRUE),
	("SL005","CL005","SW005",50, TRUE, "2017-10-02", 35000  , 50750,   TRUE),
	("SL006","CL006","SW006",20, TRUE, "2017-10-02", 1370000, 1918000, TRUE),
	("SL007","CL001","SW007",20, TRUE, "2016-10-04", 25000  , 40000,   TRUE),
	("SL008","CL002","SW008",20, TRUE, "2016-10-04", 30000  , 48000,   TRUE),
	("SL009","CL003","SW009",20, TRUE, "2016-10-04", 32000  , 48000,   TRUE),
	("SL010","CL004","SW010",20, TRUE, "2016-10-04", 980000 , 1519000, TRUE),
	("SL011","CL005","SW001",100,TRUE, "2016-10-04", 25000  , 40000,   TRUE),
	("SL012","CL006","SW006",20, TRUE, "2016-10-02", 1370000, 1918000, TRUE),
	("SL013","CL001","SW007",20, TRUE, "2015-10-04", 25000  , 40000,   TRUE),
	("SL014","CL002","SW008",20, TRUE, "2015-10-04", 30000  , 48000,   TRUE),
	("SL015","CL003","SW009",20, TRUE, "2015-10-04", 32000  , 48000,   TRUE),
	("SL016","CL004","SW010",20, TRUE, "2015-10-04", 980000 , 1519000, TRUE),
	("SL017","CL005","SW001",100,TRUE, "2015-10-04", 25000  , 40000,   TRUE),
	("SL018","CL006","SW006",20, TRUE, "2015-10-02", 1370000, 1918000, TRUE);

	SELECT curdate();
	SELECT * FROM sale WHERE year(order_date) = YEAR(curdate());
	SELECT * FROM sale s 
			JOIN software sw ON s.sw_code = sw.sw_code 
			JOIN view_sale_detail sd ON s.sale_code = sd.sale_code 
			JOIN client cl ON cl.clnt_code = s.clnt_code 
			JOIN category cat ON sw.group_code = cat.group_code 
			WHERE YEAR(s.order_date) = "2017";
DELETE FROM sale;
DELETE FROM delivery;
DELETE FROM client;
DELETE FROM software;
DELETE FROM supply_company;
DELETE FROM category;

SELECT * FROM client;
SELECT * FROM sale;
SELECT * FROM delivery;
SELECT * FROM software;
SELECT * FROM supply_company;
SELECT * FROM category;
select * from members;
drop table members;

	select order_date, sale_code, clnt_code,clnt_name, sw_code, sw_name,sale_price, sale_amount, isdeposit, total_sale_price from view_sale_by_orderdate;
	
	select * from view_sale_by_orderdate;
		//기간별판매현황조회
			CREATE VIEW view_sale_by_orderdate AS 
			
			SELECT s.order_date, s.sale_code, cl.clnt_code, cl.clnt_name, sw.sw_code, sw.sw_name,sw.sale_price, s.sale_amount, s.isdeposit,vd.total_sale_price,s.sale_isExist
			 FROM sale s JOIN client cl ON s.clnt_code = cl.clnt_code   
		     JOIN view_sale_detail vd on s.sale_code= vd.sale_code
			 JOIN software sw ON s.sw_code = sw.sw_code; 		

			 
CREATE TABLE members(
   mem_id         VARCHAR(20) NOT NULL,
   mem_name      VARCHAR(20) NOT NULL,
   mem_password   VARCHAR(200) NOT NULL,
   mem_mail      VARCHAR(50) NOT NULL,
   mem_permission VARCHAR(10) NOT NULL,
   mem_isExist    BOOLEAN     NOT NULL,
   PRIMARY KEY (mem_id)
);

SELECT * FROM software sw
			left outer JOIN category cat ON sw.group_code = cat.group_code
			left outer JOIN sale s ON sw.sw_code = s.sw_code
			left outer JOIN client cl ON cl.clnt_code = s.clnt_code
			left outer join view_sale_detail vd on s.sale_code= vd.sale_code
             group by s.sale_code;

select * from sale;
SELECT * FROM software sw
			left outer JOIN category cat ON sw.group_code = cat.group_code
			left outer JOIN sale s ON sw.sw_code = s.sw_code
			left outer JOIN client cl ON cl.clnt_code = s.clnt_code
			left outer join view_sale_detail vd on s.sale_code= vd.sale_code
              	group by sw.sw_code;
    			order by s.sale_code;

INSERT INTO members(mem_id, mem_name, mem_password, mem_mail, mem_permission, mem_isExist)  VALUES('admin','admin',password('1234'),'dididas@naver.com', 'manager', TRUE);