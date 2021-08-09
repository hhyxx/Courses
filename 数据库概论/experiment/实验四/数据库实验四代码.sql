create table Student(
	sno varchar(50),
	sname varchar(50),
	ssex varchar(50),
	sage int constraint c1 check(sage >= 10 and sage <= 50),
	sdept varchar(50),
	primary key(sno)
);

create table Course(
	cno varchar(50) primary key,
	cname varchar(50) unique,
	credit int
);

create table sc(
	sno varchar(50),
	cno varchar(50),
	grade int,
	newgrade varchar(1),
	primary key (sno,cno),
	foreign key (sno) references Student(sno),
	foreign key (cno) references Course(cno)
);

insert into Student values('201811050392','侯宇轩','男',20,'软件工程');
insert into Student values('1','张三','男',20,'网络工程');
insert into Student values('2','李四','男',20,'通信工程');
insert into Student values('3','王二麻子','女',21,'计算机科学与技术');

insert into Course values('1','数据库概论',4);
insert into Course values('2','数据结构',4);
insert into Course values('3','高等数学',4);
insert into Course values('4','概率论与数理统计',4);

insert into sc values('201811050392','1',95,null);
insert into sc values('1','2',82,null);
insert into sc values('2','3',75,null);
insert into sc values('3','4',65,null);
insert into sc values('3','2',55,null);
insert into sc values('201811050392','2',97,null);


create procedure change as
begin 
	declare @exgrade varchar(1), @dsno varchar(50), @dcno varchar(50), @dgrade int
	declare ex cursor for
	select sno,cno,grade
	from sc
	open ex
	fetch ex
	into @dsno, @dcno, @dgrade
	while (@@fetch_status=0)
	begin
		if @dgrade >= 90 set @exgrade='A'
		else if @dgrade>=80 set @exgrade='B'
		else if @dgrade>=70 set @exgrade='C'
		else if @dgrade>=60 set @exgrade='D'
		else set @exgrade='E'
		update sc
		set newgrade=@exgrade
		where sno=@dsno AND cno=@dcno
		fetch ex into @dsno, @dcno, @dgrade
	end
	close ex 
	deallocate ex
end
execute change

