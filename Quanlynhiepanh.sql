USE [master]
GO
/****** Object:  Database [Quanlynhiepanh]    Script Date: 9/9/2016 4:23:56 PM ******/
CREATE DATABASE [Quanlynhiepanh]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Quanlynhiepanh', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\Quanlynhiepanh.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Quanlynhiepanh_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\Quanlynhiepanh_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Quanlynhiepanh] SET COMPATIBILITY_LEVEL = 120
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
ALTER DATABASE [Quanlynhiepanh] SET AUTO_CLOSE ON 
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
ALTER DATABASE [Quanlynhiepanh] SET  ENABLE_BROKER 
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
ALTER DATABASE [Quanlynhiepanh] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Quanlynhiepanh]
GO
/****** Object:  Table [dbo].[Album]    Script Date: 9/9/2016 4:23:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Album](
	[Maalbum] [nchar](5) NOT NULL,
	[Tenalbum] [nvarchar](50) NULL,
 CONSTRAINT [PK_Album] PRIMARY KEY CLUSTERED 
(
	[Maalbum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Hinhanh]    Script Date: 9/9/2016 4:23:56 PM ******/
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
	[Hinhanh] [varchar](max) NULL,
	[Mathanhvien] [nchar](5) NULL,
 CONSTRAINT [PK_Hinhanh] PRIMARY KEY CLUSTERED 
(
	[Mahinhanh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Thanhvien]    Script Date: 9/9/2016 4:23:56 PM ******/
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
INSERT [dbo].[Album] ([Maalbum], [Tenalbum]) VALUES (N'AB001', N'Hoa')
INSERT [dbo].[Album] ([Maalbum], [Tenalbum]) VALUES (N'AB002', N'Động vật')
INSERT [dbo].[Album] ([Maalbum], [Tenalbum]) VALUES (N'AB003', N'Phong cảnh')
INSERT [dbo].[Hinhanh] ([Mahinhanh], [Tenhinhanh], [Maalbum], [Ngayluu], [Tieucu], [Ghichu], [Hinhanh], [Mathanhvien]) VALUES (N'11111', N'Cây mai', N'ab003', NULL, N'mot       ', N'chụp lúc chiều tàn', N'', N'NA001')
INSERT [dbo].[Hinhanh] ([Mahinhanh], [Tenhinhanh], [Maalbum], [Ngayluu], [Tieucu], [Ghichu], [Hinhanh], [Mathanhvien]) VALUES (N'12345', N'Hoa hồng đen', N'ab001', NULL, N'          ', N'hình lỗi bóng', NULL, N'NA002')
INSERT [dbo].[Thanhvien] ([Mathanhvien], [Ho], [Ten], [SDT], [Diachi], [Email]) VALUES (N'NA001', N'Nguyễn Quang', N'Sơn', 1208002008, N'371 Nguyễn Kiệm, Quận Gò vấp', N'quangson002008@gmail.com')
INSERT [dbo].[Thanhvien] ([Mathanhvien], [Ho], [Ten], [SDT], [Diachi], [Email]) VALUES (N'NA002', N'Nguyễn ', N'Anh', 912345687, N'300 Nguyễn Thái Sơn', N'anhnguyen@gmail.com')
INSERT [dbo].[Thanhvien] ([Mathanhvien], [Ho], [Ten], [SDT], [Diachi], [Email]) VALUES (N'NA003', N'Quách', N'Tĩnh', 1234568888, N'105 Phan Văn Trị phường 5 , quận gò vấp', N'tinhquach@gmail.com')
INSERT [dbo].[Thanhvien] ([Mathanhvien], [Ho], [Ten], [SDT], [Diachi], [Email]) VALUES (N'NA004', N'Trần', N'Phong', 936555222, N'215 Bạch Đằng, quận Tân Bình', N'phongtran23@gmail.com')
INSERT [dbo].[Thanhvien] ([Mathanhvien], [Ho], [Ten], [SDT], [Diachi], [Email]) VALUES (N'NA005', N'Nguyễn', N'Lâm', 988444888, N'200 Hoàng Minh Giám, quận Phú Nhuận', N'lamnguyen9999@gmail.com')
INSERT [dbo].[Thanhvien] ([Mathanhvien], [Ho], [Ten], [SDT], [Diachi], [Email]) VALUES (N'NA006', N'Nguyễn', N'Thành', NULL, N'300 hoàng minh giám', N'thanhnguyenn@gmail.com')
INSERT [dbo].[Thanhvien] ([Mathanhvien], [Ho], [Ten], [SDT], [Diachi], [Email]) VALUES (N'Na999', N'Trần Thị', N'BÉ', 94499477, N'12 nguyễn thái sơn', N'')
ALTER TABLE [dbo].[Hinhanh]  WITH CHECK ADD  CONSTRAINT [FK_Hinhanh_Album] FOREIGN KEY([Maalbum])
REFERENCES [dbo].[Album] ([Maalbum])
GO
ALTER TABLE [dbo].[Hinhanh] CHECK CONSTRAINT [FK_Hinhanh_Album]
GO
ALTER TABLE [dbo].[Hinhanh]  WITH CHECK ADD  CONSTRAINT [FK_Hinhanh_Thanhvien] FOREIGN KEY([Mathanhvien])
REFERENCES [dbo].[Thanhvien] ([Mathanhvien])
GO
ALTER TABLE [dbo].[Hinhanh] CHECK CONSTRAINT [FK_Hinhanh_Thanhvien]
GO
/****** Object:  StoredProcedure [dbo].[uspThemthanhvien]    Script Date: 9/9/2016 4:23:56 PM ******/
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
/****** Object:  StoredProcedure [dbo].[uspXoathanhvien]    Script Date: 9/9/2016 4:23:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[uspXoathanhvien]
@mathanhvien nchar (5)
AS
DELETE FROM Thanhvien
WHERE Mathanhvien=@mathanhvien


GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã thành viên' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Thanhvien', @level2type=N'COLUMN',@level2name=N'Mathanhvien'
GO
USE [master]
GO
ALTER DATABASE [Quanlynhiepanh] SET  READ_WRITE 
GO
