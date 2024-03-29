create database traffic;

go

use traffic;

create table passporta
(
id int primary key identity,
phio nvarchar(25) not null,
Imya nvarchar(25) not null,
Otchestvo nvarchar(25) not null,
Seriya_passsporta char(6) not null,
Nomer_passsporta char(6) not null,
);

go

insert passporta values 
(N'�������', N'����', N'����������','111111','1111'),
(N'�������', N'������', N'����������','222222','2222'),
(N'������������', N'�������', N'����������','333333','3333'),
(N'������', N'������', N'����������','444444','4444'),
(N'�������', N'�����', N'����������','555555','5555');

go

create table client
(
id int primary key identity,
passport int references passporta (id),
Telephon varchar(11) not null,
);

go

insert client values(1,'88005553535'),(2,'88006663636'),
(3,'99005553535'),(4,'88005552525'),(5,'88665553535');

go

create table strani 
(
id tinyint primary key identity,
nazvanie_strani nvarchar(50) not null,
stoimosti_transportnih_uslug smallint not null,
stoimosti_visi smallint not null,
);

go

insert strani values(N'������',500,5000),
(N'��������',1000,10000),(N'��������',250,2500),
(N'���������',789,7890),(N'��������� ����������',999,9990);

go

create table VidiUslug
(
id int primary key identity,
Nazvanie nvarchar(50) not null,
stoimost money not null
);

go

insert VidiUslug values(N'�����',250),(N'�������',800),
(N'�����������',900),(N'������� ������������',100),
(N'������������',1000);

go

create table marshruti
(
id int primary key identity,
tochka_otpravki nvarchar(50) not null,
tochka_pribitiya nvarchar(50) not null,
strana_pribitiya tinyint references strani(id),
usluga int references VidiUslug(id),
);

go

insert marshruti values(N'�������',N'�������',5,1),
(N'����������',N'������',1,2),
(N'������',N'���-��-�������',2,3),
(N'���������',N'������',3,4),
(N'���������',N'������',4,5);


go 

create table poezdki
(
id int primary key identity,
Klient  int references client(id),
Marshrut int references marshruti(id),
Data_nachala_prebivaniya date not null,
kol_vo_Dney_Prozhivaniya tinyint not null,
stoimost_poezdki money not null
);

/*������� �������������, ���������� ������ � �������� 
���������� �������������.*/

go

insert poezdki values(1,1,'2023-12-01',7,50000),
(2,2,'2012-02-21',1,100000),
(3,3,'2020-12-31',3,90000),
(4,4,'2000-10-12',1,52300),
(5,5,'1999-12-31',20,50000),
(2,2,'2019-11-01',6,6000),
(2,1,'2020-12-12',10,20000);
