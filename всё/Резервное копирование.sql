USE [master]
GO
/****** Object:  Database [DEM]    Script Date: 04.06.2024 17:08:35 ******/
CREATE DATABASE [DEM]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DEM', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\DEM.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DEM_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\DEM_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [DEM] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DEM].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DEM] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DEM] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DEM] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DEM] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DEM] SET ARITHABORT OFF 
GO
ALTER DATABASE [DEM] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DEM] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DEM] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DEM] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DEM] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DEM] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DEM] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DEM] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DEM] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DEM] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DEM] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DEM] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DEM] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DEM] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DEM] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DEM] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DEM] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DEM] SET RECOVERY FULL 
GO
ALTER DATABASE [DEM] SET  MULTI_USER 
GO
ALTER DATABASE [DEM] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DEM] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DEM] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DEM] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DEM] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DEM] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'DEM', N'ON'
GO
ALTER DATABASE [DEM] SET QUERY_STORE = ON
GO
ALTER DATABASE [DEM] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [DEM]
GO
/****** Object:  Table [dbo].[DataComments]    Script Date: 04.06.2024 17:08:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DataComments](
	[commentID] [int] IDENTITY(1,1) NOT NULL,
	[message] [nvarchar](max) NOT NULL,
	[masterID] [int] NOT NULL,
	[requestID] [int] NOT NULL,
 CONSTRAINT [PK_DataComments] PRIMARY KEY CLUSTERED 
(
	[commentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DataRequests]    Script Date: 04.06.2024 17:08:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DataRequests](
	[requestID] [int] IDENTITY(1,1) NOT NULL,
	[startDate] [date] NOT NULL,
	[id_orgTechType] [int] NOT NULL,
	[orgTechModel] [nvarchar](max) NOT NULL,
	[id_problemDescryption] [int] NOT NULL,
	[id_requestStatus] [int] NOT NULL,
	[completionDate] [date] NULL,
	[repairParts] [nvarchar](max) NULL,
	[masterID] [int] NULL,
	[clientID] [int] NOT NULL,
 CONSTRAINT [PK_DataRequests] PRIMARY KEY CLUSTERED 
(
	[requestID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DataUsers]    Script Date: 04.06.2024 17:08:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DataUsers](
	[userID] [int] IDENTITY(1,1) NOT NULL,
	[fio] [nvarchar](max) NOT NULL,
	[phone] [nvarchar](max) NOT NULL,
	[login] [nvarchar](max) NOT NULL,
	[password] [nvarchar](max) NOT NULL,
	[id_type] [int] NOT NULL,
 CONSTRAINT [PK_DataUsers] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrgTechTypes]    Script Date: 04.06.2024 17:08:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrgTechTypes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_OrgTechTypes] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProblemDescryptions]    Script Date: 04.06.2024 17:08:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProblemDescryptions](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_ProblemDescryptions] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RequestStatuses]    Script Date: 04.06.2024 17:08:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RequestStatuses](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_RequestStatuses] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Types]    Script Date: 04.06.2024 17:08:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Types](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Types] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[DataComments] ON 

INSERT [dbo].[DataComments] ([commentID], [message], [masterID], [requestID]) VALUES (1, N'Интересно...', 2, 1)
INSERT [dbo].[DataComments] ([commentID], [message], [masterID], [requestID]) VALUES (2, N'Будем разбираться!', 3, 2)
INSERT [dbo].[DataComments] ([commentID], [message], [masterID], [requestID]) VALUES (3, N'Сделаем всё на высшем уровне!', 3, 3)
SET IDENTITY_INSERT [dbo].[DataComments] OFF
GO
SET IDENTITY_INSERT [dbo].[DataRequests] ON 

INSERT [dbo].[DataRequests] ([requestID], [startDate], [id_orgTechType], [orgTechModel], [id_problemDescryption], [id_requestStatus], [completionDate], [repairParts], [masterID], [clientID]) VALUES (1, CAST(N'2023-06-06' AS Date), 1, N'DEXP Aquilon O286', 2, 1, NULL, NULL, 2, 7)
INSERT [dbo].[DataRequests] ([requestID], [startDate], [id_orgTechType], [orgTechModel], [id_problemDescryption], [id_requestStatus], [completionDate], [repairParts], [masterID], [clientID]) VALUES (2, CAST(N'2023-05-05' AS Date), 1, N'DEXP Atlas H388', 2, 1, NULL, NULL, 3, 8)
INSERT [dbo].[DataRequests] ([requestID], [startDate], [id_orgTechType], [orgTechModel], [id_problemDescryption], [id_requestStatus], [completionDate], [repairParts], [masterID], [clientID]) VALUES (3, CAST(N'2022-07-07' AS Date), 2, N'MSI GF76 Katana 11UC-879XRU черный', 1, 2, CAST(N'2023-01-01' AS Date), NULL, 3, 9)
INSERT [dbo].[DataRequests] ([requestID], [startDate], [id_orgTechType], [orgTechModel], [id_problemDescryption], [id_requestStatus], [completionDate], [repairParts], [masterID], [clientID]) VALUES (4, CAST(N'2023-08-02' AS Date), 2, N'MSI Modern 15 B12M-211RU черный', 1, 3, NULL, NULL, NULL, 8)
INSERT [dbo].[DataRequests] ([requestID], [startDate], [id_orgTechType], [orgTechModel], [id_problemDescryption], [id_requestStatus], [completionDate], [repairParts], [masterID], [clientID]) VALUES (5, CAST(N'2023-08-02' AS Date), 3, N'HP LaserJet Pro M404dn', 3, 3, NULL, NULL, NULL, 9)
SET IDENTITY_INSERT [dbo].[DataRequests] OFF
GO
SET IDENTITY_INSERT [dbo].[DataUsers] ON 

INSERT [dbo].[DataUsers] ([userID], [fio], [phone], [login], [password], [id_type]) VALUES (1, N'Носов Иван Михайлович', N'89210563128', N'login1', N'pass1', 3)
INSERT [dbo].[DataUsers] ([userID], [fio], [phone], [login], [password], [id_type]) VALUES (2, N'Ильин Александр Андреевич', N'89535078985', N'login2', N'pass2', 2)
INSERT [dbo].[DataUsers] ([userID], [fio], [phone], [login], [password], [id_type]) VALUES (3, N'Никифоров Иван Дмитриевич', N'89210673849', N'login3', N'pass3', 2)
INSERT [dbo].[DataUsers] ([userID], [fio], [phone], [login], [password], [id_type]) VALUES (4, N'Елисеев Артём Леонидович', N'89990563748', N'login4', N'pass4', 4)
INSERT [dbo].[DataUsers] ([userID], [fio], [phone], [login], [password], [id_type]) VALUES (5, N'Титов Сергей Кириллович', N'89994563847', N'login5', N'pass5', 4)
INSERT [dbo].[DataUsers] ([userID], [fio], [phone], [login], [password], [id_type]) VALUES (6, N'Григорьев Семён Викторович', N'89219567849', N'login11', N'pass11', 1)
INSERT [dbo].[DataUsers] ([userID], [fio], [phone], [login], [password], [id_type]) VALUES (7, N'Сорокин Дмитрий Ильич', N'89219567841', N'login12', N'pass12', 1)
INSERT [dbo].[DataUsers] ([userID], [fio], [phone], [login], [password], [id_type]) VALUES (8, N'Белоусов Егор Ярославович', N'89219567842', N'login13', N'pass13', 1)
INSERT [dbo].[DataUsers] ([userID], [fio], [phone], [login], [password], [id_type]) VALUES (9, N'Суслов Михаил Александрович', N'89219567843', N'login14', N'pass14', 1)
INSERT [dbo].[DataUsers] ([userID], [fio], [phone], [login], [password], [id_type]) VALUES (10, N'Васильев Вячеслав Александрович', N'89219567844', N'login15', N'pass15', 2)
SET IDENTITY_INSERT [dbo].[DataUsers] OFF
GO
SET IDENTITY_INSERT [dbo].[OrgTechTypes] ON 

INSERT [dbo].[OrgTechTypes] ([id], [name]) VALUES (1, N'Компьютер')
INSERT [dbo].[OrgTechTypes] ([id], [name]) VALUES (2, N'Ноутбук')
INSERT [dbo].[OrgTechTypes] ([id], [name]) VALUES (3, N'Принтер')
SET IDENTITY_INSERT [dbo].[OrgTechTypes] OFF
GO
SET IDENTITY_INSERT [dbo].[ProblemDescryptions] ON 

INSERT [dbo].[ProblemDescryptions] ([id], [name]) VALUES (1, N'Выключается')
INSERT [dbo].[ProblemDescryptions] ([id], [name]) VALUES (2, N'Перестал работать')
INSERT [dbo].[ProblemDescryptions] ([id], [name]) VALUES (3, N'Перестала включаться')
SET IDENTITY_INSERT [dbo].[ProblemDescryptions] OFF
GO
SET IDENTITY_INSERT [dbo].[RequestStatuses] ON 

INSERT [dbo].[RequestStatuses] ([id], [name]) VALUES (1, N'В процессе ремонта')
INSERT [dbo].[RequestStatuses] ([id], [name]) VALUES (2, N'Готова к выдаче')
INSERT [dbo].[RequestStatuses] ([id], [name]) VALUES (3, N'Новая заявка')
SET IDENTITY_INSERT [dbo].[RequestStatuses] OFF
GO
SET IDENTITY_INSERT [dbo].[Types] ON 

INSERT [dbo].[Types] ([id], [name]) VALUES (1, N'Заказчик')
INSERT [dbo].[Types] ([id], [name]) VALUES (2, N'Мастер')
INSERT [dbo].[Types] ([id], [name]) VALUES (3, N'Менеджер')
INSERT [dbo].[Types] ([id], [name]) VALUES (4, N'Оператор')
SET IDENTITY_INSERT [dbo].[Types] OFF
GO
ALTER TABLE [dbo].[DataComments]  WITH CHECK ADD  CONSTRAINT [FK_DataComments_DataRequests] FOREIGN KEY([requestID])
REFERENCES [dbo].[DataRequests] ([requestID])
GO
ALTER TABLE [dbo].[DataComments] CHECK CONSTRAINT [FK_DataComments_DataRequests]
GO
ALTER TABLE [dbo].[DataComments]  WITH CHECK ADD  CONSTRAINT [FK_DataComments_DataUsers] FOREIGN KEY([masterID])
REFERENCES [dbo].[DataUsers] ([userID])
GO
ALTER TABLE [dbo].[DataComments] CHECK CONSTRAINT [FK_DataComments_DataUsers]
GO
ALTER TABLE [dbo].[DataRequests]  WITH CHECK ADD  CONSTRAINT [FK_DataRequests_DataUsers] FOREIGN KEY([clientID])
REFERENCES [dbo].[DataUsers] ([userID])
GO
ALTER TABLE [dbo].[DataRequests] CHECK CONSTRAINT [FK_DataRequests_DataUsers]
GO
ALTER TABLE [dbo].[DataRequests]  WITH CHECK ADD  CONSTRAINT [FK_DataRequests_DataUsers1] FOREIGN KEY([masterID])
REFERENCES [dbo].[DataUsers] ([userID])
GO
ALTER TABLE [dbo].[DataRequests] CHECK CONSTRAINT [FK_DataRequests_DataUsers1]
GO
ALTER TABLE [dbo].[DataRequests]  WITH CHECK ADD  CONSTRAINT [FK_DataRequests_OrgTechTypes] FOREIGN KEY([id_orgTechType])
REFERENCES [dbo].[OrgTechTypes] ([id])
GO
ALTER TABLE [dbo].[DataRequests] CHECK CONSTRAINT [FK_DataRequests_OrgTechTypes]
GO
ALTER TABLE [dbo].[DataRequests]  WITH CHECK ADD  CONSTRAINT [FK_DataRequests_ProblemDescryptions] FOREIGN KEY([id_problemDescryption])
REFERENCES [dbo].[ProblemDescryptions] ([id])
GO
ALTER TABLE [dbo].[DataRequests] CHECK CONSTRAINT [FK_DataRequests_ProblemDescryptions]
GO
ALTER TABLE [dbo].[DataRequests]  WITH CHECK ADD  CONSTRAINT [FK_DataRequests_RequestStatuses] FOREIGN KEY([id_requestStatus])
REFERENCES [dbo].[RequestStatuses] ([id])
GO
ALTER TABLE [dbo].[DataRequests] CHECK CONSTRAINT [FK_DataRequests_RequestStatuses]
GO
ALTER TABLE [dbo].[DataUsers]  WITH CHECK ADD  CONSTRAINT [FK_DataUsers_Types] FOREIGN KEY([id_type])
REFERENCES [dbo].[Types] ([id])
GO
ALTER TABLE [dbo].[DataUsers] CHECK CONSTRAINT [FK_DataUsers_Types]
GO
USE [master]
GO
ALTER DATABASE [DEM] SET  READ_WRITE 
GO
