USE [master]
GO
/****** Object:  Database [NavratanTechDB]    Script Date: 25-09-2022 23:57:23 ******/
CREATE DATABASE [NavratanTechDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'NavratanTechDB', FILENAME = N'C:\Users\Acer\NavratanTechDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'NavratanTechDB_log', FILENAME = N'C:\Users\Acer\NavratanTechDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [NavratanTechDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [NavratanTechDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [NavratanTechDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [NavratanTechDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [NavratanTechDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [NavratanTechDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [NavratanTechDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [NavratanTechDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [NavratanTechDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [NavratanTechDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [NavratanTechDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [NavratanTechDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [NavratanTechDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [NavratanTechDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [NavratanTechDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [NavratanTechDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [NavratanTechDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [NavratanTechDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [NavratanTechDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [NavratanTechDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [NavratanTechDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [NavratanTechDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [NavratanTechDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [NavratanTechDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [NavratanTechDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [NavratanTechDB] SET  MULTI_USER 
GO
ALTER DATABASE [NavratanTechDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [NavratanTechDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [NavratanTechDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [NavratanTechDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [NavratanTechDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [NavratanTechDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [NavratanTechDB] SET QUERY_STORE = OFF
GO
USE [NavratanTechDB]
GO
/****** Object:  Table [dbo].[ApplicationLog]    Script Date: 25-09-2022 23:57:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApplicationLog](
	[ApplicationLogID] [uniqueidentifier] NOT NULL,
	[LogDate] [datetime2](7) NOT NULL,
	[LogOriginator] [nvarchar](max) NULL,
	[Message] [nvarchar](max) NULL,
	[Exception] [nvarchar](max) NULL,
	[UserID] [uniqueidentifier] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 25-09-2022 23:57:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderID] [uniqueidentifier] NOT NULL,
	[ItemName] [varchar](max) NOT NULL,
	[Qty] [int] NOT NULL,
	[UserID] [uniqueidentifier] NOT NULL,
	[OrderedOn] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 25-09-2022 23:57:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserId] [uniqueidentifier] NOT NULL,
	[Username] [nvarchar](100) NOT NULL,
	[PasswordHash] [nvarchar](max) NOT NULL,
	[PasswordSalt] [nvarchar](max) NOT NULL,
	[RefreshToken] [nvarchar](max) NULL,
	[TokenCreated] [datetime2](7) NULL,
	[TokenExpires] [datetime2](7) NULL,
	[isActive] [int] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[Orders] ([OrderID], [ItemName], [Qty], [UserID], [OrderedOn]) VALUES (N'f809693b-2ff5-41c2-872c-1eec02b59acd', N'Rice', 6, N'135e1af7-885f-4d20-9f48-b66a7b8bf1f7', CAST(N'2022-09-25T23:03:42.7758840' AS DateTime2))
INSERT [dbo].[Orders] ([OrderID], [ItemName], [Qty], [UserID], [OrderedOn]) VALUES (N'9846d9a8-9e51-41d6-9090-329002b2196d', N'Pani Puri', 5, N'135e1af7-885f-4d20-9f48-b66a7b8bf1f7', CAST(N'2022-09-25T23:03:42.7759634' AS DateTime2))
INSERT [dbo].[Orders] ([OrderID], [ItemName], [Qty], [UserID], [OrderedOn]) VALUES (N'43075b4a-dc3e-4cf4-aba8-376ae1b26f82', N'Manchurian', 5, N'135e1af7-885f-4d20-9f48-b66a7b8bf1f7', CAST(N'2022-09-25T23:03:34.9821387' AS DateTime2))
INSERT [dbo].[Orders] ([OrderID], [ItemName], [Qty], [UserID], [OrderedOn]) VALUES (N'9e8a17c5-29d6-4e39-be58-4480a5cd685a', N'Roti', 3, N'135e1af7-885f-4d20-9f48-b66a7b8bf1f7', CAST(N'2022-09-25T23:03:42.7759066' AS DateTime2))
INSERT [dbo].[Orders] ([OrderID], [ItemName], [Qty], [UserID], [OrderedOn]) VALUES (N'8aad3a1f-7bb3-4008-9b15-68fc6dd1d101', N'Paneer', 5, N'135e1af7-885f-4d20-9f48-b66a7b8bf1f7', CAST(N'2022-09-25T23:03:42.7759016' AS DateTime2))
INSERT [dbo].[Orders] ([OrderID], [ItemName], [Qty], [UserID], [OrderedOn]) VALUES (N'3f3d8728-743f-4c7c-90a1-950c426bd1ac', N'Pasta', 1, N'135e1af7-885f-4d20-9f48-b66a7b8bf1f7', CAST(N'2022-09-25T23:03:42.7757375' AS DateTime2))
INSERT [dbo].[Orders] ([OrderID], [ItemName], [Qty], [UserID], [OrderedOn]) VALUES (N'9d4f3123-bf5c-446e-9c24-a50a2988e223', N'Juice', 6, N'135e1af7-885f-4d20-9f48-b66a7b8bf1f7', CAST(N'2022-09-25T23:03:42.7759303' AS DateTime2))
INSERT [dbo].[Orders] ([OrderID], [ItemName], [Qty], [UserID], [OrderedOn]) VALUES (N'141007e1-1357-48f6-bcdb-b2fe9f2c2d4a', N'Ice cream', 11, N'135e1af7-885f-4d20-9f48-b66a7b8bf1f7', CAST(N'2022-09-25T23:03:42.7759112' AS DateTime2))
INSERT [dbo].[Orders] ([OrderID], [ItemName], [Qty], [UserID], [OrderedOn]) VALUES (N'462d26e3-3ef7-4cba-9030-bc8fc8074ae4', N'Dosa', 11, N'135e1af7-885f-4d20-9f48-b66a7b8bf1f7', CAST(N'2022-09-25T23:03:42.7758120' AS DateTime2))
INSERT [dbo].[Orders] ([OrderID], [ItemName], [Qty], [UserID], [OrderedOn]) VALUES (N'f0907f0b-97ec-4bca-a467-e22e7918a452', N'Noodles', 3, N'135e1af7-885f-4d20-9f48-b66a7b8bf1f7', CAST(N'2022-09-25T23:03:37.2511669' AS DateTime2))
INSERT [dbo].[Orders] ([OrderID], [ItemName], [Qty], [UserID], [OrderedOn]) VALUES (N'e67f1aab-5d41-4f5a-93c8-ef95f4709070', N'Butter Milk', 22, N'135e1af7-885f-4d20-9f48-b66a7b8bf1f7', CAST(N'2022-09-25T23:03:42.7759510' AS DateTime2))
GO
INSERT [dbo].[User] ([UserId], [Username], [PasswordHash], [PasswordSalt], [RefreshToken], [TokenCreated], [TokenExpires], [isActive]) VALUES (N'135e1af7-885f-4d20-9f48-b66a7b8bf1f7', N'string', N'AlbSuJwlNCSjE3eWrG21iDb9vBKP/grqtzgJseYjJFW/ItAu49Gez3UgRrhAcPHILNW3qbcNakMjtG+lPh3Psw==', N'tPfYBH1F7+ZFkOO4+flmHT2BM2wu1WkTpDzCI+p2zsEvmG+absLsiINzM0wYnD/nYbBpCe7A5orhCAAjEWcvKwnQdFZd0uiqT2BNhUOkx/xX4q1rTLZDQuhGv63P994DMVioHdcVoQkO54MU6J7gb5SoyMi4aY0cj0T1CGczYJs=', N'xEQ3TIRQqkdaBlY9j5apg86AorwotwpIfouPq7peCdZ3+dU1b7i8y4B3wOgSEyPUChMkc0Mg01LVKw9ZFA8FEA==', CAST(N'2022-09-25T23:48:44.8048337' AS DateTime2), CAST(N'2022-10-02T23:48:44.8048017' AS DateTime2), 1)
INSERT [dbo].[User] ([UserId], [Username], [PasswordHash], [PasswordSalt], [RefreshToken], [TokenCreated], [TokenExpires], [isActive]) VALUES (N'3b6f2c2e-2079-4ec8-8623-c81423853f67', N'aruntahil', N'rJlAQyv7U0oDAZl9AaX3XMYPis78xFb8grP+JsLwhFm83H66a0j96WYoI3kjmCj3kZB1x68mNYJyk3zeR/UNAw==', N'8+6MwQH6fCRJHd5sAuyReGa8CQjY0TxoMsWvme268JqJ8akkZHDIwrlbQohWotlQSbWdehyVvFdsN3zOvL4yTSyHmvKkx9yt5PFukKsoinoXzsqquQPZv3oM0+KoFjQK3p0935ADIPyg3byQ+BMJiJToYpvSQjBe+FoWCwPpLQQ=', N'TQk+hLBaAYR9nhQjP0gigVJsxAwzPjS2OodOeGGLhGfQ89Df5Jcsn5uYbpteD1CtySSKYpyHryNKpvS5UDNGtQ==', CAST(N'2022-09-25T21:08:42.5786589' AS DateTime2), CAST(N'2022-10-02T21:08:42.5317178' AS DateTime2), 1)
INSERT [dbo].[User] ([UserId], [Username], [PasswordHash], [PasswordSalt], [RefreshToken], [TokenCreated], [TokenExpires], [isActive]) VALUES (N'e9f4651e-6732-44f1-87b3-ca4ba36689a0', N'Ironman', N'Y4vyRvVfMbzAkL7zlCeNx4JyxiBJdj4GJG3+idJOLSehNCAuM07ivI00cgtfSzCYhFwFAU7FYfNjsio6BD1sLA==', N'GGH4Oca9/tlu7M3x1v1PdXZVcO+a7xNYE4EbirL8WONM9qd0O8IfxfazhqDcGwn4iOOkNxhATcchCi7Zy9NClGsvm2O2FNYZmEOeLwP+nb8YxwRJKoms1OGMtrzHBBFCwYpwQ6AqdIIt0/qRZ9z1fZw5m1t0Ql/Om8u17y450bg=', N'6aQhuEUYyQJJqiUwzptBP167ILwCkY9nBW+aRGL/3iBBOSlkNsuP5oOgNl5aLjpIvD4ku0WsKJomGSxwSkgTIQ==', CAST(N'2022-09-25T23:22:11.1642456' AS DateTime2), CAST(N'2022-10-02T23:22:11.1642455' AS DateTime2), 1)
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_isActive]  DEFAULT ((1)) FOR [isActive]
GO
USE [master]
GO
ALTER DATABASE [NavratanTechDB] SET  READ_WRITE 
GO
