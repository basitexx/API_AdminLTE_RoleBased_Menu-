USE [master]
GO
/****** Object:  Database [hawic_db]    Script Date: 7/1/2024 12:17:51 PM ******/
CREATE DATABASE [hawic_db]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'hawic_db', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\hawic_db.mdf' , SIZE = 6144KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'hawic_db_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\hawic_db_log.ldf' , SIZE = 7616KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [hawic_db] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [hawic_db].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [hawic_db] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [hawic_db] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [hawic_db] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [hawic_db] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [hawic_db] SET ARITHABORT OFF 
GO
ALTER DATABASE [hawic_db] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [hawic_db] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [hawic_db] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [hawic_db] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [hawic_db] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [hawic_db] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [hawic_db] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [hawic_db] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [hawic_db] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [hawic_db] SET  DISABLE_BROKER 
GO
ALTER DATABASE [hawic_db] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [hawic_db] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [hawic_db] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [hawic_db] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [hawic_db] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [hawic_db] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [hawic_db] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [hawic_db] SET RECOVERY FULL 
GO
ALTER DATABASE [hawic_db] SET  MULTI_USER 
GO
ALTER DATABASE [hawic_db] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [hawic_db] SET DB_CHAINING OFF 
GO
ALTER DATABASE [hawic_db] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [hawic_db] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [hawic_db] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'hawic_db', N'ON'
GO
USE [hawic_db]
GO
/****** Object:  Table [dbo].[tbl_Appointment]    Script Date: 7/1/2024 12:17:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Appointment](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PatientID] [int] NULL,
	[DoctorID] [int] NULL,
	[AppointmentDate] [date] NULL,
	[LastUpdate] [datetime] NULL,
 CONSTRAINT [PK_tbl_Appointment] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_Department]    Script Date: 7/1/2024 12:17:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Department](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentName] [varchar](450) NULL,
 CONSTRAINT [PK_tbl_Department] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_ImagingOrder]    Script Date: 7/1/2024 12:17:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_ImagingOrder](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DoctorID] [int] NULL,
	[ImagingID] [int] NULL,
	[PatientID] [int] NULL,
	[LastUpdate] [datetime] NULL,
	[ImageResult] [image] NULL,
	[OrderStatus] [int] NULL,
	[Remark] [nvarchar](max) NULL,
 CONSTRAINT [PK_tbl_ImagingOrder] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_InjectionOrder]    Script Date: 7/1/2024 12:17:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_InjectionOrder](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DoctorID] [int] NULL,
	[NurseID] [int] NULL,
	[Description] [int] NULL,
	[OrderStatus] [int] NULL,
	[LastUpdate] [datetime] NULL,
	[PatientID] [int] NULL,
	[Remark] [nvarchar](max) NULL,
 CONSTRAINT [PK_tbl_InjectionOrder] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_LaboratoryOrder]    Script Date: 7/1/2024 12:17:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_LaboratoryOrder](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DoctorID] [int] NULL,
	[LaboratoryID] [int] NULL,
	[PatientID] [int] NULL,
	[LastUpdate] [datetime] NULL,
	[OrderStatus] [int] NULL,
	[Remark] [nvarchar](max) NULL,
 CONSTRAINT [PK_tbl_LaboratoryOrder] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_OrderStatus]    Script Date: 7/1/2024 12:17:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_OrderStatus](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[OrderStatus] [varchar](50) NULL,
 CONSTRAINT [PK_tbl_OrderStatus] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Patient]    Script Date: 7/1/2024 12:17:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Patient](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](200) NULL,
	[DateOfBirth] [date] NULL,
	[Gender] [varchar](10) NULL,
	[PhoneNo] [varchar](50) NULL,
	[SubCity] [int] NULL,
	[Woreda] [int] NULL,
 CONSTRAINT [PK_tbl_Patient] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_PatientHistory]    Script Date: 7/1/2024 12:17:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_PatientHistory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PatientID] [int] NULL,
	[DoctorID] [int] NULL,
	[VisitID] [int] NULL,
	[DoctorComment] [nvarchar](max) NULL,
	[LastUpdate] [datetime] NULL,
 CONSTRAINT [PK_tbl_PatientHistory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_PatientHistoryOrders]    Script Date: 7/1/2024 12:17:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_PatientHistoryOrders](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PatientHistoryID] [int] NULL,
	[LaboratoryOrderID] [int] NULL,
	[ImagingOrderID] [int] NULL,
	[InjectionOrderID] [int] NULL,
	[PrescriptionOrderID] [int] NULL,
 CONSTRAINT [PK_tbl_PatientHistoryOrders] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_Prescription]    Script Date: 7/1/2024 12:17:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Prescription](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Prescription] [nvarchar](max) NULL,
	[DoctorID] [int] NULL,
	[PatientID] [int] NULL,
	[LastUpdate] [datetime] NULL,
 CONSTRAINT [PK_tbl_Prescription] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_Staff]    Script Date: 7/1/2024 12:17:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Staff](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](50) NULL,
	[FullName] [nvarchar](200) NULL,
	[JobTitle] [varchar](50) NULL,
	[PhoneNo] [varchar](50) NULL,
	[SubCity] [int] NULL CONSTRAINT [DF_tbl_Staff_SubCity]  DEFAULT ((0)),
	[Woreda] [varchar](50) NULL CONSTRAINT [DF_tbl_Staff_Woreda]  DEFAULT ((0)),
	[AccountID] [nvarchar](450) NULL,
	[RegisterDate] [datetime] NULL CONSTRAINT [DF_tbl_Staff_RegisterDate]  DEFAULT (getdate()),
	[RegStatus] [int] NULL,
	[Department] [int] NULL,
	[Email] [varchar](100) NULL,
	[Photo] [varbinary](max) NULL,
	[ContentType] [nvarchar](200) NULL,
	[LastUpdate] [datetime] NULL CONSTRAINT [DF_tbl_Staff_LastUpdate]  DEFAULT (getdate()),
 CONSTRAINT [PK_tbl_Staff] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_SubCity]    Script Date: 7/1/2024 12:17:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_SubCity](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SubCity] [varchar](max) NULL,
 CONSTRAINT [PK_tbl_SubCity] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Visit]    Script Date: 7/1/2024 12:17:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Visit](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PatientID] [int] NULL,
	[VisitDate] [datetime] NULL,
	[VisitType] [int] NULL,
	[VisitStatus] [int] NULL,
 CONSTRAINT [PK_tbl_Visit] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_Woreda]    Script Date: 7/1/2024 12:17:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Woreda](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Woreda] [varchar](max) NULL,
	[SubCityID] [int] NULL,
 CONSTRAINT [PK_tbl_Woreda] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UserNAme-20240627-031951]    Script Date: 7/1/2024 12:17:52 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNAme-20240627-031951] ON [dbo].[tbl_Staff]
(
	[AccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tbl_Appointment]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Appointment_tbl_Staff] FOREIGN KEY([DoctorID])
REFERENCES [dbo].[tbl_Staff] ([ID])
GO
ALTER TABLE [dbo].[tbl_Appointment] CHECK CONSTRAINT [FK_tbl_Appointment_tbl_Staff]
GO
ALTER TABLE [dbo].[tbl_Appointment]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Appointment_tbl_StaffPatient] FOREIGN KEY([PatientID])
REFERENCES [dbo].[tbl_Staff] ([ID])
GO
ALTER TABLE [dbo].[tbl_Appointment] CHECK CONSTRAINT [FK_tbl_Appointment_tbl_StaffPatient]
GO
ALTER TABLE [dbo].[tbl_ImagingOrder]  WITH CHECK ADD  CONSTRAINT [FK_tbl_ImagingOrder_tbl_OrderStatus] FOREIGN KEY([OrderStatus])
REFERENCES [dbo].[tbl_OrderStatus] ([ID])
GO
ALTER TABLE [dbo].[tbl_ImagingOrder] CHECK CONSTRAINT [FK_tbl_ImagingOrder_tbl_OrderStatus]
GO
ALTER TABLE [dbo].[tbl_ImagingOrder]  WITH CHECK ADD  CONSTRAINT [FK_tbl_ImagingOrder_tbl_Patient] FOREIGN KEY([PatientID])
REFERENCES [dbo].[tbl_Patient] ([ID])
GO
ALTER TABLE [dbo].[tbl_ImagingOrder] CHECK CONSTRAINT [FK_tbl_ImagingOrder_tbl_Patient]
GO
ALTER TABLE [dbo].[tbl_ImagingOrder]  WITH NOCHECK ADD  CONSTRAINT [FK_tbl_ImagingOrder_tbl_StaffDoctor] FOREIGN KEY([DoctorID])
REFERENCES [dbo].[tbl_Staff] ([ID])
GO
ALTER TABLE [dbo].[tbl_ImagingOrder] NOCHECK CONSTRAINT [FK_tbl_ImagingOrder_tbl_StaffDoctor]
GO
ALTER TABLE [dbo].[tbl_ImagingOrder]  WITH NOCHECK ADD  CONSTRAINT [FK_tbl_ImagingOrder_tbl_StaffImaging] FOREIGN KEY([ImagingID])
REFERENCES [dbo].[tbl_Staff] ([ID])
GO
ALTER TABLE [dbo].[tbl_ImagingOrder] NOCHECK CONSTRAINT [FK_tbl_ImagingOrder_tbl_StaffImaging]
GO
ALTER TABLE [dbo].[tbl_InjectionOrder]  WITH CHECK ADD  CONSTRAINT [FK_tbl_InjectionOrder_tbl_OrderStatus] FOREIGN KEY([OrderStatus])
REFERENCES [dbo].[tbl_OrderStatus] ([ID])
GO
ALTER TABLE [dbo].[tbl_InjectionOrder] CHECK CONSTRAINT [FK_tbl_InjectionOrder_tbl_OrderStatus]
GO
ALTER TABLE [dbo].[tbl_InjectionOrder]  WITH CHECK ADD  CONSTRAINT [FK_tbl_InjectionOrder_tbl_Patient] FOREIGN KEY([PatientID])
REFERENCES [dbo].[tbl_Patient] ([ID])
GO
ALTER TABLE [dbo].[tbl_InjectionOrder] CHECK CONSTRAINT [FK_tbl_InjectionOrder_tbl_Patient]
GO
ALTER TABLE [dbo].[tbl_InjectionOrder]  WITH NOCHECK ADD  CONSTRAINT [FK_tbl_InjectionOrder_tbl_StaffDoctor] FOREIGN KEY([DoctorID])
REFERENCES [dbo].[tbl_Staff] ([ID])
GO
ALTER TABLE [dbo].[tbl_InjectionOrder] CHECK CONSTRAINT [FK_tbl_InjectionOrder_tbl_StaffDoctor]
GO
ALTER TABLE [dbo].[tbl_InjectionOrder]  WITH NOCHECK ADD  CONSTRAINT [FK_tbl_InjectionOrder_tbl_StaffNurse] FOREIGN KEY([NurseID])
REFERENCES [dbo].[tbl_Staff] ([ID])
GO
ALTER TABLE [dbo].[tbl_InjectionOrder] NOCHECK CONSTRAINT [FK_tbl_InjectionOrder_tbl_StaffNurse]
GO
ALTER TABLE [dbo].[tbl_LaboratoryOrder]  WITH CHECK ADD  CONSTRAINT [FK_tbl_LaboratoryOrder_tbl_OrderStatus] FOREIGN KEY([OrderStatus])
REFERENCES [dbo].[tbl_OrderStatus] ([ID])
GO
ALTER TABLE [dbo].[tbl_LaboratoryOrder] CHECK CONSTRAINT [FK_tbl_LaboratoryOrder_tbl_OrderStatus]
GO
ALTER TABLE [dbo].[tbl_LaboratoryOrder]  WITH CHECK ADD  CONSTRAINT [FK_tbl_LaboratoryOrder_tbl_Patient] FOREIGN KEY([PatientID])
REFERENCES [dbo].[tbl_Patient] ([ID])
GO
ALTER TABLE [dbo].[tbl_LaboratoryOrder] CHECK CONSTRAINT [FK_tbl_LaboratoryOrder_tbl_Patient]
GO
ALTER TABLE [dbo].[tbl_LaboratoryOrder]  WITH NOCHECK ADD  CONSTRAINT [FK_tbl_LaboratoryOrder_tbl_StaffDoctor] FOREIGN KEY([DoctorID])
REFERENCES [dbo].[tbl_Staff] ([ID])
GO
ALTER TABLE [dbo].[tbl_LaboratoryOrder] NOCHECK CONSTRAINT [FK_tbl_LaboratoryOrder_tbl_StaffDoctor]
GO
ALTER TABLE [dbo].[tbl_LaboratoryOrder]  WITH NOCHECK ADD  CONSTRAINT [FK_tbl_LaboratoryOrder_tbl_StaffLaboratory] FOREIGN KEY([LaboratoryID])
REFERENCES [dbo].[tbl_Staff] ([ID])
GO
ALTER TABLE [dbo].[tbl_LaboratoryOrder] NOCHECK CONSTRAINT [FK_tbl_LaboratoryOrder_tbl_StaffLaboratory]
GO
ALTER TABLE [dbo].[tbl_PatientHistory]  WITH CHECK ADD  CONSTRAINT [FK_tbl_PatientHistory_tbl_Patient] FOREIGN KEY([PatientID])
REFERENCES [dbo].[tbl_Patient] ([ID])
GO
ALTER TABLE [dbo].[tbl_PatientHistory] CHECK CONSTRAINT [FK_tbl_PatientHistory_tbl_Patient]
GO
ALTER TABLE [dbo].[tbl_PatientHistory]  WITH CHECK ADD  CONSTRAINT [FK_tbl_PatientHistory_tbl_Staff] FOREIGN KEY([DoctorID])
REFERENCES [dbo].[tbl_Staff] ([ID])
GO
ALTER TABLE [dbo].[tbl_PatientHistory] CHECK CONSTRAINT [FK_tbl_PatientHistory_tbl_Staff]
GO
ALTER TABLE [dbo].[tbl_PatientHistory]  WITH CHECK ADD  CONSTRAINT [FK_tbl_PatientHistory_tbl_Visit] FOREIGN KEY([VisitID])
REFERENCES [dbo].[tbl_Visit] ([ID])
GO
ALTER TABLE [dbo].[tbl_PatientHistory] CHECK CONSTRAINT [FK_tbl_PatientHistory_tbl_Visit]
GO
ALTER TABLE [dbo].[tbl_PatientHistoryOrders]  WITH CHECK ADD  CONSTRAINT [FK_tbl_PatientHistoryOrders_tbl_PatientHistory] FOREIGN KEY([PatientHistoryID])
REFERENCES [dbo].[tbl_PatientHistory] ([ID])
GO
ALTER TABLE [dbo].[tbl_PatientHistoryOrders] CHECK CONSTRAINT [FK_tbl_PatientHistoryOrders_tbl_PatientHistory]
GO
ALTER TABLE [dbo].[tbl_Prescription]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Prescription_tbl_Patient] FOREIGN KEY([PatientID])
REFERENCES [dbo].[tbl_Patient] ([ID])
GO
ALTER TABLE [dbo].[tbl_Prescription] CHECK CONSTRAINT [FK_tbl_Prescription_tbl_Patient]
GO
ALTER TABLE [dbo].[tbl_Prescription]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Prescription_tbl_StaffDoctor] FOREIGN KEY([DoctorID])
REFERENCES [dbo].[tbl_Staff] ([ID])
GO
ALTER TABLE [dbo].[tbl_Prescription] CHECK CONSTRAINT [FK_tbl_Prescription_tbl_StaffDoctor]
GO
ALTER TABLE [dbo].[tbl_Staff]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Staff_tbl_SubCity] FOREIGN KEY([SubCity])
REFERENCES [dbo].[tbl_SubCity] ([ID])
GO
ALTER TABLE [dbo].[tbl_Staff] CHECK CONSTRAINT [FK_tbl_Staff_tbl_SubCity]
GO
ALTER TABLE [dbo].[tbl_Visit]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Visit_tbl_Patient] FOREIGN KEY([PatientID])
REFERENCES [dbo].[tbl_Patient] ([ID])
GO
ALTER TABLE [dbo].[tbl_Visit] CHECK CONSTRAINT [FK_tbl_Visit_tbl_Patient]
GO
ALTER TABLE [dbo].[tbl_Woreda]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Woreda_tbl_SubCity] FOREIGN KEY([SubCityID])
REFERENCES [dbo].[tbl_SubCity] ([ID])
GO
ALTER TABLE [dbo].[tbl_Woreda] CHECK CONSTRAINT [FK_tbl_Woreda_tbl_SubCity]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'DoctorID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tbl_Appointment', @level2type=N'CONSTRAINT',@level2name=N'FK_tbl_Appointment_tbl_Staff'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'PAtientID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tbl_Appointment', @level2type=N'CONSTRAINT',@level2name=N'FK_tbl_Appointment_tbl_StaffPatient'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Used to set remark when its an outpatient' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tbl_ImagingOrder', @level2type=N'COLUMN',@level2name=N'Remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Used when the patient is an outpatient' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tbl_InjectionOrder', @level2type=N'COLUMN',@level2name=N'Remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Used when the patient is an outpatient' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tbl_LaboratoryOrder', @level2type=N'COLUMN',@level2name=N'Remark'
GO
USE [master]
GO
ALTER DATABASE [hawic_db] SET  READ_WRITE 
GO
