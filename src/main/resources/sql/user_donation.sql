create table User_Donation(UD_No number,
UD_Id varchar2(20),
UD_Title varchar2(100),
UD_DirectMoney number default 0,
UD_LikeMoney number default 0,
UD_ReplyMoney number default 0,
UD_ShareMoney number default 0,
UD_Date date default sysdate
);

create sequence user_donation_seq;