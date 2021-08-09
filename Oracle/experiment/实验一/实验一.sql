

create user houyuxuan identified by 123456;
grant create session to houyuxuan;
grant create table to houyuxuan;

select * from all_users;-----查看系统中的所有用户

create table s(
  sno number(10) primary key,
  sname varchar2(10) not null,
  ssex varchar2(3) default'男' check(ssex='男' or ssex='女'),
  sbitthday date,
  sddr varchar2(20),
  sal number(10)
);
        
create table p (
  pno number(10) primary key,
  pname varchar2(20),
  sdate date,
  edate date,
  buget number(10)
);

create table sp(
  sno number(10),
  pno number(10),
  primary key(sno,pno),
  foreign key(sno) references s(sno),
  foreign key(pno) references p(pno)
);
    
  
--（2） 使用语句插入以下信息  
insert into s values(1,'王晓明','女','03-1月-1980','山东青岛',8900);
insert into s values(2,'王涵','男','12-6月-1978','广东佛山',7600);
insert into s values(3,'李有才','男','23-5月-1978','上海',7800);
insert into s values(4,'张小小','女','07-9月-1982','山东济南',4500);
  
select * from s;
  
insert into p values(1001,'小型监控系统','06-8月-2009','01-1月-2010',100000);
insert into p values(1002,'办公网络安全','30-12月-2009','30-11月-2009',450000);
insert into p values(1003,'电子购物广场','30-11月-2009','31-12月-2009',12000);
  
select * from project;
  
insert into sp values(1,1001);
insert into sp values(1,1002);
insert into sp values(1,1003);
insert into sp values(2,1002);
insert into sp values(2,1003);
insert into sp values(3,1002);
insert into sp values(3,1001);
insert into sp values(4,1001);
  
select * from sp;
  
rename s to staff;
rename p to project;
  
alter table staff rename column sal to salary;
  

