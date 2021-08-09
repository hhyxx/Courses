
--1.检索参与小型监控系统的员工信息，并将薪资按照从高到低排序
select * from staff join sp on staff.sno=sp.sno join project on sp.pno=project.pno
where sp.pno in (
  select pno
  from project 
  where pname='小型监控系统'
)
order by salary asc;

--2.显示出已选项目的员工信息

select * from staff
where staff.sno in(
      select distinct sno 
      from sp
);

--3.查询员工编号为4的员工姓名，薪资，所选项目
select staff.sno,sname,salary,pname
from staff join sp on staff.sno=sp.sno join project on sp.pno=project.pno
where staff.sno=4;

--4.查询员工最高工资和最低工资的差距（DIFFERENCE）
select max(salary)-min(salary) as  DIFFERENCE 
from staff ;

--5.查询公司中员工总数量，出生在1978年，1980年，1982年和1987年的员工数量。结果类似下面的格式

select count(*) 员工数量,
sum(decode(to_char(sbitthday,'yyyy'),1978,1,0))"1978",
sum(decode(to_char(sbitthday,'yyyy'),1980,1,0))"1980",
sum(decode(to_char(sbitthday,'yyyy'),1982,1,0))"1982",
sum(decode(to_char(sbitthday,'yyyy'),1987,1,0))"1987"
from staff;

--6.列出薪金比张三高的员工信息

select * from staff
where salary > (
      select salary from staff 
      where sname='张三'
);
       
--7.列出出生在80年代的员工信息
select * from staff where to_char(sbitthday,'yyyy') between 1980 and 1989

--8.列出所有员工的年工资，按照年薪从低到高排列

select salary * 12 年薪 from staff
order by salary

--9.列出每个项目的持续月数
select months_between(edate,sdate) 持续月数 from project

--10.列出没有员工负责的项目信息

select * from project 
where pno not in (
      select pno 
      from sp
);