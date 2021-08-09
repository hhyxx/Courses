create table student(
 
    No                  nvarchar (10) COLLATE Chinese_PRC_CI_AS NULL,     /*编号*/
    Name                nvarchar (50) COLLATE Chinese_PRC_CI_AS NULL,     /*姓名*/
    Sex                 nvarchar (2) COLLATE Chinese_PRC_CI_AS NULL,      /*性别*/
    birthday            datetime,                                         /*出生日期*/
    adress              nvarchar (50) COLLATE Chinese_PRC_CI_AS NULL,     /*地址*/
    Photo               nvarchar (50) COLLATE Chinese_PRC_CI_AS NULL      /*照片*/
    /* COLLATE 定义值的排序规则*/
)