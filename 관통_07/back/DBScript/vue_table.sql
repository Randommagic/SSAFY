create database if not exists ssafyws;

use ssafyws;

CREATE TABLE `vue_user` (
  `user_no` int NOT NULL AUTO_INCREMENT,
  `user_id` varchar(20) NOT NULL,
  `name` varchar(30) NOT NULL,
  `pwd` varchar(100) NOT NULL,
  `join_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_no`),
  UNIQUE KEY (`user_id`)
);


CREATE TABLE `vue_board` (
  `no` int NOT NULL AUTO_INCREMENT,
  `writer` varchar(20) NOT NULL,
  `title` varchar(100) NOT NULL,
  `content` varchar(2000) NOT NULL,
  `regtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`no`),
  CONSTRAINT `vue_board_to_user_fk` FOREIGN KEY (`writer`) REFERENCES `vue_user` (`user_id`)
); 


insert into vue_user(user_id, name, pwd) 
values('ssafy', '싸피', 'ssafy'),
      ('user', '유저', 'user');

insert into vue_board(writer, title, content) 
values('ssafy', 'Vue Axios 연동', 'Vue를 이용한 HTTP 통신'), 
      ('ssafy', 'Vue를 배워봅시다', 'Vue와 Spring을 연동하자~'),
      ('ssafy', '프론트엔드 프레임워크', 'Vue는 프론트엔드의 인기있는 프레임워크 입니다.');

commit;

select * from vue_board;