--1.将所有员工的祖籍信息前都加上‘中国’二字，比如‘山东青岛’改为‘中国山东青岛’
update staff set sddr = concat('中国',sddr);
select * from staff


--2.将参与了‘办公网络安全’项目的职工的工资都加上200元
update staff set salary =salary +20
where sno in (
      select sno from sp join project on sp.pno =project.pno
      where pname='办公网络安全'
);

select * from staff 
where sno in(
      select sno from sp join project on sp.pno=project.pno
      where pname='办公网络安全'
);


--3.只保留李有才一个人在小型监控系统项目中，其他参与该项目的人不再插手该项目
delete from sp
where pno=(select pno from project where pname ='小型监控系统')
and sno != (select sno from staff where sname='李有才');

select sname,pname
from staff join sp on staff.sno=sp.sno join project on sp.pno=project.pno;


--4.在staff表中插入5号员工信息：姓名-张三，性别-男，日期-1987-3-10,济南，工资-3500 
insert into staff values(5,'张三','男','10-3月-1987','济南',3500);
select * from staff

--5.查询公司中所有的王姓员工
select * from staff
where sname like '王%';

--6.查询参与了预算最多的员工有哪些
select * from
(select staff.sno,sname,sum(buget)
from staff join sp on staff.sno = sp.sno join project on sp.pno = project.pno
group by staff.sno , sname
order by sum(buget) desc)
where rownum < 2;

--7.检索一下每个项目有多少员工参与了
select pno,count(sno)
from sp
group by pno;

--8.检索李有才的基本信息及其参与的项目信息
select * from staff join sp on staff.sno=sp.sno join project on sp.pno=project.pno
where sname='李有才';

--9.检索所有员工的平均薪资，最高薪资，最低薪资
select avg(salary),max(salary),min(salary)
from staff;

--10.连接表staff的全部列，各个列之间用逗号隔开，列头显示成OUT_PUT 
select sno||','||sname||','||ssex||','||sbitthday||','||sddr||','||salary||','||

sno as OUT_PUT
from staff