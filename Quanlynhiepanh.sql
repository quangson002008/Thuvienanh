if OBJECT_ID('Quanlynhiepanh', 'P') IS NOT NULL
DROP Database Quanlynhiepanh
USE [Quanlynhiepanh]
GO
/****** Object:  Table [dbo].[Album]    Script Date: 01/09/2016 9:43:18 CH ******/
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
/****** Object:  Table [dbo].[Hinhanh]    Script Date: 01/09/2016 9:43:26 CH ******/
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
/****** Object:  Table [dbo].[Thanhvien]    Script Date: 01/09/2016 9:43:26 CH ******/
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
INSERT [dbo].[Album] ([Maalbum], [Tenalbum]) VALUES (N'AB004', N'Cây cảnh')
INSERT [dbo].[Thanhvien] ([Mathanhvien], [Ho], [Ten], [SDT], [Diachi], [Email]) VALUES (N'dasdd', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Thanhvien] ([Mathanhvien], [Ho], [Ten], [SDT], [Diachi], [Email]) VALUES (N'dddd ', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Thanhvien] ([Mathanhvien], [Ho], [Ten], [SDT], [Diachi], [Email]) VALUES (N'NA001', N'Nguyễn Quang', N'Sơn', 1208002008, N'371 Nguyễn Kiệm, Quận Gò vấp', N'quangson002008@gmail.com')
INSERT [dbo].[Thanhvien] ([Mathanhvien], [Ho], [Ten], [SDT], [Diachi], [Email]) VALUES (N'NA002', N'Nguyễn ', N'Anh', 912345687, N'300 Nguyễn Thái Sơn', N'anhnguyen@gmail.com')
INSERT [dbo].[Thanhvien] ([Mathanhvien], [Ho], [Ten], [SDT], [Diachi], [Email]) VALUES (N'NA003', N'Quách', N'Tĩnh', 1234568888, N'105 Phan Văn Trị phường 5 , quận gò vấp', N'tinhquach@gmail.com')
INSERT [dbo].[Thanhvien] ([Mathanhvien], [Ho], [Ten], [SDT], [Diachi], [Email]) VALUES (N'NA004', N'Trần', N'Phong', 936555222, N'215 Bạch Đằng, quận Tân Bình', N'phongtran23@gmail.com')
INSERT [dbo].[Thanhvien] ([Mathanhvien], [Ho], [Ten], [SDT], [Diachi], [Email]) VALUES (N'NA005', N'Nguyễn', N'Lâm', 988444888, N'200 Hoàng Minh Giám, quận Phú Nhuận', N'lamnguyen9999@gmail.com')
INSERT [dbo].[Thanhvien] ([Mathanhvien], [Ho], [Ten], [SDT], [Diachi], [Email]) VALUES (N'sdsad', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Thanhvien] ([Mathanhvien], [Ho], [Ten], [SDT], [Diachi], [Email]) VALUES (N'thêm ', N'viên', N'thứ 1', NULL, NULL, NULL)
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
/****** Object:  StoredProcedure [dbo].[uspThemthanhvien]    Script Date: 01/09/2016 9:43:26 CH ******/
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
/****** Object:  StoredProcedure [dbo].[uspXoathanhvien]    Script Date: 01/09/2016 9:43:26 CH ******/
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
