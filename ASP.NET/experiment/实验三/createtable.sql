create table student(
 
    No                  nvarchar (10) COLLATE Chinese_PRC_CI_AS NULL,     /*���*/
    Name                nvarchar (50) COLLATE Chinese_PRC_CI_AS NULL,     /*����*/
    Sex                 nvarchar (2)  COLLATE Chinese_PRC_CI_AS NULL,      /*�Ա�*/
    birthday            datetime,                                         /*��������*/
    adress              nvarchar (50) COLLATE Chinese_PRC_CI_AS NULL,     /*��ַ*/
    Photo               nvarchar (50) COLLATE Chinese_PRC_CI_AS NULL      /*��Ƭ*/
)