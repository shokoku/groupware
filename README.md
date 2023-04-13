## Spring Framework 인사관리 프로젝트

## 개발환경
- IntelliJ IDEA Community Edition
- Amazon corretto open jdk 11
- Mariadb 10.11
- mybatis
- JSP
- Tomcat 9

## DB sql

--데이터 베이스 생성<br>
create database groupware;

-- 회원 테이블<br>
drop table if exists member_table;<br>
create table member_table(<br>
id bigint primary key auto_increment,<br>
memberEmail varchar(20) unique,<br>
memberPassword varchar(20),<br>
memberName varchar(20),<br>
memberAge int,<br>
memberMobile varchar(30)<br>
); 