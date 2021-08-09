# 一、SQL基本概念

（1）动词
![img](https://img2020.cnblogs.com/blog/1861185/202006/1861185-20200609144157943-1085446597.png)
（2）可以操作的模式
![img](https://img2020.cnblogs.com/blog/1861185/202006/1861185-20200609144213910-1549378916.png)

- 基本表
    - 本身独立存在的表
    - SQL中一个关系就对应一个基本表
    - 一个（或多个）基本表对应一个存储文件
    - 一个表可以带若干索引
- 存储文件
    - 逻辑结构组成了关系数据库的内模式
    - 物理结构对用户是隐蔽的
- 视图
    - 从一个或几个基本表导出的表
    - 只存放视图的定义而不存放视图对应的数据 (每次使用视图集合的时才进行关系运算求得
    - 视图是一个虚表
    - 用户可以在视图上再定义视图

# 二、数据定义

![img](https://img2020.cnblogs.com/blog/1861185/202006/1861185-20200609144405191-573049950.png)

## 1. 模式的定义与删除

- 创建
    - 一个关系数据库管理系统的实例（Instance）中可以建立多个数据库
    - 一个数据库中可以建立多个模式
    - 一个模式下通常包括多个表、视图和索引等数据库对象
    - 在CREATE SCHEMA中可以接受CREATE TABLE，CREATE VIEW和GRANT子句。

```sql
/*为用户ZHANG创建了一个模式TEST，并且在其中定义一个表TAB1*/
CREATE SCHEMA TEST AUTHORIZATION ZHANG CREATE TABLE TAB1
(   COL1 SMALLINT,
    COL2 INT,
    COL3 CHAR(20),
    COL4 NUMERIC(10,3),
    COL5 DECIMAL(5,2)
); 
```

能创建模式的用户拥有DBA权限（DBA，Database Administrator，数据库管理员），或者获得授予的CREATE SCHEMA权限
定义模式实际上定义了一个命名空间。在这个空间中可以定义该模式包含的数据库对象， 例如基本表、视图、索引等。
删除

- DROP SCHEMA <模式名> <CASCADE|RESTRICT>
    - CASCADE（级联）RESTRICT（限制）
        - 删除模式的同时把该模式中所有的数据库对象全部删除
        - 如果该模式中定义了下属的数据库对象（如表、视图 等），则拒绝该删除语句的执行。
        - 仅当该模式中没有任何下属的对象时才能执行

```sql
/*删除模式ZHANG同时该模式中定义的表TAB1也被删除*/
DROP SCHEMA ZHANG CASCADE;
```

## 2. 基本表的操作

### （1）定义基本表

```sql
/*建立“学生”表Student。学号是主码，姓名取值唯一*/
CREATE TABLE Student
(   Sno CHAR(9) PRIMARY KEY,/* 列级完整性约束条件,Sno是主码*/
    Sname CHAR(20) UNIQUE, /* Sname取唯一值*/
    Ssex CHAR(2),
    Sage SMALLINT,
    Sdept    CHAR(20)
);
```



```sql
/*建立一个学生选课表SC*/
CREATE TABLE  SC
(Sno CHAR(9),  
Cno CHAR(4),
Grade SMALLINT，
PRIMARY KEY (Sno,Cno),
/* 主码由两个属性构成，必须作为表级完整性进行定义*/
FOREIGN KEY (Sno) REFERENCES Student(Sno),
/* 表级完整性约束条件，Sno是外码，被参照表是Student,实现选课表和学生表的对应 */
FOREIGN KEY (Cno)REFERENCES Course(Cno)
/* 表级完整性约束条件，Cno是外码，被参照表是Course，实现选课表和课程表的对应*/
);
```



### （2）数据类型

![img](https://img2020.cnblogs.com/blog/1861185/202006/1861185-20200609144713865-1380758251.png)

### （3）常用完整性约束

- 主码约束： PRIMARY KEY
- 唯一性约束：UNIQUE
- 非空值约束：NOT NULL
- 参照完整性约束
- PRIMARY KEY不能重不能空，UNIQUE不能重可以空

### （4）模式与表

每一个基本表都属于某一个模式，一个模式包含多个基本表
定义基本表所属模式

+ 方法一：在表名中明显地给出模式名（例：S-T为模式名

```sql
Create table"S-T".Student(......);
```

+ 方法二：在创建模式语句中同时创建表
+ 方法三：设置所属的模式
    + 创建基本表（其他数据库对象也一样）时，若没有指定模式，系统根据搜索路径来确定该对象所属的模式
        关系数据库管理系统会使用模式列表中第一个存在的模式作为数据库对象的模式名
        若搜索路径中的模式名都不存在，系统将给出错误
        显示当前的搜索路径： SHOW search_path;
        搜索路径的当前默认值是：user，PUBLIC
        数据库管理员用户可以设置搜索路径，然后定义基本表

```sql
SET search_path TO "S-T",PUBLIC;
Create table Student(......);
```

结果建立了S-T.Student基本表。
关系数据库管理系统发现搜索路径中第一个模式名S-T， 就把该模式作为基本表Student所属的模式。

### （5）修改基本表

ALTER TABLE 表名

- ADD子句用于增加新列、新的列级完整性约束条件和新的表级完整性约束条件
- DROP COLUMN子句用于删除表中的列 CASCADE自动删除、RESTRICT该列被其他对象引用，关系数据库管理系统将拒绝删除该列
- DROP CONSTRAINT子句用于删除指定的完整性约束条件
- ALTER COLUMN子句用于修改原有的列定义，包括修改列名和数据类型

```sql
/*若表上建有视图，选择RESTRICT时表不能删除;选择 CASCADE时可以删除表，视图也自动删除。*/
CREATE VIEW IS_Student AS
SELECT Sno,Sname,Sage
FROM Student WHERE Sdept='IS';

DROP TABLE Student RESTRICT;
--ERROR: cannot drop table Student because other objects depend on it
```

### （6）删除基本表

- delete from 表名
    - 只是删除表中某些数据，表结构还在.。
    - Delete 可以带where子句来删除一部分数据，例如 DELETE FROM Student WHERE sAge > 20
    - 自动编号不恢复到初始值。
- truncate table 表名
    - truncate语句不能跟where条件，无法根据条件来删除，只能全部删除数据。
    - 自动编号恢复到初始值。
    - 使用truncate删除表中所有数据要比delete效率高的多，因为truncate操作采用按最小方式来记录日志.
    - truncate删除数据，不触发delete触发器。
- drop table 表名
    - 删除表本身，即表中数据和表结构（列、约束、视图、键）全部删除。

## 3. 索引的建立与删除

建立索引的目的：加快查询速度
关系数据库管理系统中常见索引：

- 顺序文件上的索引
- B+树索引
- 散列（hash）索引
- 位图索引
    特点：
- B+树索引具有动态平衡的优点
- HASH索引具有查找速度快的特点
    索引相关的权限:
- 建立索引权限：数据库管理员 或 建立表的人
- 维护索引权限：关系数据库管理系统自动完成
- 使用索引权限：关系数据库管理系统自动选择合适的索引作为存取路径，用户不必也不能显式地选择索引

### （1）建立索引

- UNIQUE 唯一值索引：
    - 对于已含重复的属性列不能建UNIQUE索引
    - 对某个列建立UNIQUE索引后，插入新记录时，DBMS会自动检查新纪录在该列上是否取了重复值，相当于增加一个UNIQUE约束
- CLUSTER 聚簇索引
    - 表中的数据按照指定的聚簇属性升序或降序存放，也就是聚簇索引的索引项顺序与表中记录的物理顺序一致

```sql
/*为学生-课程数据库中的Student，Course，SC三个表建立索引。
Student表按学号升序建唯一索引，Course表按课程号升序建唯一索引，
SC表按学号升序和课程号降序建唯一索引*/
CREATE UNIQUE INDEX    Stusno ON Student(Sno);
CREATE UNIQUE INDEX    Coucno ON Course(Cno);
CREATE UNIQUE INDEX    SCno ON SC(Sno ASC,Cno DESC);
```

### （2）删除索引

```sql
/*删除Student表的Stusname索引*/
DROP INDEX Stusname;
```

### （3）修改索引

```sql
/*将SC表的SCno索引名改为SCSno */
ALTER INDEX SCno RENAME TO SCSno;
```

## 4. 数据字典

数据字典是关系数据库管理系统内部的一组系统表，它记录了数据库中所有的定义信息：

- 关系模式定义
- 视图定义
- 索引定义
- 完整性约束定义
- 各类用户对数据库的操作权限
- 统计信息等
    关系数据库管理系统在执行SQL的数据定义语句时，实际上就是在更新数据字典表中的相应信息

# 三、数据查询

- SELECT：指定要显示的属性列
- FROM：指定查询对象（基本表或视图）
- WHERE：指定查询条件
- GROUP BY子句：对查询结果按指定列的值分组，该属性列值相等的元组为一个组。通常会在每组中作用聚集函数。
- HAVING：只有满足指定条件的组才予以输出
- ORDER BY：对查询结果表按指定列值的升序或降序排序

## 1. 单表查询

### （1）选择表中的若干列(投影

```sql
/*查询全体学生的姓名、出生年份和所在的院系，要求用小写字母表示系名。*/
SELECT Sname,2020-Sage,LOWER(Sdept) 
FROM Student;
SELECT Sname NAME,
2020-Sage BIRTHDAY,LOWER(Sdept)    DEPARTMENT
/*生日用BIRTHDAY表示，结果就是2020-其出生年的值，专业用DEPARTMENT表示*/
FROM Student;
```

### （2）选择表中的若干元组（行

消除取值重复的行

- DISTINCT 即去除重复的行
- 默认为ALL即不去重

```sql
/*指定DISTINCT关键词，去掉表中重复的行*/
SELECT DISTINCT Sno FROM SC;
```

查询满足条件的元组
![img](https://img2020.cnblogs.com/blog/1861185/202006/1861185-20200609145511830-1066882853.png)

```sql
SELECT name,age /* 选取name和age列，其中age值满足<20 */
FROM Student 
WHERE age < 20;
```



```sql
SELECT Sname, Sdept, Sage
FROM Student
WHERE Sage BETWEEN 20 AND 30;
```



```sql
SELECT Sname,Ssex FROM Student
WHERE Sdept IN('CS','MA','IS');
/* 在学生表中选择课程属性值为CS或MA或IS专业的名字和性别*/
```



(NOT) LIKE ‘匹配串’ ESCAPE ‘ 换码字符 ’
% 代表任意长度（长度可以为0）的字符串
a%b表示以a开头，以b结尾的任意长度的字符串
_ （下横线） 代表任意单个字符。
a_b表示以a开头，以b结尾的长度为3的任意字符串
如果原串含有通配符使用换义字符转义通配符

```sql
SELECT Cnno ,Ccredit
FROM course
WHERE Cname LIKE 'DB\_Design' ESCAPE '\';
/* ESCAPE 即转义字符*/
复制代码1234
SQL/*选择年级为空的学生的学号和课程号*/
SELECT Sno, Cno 
FROM SC
WHERE Grade IS NULL；
复制代码1234
SQL/*选择学生表中CS专业的年纪小于20的名字*/
SELECT Sname 
FROM   Student
WHERE Sdept= 'CS' AND Sage<20; 
```

### （3）对查询结果排序

```sql
/*查询选修了3号课程的学生的学号及其成绩，查询结 果按分数降序排列。*/
SELECT Sno, Grade
FROM     SC
WHERE Cno= '3' ORDER BY Grade DESC;
```

### （4）使用集函数

- 统计元组个数 COUNT(*)
- 统计一列中值的个数 COUNT([DISTINCT|ALL] <列名>) DISTINCT 的话相同值只算一次
- 总和（此列必须为数值型） SUM([DISTINCT|ALL] <列名>)
- 平均值（此列必须为数值型） AVG([DISTINCT|ALL] <列名>)
- 最大值和最小值 MAX([DISTINCT|ALL] <列名>) MIN([DISTINCT|ALL] <列名>)

```sql
SELECT COUNT(DISTINCT Sno) 
FROM SC;
```

### （5）GROUP BY

目的：细化聚集函数的作用对象
未对查询结果分组，将作用于整个查询结果
对查询结果分组后，分别作用于每个组
WHERE子句中不能用聚集函数作为条件表达式，HAVING可以

```sql
/*查询平均成绩大于等于90分的学生学号和平均成绩 */ 
SELECT Sno, AVG(Grade) 
FROM SC 
GROUP BY Sno 
HAVING AVG(Grade)>=90;
```

WHERE作用于表的所有，基表或视图，从中选择满足条件的元组
HAVING作用于筛选出来的组，从中选择满足条件的组

## 2. 连接查询

### （1）执行方式

- 连接查询：同时涉及两个以上的表的查询
    - 连接条件或连接谓词：用来连接两个表的条件
    - [<表名1>.]<列名1> <比较运算符> [<表名2>.]<列名2>
    - [<表名1>.]<列名1> BETWEEN [<表名2>.]<列名2> AND [<表名2>.]<列名3>
- 连接字段
    - 列名称为连接字段，连接条件中的个连接字段类型必须是可比的，但不必是相同的

```sql
SELECT Student.*, SC.* 
FROM     Student, SC
WHERE Student.Sno = SC.Sno;/*相同的两个元组连接成大元祖*/
```

连接操作的执行过程：

- 嵌套循环法（NESTED-LOOP）
    - 首先在表1中找到第一个元组，然后从头开始扫描表2，逐一查找满足连接件的元组，找到后就将表1中的第一个元组与该元组拼接起来，形成结果表中一个元组。
    - 表2全部查找完后，再找表1中第二个元组，然后再从头开始扫描表2，逐一查找满足连接条件的元组，找到后就将表1中的第二个元组与该元组拼接起来，形成结果表中一个元组。
    - 重复上述操作，直到表1中的全部元组都处理完毕
- 排序合并法（SORT-MERGE）
    - 常用于=连接
    - 首先按连接属性对表1和表2排序
    - 对表1的第一个元组，从头开始扫描表2，顺序查找满足连接条件的元组，找到后就将表1中的第一个元组与该元组拼接起来，形成结果表中一个元组。当遇到表2中第一条大于表1连接字段值的元组时，对表2的查询不再继续
    - 找到表1的第二条元组，然后从刚才的中断点处继续顺序扫描表2，查找满足连接条件的元组，找到后就将表1中的第二条元组与该元组拼接起来，形成结果表中一个元组。直接遇到表2中大于表1连接字段值的元组时，对表2的查询不再继续
    - 重复上述操作，直到表1或表2中的全部元组都处理完毕为止
- 索引连接（INDEX-JOIN）
    - 对表2按连接字段建立索引
    - 对表1中的每个元组，依次根据其连接字段值查询表2的索引，从中找到满足条件的元组，找到后就将表1中的第一个元组与该元组拼接起来，形成结果表中一个元组

### （2）等值与非等值连接查询

一条SQL语句可以同时完成选择和连接查询，这时 WHERE子句是由连接谓词和选择谓词组成的复合条件。
过程：
先从SC中挑选出Cno='2'并且Grade>90的元组形成一个中间关系 再和Student中满足连接条件的元组进行连接得到最终的结果关系

```sql
SELECT Student.Sno,Sname FROM Student,SC
WHERE Student.Sno=SC.Sno AND SC.Cno='2' AND SC.Grade >90;
/*先选出Cno=2，Grade>90*/
```

### （3）自身连接

- 自身连接：一个表与自己进行连接
- 需要给表起别名以示区别
- 由于所有属性名都是同名属性，因此必须使用别名前缀

```sql
SELECT FIRST.Cno, SECOND.Cpno
FROM Course FIRST, Course SECOND
WHERE FIRST.Cpno = SECOND.Cno;
/*第一个表中的先修课是二表中的课程号码*/
```

### （4）外连接

- 与普通连接的区别
    - 普通连接操作只输出满足连接条件的元组
    - 外连接操作以指定表为连接主体，将主体表中不满足连接条件的元组一并输出
- 左外连接
    - 列出左边关系中所有的元组
- 右外连接
    - 列出右边关系中所有的元组

```sql
SELECT Student.Sno,Sname,Ssex,Sage,Sdept,Cno,Grade 
FROM Student LEFT OUTER JOIN SC ON (Student.Sno=SC.Sno);
/*多表连接*/ 
```

两个以上的表进行连接

```sql
/*查询每个学生的学号、姓名、选修的课程名及成绩*/
SELECT Student.Sno, Sname, Cname, Grade
FROM    Student, SC, Course /*多表连接*/
WHERE Student.Sno = SC.Sno AND SC.Cno = Course.Cno;
```

## 3. 嵌套查询

- 一个SELECT-FROM-WHERE语句称为一个查询块
- 将一个查询块嵌套在另一个查询块的WHERE子句或HAVING短语的条件中的查询称为嵌套查询
    层的查询块称为外层查询或父查询,下层查询块称为内层查询或子查询 SQL
    语言允许多层嵌套查询,即一个子查询中还可以嵌套其他子查询  子查询的限制 不能使用ORDER BY子句
    不相关子查询：
- 子查询的查询条件不依赖于父查询
- 由里向外逐层处理。即每个子查询在上一级查询处理之前求解，子查询的结果用于建立其父查询的查找条件。

### （1）IN谓词的子查询

```sql
/*查询选修了课程名为“信息系统”的学生学号和姓名*/
SELECT Sno,Sname FROM Student 
WHERE Sno IN
    (SELECT Sno 
    FROM SC 
    WHERE    Cno IN
        ( SELECT Cno
        FROM Course
        WHERE Cname= '信息系统'
        )
    );
```

### （2）带比较运算符的子查询

当能确切知道内层查询返回单值时，可用比较运算符（>，<，=，>=，<=，!=或< >）。
多对一或一对一的关系IN可以用=代替

```sql
/*找出每个学生超过他选修课程平均成绩的课程号。*/
SELECT Sno, Cno
FROM    SC    x
WHERE Grade >=(SELECT AVG(Grade)
FROM    SC y
WHERE y.Sno=x.Sno);
```

可能执行的过程：
从外层查询中取出SC的一个元组x，将元组x的Sno值 （201215121）传送给内层查询。

```sql
/*
从外层查询中取出SC的一个元组x，将元组x的Sno值
（201215121）传送给内层查询
*/
SELECT AVG(Grade) 
FROM SC y
WHERE y.Sno='201215121';

/*
执行内层查询，得到值88（近似值），用该值代替内层查询，得到外层查询：
*/
SELECT Sno,Cno 
FROM     SC x WHERE Grade >=88;
/*
执行这个查询，得到
（201215121,1）
（201215121,3）
然后外层查询取出下一个元组重复做上述步骤，直到外层的SC元组全部处理完毕。结果为:
（201215121,1）
（201215121,3）
（201215122,2）
*/
```

### （3）带有ANY或ALL的子查询

使用ANY或ALL谓词时必须同时使用比较运算
语义为：

- \>ANY 大于子查询结果中的某个值
- \>ALL 大于子查询结果中的所有值
- <ANY 小于子查询结果中的某个值
- <ALL 小于子查询结果中的所有值
- \>=ANY 大于等于子查询结果中的某个值
- \>=ALL 大于等于子查询结果中的所有值
- <=ANY 小于等于子查询结果中的某个值
- <=ALL 于等于子查询结果中的所有值
- =ANY 等于子查询结果中的某个值
- =ALL 等于子查询结果中的所有值
- !=（或<>）𝐴𝑁𝑌  不等于子查询结果中的某个值
- !=（或<>）𝐴𝐿𝐿 不等于子查询结果中的任何一个值

```sql
/*
查询非计算机科学系中比计算机科学系任意一个学生年龄小的学生姓名和年龄
*/
SELECT Sname,Sage
FROM Student
WHERE Sage < ANY (
SELECT Sage
FROM Student 
WHERE Sdept= 'CS')
AND Sdept <> 'CS'/* <> 即 != */
```

### （4）带有EXISTS谓词的子查询

## 4. 集合查询

集合操作的种类

- 并操作UNION
- 交操作INTERSECT
- 差操作EXCEPT
    参加集合操作的各查询结果的列数必须相同;对应项的数据类型也必须相同

```sql
/*查询计算机科学系的学生与年龄不大于19岁的 学生的差集。*/
SELECT *
FROM Student WHERE Sdept='CS'
EXCEPT SELECT *
FROM Student WHERE Sage <=19;
```

## 5. 基于派生表的查询

子查询不仅可以出现在WHERE子句中，还可以出现在FROM子句中，
这时子查询生成的临时派生表Derived Table）成为主查询的查询对象

```sql
/*找出每个学生超过他自己选修课程平均成绩的课程号*/
SELECT Sno, Cno
FROM SC, (SELECT Sno, Avg(Grade) FROM SC GROUP BY Sno)
/*Avg_sc、avg_sno、avg_grade为派生表*/
                 AS Avg_sc(avg_sno,avg_grade)/
WHERE SC.Sno = Avg_sc.avg_sno and 
            SC.Grade >=Avg_sc.avg_grade
```

如果子查询中没有聚集函数，派生表可以不指定属性列，子查询SELECT子句后面的列名为其缺省属性。

```sql
/*查询所有选修了1号课程的学生姓名*/
SELECT Sname
FROM Student,
(SELECT Sno FROM SC WHERE Cno=' 1 ') AS SC1
WHERE    Student.Sno=SC1.Sno;
```

# 四、数据更新

## 1. 插入数据

### （1）插入元组

- INTO子句
    - 指定要插入数据的表名及属性列 
    - 属性列的顺序可与表定义中的顺序不一致 
    - 没有指定属性列：表示要插入的是一条完整的元组，且属性列属性与表定义中的顺序一致 
    - 指定部分属性列：插入的元组在其余属性列上取空值
- VALUES子句
    - 提供的值必须与INTO子句匹配
    - 值的个数
    - 值的类型

```sql
/*将张成民的信息插入学生表*/
INSERT
INTO    Student
VALUES ('201215126','张成民','男’,18,'CS');
```

### （3）插入子查询结果

可以一次插入多个元组
INSERT INTO 表名 (属性列1> [,<属性列2>…)] 子查询;

- INTO子句，子查询
    - SELECT子句目标列必须与INTO子句匹配
    - 值的个数
    - 值的类型

```sql
/*对每一个系，求学生的平均年龄，并把结果存入数据库*/
/*建一张新表*/
CREATE TABLE Dept_age( Sdept CHAR(15)  Avg_age SMALLINT);
/*插入数据*/
INSERT
INTO Dept_age (Sdept,Avg_age) SELECT  Sdept，AVG(Sage) 
FROM Student
GROUP BY Sdept;
```

## 2. 修改数据

- UPDATE 表名
    - SET 列名 = 表达式 , 列名 = 表达式 …
    - WHERE <条件>;
- 功能
    - 修改指定表中满足WHERE子句条件的元组
    - SET子句给出<表达式>的值用于取代相应的属性列
    - 如果省略WHERE子句，表示要修改表中的所有元组
- 三种修改方式
    - 修改某一个元组的值
    - 修改多个元组的值
    - 带子查询的修改语句

## 3. 删除数据

```sql
delete from 数据库名.dbo.表名 where 条件; 
```

# 五、空值的处理

## 1. 空值的产生

空值是一个很特殊的值，含有不确定性。对关系运 算带来特殊的问题，需要做特殊的处理。

```sql
/*向SC表中插入一个元组，学生号是'201215126'，课程号是'1'，成绩为空。*/
INSERT INTO SC(Sno,Cno,Grade)
VALUES('201215126 ','1',NULL);/*该学生还没有考试成绩，取空值*/
复制代码1234
SQL/*将Student表中学生号为'201215200'的学生所属的系改为空值。*/
UPDATE Student
SET Sdept = NULL
WHERE Sno='201215200';
```

## 2. 空值的判断

判断一个属性的值是否为空值，用IS NULL 或 IS NOT NULL来表示。

```sql
/*从Student表中找出漏填了数据的学生信息*/
SELECT *
FROM Student
WHERE Sname IS NULL OR Ssex IS NULL OR 
            Sage IS NULL OR Sdept IS NULL;
```

## 3. 空值的约束条件

- 属性定义（或者域定义）中 不能取空值的情况
    - 有NOT NULL约束条件的不能取空值
    - 加了UNIQUE限制的属性不能取空值
    - 码属性不能取空值

## 4. 空值的算术运算、比较运算和逻辑运算

空值与另一个值（包括另一个空值）的算术运算的结果为空值
空值与另一个值（包括另一个空值）的比较运算的结果为 UNKNOWN。
有UNKNOWN后，传统二值（TRUE，FALSE）逻辑就扩展成了三值逻辑
![img](https://img2020.cnblogs.com/blog/1861185/202006/1861185-20200609151737874-1261982617.png)

```sql
/*选出选修1号课程的不及格的学生以及缺考的学生。*/
SELECT Sno FROM SC
WHERE Cno='1' AND (Grade<60 OR Grade IS NULL);
```

# 六、视图

- 视图的特点
    - 虚表，是从一个或几个基本表（或视图）导出的表
    - 只存放视图的定义，不存放视图对应的数据
    - 基表中的数据发生变化，从视图中查询出的数据也随之改变

## 1. 定义视图

### （1）建立视图

组成视图的属性列名
全部省略:
由子查询中SELECT目标列中的诸字段组成
明确指定视图的所有列名:

- 某个目标列是聚集函数或列表达式
- 多表连接时选出了几个同名列作为视图的字段
- 需要在视图中为某个列启用新的更合适的名字
    关系数据库管理系统执行CREATE VIEW语句时 只是把视图定义存入数据字典，并不执行其中的 SELECT语句。在对视图查询时，按视图的定义从基本表中将数据查出。

```sql
/*建立信息系学生的视图，并要求进行修改和插入 操作时仍需保证该视图只有信息系的学生。*/
CREATE VIEW IS_Student AS
SELECT Sno,Sname,Sage
FROM     Student WHERE Sdept= 'IS' 
WITH CHECK OPTION;
```

若一个视图是从单个基本表导出的，并且只是去掉了基本表的某些行和某些列，但保留了主码，这类视图为行列子集视图

### （2）基于多个基表的视图

```sql
/*建立信息系选修了1号课程的学生的视图（包括学号、姓名、成绩）。*/
CREATE VIEW IS_S1(Sno,Sname,Grade)
AS
SELECT Student.Sno,Sname,Grade 
FROM     Student,SC
WHERE Sdept= 'IS' AND
Student.Sno=SC.Sno AND SC.Cno= '1';
```

### （3）基于视图的视图

```sql
/*建立信息系选修了1号课程且成绩在90分以上的 学生的视图。*/
CREATE VIEW IS_S2 AS
SELECT Sno,Sname,Grade
FROM IS_S1
WHERE Grade>=90;
```

### （4）删除视图

- 级联删除
    - DROP VIEW 视图名 CASCADE;
    - 该语句从数据字典中删除指定的视图定义
    - 如果该视图上还导出了其他视图，使用CASCADE级联删除语句，把该视图和由它导出的所有视图一起删除
    - 删除基表时，由该基表导出的所有视图定义都必须显式地使用DROP VIEW语句删除

```sql
/*删除视图BT_S和IS_S1*/
DROP VIEW BT_S;/*成功执行*/
DROP VIEW IS_S1;/*拒绝执行*/
/*要删除IS_S1，需使用级联删除：*/
DROP VIEW IS_S1 CASCADE;
```

## 2. 查询视图

关系数据库管理系统实现视图查询的方法:

- 视图消解法（View Resolution）
    - 进行有效性检查
    - 转换成等价的对基本表的查询
    - 执行修正后的查询

```sql
/*在S_G视图中查询平均成绩在90分以上的学生学号和平均成绩*/
CREATE VIEW S_G (Sno,Gavg) AS
SELECT Sno,AVG(Grade)
FROM     SC
GROUP BY Sno;

SELECT * FROM    S_G
WHERE    Gavg>=90;

/*错误：*/
SELECT Sno，AVG(Grade)
FROM     SC
WHERE    AVG(Grade)>=90
GROUP BY Sno;

/*正确：*/
SELECT Sno,AVG(Grade) FROM SC
GROUP BY Sno
HAVING AVG(Grade)>=90;
```

## 3. 更新视图

~~~sql
/*将信息系学生视图IS_Student中学号
'201215122'的学生姓名改为'刘辰' */
UPDATE    Student SET Sname= '刘辰'
WHERE Sno= ' 201215122 ' AND Sdept= 'IS';
```　　
```sql
/*删除信息系学生视图IS_Student中学号为
“201215129”的记录*/
DELETE
FROM IS_Student
WHERE Sno= '201215129';
/*转换为对基本表的更新：*/
DELETE
FROM Student
WHERE Sno= '201215129' AND Sdept= 'IS';
~~~

对视图更新的限制：

- 若视图是由两个以上基本表导出的，则此视图不允许更新。
- 若视图的字段来自字段表达式或常数，则不允许对此视图执行INSERT和UPDATE操作，但允许执行DELETE操作。
- 若视图的字段来自聚集函数，则此视图不允许更新。
- 若视图定义中含有GROUP BY子句，则此视图不允许更新。
- 若视图定义中含有DISTINCT短语，则此视图不允许更新。
- 若视图定义中有嵌套查询，并且内层查询的FROM子句中涉及的表也是导出该视图的基本表，则此视图不允许更新。

```sql
/*将SC中成绩在平均成绩之上的元组定义成一个视图，无法更新*/
CREATE VIEW GOOD_SC AS
SELECT Sno,Cno,Grade
FROM     SC
WHERE Grade >
(SELECT AVG(Grade) FROM SC);
/*一个不允许更新的视图上定义的视图也不允许更新*/
```

## 4. 视图的作用

- 视图能够简化用户的操作：当视图中数据不是直接来自基本表时，定义视图能够简化用户的操作
    - 基于多张表连接形成的视图
    - 基于复杂嵌套查询的视图
    - 含导出属性的视图
- 视图使用户能以多种角度看待同一数据
    - 视图机制能使不同用户以不同方式看待同一数据，适应数据库共享的需要
- 视图对重构数据库提供了一定程度的逻辑独立性
    - 视图只能在一定程度上提供数据的逻辑独立性  由于对视图的更新是有条件的，因此应用程序中修改数据的语句可能仍会因基本表结构的改变而改变。
- 视图能够对机密数据提供安全保护
    - 对不同用户定义不同视图，使每个用户只能看到他有权看到的数据
- 适当的利用视图可以更清晰的表达查询
    - 经常需要执行这样的查询“对每个同学找出其最高成绩的课程号”。先定义一个视图，求出每个同学获得的最高成绩
