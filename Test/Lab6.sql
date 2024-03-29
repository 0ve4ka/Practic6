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
(N'Архипов', N'Артём', N'Алексеевич','111111','1111'),
(N'Сабиров', N'Рустем', N'Мансурович','222222','2222'),
(N'Нурмухаметов', N'Даниэль', N'Ильдарович','333333','3333'),
(N'Карпов', N'Максим', N'Дмитриевич','444444','4444'),
(N'Саляхов', N'Имиль', N'Русланович','555555','5555');

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

insert strani values(N'Россия',500,5000),
(N'Бразилия',1000,10000),(N'Беларусь',250,2500),
(N'Казахстан',789,7890),(N'Чеченская Республика',999,9990);

go

create table VidiUslug
(
id int primary key identity,
Nazvanie nvarchar(50) not null,
stoimost money not null
);

go

insert VidiUslug values(N'Отдых',250),(N'Лечение',800),
(N'Путешествие',900),(N'Научное исследование',100),
(N'Профилактика',1000);

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

insert marshruti values(N'Магадан',N'Грозный',5,1),
(N'Мадагаскар',N'Москва',1,2),
(N'Москва',N'Рио-де-Жанейро',2,3),
(N'Казахстан',N'Магилёв',3,4),
(N'Беларусия',N'Актобе',4,5);


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

/*Создать представление, собирающее данные о поездках 
конкретных пользователей.*/

go

insert poezdki values(1,1,'2023-12-01',7,50000),
(2,2,'2012-02-21',1,100000),
(3,3,'2020-12-31',3,90000),
(4,4,'2000-10-12',1,52300),
(5,5,'1999-12-31',20,50000),
(2,2,'2019-11-01',6,6000),
(2,1,'2020-12-12',10,20000);
