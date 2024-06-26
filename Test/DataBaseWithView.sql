USE [master]
GO
/****** Object:  Database [traffic]    Script Date: 29.03.2024 18:48:24 ******/
CREATE DATABASE [traffic]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'traffic', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\traffic.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'traffic_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\traffic_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [traffic] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [traffic].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [traffic] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [traffic] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [traffic] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [traffic] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [traffic] SET ARITHABORT OFF 
GO
ALTER DATABASE [traffic] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [traffic] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [traffic] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [traffic] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [traffic] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [traffic] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [traffic] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [traffic] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [traffic] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [traffic] SET  DISABLE_BROKER 
GO
ALTER DATABASE [traffic] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [traffic] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [traffic] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [traffic] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [traffic] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [traffic] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [traffic] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [traffic] SET RECOVERY FULL 
GO
ALTER DATABASE [traffic] SET  MULTI_USER 
GO
ALTER DATABASE [traffic] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [traffic] SET DB_CHAINING OFF 
GO
ALTER DATABASE [traffic] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [traffic] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [traffic] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [traffic] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'traffic', N'ON'
GO
ALTER DATABASE [traffic] SET QUERY_STORE = OFF
GO
USE [traffic]
GO
/****** Object:  Table [dbo].[passporta]    Script Date: 29.03.2024 18:48:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[passporta](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[phio] [nvarchar](25) NOT NULL,
	[Imya] [nvarchar](25) NOT NULL,
	[Otchestvo] [nvarchar](25) NOT NULL,
	[Seriya_passsporta] [char](6) NOT NULL,
	[Nomer_passsporta] [char](6) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[client]    Script Date: 29.03.2024 18:48:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[client](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[passport] [int] NULL,
	[Telephon] [varchar](11) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[strani]    Script Date: 29.03.2024 18:48:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[strani](
	[id] [tinyint] IDENTITY(1,1) NOT NULL,
	[nazvanie_strani] [nvarchar](50) NOT NULL,
	[stoimosti_transportnih_uslug] [smallint] NOT NULL,
	[stoimosti_visi] [smallint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VidiUslug]    Script Date: 29.03.2024 18:48:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VidiUslug](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Nazvanie] [nvarchar](50) NOT NULL,
	[stoimost] [money] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[marshruti]    Script Date: 29.03.2024 18:48:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[marshruti](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tochka_otpravki] [nvarchar](50) NOT NULL,
	[tochka_pribitiya] [nvarchar](50) NOT NULL,
	[strana_pribitiya] [tinyint] NULL,
	[usluga] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[poezdki]    Script Date: 29.03.2024 18:48:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[poezdki](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Klient] [int] NULL,
	[Marshrut] [int] NULL,
	[Data_nachala_prebivaniya] [date] NOT NULL,
	[kol_vo_Dney_Prozhivaniya] [tinyint] NOT NULL,
	[stoimost_poezdki] [money] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[View_1]    Script Date: 29.03.2024 18:48:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_1]
AS
SELECT        dbo.passporta.phio, dbo.passporta.Imya, dbo.passporta.Otchestvo, dbo.strani.nazvanie_strani
FROM            dbo.client INNER JOIN
                         dbo.marshruti ON dbo.client.id = dbo.marshruti.id INNER JOIN
                         dbo.passporta ON dbo.client.passport = dbo.passporta.id INNER JOIN
                         dbo.poezdki ON dbo.client.id = dbo.poezdki.Klient AND dbo.marshruti.id = dbo.poezdki.Marshrut INNER JOIN
                         dbo.strani ON dbo.marshruti.strana_pribitiya = dbo.strani.id INNER JOIN
                         dbo.VidiUslug ON dbo.marshruti.usluga = dbo.VidiUslug.id
WHERE        (dbo.passporta.phio = N'Сабиров')
GO
/****** Object:  View [dbo].[View_2]    Script Date: 29.03.2024 18:48:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_2]
AS
SELECT        dbo.passporta.phio, dbo.passporta.Imya, dbo.passporta.Otchestvo, dbo.strani.nazvanie_strani
FROM            dbo.client INNER JOIN
                         dbo.marshruti ON dbo.client.id = dbo.marshruti.id INNER JOIN
                         dbo.passporta ON dbo.client.passport = dbo.passporta.id INNER JOIN
                         dbo.poezdki ON dbo.client.id = dbo.poezdki.Klient AND dbo.marshruti.id = dbo.poezdki.Marshrut INNER JOIN
                         dbo.strani ON dbo.marshruti.strana_pribitiya = dbo.strani.id INNER JOIN
                         dbo.VidiUslug ON dbo.marshruti.usluga = dbo.VidiUslug.id
WHERE        (dbo.strani.nazvanie_strani = N'Россия')
GO
SET IDENTITY_INSERT [dbo].[client] ON 

INSERT [dbo].[client] ([id], [passport], [Telephon]) VALUES (1, 1, N'88005553535')
INSERT [dbo].[client] ([id], [passport], [Telephon]) VALUES (2, 2, N'88006663636')
INSERT [dbo].[client] ([id], [passport], [Telephon]) VALUES (3, 3, N'99005553535')
INSERT [dbo].[client] ([id], [passport], [Telephon]) VALUES (4, 4, N'88005552525')
INSERT [dbo].[client] ([id], [passport], [Telephon]) VALUES (5, 5, N'88665553535')
SET IDENTITY_INSERT [dbo].[client] OFF
GO
SET IDENTITY_INSERT [dbo].[marshruti] ON 

INSERT [dbo].[marshruti] ([id], [tochka_otpravki], [tochka_pribitiya], [strana_pribitiya], [usluga]) VALUES (1, N'Магадан', N'Грозный', 5, 1)
INSERT [dbo].[marshruti] ([id], [tochka_otpravki], [tochka_pribitiya], [strana_pribitiya], [usluga]) VALUES (2, N'Мадагаскар', N'Москва', 1, 2)
INSERT [dbo].[marshruti] ([id], [tochka_otpravki], [tochka_pribitiya], [strana_pribitiya], [usluga]) VALUES (3, N'Москва', N'Рио-де-Жанейро', 2, 3)
INSERT [dbo].[marshruti] ([id], [tochka_otpravki], [tochka_pribitiya], [strana_pribitiya], [usluga]) VALUES (4, N'Казахстан', N'Магилёв', 3, 4)
INSERT [dbo].[marshruti] ([id], [tochka_otpravki], [tochka_pribitiya], [strana_pribitiya], [usluga]) VALUES (5, N'Беларусия', N'Актобе', 4, 5)
SET IDENTITY_INSERT [dbo].[marshruti] OFF
GO
SET IDENTITY_INSERT [dbo].[passporta] ON 

INSERT [dbo].[passporta] ([id], [phio], [Imya], [Otchestvo], [Seriya_passsporta], [Nomer_passsporta]) VALUES (1, N'Архипов', N'Артём', N'Алексеевич', N'111111', N'1111  ')
INSERT [dbo].[passporta] ([id], [phio], [Imya], [Otchestvo], [Seriya_passsporta], [Nomer_passsporta]) VALUES (2, N'Сабиров', N'Рустем', N'Мансурович', N'222222', N'2222  ')
INSERT [dbo].[passporta] ([id], [phio], [Imya], [Otchestvo], [Seriya_passsporta], [Nomer_passsporta]) VALUES (3, N'Нурмухаметов', N'Даниэль', N'Ильдарович', N'333333', N'3333  ')
INSERT [dbo].[passporta] ([id], [phio], [Imya], [Otchestvo], [Seriya_passsporta], [Nomer_passsporta]) VALUES (4, N'Карпов', N'Максим', N'Дмитриевич', N'444444', N'4444  ')
INSERT [dbo].[passporta] ([id], [phio], [Imya], [Otchestvo], [Seriya_passsporta], [Nomer_passsporta]) VALUES (5, N'Саляхов', N'Имиль', N'Русланович', N'555555', N'5555  ')
SET IDENTITY_INSERT [dbo].[passporta] OFF
GO
SET IDENTITY_INSERT [dbo].[poezdki] ON 

INSERT [dbo].[poezdki] ([id], [Klient], [Marshrut], [Data_nachala_prebivaniya], [kol_vo_Dney_Prozhivaniya], [stoimost_poezdki]) VALUES (1, 1, 1, CAST(N'2023-12-01' AS Date), 7, 50000.0000)
INSERT [dbo].[poezdki] ([id], [Klient], [Marshrut], [Data_nachala_prebivaniya], [kol_vo_Dney_Prozhivaniya], [stoimost_poezdki]) VALUES (2, 2, 2, CAST(N'2012-02-21' AS Date), 1, 100000.0000)
INSERT [dbo].[poezdki] ([id], [Klient], [Marshrut], [Data_nachala_prebivaniya], [kol_vo_Dney_Prozhivaniya], [stoimost_poezdki]) VALUES (3, 3, 3, CAST(N'2020-12-31' AS Date), 3, 90000.0000)
INSERT [dbo].[poezdki] ([id], [Klient], [Marshrut], [Data_nachala_prebivaniya], [kol_vo_Dney_Prozhivaniya], [stoimost_poezdki]) VALUES (4, 4, 4, CAST(N'2000-10-12' AS Date), 1, 52300.0000)
INSERT [dbo].[poezdki] ([id], [Klient], [Marshrut], [Data_nachala_prebivaniya], [kol_vo_Dney_Prozhivaniya], [stoimost_poezdki]) VALUES (5, 5, 5, CAST(N'1999-12-31' AS Date), 20, 50000.0000)
INSERT [dbo].[poezdki] ([id], [Klient], [Marshrut], [Data_nachala_prebivaniya], [kol_vo_Dney_Prozhivaniya], [stoimost_poezdki]) VALUES (6, 2, 2, CAST(N'2019-11-01' AS Date), 6, 6000.0000)
INSERT [dbo].[poezdki] ([id], [Klient], [Marshrut], [Data_nachala_prebivaniya], [kol_vo_Dney_Prozhivaniya], [stoimost_poezdki]) VALUES (7, 2, 1, CAST(N'2020-12-12' AS Date), 10, 20000.0000)
SET IDENTITY_INSERT [dbo].[poezdki] OFF
GO
SET IDENTITY_INSERT [dbo].[strani] ON 

INSERT [dbo].[strani] ([id], [nazvanie_strani], [stoimosti_transportnih_uslug], [stoimosti_visi]) VALUES (1, N'Россия', 500, 5000)
INSERT [dbo].[strani] ([id], [nazvanie_strani], [stoimosti_transportnih_uslug], [stoimosti_visi]) VALUES (2, N'Бразилия', 1000, 10000)
INSERT [dbo].[strani] ([id], [nazvanie_strani], [stoimosti_transportnih_uslug], [stoimosti_visi]) VALUES (3, N'Беларусь', 250, 2500)
INSERT [dbo].[strani] ([id], [nazvanie_strani], [stoimosti_transportnih_uslug], [stoimosti_visi]) VALUES (4, N'Казахстан', 789, 7890)
INSERT [dbo].[strani] ([id], [nazvanie_strani], [stoimosti_transportnih_uslug], [stoimosti_visi]) VALUES (5, N'Чеченская Республика', 999, 9990)
SET IDENTITY_INSERT [dbo].[strani] OFF
GO
SET IDENTITY_INSERT [dbo].[VidiUslug] ON 

INSERT [dbo].[VidiUslug] ([id], [Nazvanie], [stoimost]) VALUES (1, N'Отдых', 250.0000)
INSERT [dbo].[VidiUslug] ([id], [Nazvanie], [stoimost]) VALUES (2, N'Лечение', 800.0000)
INSERT [dbo].[VidiUslug] ([id], [Nazvanie], [stoimost]) VALUES (3, N'Путешествие', 900.0000)
INSERT [dbo].[VidiUslug] ([id], [Nazvanie], [stoimost]) VALUES (4, N'Научное исследование', 100.0000)
INSERT [dbo].[VidiUslug] ([id], [Nazvanie], [stoimost]) VALUES (5, N'Профилактика', 1000.0000)
SET IDENTITY_INSERT [dbo].[VidiUslug] OFF
GO
ALTER TABLE [dbo].[client]  WITH CHECK ADD FOREIGN KEY([passport])
REFERENCES [dbo].[passporta] ([id])
GO
ALTER TABLE [dbo].[marshruti]  WITH CHECK ADD FOREIGN KEY([strana_pribitiya])
REFERENCES [dbo].[strani] ([id])
GO
ALTER TABLE [dbo].[marshruti]  WITH CHECK ADD FOREIGN KEY([usluga])
REFERENCES [dbo].[VidiUslug] ([id])
GO
ALTER TABLE [dbo].[poezdki]  WITH CHECK ADD FOREIGN KEY([Klient])
REFERENCES [dbo].[client] ([id])
GO
ALTER TABLE [dbo].[poezdki]  WITH CHECK ADD FOREIGN KEY([Marshrut])
REFERENCES [dbo].[marshruti] ([id])
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "client"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 119
               Right = 212
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "marshruti"
            Begin Extent = 
               Top = 6
               Left = 250
               Bottom = 136
               Right = 424
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "passporta"
            Begin Extent = 
               Top = 6
               Left = 462
               Bottom = 136
               Right = 649
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "poezdki"
            Begin Extent = 
               Top = 152
               Left = 670
               Bottom = 282
               Right = 897
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "strani"
            Begin Extent = 
               Top = 6
               Left = 952
               Bottom = 136
               Right = 1194
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "VidiUslug"
            Begin Extent = 
               Top = 6
               Left = 1232
               Bottom = 119
               Right = 1406
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Ali' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'as = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "client"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 119
               Right = 212
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "marshruti"
            Begin Extent = 
               Top = 6
               Left = 250
               Bottom = 136
               Right = 424
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "passporta"
            Begin Extent = 
               Top = 6
               Left = 462
               Bottom = 136
               Right = 649
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "poezdki"
            Begin Extent = 
               Top = 6
               Left = 687
               Bottom = 136
               Right = 914
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "strani"
            Begin Extent = 
               Top = 6
               Left = 952
               Bottom = 136
               Right = 1194
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "VidiUslug"
            Begin Extent = 
               Top = 6
               Left = 1232
               Bottom = 119
               Right = 1406
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N' = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_2'
GO
USE [master]
GO
ALTER DATABASE [traffic] SET  READ_WRITE 
GO
