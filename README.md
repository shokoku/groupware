## Spring Framework 인사관리 프로젝트

## 개발환경
- IntelliJ IDEA Community Edition
- Amazon corretto open jdk 11
- Mariadb 10.11
- mybatis
- JSP
- Tomcat 9

## 멤버 주요기능
- 회원가입
- 로그인
- 회원목록 출력
- 상세조회
- 수정
- 삭제
- 이메일 중복체크

## 게시판 주요기능
- 글작성
- 글목록
- 글조회
- 글삭제
- 글수정
- 페이징


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

-- 게시판 테이블<br>
drop table if exists board_table;<br>
create table board_table(<br>
id bigint primary key auto_increment,<br>
boardWriter varchar(50),<br>
boardPass varchar(20),<br>
boardTitle varchar(50),<br>
boardContents varchar(500),<br>
boardCreatedTime datetime default now(),<br>
boardHits int default 0,<br>
fileAttached int default 0<br>
);