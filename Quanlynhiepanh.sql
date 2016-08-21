USE [master]
GO
/****** Object:  Database [Quanlynhiepanh]    Script Date: 20/08/2016 3:51:07 CH ******/
CREATE DATABASE [Quanlynhiepanh]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Quanlynhiepanh', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\Quanlynhiepanh.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Quanlynhiepanh_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\Quanlynhiepanh_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Quanlynhiepanh] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Quanlynhiepanh].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Quanlynhiepanh] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Quanlynhiepanh] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Quanlynhiepanh] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Quanlynhiepanh] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Quanlynhiepanh] SET ARITHABORT OFF 
GO
ALTER DATABASE [Quanlynhiepanh] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Quanlynhiepanh] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Quanlynhiepanh] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Quanlynhiepanh] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Quanlynhiepanh] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Quanlynhiepanh] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Quanlynhiepanh] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Quanlynhiepanh] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Quanlynhiepanh] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Quanlynhiepanh] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Quanlynhiepanh] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Quanlynhiepanh] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Quanlynhiepanh] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Quanlynhiepanh] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Quanlynhiepanh] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Quanlynhiepanh] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Quanlynhiepanh] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Quanlynhiepanh] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Quanlynhiepanh] SET  MULTI_USER 
GO
ALTER DATABASE [Quanlynhiepanh] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Quanlynhiepanh] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Quanlynhiepanh] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Quanlynhiepanh] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [Quanlynhiepanh]
GO
/****** Object:  Table [dbo].[Album]    Script Date: 20/08/2016 3:51:07 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Album](
	[Maalbum] [nchar](5) NOT NULL,
	[Tenalbum] [nvarchar](50) NULL,
	[Mathanhvien] [nchar](5) NULL,
 CONSTRAINT [PK_Album] PRIMARY KEY CLUSTERED 
(
	[Maalbum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Hinhanh]    Script Date: 20/08/2016 3:51:07 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Hinhanh](
	[Mahinhanh] [nchar](5) NOT NULL,
	[Tenhinhanh] [nvarchar](50) NULL,
	[Maalbum] [nchar](5) NULL,
	[Ngayluu] [datetime] NULL,
	[Tieucu] [char](10) NULL,
	[Ghichu] [nvarchar](50) NULL,
 CONSTRAINT [PK_Hinhanh] PRIMARY KEY CLUSTERED 
(
	[Mahinhanh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Thanhvien]    Script Date: 20/08/2016 3:51:07 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Thanhvien](
	[Mathanhvien] [nchar](5) NOT NULL,
	[Ho] [nvarchar](50) NULL,
	[Ten] [nvarchar](50) NULL,
	[SDT] [int] NULL,
	[Diachi] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
 CONSTRAINT [PK_Thanhvien] PRIMARY KEY CLUSTERED 
(
	[Mathanhvien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[Thanhvien] ([Mathanhvien], [Ho], [Ten], [SDT], [Diachi], [Email]) VALUES (N'     ', N'', N'', 0, N'', N'')
INSERT [dbo].[Thanhvien] ([Mathanhvien], [Ho], [Ten], [SDT], [Diachi], [Email]) VALUES (N'1    ', N'1', N'1', 1, N'1', N'1')
INSERT [dbo].[Thanhvien] ([Mathanhvien], [Ho], [Ten], [SDT], [Diachi], [Email]) VALUES (N'12312', N'met', NULL, NULL, NULL, NULL)
INSERT [dbo].[Thanhvien] ([Mathanhvien], [Ho], [Ten], [SDT], [Diachi], [Email]) VALUES (N'NA001', N'Nguyễn ', N'Bé', 935123456, N'371 Nguyễn Kiệm', N'be_nguyen@gmail.com')
INSERT [dbo].[Thanhvien] ([Mathanhvien], [Ho], [Ten], [SDT], [Diachi], [Email]) VALUES (N'NA002', N'Trần ', N'Thị', 983312345, N'372 Nguyễn Kiệm', N'thi_tran@gmail.com')
INSERT [dbo].[Thanhvien] ([Mathanhvien], [Ho], [Ten], [SDT], [Diachi], [Email]) VALUES (N'NA003', N'Quách', N'Tĩnh', 123569784, N'373 Nguyễn Kiệm', N'tinh_quach@gmail.com')
INSERT [dbo].[Thanhvien] ([Mathanhvien], [Ho], [Ten], [SDT], [Diachi], [Email]) VALUES (N'NA004', N'Nguyễn', N'Quang Sơn', 1545454545, N'nguyenkiem', N'son@gmail.com')
INSERT [dbo].[Thanhvien] ([Mathanhvien], [Ho], [Ten], [SDT], [Diachi], [Email]) VALUES (N'NA005', N'Văn', N'Thị', 1200222555, N'100 Phan Văn Trị', N'thi_van77@gmail.com')
INSERT [dbo].[Thanhvien] ([Mathanhvien], [Ho], [Ten], [SDT], [Diachi], [Email]) VALUES (N'NA006', N'NGuyễn', NULL, NULL, NULL, NULL)
INSERT [dbo].[Thanhvien] ([Mathanhvien], [Ho], [Ten], [SDT], [Diachi], [Email]) VALUES (N'NA112', N'Đào', N'Thị', 212122545, N'Phan dang luu', N'thidao@yahoo.com')
INSERT [dbo].[Thanhvien] ([Mathanhvien], [Ho], [Ten], [SDT], [Diachi], [Email]) VALUES (N'NA113', N'thêm ', N'dùng thủ tục', 123121222, N'nguyễn thượng hiền', N'thanhcong@gmail.com')
/****** Object:  StoredProcedure [dbo].[uspThemthanhvien]    Script Date: 20/08/2016 3:51:07 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[uspThemthanhvien]

@Mathanhvien nchar (5),
@Ho nvarchar(50),
@Ten nvarchar(50),
@SDT int,
@Diachi nvarchar(50),
@Email nvarchar(50)

AS
INSERT INTO Thanhvien (Mathanhvien,Ho,Ten,SDT,Diachi,Email) VALUES (@Mathanhvien,@Ho,@Ten,@SDT,@Diachi,@Email)

GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã thành viên' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Thanhvien', @level2type=N'COLUMN',@level2name=N'Mathanhvien'
GO
USE [master]
GO
ALTER DATABASE [Quanlynhiepanh] SET  READ_WRITE 
GO
