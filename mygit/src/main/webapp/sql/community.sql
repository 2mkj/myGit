CREATE TABLE community(
	BOARD_NUM 		NUMBER,			  --글 번호
	BOARD_NAME		VARCHAR2(30),	  --작성자
	BOARD_SUBJECT	VARCHAR2(300),	  --제목
	BOARD_CONTENT	VARCHAR2(4000),	  --내용
	BOARD_READCOUNT	NUMBER,			--글의 조회수 
	BOARD_DATE DATE default sysdate, --글의 작성 날짜
	PRIMARY KEY(BOARD_NUM)
);

CREATE TABLE comments(
	num 			number		 primary key,
	id				varchar2(30) references memberall(email),
	content			varchar2(200),
	reg_date		date,
	comment_num number references community(BOARD_NUM) on delete cascade
);

drop table community CASCADE CONSTRAINTS;

insert into community(BOARD_NUM, BOARD_SUBJECT, BOARD_NAME)values(12,'열둘','admin1');
select * from community

select *
from (select rownum rnum, j.*
	  from (
	  		select board_num, board_subject, nvl(cnt, 0) as cnt
			from community left outer join (select comment_num, count(*) cnt
				 						from comments 
				 						group by comment_num)
			on board_num = comment_num
	 		order by board_num desc ) j
	  where rownum <= 10 
	  )
where rnum>=1 and rnum<=10;

--닉네임 출력하려면..
select *
from (select rownum rnum, j.*
	  from (
	  		select b.* , m.user_name, nvl(cnt, 0) as cnt
			from community b left outer join (select comment_num, count(*) cnt
				 						from comments 
				 						group by comment_num) c
			                on b.board_num = c.comment_num
							left join memberall m
							on b.board_name = m.email
	 		order by board_num desc ) j
	  where rownum <= 10 
	  )
where rnum>=1 and rnum<=10;


select c.*, m.user_name from community c left join memberall m
on c.board_name = m.email

-- getmyListCount
select count(*) from community 
where board_name = ? 
and board_subject like ? 
or board_content like ? 

-- getmyList(Search)
select * 
from (select rownum rnum, j.*
	  from (select community.*,  nvl(cnt, 0) cnt 
	        from community left outer join (select comment_num, count(*) cnt 
				                            from comments 
											group by comment_num) 
			
			on board_num = comment_num 
			where board_name = 'admin2' 
			and (board_subject like '%ㅇ%' or board_content like '%ㅇ%')
			order by board_num desc ) j  
	  where rownum <= 10 
	  )
where rnum>=1 and rnum<=10;


update community set BOARD_SUBJECT='수정1', BOARD_CONTENT='수정2' where BOARD_NUM=12

update community  set BOARD_READCOUNT = BOARD_READCOUNT + 1  where BOARD_NUM = 1