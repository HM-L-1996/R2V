-- user 테스트 데이터
insert into user values (null,'admin','ad_nickname','1234','관리자','211218','admin@admin.com',1,default);
insert into user values (null,'test','tes_nickname','12345','사용자1','211217','test@test.com',3,default);
insert into user values (null,'test1','hm_nickname','123','이현민','960101','test1@test1.com',1,default);
insert into user values (null,'test2','jy_nickname','124','정준영','920304','test2@test2.com',1,default);
insert into user values (null,'test3','bs_nickname','125','김범석','001205','test3@test3.com',1,default);
insert into user values (null,'test4','mk_nickname','126','박민규','960503','test4@test4.com',1,default);
insert into user values (null,'test5','ms_nickname','127','박명서','780402','test5@test5.com',1,default);
insert into user values (null,'test6','jw_nickname','128','한지웅','970304','test6@test6.com',1,default);
insert into user values (null,'test7','fu_nickname','129','홍길동','010507','test7@test7.com',1,default);
insert into user values (null,'test8','ck_nickname','120','김옥동','020607','test8@test8.com',0,default);

select * from user;

-- notice 테스트 데이터

insert into notice values (null,"공지사항 테스트1","공지사항 테스트 중~",default,0);
insert into notice values (null,"공지사항 테스트2","공지사항입니다.",default,0);
insert into notice values (null,"공지사항 테스트3","공지사항이에요.",default,0);
insert into notice values (null,"공지사항 테스트4","오늘은 수업없습니다.",default,0);
insert into notice values (null,"공지사항 테스트5","오늘은 오후 5시퇴근입니다.",default,0);
insert into notice values (null,"공지사항 테스트6","인센티브 명단입니다.",default,0);
insert into notice values (null,"공지사항 테스트7","진급누락 명단입니다.",default,0);
insert into notice values (null,"공지사항 테스트8","직장상사의 괴롭힘",default,0);
insert into notice values (null,"공지사항 테스트9","누구인가",default,0);
insert into notice values (null,"공지사항 테스트0","홍보활동 멤버",default,0);
insert into notice values (null,"공지사항 테스트11","불법로그인",default,0);

select * from notice;

-- free 테스트 데이터

insert into free values (null,2,"자유게시판 테스트1","자유게시판 테스트중",default,0);
insert into free values (null,1,"자유게시판 테스트2","자유게시판 테스트중2",default,0);
insert into free values (null,3,"자유게시판 테스트3","자유게시판 테스트중3",default,0);
insert into free values (null,4,"자유게시판 테스트4","자유게시판 테스트중4",default,0);
insert into free values (null,5,"자유게시판 테스트5","자유게시판 테스트중5",default,0);
insert into free values (null,6,"자유게시판 테스트6","자유게시판 테스트중6",default,0);
insert into free values (null,7,"자유게시판 테스트7","자유게시판 테스트중7",default,0);
insert into free values (null,8,"자유게시판 테스트8","자유게시판 테스트중8",default,0);
insert into free values (null,9,"자유게시판 테스트9","자유게시판 테스트중9",default,0);
insert into free values (null,10,"자유게시판 테스트0","자유게시판 테스트중0",default,0);
insert into free values (null,10,"자유게시판 테스트11","자유게시판 테스트중11",default,0);
insert into free values (null,10,"자유게시판 테스트12","자유게시판 테스트중12",default,0);

select * from free;

-- review 테스트 데이터
insert into review values (null,2,5,"리뷰 게시판 테스트중",default,0);
insert into review values (null,1,4,"리뷰 게시판 테스트중2",default,0);
insert into review values (null,3,3,"리뷰 게시판 테스트중3",default,0);
insert into review values (null,4,2,"리뷰 게시판 테스트중4",default,0);
insert into review values (null,5,1,"리뷰 게시판 테스트중5",default,0);
insert into review values (null,6,6,"리뷰 게시판 테스트중6",default,0);
insert into review values (null,7,7,"리뷰 게시판 테스트중7",default,0);
insert into review values (null,8,8,"리뷰 게시판 테스트중8",default,0);
insert into review values (null,9,9,"리뷰 게시판 테스트중9",default,0);
insert into review values (null,10,10,"리뷰 게시판 테스트중10",default,0);
insert into review values (null,2,11,"리뷰 게시판 테스트중11",default,0);
insert into review values (null,1,12,"리뷰 게시판 테스트중12",default,0);

select * from free;

select * from learn where learn_title like "%[%";



