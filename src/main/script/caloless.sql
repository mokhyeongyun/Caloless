-- sql 최종 --
-- 1. 한행씩 순서대로 table , sequence삭제 --
drop table tb_exer_rec;
drop table tb_notice;
drop table tb_exer_info;
drop table tb_user;
drop SEQUENCE sequ_tb_notice_nnum;
drop SEQUENCE sequ_exer_info_einum;

-- 2. 유저 테이블 생성 --
create table tb_user(
  userid varchar2(20) constraint tb_user_userid_pk primary key,
  upw varchar2(20) constraint tb_user_upw_nn not null,
  uname varchar2(40) constraint tb_user_uname_nn not null,
  uage number(3),
  uemail varchar2(30) constraint tb_user_uemail_nn not null,
  ugender varchar2(1) constraint tb_user_ugende_nn not null,
  uheight number(4,1) constraint tb_user_uheigh_nn not null,
  uweight number(4,1) constraint tb_user_uweigh_nn not null,
  ugrade varchar2(10) constraint tb_user_ugrade_nn not null
);

-- 3. 운동정보 테이블 sequence 생성 --
CREATE SEQUENCE sequ_exer_info_einum
START WITH 1
INCREMENT BY 1;

-- 4. 운동정보 테이블 생성 --
create table tb_exer_info(
  einum number(6) constraint tb_exer_info_einum_pk primary key,
  eiinout varchar2(30) constraint tb_exer_info_eiinout_nn not null,
  eimet number(3,1) constraint tb_exer_info_eimet_nn not null,
  eiadv varchar2(500) constraint tb_exer_info_eiadv_nn not null,
  eiweak varchar2(500) constraint tb_exer_info_eiweak_nn not null,
  eipre varchar2(500),
  eidate date constraint tb_exer_info_eidate_nn not null,
  userid2 varchar2(20),
  eiupdate date,
  eikind varchar2(30) constraint tb_exer_info_eikind_nn not null,
  userid varchar2(20) constraint tb_exer_info_userid_fk REFERENCES tb_user(userid)
);

--  5. 운동기록지 테이블 생성 --
create table tb_exer_rec(
  erdate date constraint tb_exer_rec_erdate_pk primary key,
  userid varchar2(20) constraint tb_exer_rec_userid_fk REFERENCES tb_user(userid),
  einum number(6) constraint tb_exer_rec_einum_fk REFERENCES tb_exer_info(einum),
  ertime number(6) constraint tb_exer_rec_ertime_nn not null,
  eryear number(5) constraint tb_exer_rec_eryear_nn not null,
  ermonth number(5) constraint tb_exer_rec_ermonth_nn not null,
  erday number(5) constraint tb_exer_rec_erday_nn not null,
  erid varchar2(20),
  erupdate date
);

--  6. 공지사항 테이블 sequence 생성--
create sequence sequ_tb_notice_nnum
increment by 1
start with 1;

--  7. 공지사항 테이블  생성--
create table tb_notice(
  nnum number(3) constraint tb_notice_nnum_pk primary key,
  ntitle varchar2(100) constraint tb_notice_nname_nn not null,
  ncontent varchar2(1000) constraint tb_notice_ncontent_nn not null,
  userid varchar2(20) constraint tb_userid_fk REFERENCES tb_user(userid),
  ndate date constraint tb_notice_ndate_nn not null,
  userid2 varchar2(20) constraint tb_userid2_fk REFERENCES tb_user(userid),
  ndate2 date
);

-- 7-2. 공지사항 더미 생성 -- 
insert into tb_notice values(sequ_tb_notice_nnum.nextval,'첫 번째 공지사항','공지사항 테스트','admin',sysdate,null,null);
insert into tb_notice values(sequ_tb_notice_nnum.nextval,'두 번째 공지사항','공지사항 테스트','admin',sysdate,null,null);
insert into tb_notice values(sequ_tb_notice_nnum.nextval,'세 번째 공지사항','공지사항 테스트','admin',sysdate,null,null);
insert into tb_notice values(sequ_tb_notice_nnum.nextval,'네 번째 공지사항','공지사항 테스트','admin',sysdate,null,null);
insert into tb_notice values(sequ_tb_notice_nnum.nextval,'다섯 번째 공지사항','공지사항 테스트','admin',sysdate,null,null);
insert into tb_notice values(sequ_tb_notice_nnum.nextval,'여섯 번째 공지사항','공지사항 테스트','admin',sysdate,null,null);

--  8. 관리자 아이디 생성 -- 
insert into tb_user values('admin','admin1234!','관리자',20,'admin@naver.com','m',170,60,'admin');
--  8-2.test 아이디 생성
insert into tb_user values('test','test1234!','테스트',20,'test@naver.com','m',170,60,'user');

-- 9. 운동정보 등록 전체 드래그 ctrl+shift --
insert into tb_exer_info values(sequ_exer_info_einum.nextval,'실내운동',3.0,'청소년 성장촉진','무릎관절에 무리',null,sysdate,'admin',sysdate,'줄넘기-천천히','admin');
insert into tb_exer_info values(sequ_exer_info_einum.nextval,'실내운동',5.5,'청소년 성장촉진','무릎관절에 무리',null,sysdate,'admin',sysdate,'줄넘기-빠르게','admin');
insert into tb_exer_info values(sequ_exer_info_einum.nextval,'실내운동',3.0,'남녀노소 가능','장비가 고가',null,sysdate,'admin',sysdate,'골프','admin');
insert into tb_exer_info values(sequ_exer_info_einum.nextval,'실내운동',2.5,'유연성 향상','무리한 운동은 관절과 인대 손상',null,sysdate,'admin',sysdate,'요가','admin');
insert into tb_exer_info values(sequ_exer_info_einum.nextval,'실내운동',2.5,'유연성 향상','무리한 운동은 관절과 인대 손상',null,sysdate,null,null,'스트레칭','admin');
insert into tb_exer_info values(sequ_exer_info_einum.nextval,'실내운동',8.0,'유연성 향상','무리한 운동은 관절과 인대 손상',null,sysdate,'admin',sysdate,'푸쉬업,싯업-고강도','admin');
insert into tb_exer_info values(sequ_exer_info_einum.nextval,'실내운동',3.0,'체중조절에 큰효과','단순행동 반복으로 지겨움',null,sysdate,'admin',sysdate,'실내사이클-저강도','admin');
insert into tb_exer_info values(sequ_exer_info_einum.nextval,'실내운동',7.0,'체중조절에 큰효과','단순행동 반복으로 지겨움',null,sysdate,'admin',sysdate,'실내사이클-중강도','admin');
insert into tb_exer_info values(sequ_exer_info_einum.nextval,'실내운동',10.5,'체중조절에 큰효과','단순행동 반복으로 지겨움',null,sysdate,'admin',sysdate,'실내사이클-고강도','admin');
insert into tb_exer_info values(sequ_exer_info_einum.nextval,'실내운동',9.0,'균형잡힌 전신운동','기구가 희소함',null,sysdate,'admin',sysdate,'로잉머신','admin');
insert into tb_exer_info values(sequ_exer_info_einum.nextval,'실내운동',3.5,'균형잡힌 전신운동','기구가 희소함',null,sysdate,'admin',sysdate,'로잉머신-가볍게','admin');
insert into tb_exer_info values(sequ_exer_info_einum.nextval,'실내운동',7.0,'균형잡힌 전신운동','기구가 희소함',null,sysdate,'admin',sysdate,'로잉머신-보통','admin');
insert into tb_exer_info values(sequ_exer_info_einum.nextval,'실내운동',8.5,'균형잡힌 전신운동','기구가 희소함',null,sysdate,'admin',sysdate,'로잉머신-고강도','admin');
insert into tb_exer_info values(sequ_exer_info_einum.nextval,'실내운동',12.0,'균형잡힌 전신운동','기구가 희소함',null,sysdate,'admin',sysdate,'로잉머신-매우 고강도','admin');
insert into tb_exer_info values(sequ_exer_info_einum.nextval,'실내운동',7.0,'가정에서 접하기 쉬움','층간소음의 위험성',null,sysdate,null,null,'스탬퍼','admin');
insert into tb_exer_info values(sequ_exer_info_einum.nextval,'실내운동',4.0,'가정에서 접하기 쉬움','층간소음의 위험성',null,sysdate,'admin',sysdate,'훌라후프','admin');
insert into tb_exer_info values(sequ_exer_info_einum.nextval,'실내운동',6.0,'헬스장에서 접하기 쉬움','올바른 자세지도 필요',null,sysdate,'admin',sysdate,'덤벨,바벨 들기','admin');
insert into tb_exer_info values(sequ_exer_info_einum.nextval,'실내운동',5.0,'골다공증 예방','관절부상의 위험',null,sysdate,'admin',sysdate,'에어로빅-약하게','admin');
insert into tb_exer_info values(sequ_exer_info_einum.nextval,'실내운동',6.5,'골다공증 예방','관절부상의 위험',null,sysdate,'admin',sysdate,'에어로빅-보통','admin');
insert into tb_exer_info values(sequ_exer_info_einum.nextval,'실내운동',7.0,'골다공증 예방','관절부상의 위험',null,sysdate,'admin',sysdate,'에어로빅-강하게','admin');
insert into tb_exer_info values(sequ_exer_info_einum.nextval,'실내운동',4.5,'자세교정에 도움','돈과 시간이 많이듬',null,sysdate,'admin',sysdate,'볼룸댄스','admin');
insert into tb_exer_info values(sequ_exer_info_einum.nextval,'실내운동',4.5,'자세교정에 도움','돈과 시간이 많이듬',null,sysdate,'admin',sysdate,'훌라댄스','admin');
insert into tb_exer_info values(sequ_exer_info_einum.nextval,'실내운동',4.5,'자세교정에 도움','돈과 시간이 많이듬',null,sysdate,'admin',sysdate,'플라멩코댄스','admin');
insert into tb_exer_info values(sequ_exer_info_einum.nextval,'실내운동',4.8,'자세교정에 도움','돈과 시간이 많이듬',null,sysdate,'admin',sysdate,'발레댄스','admin');
insert into tb_exer_info values(sequ_exer_info_einum.nextval,'실내운동',4.8,'자세교정에 도움','돈과 시간이 많이듬',null,sysdate,'admin',sysdate,'재즈댄스','admin');
insert into tb_exer_info values(sequ_exer_info_einum.nextval,'실내운동',4.8,'자세교정에 도움','돈과 시간이 많이듬',null,sysdate,'admin',sysdate,'탭댄스','admin');
insert into tb_exer_info values(sequ_exer_info_einum.nextval,'실내운동',4.8,'자세교정에 도움','돈과 시간이 많이듬',null,sysdate,'admin',sysdate,'지루박댄스','admin');
insert into tb_exer_info values(sequ_exer_info_einum.nextval,'실내운동',4.8,'자세교정에 도움','돈과 시간이 많이듬',null,sysdate,'admin',sysdate,'트위스트댄스','admin');
insert into tb_exer_info values(sequ_exer_info_einum.nextval,'실내운동',6.0,'심폐기능 향상','어깨부상의 위험',null,sysdate,'admin',sysdate,'수영-자유롭게','admin');
insert into tb_exer_info values(sequ_exer_info_einum.nextval,'실내운동',7.0,'심폐기능 향상','어깨부상의 위험',null,sysdate,'admin',sysdate,'수영-자유형','admin');
insert into tb_exer_info values(sequ_exer_info_einum.nextval,'실내운동',7.0,'심폐기능 향상','어깨부상의 위험',null,sysdate,'admin',sysdate,'수영-배영','admin');
insert into tb_exer_info values(sequ_exer_info_einum.nextval,'실내운동',10.0,'심폐기능 향상','어깨부상의 위험',null,sysdate,'admin',sysdate,'수영-평영','admin');
insert into tb_exer_info values(sequ_exer_info_einum.nextval,'실내운동',11.0,'심폐기능 향상','어깨부상의 위험',null,sysdate,'admin',sysdate,'수영-접영','admin');
insert into tb_exer_info values(sequ_exer_info_einum.nextval,'실내운동',4.0,'심폐기능 향상','어깨부상의 위험',null,sysdate,'admin',sysdate,'수중 에어로빅','admin');
insert into tb_exer_info values(sequ_exer_info_einum.nextval,'실내운동',8.0,'심폐기능 향상','어깨부상의 위험',null,sysdate,'admin',sysdate,'수중 조깅','admin');
insert into tb_exer_info values(sequ_exer_info_einum.nextval,'실내운동',10.0,'칼로리 소모가 높음','염좌의 위험',null,sysdate,null,null,'킥복싱','admin');
insert into tb_exer_info values(sequ_exer_info_einum.nextval,'실내운동',6.0,'자세교정에 도움','장비착용으로 인한 답답함',null,sysdate,'admin',sysdate,'검도','admin');
insert into tb_exer_info values(sequ_exer_info_einum.nextval,'실내운동',6.0,'자세교정에 도움','장비착용으로 인한 답답함',null,sysdate,'admin',sysdate,'펜싱','admin');
insert into tb_exer_info values(sequ_exer_info_einum.nextval,'실내운동',9.0,'고강도 운동','부상의 위험성',null,sysdate,'admin',sysdate,'복싱','admin');
insert into tb_exer_info values(sequ_exer_info_einum.nextval,'실내운동',6.0,'고강도 운동','부상의 위험성',null,sysdate,'admin',sysdate,'복싱 펀치백 치기','admin');
insert into tb_exer_info values(sequ_exer_info_einum.nextval,'실내운동',6.0,'심신단련에 효과','혼자배우기 어려움',null,sysdate,'admin',sysdate,'태보','admin');
insert into tb_exer_info values(sequ_exer_info_einum.nextval,'실내운동',10.0,'접근성이 좋음','혼자배우기 어려움',null,sysdate,'admin',sysdate,'태권도','admin');
insert into tb_exer_info values(sequ_exer_info_einum.nextval,'실내운동',10.0,'심신단련에 효과','혼자배우기 어려움',null,sysdate,'admin',sysdate,'공수도','admin');
insert into tb_exer_info values(sequ_exer_info_einum.nextval,'실내운동',4.0,'심신단련에 효과','혼자배우기 어려움',null,sysdate,'admin',sysdate,'태극권','admin');
insert into tb_exer_info values(sequ_exer_info_einum.nextval,'실내운동',7.0,'민첩성 증가','생소한 운동',null,sysdate,'admin',sysdate,'라켓볼','admin');
insert into tb_exer_info values(sequ_exer_info_einum.nextval,'실내운동',3.0,'유연성 증가','고가의 장비',null,sysdate,'admin',sysdate,'볼링','admin');
insert into tb_exer_info values(sequ_exer_info_einum.nextval,'실내운동',12.0,'집중력,순발력 증가','손목부상의 위험',null,sysdate,'admin',sysdate,'스쿼시','admin');
insert into tb_exer_info values(sequ_exer_info_einum.nextval,'실내운동',12.0,'높은 운동량','접근성이 낮음',null,sysdate,'admin',sysdate,'핸드볼','admin');
insert into tb_exer_info values(sequ_exer_info_einum.nextval,'실내운동',4.0,'접근성이 높음','혼자 할 수 없음',null,sysdate,'admin',sysdate,'탁구','admin');
insert into tb_exer_info values(sequ_exer_info_einum.nextval,'실내운동',4.5,'남녀노소하기 좋은 운동','기구 비용 부담',null,sysdate,'admin',sysdate,'배드민턴','admin');
insert into tb_exer_info values(sequ_exer_info_einum.nextval,'실내운동',4.5,'근지구력 강화','염좌의 위험',null,sysdate,'admin',sysdate,'농구-슈팅게임','admin');
insert into tb_exer_info values(sequ_exer_info_einum.nextval,'실내운동',6.5,'근지구력 강화','염좌의 위험',null,sysdate,'admin',sysdate,'농구-장애인','admin');
insert into tb_exer_info values(sequ_exer_info_einum.nextval,'실내운동',8.0,'근지구력 강화','염좌의 위험',null,sysdate,'admin',sysdate,'농구-일반인','admin');

insert into tb_exer_info values(sequ_exer_info_einum.nextval,'실외운동',2.0,'스트레칭으로 인한 유연성 증가','상체운동 효과 적음',null,sysdate,null,null,'산책','admin');
insert into tb_exer_info values(sequ_exer_info_einum.nextval,'실외운동',3.0,'스트레칭으로 인한 유연성 증가','상체운동 효과 적음',null,sysdate,null,null,'걷기-보통','admin');
insert into tb_exer_info values(sequ_exer_info_einum.nextval,'실외운동',3.3,'스트레칭으로 인한 유연성 증가','상체운동 효과 적음',null,sysdate,null,null,'걷기-약간 빠르게','admin');
insert into tb_exer_info values(sequ_exer_info_einum.nextval,'실외운동',3.8,'스트레칭으로 인한 유연성 증가','상체운동 효과 적음',null,sysdate,null,null,'걷기-빠르게','admin');
insert into tb_exer_info values(sequ_exer_info_einum.nextval,'실외운동',5.0,'스트레칭으로 인한 유연성 증가','상체운동 효과 적음',null,sysdate,null,null,'걷기-매우 빠르게','admin');
insert into tb_exer_info values(sequ_exer_info_einum.nextval,'실외운동',8.0,'하체근력 강화','무릎관절에 무리',null,sysdate,null,null,'계단 오르내리기','admin');
insert into tb_exer_info values(sequ_exer_info_einum.nextval,'실외운동',7.0,'심폐지구력 향상','호흡기가 좋지 않으면 역효과',null,sysdate,null,null,'달리기-천천히','admin');
insert into tb_exer_info values(sequ_exer_info_einum.nextval,'실외운동',10.0,'심폐지구력 향상','호흡기가 좋지 않으면 역효과',null,sysdate,null,null,'달리기-보통','admin');
insert into tb_exer_info values(sequ_exer_info_einum.nextval,'실외운동',13.5,'심폐지구력 향상','호흡기가 좋지 않으면 역효과',null,sysdate,null,null,'달리기-빠르게','admin');
insert into tb_exer_info values(sequ_exer_info_einum.nextval,'실외운동',7.0,'심폐지구력 향상','무릎관절에 무리',null,sysdate,null,null,'등산-짐없음','admin');
insert into tb_exer_info values(sequ_exer_info_einum.nextval,'실외운동',8.0,'심폐지구력 향상','무릎관절에 무리',null,sysdate,null,null,'등산-짐있음','admin');
insert into tb_exer_info values(sequ_exer_info_einum.nextval,'실외운동',8.0,'심폐지구력 향상','무릎관절에 무리',null,sysdate,null,null,'등산-경사 높은 산','admin');
insert into tb_exer_info values(sequ_exer_info_einum.nextval,'실외운동',11.0,'심폐지구력 향상','무릎관절에 무리',null,sysdate,null,null,'등산-암벽등반','admin');
insert into tb_exer_info values(sequ_exer_info_einum.nextval,'실외운동',8.5,'성인병 예방효과','사고에 유의',null,sysdate,null,null,'자전거-산악','admin');
insert into tb_exer_info values(sequ_exer_info_einum.nextval,'실외운동',5.0,'성인병 예방효과','사고에 유의',null,sysdate,null,null,'자전거-외발자전거','admin');
insert into tb_exer_info values(sequ_exer_info_einum.nextval,'실외운동',6.0,'성인병 예방효과','사고에 유의',null,sysdate,null,null,'자전거-저강도','admin');
insert into tb_exer_info values(sequ_exer_info_einum.nextval,'실외운동',8.0,'성인병 예방효과','사고에 유의',null,sysdate,null,null,'자전거-중강도','admin');
insert into tb_exer_info values(sequ_exer_info_einum.nextval,'실외운동',10.0,'성인병 예방효과','사고에 유의',null,sysdate,null,null,'자전거-고강도','admin');
insert into tb_exer_info values(sequ_exer_info_einum.nextval,'실외운동',5.0,'재미를 느끼기 쉬움','계절과 날씨의 영향을 많이 받음',null,sysdate,null,null,'스키/보드-초급자','admin');
insert into tb_exer_info values(sequ_exer_info_einum.nextval,'실외운동',6.0,'재미를 느끼기 쉬움','계절과 날씨의 영향을 많이 받음',null,sysdate,null,null,'스키/보드-중급자','admin');
insert into tb_exer_info values(sequ_exer_info_einum.nextval,'실외운동',7.0,'재미를 느끼기 쉬움','계절과 날씨의 영향을 많이 받음',null,sysdate,null,null,'스키/보드-상급자','admin');
insert into tb_exer_info values(sequ_exer_info_einum.nextval,'실외운동',12.5,'관절의 노화 방지','순간적인 부상의 위험',null,sysdate,null,null,'인라인스케이트','admin');
insert into tb_exer_info values(sequ_exer_info_einum.nextval,'실외운동',7.0,'관절의 노화 방지','순간적인 부상의 위험',null,sysdate,null,null,'롤러스케이트','admin');
insert into tb_exer_info values(sequ_exer_info_einum.nextval,'실외운동',5.0,'관절의 노화 방지','순간적인 부상의 위험',null,sysdate,null,null,'스케이트보드','admin');
insert into tb_exer_info values(sequ_exer_info_einum.nextval,'실외운동',7.0,'접근성이 좋음','기술습득이 어려움',null,sysdate,null,null,'축구','admin');
insert into tb_exer_info values(sequ_exer_info_einum.nextval,'실외운동',8.0,'기초대사량 증가','발목부상의 위험',null,sysdate,null,null,'테니스-단식','admin');
insert into tb_exer_info values(sequ_exer_info_einum.nextval,'실외운동',5.0,'기초대사량 증가','발목부상의 위험',null,sysdate,null,null,'테니스-복식','admin');

-- 10. 커밋 --
commit;

