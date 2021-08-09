

--1.创建一个视图，显示80后的员工信息
create view emp_ as
  select * from staff 
  where sbitthday >to_date('1980/01/01','yyyy-mm-dd') and sbitthday <to_date('1990/01/01','yyyy-mm-dd');
--转换日期格式必须为 ('1980/01/01','yyyy-mm-dd')，否则会报错

select * from emp_;


--2.创建一个名为‘检索信息’的存储过程，该存储过程完成检索指定员工号所参与的项目总数，其中员工号为输入参数，项目总数为输出参数
--调用‘检索信息’存储过程，完成检索1号员工参与的项目总数。


create or replace  procedure 检索信息(sno_ in number,p_count out number)
as
begin
  select count(pno) into p_count from sp where sno = sno_;
end 检索信息;

declare 
 sno_ number;
 p_count number;
begin
  检索信息(1,p_count);
  dbms_output.put_line('项目总数为:  '||p_count);
end;





--3.创建一个触发器，该触发器完成当项目结束时，将预算加1000，并将新的预算和旧预算输出
--创建薪资变化表
create table project_change(
  time date,
  pno varchar(20),
  old_bg number(10),
  new_bg number(10)
);

create or replace trigger tri_aft_pro
  after update of budget on project for each row
begin 
  insert into project_change values(sysdate,:OLD.pno,:OLD.buget,:NEW.buget);
end tri_aft_pro;

update project set buget=buget+1000 where sysdate-edate > 0;

select * from project_change;



--4.使用PL/SQL完成：将员工薪资小于5000的员工薪资加薪15%，薪资大于5000小于8000的加薪10%，大于8000的加薪5%，并将员工编号，员工姓名和加薪后的薪资输出

declare 
  cursor staff_ is
    select sno,sname,sal from staff for update;
  v_new_sal number; 
begin
   for r_staff in staff_

loop   
  if r_staff.sal < 5000 then 
    v_new_sal := r_staff.sal * 1.15;
    update staff set sal=v_new_sal where current of staff_;
    dbms_output.put_line(r_staff.sno||r_staff.sname||' '||r_staff.sal);

  elsif r_staff.sal < 8000 then 
    v_new_sal := r_staff.sal * 1.10;
    update staff set sal=v_new_sal where current of staff_;
    dbms_output.put_line(r_staff.sno||r_staff.sname||' '||r_staff.sal); 

  else
    v_new_sal := r_staff.sal * 1.05;
    update staff set sal=v_new_sal where current of staff_;
    dbms_output.put_line(r_staff.sno||r_staff.sname||' '||r_staff.sal);

  end if;
end loop;    
end; 



--5.使用显示游标循环输出项目编号，项目名称，预算


declare
  v_pno project.pno%type;
  v_pname project.pname%type;
  v_buget project.buget%type;
  cursor c_pno is select pno from project;
  cursor c_pname is select pname from project;
  cursor c_buget is select buget from project;
begin
  open c_pno;
  open c_pname;
  open c_buget;
  loop
    fetch c_pno into v_pno;
    fetch c_pname into v_pname;
    fetch c_buget into v_buget;
    dbms_output.put_line(v_pno||v_pname||v_buget);
    exit when c_pno %notfound;
  end loop;
  close c_pno;
  close c_pname;
  close c_buget;
end;


--6.使用带参游标完成：输入员工编号，查询显示出员工编号，姓名，年龄

declare
  v_sno staff.sno%type;
  cursor col_s(sno_ number) is select sno, sname, to_char(sysdate,'yyyy')-to_char(sbitthday,'yyyy') sage
  from staff where sno=sno_;
  row_s col_s %rowtype;
begin
  v_sno := '&员工编号'; --输入编号
  open col_s(v_sno);  
  loop
    fetch col_s into row_s;
    exit when col_s%notfound;
    dbms_output.put_line('员工编号为:'||row_s.sno||'姓名为:'||row_s.sname||' 年龄为:'||row_s.sage);
  end loop;
  close col_s;
end;