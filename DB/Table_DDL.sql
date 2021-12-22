create database project1;
use project1;

create table user(
	usernum int auto_increment,
    id varchar(12) not null,
    nickname varchar(12) not null,
    pw varchar(12) not null,
    username varchar(4) not null,
    birth varchar(6) not null,
    email varchar(20) not null,
    interest int null,
    userdate datetime not null default now(),
	
    constraint user_usernum_pk primary key(usernum) ,
	constraint user_id_uk unique(id),
    constraint user_nickname_uk unique(nickname)
);

-- https://jihunworld.tistory.com/46
create table learn(
	learn_num int,
    learn_title varchar(500) not null,
    learn_teacher varchar(200) not null,
    image_link varchar(2000) not null,
    learn_link varchar(2000) not null,
    sale_price int not null,
    price int not null,
    
    constraint learn_learn_num_pk primary key(learn_num)
);
create table notice(
	notice_num int auto_increment,
    notice_title varchar(20) not null,
    notice_article varchar(500) not null,
    notice_date datetime not null default now(),
    notice_watch int default 0,
    
    constraint notice_notice_num_pk primary key(notice_num)
);


create table free(
	free_num int auto_increment,
	usernum int,
    free_title varchar(20) not null,
    free_article varchar(500) not null,
    free_date datetime not null default now(),
    free_watch int default 0,
    
    constraint free_free_num_pk primary key(free_num),
	constraint free_usernum_fk foreign key (usernum) references user(usernum) on delete cascade
);

create table review(
	review_num int auto_increment,
	usernum int,
    learn_num int,
    review_article varchar(500) not null,
    review_date datetime not null default now(),
    review_watch int default 0,
    
    constraint review_review_num_pk primary key(review_num),
	constraint review_usernum_fk foreign key (usernum) references user(usernum) on delete cascade,
    constraint review_learn_num_fk foreign key (learn_num) references learn(learn_num) on delete cascade
);


drop table
drop table review;
drop table learn;

