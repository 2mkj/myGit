
drop table member cascade constraints purge;
--1. index.jsp에서 시작 합니다.
--2. 관리자 계정 admin, 비번 1234를 만듭니다.
--3. 사용자 계정을 3개 만듭니다.

create table member(
id	      varchar2(12),
password  varchar2(10),
name	  varchar2(15),
age	      number(2),
gender	  varchar2(3),
email	  varchar2(30),
memberfile	varchar2(50),
PRIMARY KEY(id)
);

--memberfile은 회원 정보 수정시 적용합니다.

select * from member;
delete from member;

select id, password from member where id='admin';
update member set name='사용자' where id='admin1'; 
insert into member values ('admin3','123','사용자',21,'남','admin3@gmail.com',null);
insert into member values ('admin','1234','관리자',21,'남','admin@gmail.com',null);




drop table memberall cascade constraints purge;


create table memberall(
	email		varchar2(30),
	domain		varchar2(50),
	pass 		varchar2(16),
	user_name 	varchar2(20),
	name		varchar2(15),
	jumin1		char(6),
	jumin2		char(7),
	gender		varchar2(10),
	phone		varchar2(30),
	post		char(5),
	address		varchar2(200),
	primary key(email)
);

select * from memberall

ALTER TABLE memberall ADD(memberfile varchar2(50));

insert into memberall values ('admin','gmail.com','123','사용자','김땡땡','990909','3012367',
						'남','010-123-456','12345','서울',null);
insert into memberall values ('admin1','gmail.com','123','사용자','김땡땡','990909','3012367',
						'남','010-123-456','12345','서울',null);
						
update memberall set pass='123' where email='admin1'