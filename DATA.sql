USE [master]
GO
/****** Object:  Database [QLUser]    Script Date: 29/10/2020 16:53:36 ******/
CREATE DATABASE [QLUser]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QLUser', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\QLUser.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'QLUser_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\QLUser_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [QLUser] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QLUser].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QLUser] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QLUser] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QLUser] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QLUser] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QLUser] SET ARITHABORT OFF 
GO
ALTER DATABASE [QLUser] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QLUser] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QLUser] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QLUser] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QLUser] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QLUser] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QLUser] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QLUser] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QLUser] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QLUser] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QLUser] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QLUser] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QLUser] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QLUser] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QLUser] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QLUser] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QLUser] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QLUser] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QLUser] SET  MULTI_USER 
GO
ALTER DATABASE [QLUser] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QLUser] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QLUser] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QLUser] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [QLUser] SET DELAYED_DURABILITY = DISABLED 
GO
USE [QLUser]
GO
/****** Object:  Table [dbo].[Friend]    Script Date: 29/10/2020 16:53:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Friend](
	[NickName] [nvarchar](50) NOT NULL,
	[Friend] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Friend] PRIMARY KEY CLUSTERED 
(
	[NickName] ASC,
	[Friend] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[GroupMessage]    Script Date: 29/10/2020 16:53:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GroupMessage](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[GroupName] [nvarchar](50) NOT NULL,
	[NickName] [nvarchar](50) NOT NULL,
	[ContentMessage] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_GroupMessage] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Groups]    Script Date: 29/10/2020 16:53:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Groups](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[GroupName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Group] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MemberGroup]    Script Date: 29/10/2020 16:53:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberGroup](
	[GroupName] [nvarchar](50) NOT NULL,
	[NickName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_MemberGroup] PRIMARY KEY CLUSTERED 
(
	[GroupName] ASC,
	[NickName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MessageFriend]    Script Date: 29/10/2020 16:53:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MessageFriend](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NickName] [nvarchar](50) NOT NULL,
	[Friend] [nvarchar](50) NOT NULL,
	[ContentMessage] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_MessageFriend] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[QLUser]    Script Date: 29/10/2020 16:53:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QLUser](
	[Email] [nvarchar](50) NOT NULL,
	[NickName] [nvarchar](50) NULL,
	[MatKhau] [nvarchar](50) NOT NULL,
	[Sđt] [nvarchar](50) NULL,
 CONSTRAINT [PK_QLUser] PRIMARY KEY CLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  UserDefinedFunction [dbo].[Fn_findFriend]    Script Date: 29/10/2020 16:53:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Function [dbo].[Fn_findFriend](@nickName nvarchar(50))
returns table return
	select NickName from QLUser where NickName like ('%'+@nickName+'%') AND NickName!=@nickName
GO
/****** Object:  UserDefinedFunction [dbo].[Fn_findGroup]    Script Date: 29/10/2020 16:53:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Function [dbo].[Fn_findGroup](@group nvarchar(50))
returns table return
	select GroupName from Groups where GroupName like ('%'+@group+'%')
GO
INSERT [dbo].[Friend] ([NickName], [Friend]) VALUES (N'a', N'anhquang')
INSERT [dbo].[Friend] ([NickName], [Friend]) VALUES (N'a', N'aquang123')
INSERT [dbo].[Friend] ([NickName], [Friend]) VALUES (N'anhquang', N'aquang123')
INSERT [dbo].[Friend] ([NickName], [Friend]) VALUES (N'aquang123', N'a')
INSERT [dbo].[Friend] ([NickName], [Friend]) VALUES (N'aquang123', N'anhquang')
SET IDENTITY_INSERT [dbo].[GroupMessage] ON 

INSERT [dbo].[GroupMessage] ([ID], [GroupName], [NickName], [ContentMessage]) VALUES (1, N'abc', N'a', N'aaaaaaaaaaaaa')
INSERT [dbo].[GroupMessage] ([ID], [GroupName], [NickName], [ContentMessage]) VALUES (3, N'abc', N'aquang123', N'bbbbbbbbbbbbb')
INSERT [dbo].[GroupMessage] ([ID], [GroupName], [NickName], [ContentMessage]) VALUES (6, N'abc', N'aquang123', N'alo')
INSERT [dbo].[GroupMessage] ([ID], [GroupName], [NickName], [ContentMessage]) VALUES (7, N'abc', N'a', N'ok')
SET IDENTITY_INSERT [dbo].[GroupMessage] OFF
SET IDENTITY_INSERT [dbo].[Groups] ON 

INSERT [dbo].[Groups] ([ID], [GroupName]) VALUES (4, N' bombom')
INSERT [dbo].[Groups] ([ID], [GroupName]) VALUES (1, N'abc')
INSERT [dbo].[Groups] ([ID], [GroupName]) VALUES (3, N'BinhPhuoc')
INSERT [dbo].[Groups] ([ID], [GroupName]) VALUES (2, N'BomBo')
SET IDENTITY_INSERT [dbo].[Groups] OFF
INSERT [dbo].[MemberGroup] ([GroupName], [NickName]) VALUES (N' bombom', N'a')
INSERT [dbo].[MemberGroup] ([GroupName], [NickName]) VALUES (N'abc', N'a')
INSERT [dbo].[MemberGroup] ([GroupName], [NickName]) VALUES (N'abc', N'aquang123')
INSERT [dbo].[MemberGroup] ([GroupName], [NickName]) VALUES (N'BinhPhuoc', N'a')
INSERT [dbo].[MemberGroup] ([GroupName], [NickName]) VALUES (N'BomBo', N'a')
INSERT [dbo].[MemberGroup] ([GroupName], [NickName]) VALUES (N'BomBo', N'aquang123')
SET IDENTITY_INSERT [dbo].[MessageFriend] ON 

INSERT [dbo].[MessageFriend] ([ID], [NickName], [Friend], [ContentMessage]) VALUES (1, N'anhquang', N'aquang123', N'alo ')
INSERT [dbo].[MessageFriend] ([ID], [NickName], [Friend], [ContentMessage]) VALUES (2, N'aquang123', N'anhquang', N'ok2')
INSERT [dbo].[MessageFriend] ([ID], [NickName], [Friend], [ContentMessage]) VALUES (3, N'a', N'aquang123', N'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
INSERT [dbo].[MessageFriend] ([ID], [NickName], [Friend], [ContentMessage]) VALUES (4, N'aquang123', N'a', N'bbbbbbbbbbbbbbbbbbbbbbbbbb')
INSERT [dbo].[MessageFriend] ([ID], [NickName], [Friend], [ContentMessage]) VALUES (5, N'a', N'aquang123', N'ccccccccccccccccc')
INSERT [dbo].[MessageFriend] ([ID], [NickName], [Friend], [ContentMessage]) VALUES (6, N'aquang123', N'a', N'ddddddddddddddddddddd')
INSERT [dbo].[MessageFriend] ([ID], [NickName], [Friend], [ContentMessage]) VALUES (7, N'a', N'b', N'aquang123')
INSERT [dbo].[MessageFriend] ([ID], [NickName], [Friend], [ContentMessage]) VALUES (8, N'a', N'aquang123', N'alo')
INSERT [dbo].[MessageFriend] ([ID], [NickName], [Friend], [ContentMessage]) VALUES (9, N'a', N'aquang123', N'alo')
INSERT [dbo].[MessageFriend] ([ID], [NickName], [Friend], [ContentMessage]) VALUES (10, N'a', N'aquang123', N'alo')
INSERT [dbo].[MessageFriend] ([ID], [NickName], [Friend], [ContentMessage]) VALUES (11, N'a', N'aquang123', N'alo')
INSERT [dbo].[MessageFriend] ([ID], [NickName], [Friend], [ContentMessage]) VALUES (12, N'aquang123', N'a', N'ok')
INSERT [dbo].[MessageFriend] ([ID], [NickName], [Friend], [ContentMessage]) VALUES (13, N'aquang123', N'a', N'ok')
INSERT [dbo].[MessageFriend] ([ID], [NickName], [Friend], [ContentMessage]) VALUES (14, N'aquang123', N'/a', N'??')
INSERT [dbo].[MessageFriend] ([ID], [NickName], [Friend], [ContentMessage]) VALUES (15, N'aquang123', N'a', N'aaaaaa')
INSERT [dbo].[MessageFriend] ([ID], [NickName], [Friend], [ContentMessage]) VALUES (16, N'aquang123', N'a', N'aaaaa')
INSERT [dbo].[MessageFriend] ([ID], [NickName], [Friend], [ContentMessage]) VALUES (17, N'a', N'aquang123', N'alo')
INSERT [dbo].[MessageFriend] ([ID], [NickName], [Friend], [ContentMessage]) VALUES (18, N'a', N'aquang123', N'alo')
INSERT [dbo].[MessageFriend] ([ID], [NickName], [Friend], [ContentMessage]) VALUES (19, N'anhquang', N'aquang123', N'alo alo 123')
INSERT [dbo].[MessageFriend] ([ID], [NickName], [Friend], [ContentMessage]) VALUES (20, N'a', N'aquang123', N'alo ')
INSERT [dbo].[MessageFriend] ([ID], [NickName], [Friend], [ContentMessage]) VALUES (21, N'aquang123', N'a', N'alo')
INSERT [dbo].[MessageFriend] ([ID], [NickName], [Friend], [ContentMessage]) VALUES (22, N'aquang123', N'a', N'viết tiếng việt coi')
INSERT [dbo].[MessageFriend] ([ID], [NickName], [Friend], [ContentMessage]) VALUES (23, N'a', N'aquang123', N'ơ được này')
INSERT [dbo].[MessageFriend] ([ID], [NickName], [Friend], [ContentMessage]) VALUES (24, N'a', N'aquang123', N'')
INSERT [dbo].[MessageFriend] ([ID], [NickName], [Friend], [ContentMessage]) VALUES (25, N'a', N'aquang123', N'xịn sò')
INSERT [dbo].[MessageFriend] ([ID], [NickName], [Friend], [ContentMessage]) VALUES (26, N'aquang123', N'a', N'haha')
INSERT [dbo].[MessageFriend] ([ID], [NickName], [Friend], [ContentMessage]) VALUES (27, N'aquang123', N'a', N'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
INSERT [dbo].[MessageFriend] ([ID], [NickName], [Friend], [ContentMessage]) VALUES (28, N'a', N'aquang123', N'alo')
INSERT [dbo].[MessageFriend] ([ID], [NickName], [Friend], [ContentMessage]) VALUES (29, N'aquang123', N'a', N'thấy')
INSERT [dbo].[MessageFriend] ([ID], [NickName], [Friend], [ContentMessage]) VALUES (30, N'aquang123', N'a', N'alo')
INSERT [dbo].[MessageFriend] ([ID], [NickName], [Friend], [ContentMessage]) VALUES (31, N'aquang123', N'a', N'alo')
INSERT [dbo].[MessageFriend] ([ID], [NickName], [Friend], [ContentMessage]) VALUES (32, N'aquang123', N'a', N'alo')
INSERT [dbo].[MessageFriend] ([ID], [NickName], [Friend], [ContentMessage]) VALUES (33, N'a', N'aquang123', N'ok xịn')
INSERT [dbo].[MessageFriend] ([ID], [NickName], [Friend], [ContentMessage]) VALUES (34, N'aquang123', N'a', N'alo')
INSERT [dbo].[MessageFriend] ([ID], [NickName], [Friend], [ContentMessage]) VALUES (35, N'aquang123', N'a', N'zo')
INSERT [dbo].[MessageFriend] ([ID], [NickName], [Friend], [ContentMessage]) VALUES (36, N'a', N'aquang123', N'zo')
SET IDENTITY_INSERT [dbo].[MessageFriend] OFF
INSERT [dbo].[QLUser] ([Email], [NickName], [MatKhau], [Sđt]) VALUES (N'leminhquangit@gmail.com', N'a', N'123456', NULL)
INSERT [dbo].[QLUser] ([Email], [NickName], [MatKhau], [Sđt]) VALUES (N'lquang@gmail.com', N'aquang123', N'123456', N'45689')
INSERT [dbo].[QLUser] ([Email], [NickName], [MatKhau], [Sđt]) VALUES (N'quang@gmail.com', N'anhquang', N'123', N'123344')
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Group]    Script Date: 29/10/2020 16:53:36 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Group] ON [dbo].[Groups]
(
	[GroupName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_QLUser]    Script Date: 29/10/2020 16:53:36 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_QLUser] ON [dbo].[QLUser]
(
	[NickName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Friend]  WITH CHECK ADD  CONSTRAINT [FK_Friend_QLUser1] FOREIGN KEY([NickName])
REFERENCES [dbo].[QLUser] ([NickName])
GO
ALTER TABLE [dbo].[Friend] CHECK CONSTRAINT [FK_Friend_QLUser1]
GO
ALTER TABLE [dbo].[GroupMessage]  WITH CHECK ADD  CONSTRAINT [FK_GroupMessage_Group] FOREIGN KEY([GroupName])
REFERENCES [dbo].[Groups] ([GroupName])
GO
ALTER TABLE [dbo].[GroupMessage] CHECK CONSTRAINT [FK_GroupMessage_Group]
GO
ALTER TABLE [dbo].[GroupMessage]  WITH CHECK ADD  CONSTRAINT [FK_GroupMessage_QLUser] FOREIGN KEY([NickName])
REFERENCES [dbo].[QLUser] ([NickName])
GO
ALTER TABLE [dbo].[GroupMessage] CHECK CONSTRAINT [FK_GroupMessage_QLUser]
GO
ALTER TABLE [dbo].[MemberGroup]  WITH CHECK ADD  CONSTRAINT [FK_MemberGroup_Group] FOREIGN KEY([GroupName])
REFERENCES [dbo].[Groups] ([GroupName])
GO
ALTER TABLE [dbo].[MemberGroup] CHECK CONSTRAINT [FK_MemberGroup_Group]
GO
ALTER TABLE [dbo].[MemberGroup]  WITH CHECK ADD  CONSTRAINT [FK_MemberGroup_QLUser] FOREIGN KEY([NickName])
REFERENCES [dbo].[QLUser] ([NickName])
GO
ALTER TABLE [dbo].[MemberGroup] CHECK CONSTRAINT [FK_MemberGroup_QLUser]
GO
ALTER TABLE [dbo].[MessageFriend]  WITH CHECK ADD  CONSTRAINT [FK_MessageFriend_QLUser] FOREIGN KEY([NickName])
REFERENCES [dbo].[QLUser] ([NickName])
GO
ALTER TABLE [dbo].[MessageFriend] CHECK CONSTRAINT [FK_MessageFriend_QLUser]
GO
USE [master]
GO
ALTER DATABASE [QLUser] SET  READ_WRITE 
GO
