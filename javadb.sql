-- member 테이블 생성
-- id(숫자, 8) pk
-- name(가변문자열, 20) not null
-- addr(가변문자열, 50) not null
-- email(가변문자열, 30) not null
-- age number(3)
create table member(
    id number(8) primary key,
    name VARCHAR2(20) not null,
    addr VARCHAR2(50) not null,
    email VARCHAR2(30) not null,
    age number(3)
    );
    
select * from member;

create sequence member_seq;

commit;
