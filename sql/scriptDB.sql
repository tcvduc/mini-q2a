drop database if exists `mini_social_network`;
create database mini_social_network;
use mini_social_network;

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- -----------------------
-- Table structure for users
-- -----------------------
drop table if exists `users`;
create table `users`(
	user_id nvarchar(200) primary key  ,
    email nvarchar(200),
    user_name nvarchar(200),
    user_pass nvarchar(200),
    user_type nvarchar(200),
    user_rank nvarchar(200),
    toggle_send_notify_status bool
	
)ENGINE=InnoDB AUTO_INCREMENT=16050 DEFAULT CHARSET=utf8;


-- ----------------------
-- Record of users
-- ----------------------
BEGIN;
insert into `users`(user_id,email,user_name,user_pass,user_type,user_rank,toggle_send_notify_status)  values ("user_01",'duccao01@gmail.com','duccao','duc123','admin','100',true);
insert into `users`(user_id,email,user_name,user_pass,user_type,user_rank,toggle_send_notify_status)  values ("user_02",'duccao02@gmail.com','duccao2','duc123','admin','100',true);
insert into `users`(user_id,email,user_name,user_pass,user_type,user_rank,toggle_send_notify_status)  values ("user_03",'user03@gmail.com','user03','user03','user',null,true);
insert into `users`(user_id,email,user_name,user_pass,user_type,user_rank,toggle_send_notify_status)  values ("user_04",'user04@gmail.com','user04','user04','user',null,true);
insert into `users`(user_id,email,user_name,user_pass,user_type,user_rank,toggle_send_notify_status)  values ("user_05",'user05@gmail.com','user05','user05','user',null,true);
insert into `users`(user_id,email,user_name,user_pass,user_type,user_rank,toggle_send_notify_status)  values ("user_06",'admin@gmail.com','admin','admin','admin',null,true);
insert into `users`(user_id,email,user_name,user_pass,user_type,user_rank,toggle_send_notify_status)  values ("user_07",'anonymous@gmail.com','anonymous','anonymous','anonymous',null,true);
insert into `users`(user_id,email,user_name,user_pass,user_type,user_rank,toggle_send_notify_status)  values ("user_08",'user@gmail.com','user','user','user',null,true);
insert into `users`(user_id,email,user_name,user_pass,user_type,user_rank,toggle_send_notify_status)  values ("duccao",'caovanducs@gmail.com','duccao','duccao','user',null,true);
COMMIT;


-- -------------------------------------
-- Table structure for questionCategories 
-- -------------------------------------
drop table if exists `questionCategories`;
create table `questionCategories`(
	que_cate_id nvarchar(200) primary key ,
    que_cate_name nvarchar(200)
)ENGINE=InnoDB AUTO_INCREMENT=16050 DEFAULT CHARSET=utf8;

-- ------------------------------------
-- Record of questionCategories
-- ------------------------------------
BEGIN;
insert into `questionCategories`(que_cate_id,que_cate_name) values ("que_cate_01",'V???t l??');
insert into `questionCategories`(que_cate_id,que_cate_name) values ("que_cate_02",'To??n h???c');
insert into `questionCategories`(que_cate_id,que_cate_name) values ("que_cate_03",'L???ch s???');
COMMIT;





-- -------------------------------------
-- Table structure for questionQueue 
-- -------------------------------------
drop table if exists `questionQueue`;
create table `questionQueue`(
	que_id nvarchar(200) primary key ,
    que_content nvarchar(3000),
    que_title nvarchar(200),
    createdAt datetime,
    user_id nvarchar(200),
	que_cate_id nvarchar(200),
    is_accepted bool,
	constraint `fk_questionQueue_users` foreign key (`user_id`) 
    references `users`(`user_id`) on delete set null on update cascade,
    
    constraint `fk_questionQueue_questionCategories` foreign key (`que_cate_id`) 
    references `questionCategories`(`que_cate_id`) on delete set null on update cascade
    
)ENGINE=InnoDB AUTO_INCREMENT=16050 DEFAULT CHARSET=utf8;
ALTER TABLE `questionQueue`
ADD FULLTEXT(que_content);
ALTER TABLE `questionQueue`
ADD FULLTEXT(que_title);

-- ------------------------------------
-- Record of questionQueue
-- ------------------------------------
BEGIN;
insert into `questionQueue`(que_id,que_content,que_title,createdAt,user_id,que_cate_id,is_accepted) values ("que_01",'T???i sao ph???i h???c v???t l?? ?','Why Physic?',current_timestamp(),"user_01",'que_cate_01',true);
insert into `questionQueue`(que_id,que_content,que_title,createdAt,user_id,que_cate_id,is_accepted) values ("que_02",'H???c l?? kh?? qu?? m???i ng?????i, gi??p t??i v???i ?','Physic is hard ?',current_timestamp(),"user_01",'que_cate_01',true);
insert into `questionQueue`(que_id,que_content,que_title,createdAt,user_id,que_cate_id,is_accepted) values ("que_03",'To??n ?????i h???c nh?? th??? n??o ?','To??n ?????i h???c',current_timestamp(),"user_02",'que_cate_02',true); 


insert into `questionQueue`(que_id,que_content,que_title,createdAt,user_id,que_cate_id,is_accepted) values ("que_04",'To??n ?????i h???c nh?? th??? n??o ?','To??n ?????i h???c',current_timestamp(),"user_02",'que_cate_02',true); 

insert into `questionQueue`(que_id,que_content,que_title,createdAt,user_id,que_cate_id,is_accepted) values ("que_05",'C??u h???i 5 ?','To??n',current_timestamp(),"user_03",'que_cate_02',true); 
insert into `questionQueue`(que_id,que_content,que_title,createdAt,user_id,que_cate_id,is_accepted) values ("que_06",'C??u h???i 6?','To??n',current_timestamp(),"user_03",'que_cate_02',true); 
insert into `questionQueue`(que_id,que_content,que_title,createdAt,user_id,que_cate_id,is_accepted) values ("que_07",'C??u h???i 7 ?','To??n',current_timestamp(),"user_03",'que_cate_02',true); 

insert into `questionQueue`(que_id,que_content,que_title,createdAt,user_id,que_cate_id,is_accepted) values ("que_08",'C??u h???i 8 ?','L??',current_timestamp(),"user_03",'que_cate_01',true); 
insert into `questionQueue`(que_id,que_content,que_title,createdAt,user_id,que_cate_id,is_accepted) values ("que_09",'C??u h???i 9 ?','L??',current_timestamp(),"user_03",'que_cate_01',true); 
insert into `questionQueue`(que_id,que_content,que_title,createdAt,user_id,que_cate_id,is_accepted) values ("que_10",'C??u h???i 10 ?','L??',current_timestamp(),"user_03",'que_cate_01',true);

insert into `questionQueue`(que_id,que_content,que_title,createdAt,user_id,que_cate_id,is_accepted) values ("que_11",'C??u h???i 11 ?','S???',current_timestamp(),"user_02",'que_cate_03',true);  
insert into `questionQueue`(que_id,que_content,que_title,createdAt,user_id,que_cate_id,is_accepted) values ("que_12",'C??u h???i 12 ?','S???',current_timestamp(),"user_02",'que_cate_03',true);  
insert into `questionQueue`(que_id,que_content,que_title,createdAt,user_id,que_cate_id,is_accepted) values ("que_13",'C??u h???i 13 ?','S???',current_timestamp(),"user_02",'que_cate_03',true);  

insert into `questionQueue`(que_id,que_content,que_title,createdAt,user_id,que_cate_id,is_accepted) values ("que_14",'C??u h???i 14 c?? v???n ??????','C??u h???i n??y c?? v???n ?????',current_timestamp(),"user_02",'que_cate_03',false);  
insert into `questionQueue`(que_id,que_content,que_title,createdAt,user_id,que_cate_id,is_accepted) values ("que_15",'C??u h???i 15 c?? v???n ??????','C??u h???i n??y c?? v???n ?????',current_timestamp(),"user_02",'que_cate_03',false);  



insert into `questionQueue`(que_id,que_content,que_title,createdAt,user_id,que_cate_id,is_accepted) values ("que_16",'L?? 1 ?????i h???c nh?? th??? n??o ?','L?? 1 ?????i h???c',current_timestamp(),"duccao",'que_cate_01',true); 
insert into `questionQueue`(que_id,que_content,que_title,createdAt,user_id,que_cate_id,is_accepted) values ("que_17",'L?? 2 ?????i h???c nh?? th??? n??o ?','L?? 2 ?????i h???c',current_timestamp(),"duccao",'que_cate_01',true); 
insert into `questionQueue`(que_id,que_content,que_title,createdAt,user_id,que_cate_id,is_accepted) values ("que_18",'L?? 3 ?????i h???c nh?? th??? n??o ?','L?? 3 ?????i h???c',current_timestamp(),"duccao",'que_cate_01',true); 
insert into `questionQueue`(que_id,que_content,que_title,createdAt,user_id,que_cate_id,is_accepted) values ("que_19",'L?? ph??? th??ng nh?? th??? n??o ?','L?? ph??? th??ng',current_timestamp(),"duccao",'que_cate_01',true); 
insert into `questionQueue`(que_id,que_content,que_title,createdAt,user_id,que_cate_id,is_accepted) values ("que_20",'L?? c???p 2 nh?? th??? n??o ?','L?? c???p 2',current_timestamp(),"duccao",'que_cate_01',true); 
insert into `questionQueue`(que_id,que_content,que_title,createdAt,user_id,que_cate_id,is_accepted) values ("que_21",'L?? th???c s?? nh?? th??? n??o ?','L?? th???c s??',current_timestamp(),"duccao",'que_cate_01',true); 
insert into `questionQueue`(que_id,que_content,que_title,createdAt,user_id,que_cate_id,is_accepted) values ("que_22",'L?? ti???n s?? nh?? th??? n??o ?','L?? ti???n s??',current_timestamp(),"duccao",'que_cate_01',true); 
insert into `questionQueue`(que_id,que_content,que_title,createdAt,user_id,que_cate_id,is_accepted) values ("que_23",'L?? gi??o s?? nh?? th??? n??o ?','L?? gi??o s??',current_timestamp(),"duccao",'que_cate_01',true); 
insert into `questionQueue`(que_id,que_content,que_title,createdAt,user_id,que_cate_id,is_accepted) values ("que_24",'M??n ???ng d???ng ph??n t??n c?? kh?? kh??ng?','CSC','2021-02-11 11:11:11',"duccao",'que_cate_01',true); 
insert into `questionQueue`(que_id,que_content,que_title,createdAt,user_id,que_cate_id,is_accepted) values ("que_25",'M??n ???ng d???ng ph??n t??n c?? d??? kh??ng?','CSC','2021-03-11 11:11:11',"duccao",'que_cate_01',true); 




COMMIT;



-- -------------------------------------
-- Table structure for ratingsQuestion 
-- -------------------------------------
drop table if exists `ratingsQuestion`;
create table `ratingsQuestion`(
	rate_id nvarchar(200) primary key,
    rate_name nvarchar(200),
    que_id nvarchar(200) ,
    user_id nvarchar(200) ,
    CONSTRAINT `fk_ratingsQuestion_questionQueue` FOREIGN KEY (`que_id`) REFERENCES `questionQueue` (`que_id`) ON DELETE SET NULL ON UPDATE CASCADE,
	CONSTRAINT `fk_ratingsQuestion_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE SET NULL ON UPDATE CASCADE
)ENGINE=InnoDB AUTO_INCREMENT=16050 DEFAULT CHARSET=utf8;

-- ------------------------------------------------------
-- Record of ratingsQuestion
-- ------------------------------------------------------
begin;
insert into `ratingsQuestion`(rate_id,rate_name,que_id,user_id)  values ("rate_01",'like','que_01','user_03');
insert into `ratingsQuestion`(rate_id,rate_name,que_id,user_id)  values ("rate_02",'spam','que_03','user_03');
insert into `ratingsQuestion`(rate_id,rate_name,que_id,user_id)  values ("rate_03",'bad_content','que_02','user_03');
insert into `ratingsQuestion`(rate_id,rate_name,que_id,user_id)  values ("rate_04",'like','que_01','user_04');
insert into `ratingsQuestion`(rate_id,rate_name,que_id,user_id)  values ("rate_05",'like','que_01','user_05');
insert into `ratingsQuestion`(rate_id,rate_name,que_id,user_id)  values ("rate_06",'like','que_03','user_05');
insert into `ratingsQuestion`(rate_id,rate_name,que_id,user_id)  values ("rate_07",'like','que_02','user_05');
insert into `ratingsQuestion`(rate_id,rate_name,que_id,user_id)  values ("rate_08",'like','que_03','user_05');
insert into `ratingsQuestion`(rate_id,rate_name,que_id,user_id)  values ("rate_09",'like','que_02','user_05');
commit;









-- -------------------------------------
-- Table structure for labels 
-- -------------------------------------
drop table if exists `labels`;
create table `labels`(
	label_id nvarchar(200) primary key,
    label_name nvarchar(200) 
)ENGINE=InnoDB AUTO_INCREMENT=16050 DEFAULT CHARSET=utf8;

-- ------------------------------------------------------
-- Record of labels
-- ------------------------------------------------------
begin;
insert into `labels`(label_id,label_name)  values ("label_01",'hay');
insert into `labels`(label_id,label_name)  values ("label_02",'tuyetvoi');
insert into `labels`(label_id,label_name)  values ("label_03",'dangxem');
commit;

-- -------------------------------------
-- Table structure for quetionQueue_Label 
-- -------------------------------------
drop table if exists `quetionQueue_Labels`;
create table `quetionQueue_Labels`(
	que_id nvarchar(200) ,
    label_id nvarchar(200),
    primary key (que_id,label_id)
)ENGINE=InnoDB AUTO_INCREMENT=16050 DEFAULT CHARSET=utf8;

-- ------------------------------------------------------
-- Record of autoQuestionAccepted
-- ------------------------------------------------------
begin;
insert into `quetionQueue_Labels`(que_id,label_id)  values ("que_01",'label_01');
insert into `quetionQueue_Labels`(que_id,label_id)  values ("que_01",'label_02');
insert into `quetionQueue_Labels`(que_id,label_id)  values ("que_01",'label_03');
insert into `quetionQueue_Labels`(que_id,label_id)  values ("que_02",'label_02');
insert into `quetionQueue_Labels`(que_id,label_id)  values ("que_03",'label_03');
commit;



-- -------------------------------------
-- Table structure for answers 
-- -------------------------------------
drop table if exists `answers`;
create table `answers`(
	ans_id nvarchar(200) primary key,
    ans_content nvarchar(3000),
    ans_source_URL  nvarchar(3000),
    ans_images nvarchar(3000),
    createdAt datetime,
    que_id nvarchar(200),
    user_id nvarchar(200),
    is_accepted bool,
  CONSTRAINT `fk_answers_questionQueue` FOREIGN KEY (`que_id`) REFERENCES `questionQueue` (`que_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_answers_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE SET NULL ON UPDATE CASCADE
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- ------------------------------------------------------
-- Record of answers
-- ------------------------------------------------------
begin;
insert into `answers`(ans_id,ans_content,ans_source_URL,ans_images,createdAt,que_id,user_id,is_accepted)  values ("ans_01",'V?? n?? l?? n???n t???ng c???a th??? gi???i ch??ng ta! ',"https://www.merriam-webster.com/dictionary/physic#:~:text=1a%20%3A%20the%20art%20or,physic",null,current_timestamp(),"que_01","user_05",true);
insert into `answers`(ans_id,ans_content,ans_source_URL,ans_images,createdAt,que_id,user_id,is_accepted)  values ("ans_02",'V?? n?? l?? n???n t???ng c???a th??? gi???i ch??ng ta!',"https://www.merriam-webster.com/dictionary/physic#:~:text=1a%20%3A%20the%20art%20or,physic",null,current_timestamp(),"que_02","user_05",true);
insert into `answers`(ans_id,ans_content,ans_source_URL,ans_images,createdAt,que_id,user_id,is_accepted)  values ("ans_03",'V?? n?? l?? n???n t???ng c???a th??? gi???i ch??ng ta!',"https://www.merriam-webster.com/dictionary/physic#:~:text=1a%20%3A%20the%20art%20or,physic",null,current_timestamp(),"que_01","user_05",true);
insert into `answers`(ans_id,ans_content,ans_source_URL,ans_images,createdAt,que_id,user_id,is_accepted)  values ("ans_04",'C??u tr??? l???i n??y c?? v???n ????? !',"https://www.merriam-webster.com/dictionary/physic#:~:text=1a%20%3A%20the%20art%20or,physic",null,current_timestamp(),"que_02","user_05",false);
insert into `answers`(ans_id,ans_content,ans_source_URL,ans_images,createdAt,que_id,user_id,is_accepted)  values ("ans_05",'C??u tr??? l???i n??y c?? v???n ????? !',"https://www.merriam-webster.com/dictionary/physic#:~:text=1a%20%3A%20the%20art%20or,physic",null,current_timestamp(),"que_01","user_05",false);

insert into `answers`(ans_id,ans_content,ans_source_URL,ans_images,createdAt,que_id,user_id,is_accepted)  values ("ans_06",'V?? n?? l?? n???n t???ng c???a th??? gi???i ch??ng ta!',"https://www.merriam-webster.com/dictionary/physic#:~:text=1a%20%3A%20the%20art%20or,physic",null,current_timestamp(),"que_01","user_02",true);
insert into `answers`(ans_id,ans_content,ans_source_URL,ans_images,createdAt,que_id,user_id,is_accepted)  values ("ans_07",'V?? n?? l?? n???n t???ng c???a th??? gi???i ch??ng ta!',"https://www.merriam-webster.com/dictionary/physic#:~:text=1a%20%3A%20the%20art%20or,physic",null,current_timestamp(),"que_01","user_03",true);
insert into `answers`(ans_id,ans_content,ans_source_URL,ans_images,createdAt,que_id,user_id,is_accepted)  values ("ans_08",'V?? n?? l?? n???n t???ng c???a th??? gi???i ch??ng ta!',"https://www.merriam-webster.com/dictionary/physic#:~:text=1a%20%3A%20the%20art%20or,physic",null,current_timestamp(),"que_01","user_04",true);



insert into `answers`(ans_id,ans_content,ans_source_URL,ans_images,createdAt,que_id,user_id,is_accepted)  values ("ans_09",'L?? d??? m??!',"https://www.merriam-webster.com/dictionary/physic#:~:text=1a%20%3A%20the%20art%20or,physic",null,current_timestamp(),"que_02","user_02",true);
insert into `answers`(ans_id,ans_content,ans_source_URL,ans_images,createdAt,que_id,user_id,is_accepted)  values ("ans_10",'L?? d??? m??!',"https://www.merriam-webster.com/dictionary/physic#:~:text=1a%20%3A%20the%20art%20or,physic",null,current_timestamp(),"que_02","user_03",true);
insert into `answers`(ans_id,ans_content,ans_source_URL,ans_images,createdAt,que_id,user_id,is_accepted)  values ("ans_11",'Do b???n l?????i ?????y!',"https://www.merriam-webster.com/dictionary/physic#:~:text=1a%20%3A%20the%20art%20or,physic",null,current_timestamp(),"que_02","user_04",true);

insert into `answers`(ans_id,ans_content,ans_source_URL,ans_images,createdAt,que_id,user_id,is_accepted)  values ("ans_12",'L?? d??? m??!',"https://www.merriam-webster.com/dictionary/physic#:~:text=1a%20%3A%20the%20art%20or,physic",null,current_timestamp(),"que_02","user_08",true);
insert into `answers`(ans_id,ans_content,ans_source_URL,ans_images,createdAt,que_id,user_id,is_accepted)  values ("ans_13",'Do b???n l?????i ?????y!',"https://www.merriam-webster.com/dictionary/physic#:~:text=1a%20%3A%20the%20art%20or,physic",null,current_timestamp(),"que_02","user_08",true);

insert into `answers`(ans_id,ans_content,ans_source_URL,ans_images,createdAt,que_id,user_id,is_accepted)  values ("ans_14",'???ng d???ng ph??n t??n kh??ng kh?? ????u!',"https://www.merriam-webster.com/dictionary/physic#:~:text=1a%20%3A%20the%20art%20or,physic",null,'2021-02-12 11:11:11',"que_24","user_08",true);
insert into `answers`(ans_id,ans_content,ans_source_URL,ans_images,createdAt,que_id,user_id,is_accepted)  values ("ans_15",'???ng d???ng ph??n t??n kh??ng kh?? ????u!',"https://www.merriam-webster.com/dictionary/physic#:~:text=1a%20%3A%20the%20art%20or,physic",null,'2021-03-12 11:11:11',"que_24","user_08",true);


commit;







-- -------------------------------------
-- Table structure for ratingsAnswer 
-- -------------------------------------
drop table if exists `ratingsAnswer`;
create table `ratingsAnswer`(
	rate_ans_id nvarchar(200) primary key ,
    rate_name nvarchar(200) ,
	ans_id nvarchar(200) ,
	user_id nvarchar(200) ,
	CONSTRAINT `fk_ratingsAnswer_answers` FOREIGN KEY (`ans_id`) REFERENCES `answers` (`ans_id`) ON DELETE SET NULL ON UPDATE CASCADE ,
	CONSTRAINT `fk_ratingsAnswer_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE SET NULL ON UPDATE CASCADE
)ENGINE=InnoDB AUTO_INCREMENT=16050 DEFAULT CHARSET=utf8;

-- ------------------------------------------------------
-- Record of ratingsAnswer
-- ------------------------------------------------------
begin;
insert into `ratingsAnswer`(rate_ans_id,rate_name,ans_id,user_id)  values ("rate_ans_01",'like','ans_01','user_01');
insert into `ratingsAnswer`(rate_ans_id,rate_name,ans_id,user_id)  values ("rate_ans_02",'like','ans_01','user_02');
insert into `ratingsAnswer`(rate_ans_id,rate_name,ans_id,user_id)  values ("rate_ans_03",'like','ans_01','user_03');
insert into `ratingsAnswer`(rate_ans_id,rate_name,ans_id,user_id)  values ("rate_ans_04",'like','ans_01','user_04');
commit;


-- -------------------------------------
-- Table structure for configureAPI 
-- -------------------------------------
drop table if exists `configureAPI`;
create table `configureAPI`(
	config_id int (10) not null auto_increment,
    table_name nvarchar(200),
      column_default nvarchar(200),
    column_name nvarchar(200),
    column_remain nvarchar(200),
       column_remain_default nvarchar(200),
    primary key (config_id)
)ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;

-- ------------------------------------------------------
-- Record of ratingsAnswer
-- ------------------------------------------------------
insert into `configureAPI` (table_name,column_default,column_remain,column_remain_default) values ('answers','ans_content,que_id,user_id','ans_source_URL,ans_images,is_accepted','ans_source_URL,ans_images,is_accepted');
insert into `configureAPI` (table_name,column_default,column_remain,column_remain_default) values ('users','user_name,user_pass,user_type','email,toggle_send_notify_status','email,toggle_send_notify_status');
insert into `configureAPI` (table_name,column_default,column_remain,column_remain_default) values ('questionqueue','que_content,user_id,que_cate_id','que_title,is_accepted','que_title,is_accepted');


