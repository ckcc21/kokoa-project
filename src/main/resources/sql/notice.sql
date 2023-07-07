create table notice(N_Num number default 0,
N_Fix number default 1,
N_Sep number,
N_date date default sysdate,
N_Title varchar(100),
N_Content varchar(4000));

create sequence notice_seq;