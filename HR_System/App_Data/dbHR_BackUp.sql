USE [dbHRSystem]
GO
/****** Object:  Role [aspnet_Membership_BasicAccess]    Script Date: 02/04/2014 12:06:23 ******/
CREATE ROLE [aspnet_Membership_BasicAccess] AUTHORIZATION [dbo]
GO
/****** Object:  Role [aspnet_Membership_ReportingAccess]    Script Date: 02/04/2014 12:06:23 ******/
CREATE ROLE [aspnet_Membership_ReportingAccess] AUTHORIZATION [dbo]
GO
/****** Object:  Role [aspnet_Membership_FullAccess]    Script Date: 02/04/2014 12:06:23 ******/
CREATE ROLE [aspnet_Membership_FullAccess] AUTHORIZATION [dbo]
GO
/****** Object:  Role [aspnet_Personalization_BasicAccess]    Script Date: 02/04/2014 12:06:23 ******/
CREATE ROLE [aspnet_Personalization_BasicAccess] AUTHORIZATION [dbo]
GO
/****** Object:  Role [aspnet_Personalization_ReportingAccess]    Script Date: 02/04/2014 12:06:23 ******/
CREATE ROLE [aspnet_Personalization_ReportingAccess] AUTHORIZATION [dbo]
GO
/****** Object:  Role [aspnet_Personalization_FullAccess]    Script Date: 02/04/2014 12:06:23 ******/
CREATE ROLE [aspnet_Personalization_FullAccess] AUTHORIZATION [dbo]
GO
/****** Object:  Role [aspnet_Profile_BasicAccess]    Script Date: 02/04/2014 12:06:23 ******/
CREATE ROLE [aspnet_Profile_BasicAccess] AUTHORIZATION [dbo]
GO
/****** Object:  Role [aspnet_Profile_ReportingAccess]    Script Date: 02/04/2014 12:06:23 ******/
CREATE ROLE [aspnet_Profile_ReportingAccess] AUTHORIZATION [dbo]
GO
/****** Object:  Role [aspnet_Profile_FullAccess]    Script Date: 02/04/2014 12:06:23 ******/
CREATE ROLE [aspnet_Profile_FullAccess] AUTHORIZATION [dbo]
GO
/****** Object:  Role [aspnet_Roles_BasicAccess]    Script Date: 02/04/2014 12:06:23 ******/
CREATE ROLE [aspnet_Roles_BasicAccess] AUTHORIZATION [dbo]
GO
/****** Object:  Role [aspnet_Roles_ReportingAccess]    Script Date: 02/04/2014 12:06:23 ******/
CREATE ROLE [aspnet_Roles_ReportingAccess] AUTHORIZATION [dbo]
GO
/****** Object:  Role [aspnet_Roles_FullAccess]    Script Date: 02/04/2014 12:06:23 ******/
CREATE ROLE [aspnet_Roles_FullAccess] AUTHORIZATION [dbo]
GO
/****** Object:  Role [aspnet_WebEvent_FullAccess]    Script Date: 02/04/2014 12:06:23 ******/
CREATE ROLE [aspnet_WebEvent_FullAccess] AUTHORIZATION [dbo]
GO
/****** Object:  Schema [aspnet_WebEvent_FullAccess]    Script Date: 02/04/2014 12:06:23 ******/
CREATE SCHEMA [aspnet_WebEvent_FullAccess] AUTHORIZATION [aspnet_WebEvent_FullAccess]
GO
/****** Object:  Schema [aspnet_Roles_ReportingAccess]    Script Date: 02/04/2014 12:06:23 ******/
CREATE SCHEMA [aspnet_Roles_ReportingAccess] AUTHORIZATION [aspnet_Roles_ReportingAccess]
GO
/****** Object:  Schema [aspnet_Roles_FullAccess]    Script Date: 02/04/2014 12:06:23 ******/
CREATE SCHEMA [aspnet_Roles_FullAccess] AUTHORIZATION [aspnet_Roles_FullAccess]
GO
/****** Object:  Schema [aspnet_Roles_BasicAccess]    Script Date: 02/04/2014 12:06:23 ******/
CREATE SCHEMA [aspnet_Roles_BasicAccess] AUTHORIZATION [aspnet_Roles_BasicAccess]
GO
/****** Object:  Schema [aspnet_Profile_ReportingAccess]    Script Date: 02/04/2014 12:06:23 ******/
CREATE SCHEMA [aspnet_Profile_ReportingAccess] AUTHORIZATION [aspnet_Profile_ReportingAccess]
GO
/****** Object:  Schema [aspnet_Profile_FullAccess]    Script Date: 02/04/2014 12:06:23 ******/
CREATE SCHEMA [aspnet_Profile_FullAccess] AUTHORIZATION [aspnet_Profile_FullAccess]
GO
/****** Object:  Schema [aspnet_Profile_BasicAccess]    Script Date: 02/04/2014 12:06:23 ******/
CREATE SCHEMA [aspnet_Profile_BasicAccess] AUTHORIZATION [aspnet_Profile_BasicAccess]
GO
/****** Object:  Schema [aspnet_Personalization_ReportingAccess]    Script Date: 02/04/2014 12:06:23 ******/
CREATE SCHEMA [aspnet_Personalization_ReportingAccess] AUTHORIZATION [aspnet_Personalization_ReportingAccess]
GO
/****** Object:  Schema [aspnet_Personalization_FullAccess]    Script Date: 02/04/2014 12:06:23 ******/
CREATE SCHEMA [aspnet_Personalization_FullAccess] AUTHORIZATION [aspnet_Personalization_FullAccess]
GO
/****** Object:  Schema [aspnet_Personalization_BasicAccess]    Script Date: 02/04/2014 12:06:23 ******/
CREATE SCHEMA [aspnet_Personalization_BasicAccess] AUTHORIZATION [aspnet_Personalization_BasicAccess]
GO
/****** Object:  Schema [aspnet_Membership_ReportingAccess]    Script Date: 02/04/2014 12:06:23 ******/
CREATE SCHEMA [aspnet_Membership_ReportingAccess] AUTHORIZATION [aspnet_Membership_ReportingAccess]
GO
/****** Object:  Schema [aspnet_Membership_FullAccess]    Script Date: 02/04/2014 12:06:23 ******/
CREATE SCHEMA [aspnet_Membership_FullAccess] AUTHORIZATION [aspnet_Membership_FullAccess]
GO
/****** Object:  Schema [aspnet_Membership_BasicAccess]    Script Date: 02/04/2014 12:06:23 ******/
CREATE SCHEMA [aspnet_Membership_BasicAccess] AUTHORIZATION [aspnet_Membership_BasicAccess]
GO
/****** Object:  Table [dbo].[aspnet_Applications]    Script Date: 02/04/2014 12:06:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Applications](
	[ApplicationName] [nvarchar](256) NOT NULL,
	[LoweredApplicationName] [nvarchar](256) NOT NULL,
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[Description] [nvarchar](256) NULL,
PRIMARY KEY NONCLUSTERED 
(
	[ApplicationId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[LoweredApplicationName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[ApplicationName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE CLUSTERED INDEX [aspnet_Applications_Index] ON [dbo].[aspnet_Applications] 
(
	[LoweredApplicationName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
INSERT [dbo].[aspnet_Applications] ([ApplicationName], [LoweredApplicationName], [ApplicationId], [Description]) VALUES (N'/', N'/', N'8065942f-951b-4796-a5f1-6ebeb60e5566', NULL)
/****** Object:  Table [dbo].[Department]    Script Date: 02/04/2014 12:06:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[DepartmentID] [uniqueidentifier] NOT NULL,
	[DepartmentNameAr] [nvarchar](100) NULL,
	[DepartmentCode] [nvarchar](100) NULL,
	[DepartmentNameEn] [nvarchar](100) NULL,
	[ActiveFromDate] [datetime] NULL,
	[ISActive] [bit] NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[DepartmentID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Department] ([DepartmentID], [DepartmentNameAr], [DepartmentCode], [DepartmentNameEn], [ActiveFromDate], [ISActive]) VALUES (N'07a75ef5-2ace-417b-81c9-9c6808d94b2f', N'Finance Department', N'DEPT', N'Finance Department', CAST(0x0000A26600000000 AS DateTime), 1)
INSERT [dbo].[Department] ([DepartmentID], [DepartmentNameAr], [DepartmentCode], [DepartmentNameEn], [ActiveFromDate], [ISActive]) VALUES (N'd71420dd-aa85-48f8-ba0d-9d19ffac6b5f', N'IT Software', N'IT', N'IT Software', CAST(0x0000A28900000000 AS DateTime), 1)
INSERT [dbo].[Department] ([DepartmentID], [DepartmentNameAr], [DepartmentCode], [DepartmentNameEn], [ActiveFromDate], [ISActive]) VALUES (N'86075a92-a26e-4061-88d5-bf7f9d75fa58', N'HR Department', N'HDEPT', N'HR Department', CAST(0x0000A26200000000 AS DateTime), 1)
/****** Object:  Table [dbo].[Notification]    Script Date: 02/04/2014 12:06:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notification](
	[NotificationID] [uniqueidentifier] NOT NULL,
	[EmployeeID] [uniqueidentifier] NULL,
	[Message] [nvarchar](1000) NULL,
	[NotinficationTime] [datetime] NULL,
	[IsRead] [bit] NULL,
	[Url] [nvarchar](max) NULL,
 CONSTRAINT [PK_Notification] PRIMARY KEY CLUSTERED 
(
	[NotificationID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Notification] ([NotificationID], [EmployeeID], [Message], [NotinficationTime], [IsRead], [Url]) VALUES (N'1d800ba5-850e-49e9-8942-001017720915', N'd448c4b5-8f24-42fa-8308-9c2e4fdb3de4', N'Your request of leave from 11/8/2013 to 11/16/2013 has been approved', CAST(0x0000A25700F49CF5 AS DateTime), 1, N'~/Notification/Detail/1d800ba5-850e-49e9-8942-001017720915')
INSERT [dbo].[Notification] ([NotificationID], [EmployeeID], [Message], [NotinficationTime], [IsRead], [Url]) VALUES (N'b39b7f9a-aaa9-4d31-a452-0444762cdb72', N'634814e9-d0a9-48a4-b7eb-1421d09d23d0', N'Your request of leave of 9/25/2013 has been approved', CAST(0x0000A243015053C5 AS DateTime), 1, N'~/Notification/Detail/b39b7f9a-aaa9-4d31-a452-0444762cdb72')
INSERT [dbo].[Notification] ([NotificationID], [EmployeeID], [Message], [NotinficationTime], [IsRead], [Url]) VALUES (N'7541e60b-89d3-4ba3-b4a3-0ebc433c5c16', N'20250795-00e5-4355-b986-e2f3f6f9e07e', N'Your timesheet of Feb-2015 has been recalled', CAST(0x0000A29D011336BA AS DateTime), 0, N'~/Notification/Detail/7541e60b-89d3-4ba3-b4a3-0ebc433c5c16')
INSERT [dbo].[Notification] ([NotificationID], [EmployeeID], [Message], [NotinficationTime], [IsRead], [Url]) VALUES (N'4b94360d-cfe7-4f08-8be2-0f8a4864302a', N'5aa322ce-222c-4b7b-958e-7e19ab44c2e6', N'Your request of leave from 10/9/2013 to 10/16/2013 has been approved', CAST(0x0000A24B01324CB9 AS DateTime), 1, N'~/Notification/Detail/4b94360d-cfe7-4f08-8be2-0f8a4864302a')
INSERT [dbo].[Notification] ([NotificationID], [EmployeeID], [Message], [NotinficationTime], [IsRead], [Url]) VALUES (N'66811769-c4f6-42fe-9150-10386ad1f593', N'20250795-00e5-4355-b986-e2f3f6f9e07e', N'Your request of leave from 1/12/2014 to 1/14/2014 has been approved', CAST(0x0000A2B500C8CF9A AS DateTime), 0, N'~/Notification/Detail/66811769-c4f6-42fe-9150-10386ad1f593')
INSERT [dbo].[Notification] ([NotificationID], [EmployeeID], [Message], [NotinficationTime], [IsRead], [Url]) VALUES (N'fe93cc1b-1eba-4083-9053-13ed0b52a38f', N'81262e83-e417-4732-89d5-933d3a2ab5df', N'Your request of leave from 11/7/2013 to 11/9/2013 has been approved', CAST(0x0000A2570139B0CF AS DateTime), 0, N'~/Notification/Detail/fe93cc1b-1eba-4083-9053-13ed0b52a38f')
INSERT [dbo].[Notification] ([NotificationID], [EmployeeID], [Message], [NotinficationTime], [IsRead], [Url]) VALUES (N'd83ee133-c242-451a-acd8-15391a4880ab', N'80159e76-2698-4e18-b551-c1b6b09c018b', N'Your request of leave from 10/6/2013 to 10/10/2013 has been approved', CAST(0x0000A24B009EFA9A AS DateTime), 1, N'~/Notification/Detail/d83ee133-c242-451a-acd8-15391a4880ab')
INSERT [dbo].[Notification] ([NotificationID], [EmployeeID], [Message], [NotinficationTime], [IsRead], [Url]) VALUES (N'e684b66f-225b-48da-9001-1a80325af051', N'd448c4b5-8f24-42fa-8308-9c2e4fdb3de4', N'Your request of leave from 11/8/2013 to 11/16/2013 has been approved', CAST(0x0000A25300D039F2 AS DateTime), 1, N'~/Notification/Detail/e684b66f-225b-48da-9001-1a80325af051')
INSERT [dbo].[Notification] ([NotificationID], [EmployeeID], [Message], [NotinficationTime], [IsRead], [Url]) VALUES (N'3fb78f61-af03-45e3-a14b-1c325a5aceaa', N'40a4478d-2dc8-41d0-ab94-d63ac48321f6', N'Your request of leave of 10/8/2013 has been approved', CAST(0x0000A24D01360C9A AS DateTime), 0, N'~/Notification/Detail/3fb78f61-af03-45e3-a14b-1c325a5aceaa')
INSERT [dbo].[Notification] ([NotificationID], [EmployeeID], [Message], [NotinficationTime], [IsRead], [Url]) VALUES (N'0c80b81e-870c-47fe-b2a0-1c58d8809bbf', N'20250795-00e5-4355-b986-e2f3f6f9e07e', N'Your request of leave from 1/10/2014 to 1/11/2014 has been approved', CAST(0x0000A2B500E230A6 AS DateTime), 0, N'~/Notification/Detail/0c80b81e-870c-47fe-b2a0-1c58d8809bbf')
INSERT [dbo].[Notification] ([NotificationID], [EmployeeID], [Message], [NotinficationTime], [IsRead], [Url]) VALUES (N'8d860607-c717-4453-8b75-24a59a8a5915', N'6fdc4b80-8ae6-4b97-a068-a66a6c230623', N'Your timesheet of Dec-2013 has been recalled', CAST(0x0000A29D012A5A93 AS DateTime), 1, N'~/Notification/Detail/8d860607-c717-4453-8b75-24a59a8a5915')
INSERT [dbo].[Notification] ([NotificationID], [EmployeeID], [Message], [NotinficationTime], [IsRead], [Url]) VALUES (N'ef664780-d94d-4ee3-b978-2c5daea8554c', N'20250795-00e5-4355-b986-e2f3f6f9e07e', N'Your request of leave from 1/1/2014 to 1/9/2014 has been disapproved', CAST(0x0000A2B500C9735E AS DateTime), 0, N'~/Notification/Detail/ef664780-d94d-4ee3-b978-2c5daea8554c')
INSERT [dbo].[Notification] ([NotificationID], [EmployeeID], [Message], [NotinficationTime], [IsRead], [Url]) VALUES (N'a4bd799e-d2e6-46d8-8753-2c69361a9b50', N'720d8341-ae54-4d06-b92e-652c25c7cf1e', N'Your request of leave of 1/3/2014 has been approved', CAST(0x0000A2BE012B5F7E AS DateTime), 1, N'~/Notification/Detail/a4bd799e-d2e6-46d8-8753-2c69361a9b50')
INSERT [dbo].[Notification] ([NotificationID], [EmployeeID], [Message], [NotinficationTime], [IsRead], [Url]) VALUES (N'e514fc1e-c3a5-42f6-8b1a-35959ff4d00e', N'6fdc4b80-8ae6-4b97-a068-a66a6c230623', N'Your timesheet of Dec-2013 has been recalled', CAST(0x0000A29D01265EEB AS DateTime), 1, N'~/Notification/Detail/e514fc1e-c3a5-42f6-8b1a-35959ff4d00e')
INSERT [dbo].[Notification] ([NotificationID], [EmployeeID], [Message], [NotinficationTime], [IsRead], [Url]) VALUES (N'025c6bcd-3ff5-4bd5-8545-3700eb2b88a2', N'd448c4b5-8f24-42fa-8308-9c2e4fdb3de4', N'Your request of leave from 11/22/2013 to 11/26/2013 has been approved', CAST(0x0000A25700CEA79F AS DateTime), 1, N'~/Notification/Detail/025c6bcd-3ff5-4bd5-8545-3700eb2b88a2')
INSERT [dbo].[Notification] ([NotificationID], [EmployeeID], [Message], [NotinficationTime], [IsRead], [Url]) VALUES (N'fc3eec8f-64ce-4bec-a3d4-38eaecfb7e98', N'd448c4b5-8f24-42fa-8308-9c2e4fdb3de4', N'Your request of leave from 11/1/2013 to 11/30/2013 has been approved', CAST(0x0000A25300D48698 AS DateTime), 1, N'~/Notification/Detail/fc3eec8f-64ce-4bec-a3d4-38eaecfb7e98')
INSERT [dbo].[Notification] ([NotificationID], [EmployeeID], [Message], [NotinficationTime], [IsRead], [Url]) VALUES (N'f2eaea36-d2c7-4235-8a52-4151d338b95c', N'81262e83-e417-4732-89d5-933d3a2ab5df', N'Your request of leave from 11/1/2013 to 11/30/2013 has been approved', CAST(0x0000A25700F882DA AS DateTime), 0, N'~/Notification/Detail/f2eaea36-d2c7-4235-8a52-4151d338b95c')
INSERT [dbo].[Notification] ([NotificationID], [EmployeeID], [Message], [NotinficationTime], [IsRead], [Url]) VALUES (N'1f10ca5b-b753-4513-af7b-4347b649859c', N'20250795-00e5-4355-b986-e2f3f6f9e07e', N'Your request of leave of 2/23/2015 has been approved', CAST(0x0000A29D01141E0E AS DateTime), 0, N'~/Notification/Detail/1f10ca5b-b753-4513-af7b-4347b649859c')
INSERT [dbo].[Notification] ([NotificationID], [EmployeeID], [Message], [NotinficationTime], [IsRead], [Url]) VALUES (N'39eaa72a-e736-46a2-878d-441e94d3e831', N'20250795-00e5-4355-b986-e2f3f6f9e07e', N'Your request of leave from 12/28/2013 to 12/30/2013 has been approved', CAST(0x0000A2B500E24088 AS DateTime), 0, N'~/Notification/Detail/39eaa72a-e736-46a2-878d-441e94d3e831')
INSERT [dbo].[Notification] ([NotificationID], [EmployeeID], [Message], [NotinficationTime], [IsRead], [Url]) VALUES (N'562726d5-74d2-4805-9e86-49849ae01c8e', N'720d8341-ae54-4d06-b92e-652c25c7cf1e', N'Your request of leave from 1/1/2014 to 1/2/2014 has been approved', CAST(0x0000A2BE012849A4 AS DateTime), 1, N'~/Notification/Detail/562726d5-74d2-4805-9e86-49849ae01c8e')
INSERT [dbo].[Notification] ([NotificationID], [EmployeeID], [Message], [NotinficationTime], [IsRead], [Url]) VALUES (N'c2e217ac-00d4-496f-92b7-509d9b46544b', N'6fdc4b80-8ae6-4b97-a068-a66a6c230623', N'Your request of leave of 12/24/2013 has been approved', CAST(0x0000A29D0135BD16 AS DateTime), 0, N'~/Notification/Detail/c2e217ac-00d4-496f-92b7-509d9b46544b')
INSERT [dbo].[Notification] ([NotificationID], [EmployeeID], [Message], [NotinficationTime], [IsRead], [Url]) VALUES (N'3d9c5888-2b77-4354-a42c-569709192e9c', N'd448c4b5-8f24-42fa-8308-9c2e4fdb3de4', N'Your request of leave from 10/15/2013 to 10/16/2013 has been approved', CAST(0x0000A25700F4FECD AS DateTime), 1, N'~/Notification/Detail/3d9c5888-2b77-4354-a42c-569709192e9c')
INSERT [dbo].[Notification] ([NotificationID], [EmployeeID], [Message], [NotinficationTime], [IsRead], [Url]) VALUES (N'02c2949e-48de-44ac-954c-5d34454c3187', N'd448c4b5-8f24-42fa-8308-9c2e4fdb3de4', N'Your request of leave from 10/29/2013 to 10/31/2013 has been approved', CAST(0x0000A25700D0A6E8 AS DateTime), 1, N'~/Notification/Detail/02c2949e-48de-44ac-954c-5d34454c3187')
INSERT [dbo].[Notification] ([NotificationID], [EmployeeID], [Message], [NotinficationTime], [IsRead], [Url]) VALUES (N'6097dc0f-f0fb-4280-8be1-6220ca5d1454', N'20250795-00e5-4355-b986-e2f3f6f9e07e', N'Your request of leave of 2/18/2015 has been approved', CAST(0x0000A29D011000BB AS DateTime), 0, N'~/Notification/Detail/6097dc0f-f0fb-4280-8be1-6220ca5d1454')
INSERT [dbo].[Notification] ([NotificationID], [EmployeeID], [Message], [NotinficationTime], [IsRead], [Url]) VALUES (N'7189cb7a-d6ae-4b5c-bc2e-63ff261eb6fc', N'80159e76-2698-4e18-b551-c1b6b09c018b', N'Your timesheet of Oct-2013 has been recalled', CAST(0x0000A24C00BD7B16 AS DateTime), 1, N'~/Notification/Detail/7189cb7a-d6ae-4b5c-bc2e-63ff261eb6fc')
INSERT [dbo].[Notification] ([NotificationID], [EmployeeID], [Message], [NotinficationTime], [IsRead], [Url]) VALUES (N'13e4e3af-e628-4329-9dea-6b0b3ed3d6b5', N'20250795-00e5-4355-b986-e2f3f6f9e07e', N'Your timesheet of Apr-2014 has been recalled', CAST(0x0000A29B00BCA245 AS DateTime), 1, N'~/Notification/Detail/13e4e3af-e628-4329-9dea-6b0b3ed3d6b5')
INSERT [dbo].[Notification] ([NotificationID], [EmployeeID], [Message], [NotinficationTime], [IsRead], [Url]) VALUES (N'ce3577c7-ba8a-4062-8f92-77018ba657fb', N'81262e83-e417-4732-89d5-933d3a2ab5df', N'Your request of leave from 12/20/2013 to 12/21/2013 has been approved', CAST(0x0000A29A010979F1 AS DateTime), 0, N'~/Notification/Detail/ce3577c7-ba8a-4062-8f92-77018ba657fb')
INSERT [dbo].[Notification] ([NotificationID], [EmployeeID], [Message], [NotinficationTime], [IsRead], [Url]) VALUES (N'3e6bd74b-0ffe-4774-bcb3-79373285d535', N'6fdc4b80-8ae6-4b97-a068-a66a6c230623', N'Your request of leave from 1/1/2014 to 1/14/2014 has been approved', CAST(0x0000A2B500E21804 AS DateTime), 0, N'~/Notification/Detail/3e6bd74b-0ffe-4774-bcb3-79373285d535')
INSERT [dbo].[Notification] ([NotificationID], [EmployeeID], [Message], [NotinficationTime], [IsRead], [Url]) VALUES (N'c68452a1-bbd6-44ce-b298-79faac1c14e4', N'20250795-00e5-4355-b986-e2f3f6f9e07e', N'Your timesheet of Dec-2013 has been recalled', CAST(0x0000A29D010BE7CE AS DateTime), 0, N'~/Notification/Detail/c68452a1-bbd6-44ce-b298-79faac1c14e4')
INSERT [dbo].[Notification] ([NotificationID], [EmployeeID], [Message], [NotinficationTime], [IsRead], [Url]) VALUES (N'1c06ab12-dfd1-47c5-b3f7-7f4d1b9198e2', N'634814e9-d0a9-48a4-b7eb-1421d09d23d0', N'Your request of leave from 9/25/2013 to 9/25/2013 has been cancelled', CAST(0x0000A245013B1F72 AS DateTime), 1, N'~/Notification/Detail/1c06ab12-dfd1-47c5-b3f7-7f4d1b9198e2')
INSERT [dbo].[Notification] ([NotificationID], [EmployeeID], [Message], [NotinficationTime], [IsRead], [Url]) VALUES (N'38429bbb-6fca-4bf7-a88a-8baa9f7ee3df', N'20250795-00e5-4355-b986-e2f3f6f9e07e', N'Your request of leave of 5/3/2014 has been approved', CAST(0x0000A29B01260732 AS DateTime), 0, N'~/Notification/Detail/38429bbb-6fca-4bf7-a88a-8baa9f7ee3df')
INSERT [dbo].[Notification] ([NotificationID], [EmployeeID], [Message], [NotinficationTime], [IsRead], [Url]) VALUES (N'cff3e714-4185-4147-bab3-8f13b86c1b67', N'20250795-00e5-4355-b986-e2f3f6f9e07e', N'Your request of leave from 12/26/2013 to 12/30/2013 has been approved', CAST(0x0000A29A01096722 AS DateTime), 1, N'~/Notification/Detail/cff3e714-4185-4147-bab3-8f13b86c1b67')
INSERT [dbo].[Notification] ([NotificationID], [EmployeeID], [Message], [NotinficationTime], [IsRead], [Url]) VALUES (N'788699d7-1c32-4aec-9880-90816c6bfb21', N'20250795-00e5-4355-b986-e2f3f6f9e07e', N'Your request of leave from 2/1/2014 to 2/2/2014 has been approved', CAST(0x0000A29A012B33F9 AS DateTime), 1, N'~/Notification/Detail/788699d7-1c32-4aec-9880-90816c6bfb21')
INSERT [dbo].[Notification] ([NotificationID], [EmployeeID], [Message], [NotinficationTime], [IsRead], [Url]) VALUES (N'512e5c3c-aa6a-47c2-891f-93552cd7b599', N'6fdc4b80-8ae6-4b97-a068-a66a6c230623', N'Your request of leave of 12/23/2013 has been approved', CAST(0x0000A29D0121B1E9 AS DateTime), 1, N'~/Notification/Detail/512e5c3c-aa6a-47c2-891f-93552cd7b599')
INSERT [dbo].[Notification] ([NotificationID], [EmployeeID], [Message], [NotinficationTime], [IsRead], [Url]) VALUES (N'95b0e975-1cde-4e49-9495-9359fcfc6f7c', N'81262e83-e417-4732-89d5-933d3a2ab5df', N'Your request of leave from 11/1/2013 to 11/30/2013 has been approved', CAST(0x0000A25701076FAD AS DateTime), 1, N'~/Notification/Detail/95b0e975-1cde-4e49-9495-9359fcfc6f7c')
INSERT [dbo].[Notification] ([NotificationID], [EmployeeID], [Message], [NotinficationTime], [IsRead], [Url]) VALUES (N'b3d3004d-e1f4-4186-8686-93b79f5ad29e', N'20250795-00e5-4355-b986-e2f3f6f9e07e', N'Your request of leave of 12/22/2013 has been approved', CAST(0x0000A29B00DBEA34 AS DateTime), 0, N'~/Notification/Detail/b3d3004d-e1f4-4186-8686-93b79f5ad29e')
INSERT [dbo].[Notification] ([NotificationID], [EmployeeID], [Message], [NotinficationTime], [IsRead], [Url]) VALUES (N'de87b56e-0ff4-4276-bf44-9ad60e0f467d', N'5aa322ce-222c-4b7b-958e-7e19ab44c2e6', N'Your request of leave of 10/5/2013 has been approved', CAST(0x0000A24B0134D103 AS DateTime), 0, N'~/Notification/Detail/de87b56e-0ff4-4276-bf44-9ad60e0f467d')
INSERT [dbo].[Notification] ([NotificationID], [EmployeeID], [Message], [NotinficationTime], [IsRead], [Url]) VALUES (N'f50aec0e-6fd7-4a5d-8c23-9bfcd1e46810', N'd448c4b5-8f24-42fa-8308-9c2e4fdb3de4', N'Your request of leave from 11/1/2013 to 11/30/2013 has been cancelled', CAST(0x0000A2530108F44C AS DateTime), 1, N'~/Notification/Detail/f50aec0e-6fd7-4a5d-8c23-9bfcd1e46810')
INSERT [dbo].[Notification] ([NotificationID], [EmployeeID], [Message], [NotinficationTime], [IsRead], [Url]) VALUES (N'54f7bc05-03f2-4c5e-8257-9cbe380f0dd8', N'20250795-00e5-4355-b986-e2f3f6f9e07e', N'Your request of leave of 4/2/2014 has been approved', CAST(0x0000A29A0130FAE7 AS DateTime), 1, N'~/Notification/Detail/54f7bc05-03f2-4c5e-8257-9cbe380f0dd8')
INSERT [dbo].[Notification] ([NotificationID], [EmployeeID], [Message], [NotinficationTime], [IsRead], [Url]) VALUES (N'f20b782c-39c3-417b-8131-b0b17c286f5c', N'20250795-00e5-4355-b986-e2f3f6f9e07e', N'Your request of leave of 11/1/2014 has been approved', CAST(0x0000A29B00F4C5E9 AS DateTime), 1, N'~/Notification/Detail/f20b782c-39c3-417b-8131-b0b17c286f5c')
INSERT [dbo].[Notification] ([NotificationID], [EmployeeID], [Message], [NotinficationTime], [IsRead], [Url]) VALUES (N'680bfe1f-9a9f-483b-87e0-b56809ac8218', N'80159e76-2698-4e18-b551-c1b6b09c018b', N'Your request of leave of 10/3/2013 has been approved', CAST(0x0000A24B00AE8C62 AS DateTime), 1, N'~/Notification/Detail/680bfe1f-9a9f-483b-87e0-b56809ac8218')
INSERT [dbo].[Notification] ([NotificationID], [EmployeeID], [Message], [NotinficationTime], [IsRead], [Url]) VALUES (N'a188038c-89ba-4928-aa8b-c991094f9f16', N'634814e9-d0a9-48a4-b7eb-1421d09d23d0', N'Your request of leave from 9/25/2013 to 10/2/2013 has been cancelled', CAST(0x0000A243013E9235 AS DateTime), 0, N'~/Notification/Index/64a30a96-ff73-43f9-9053-dc01540b2938')
INSERT [dbo].[Notification] ([NotificationID], [EmployeeID], [Message], [NotinficationTime], [IsRead], [Url]) VALUES (N'310b4fda-2556-4c60-a2f1-cdab21e1f342', N'20250795-00e5-4355-b986-e2f3f6f9e07e', N'Your request of leave from 1/3/2014 to 1/4/2014 has been approved', CAST(0x0000A2B600B9CE25 AS DateTime), 0, N'~/Notification/Detail/310b4fda-2556-4c60-a2f1-cdab21e1f342')
INSERT [dbo].[Notification] ([NotificationID], [EmployeeID], [Message], [NotinficationTime], [IsRead], [Url]) VALUES (N'5082510f-b2e3-4f72-929a-ce725eac0604', N'b1ca1847-3f52-4f9a-9169-c307eea1f118', N'Your request of leave from 9/21/2013 to 9/21/2013 has been cancelled', CAST(0x0000A249011EF376 AS DateTime), 0, N'~/Notification/Detail/5082510f-b2e3-4f72-929a-ce725eac0604')
INSERT [dbo].[Notification] ([NotificationID], [EmployeeID], [Message], [NotinficationTime], [IsRead], [Url]) VALUES (N'a7b2fa9b-93c5-423d-aad4-ced78222d4f5', N'81262e83-e417-4732-89d5-933d3a2ab5df', N'Your request of leave from 12/17/2013 to 12/24/2013 has been approved', CAST(0x0000A29600C8B11B AS DateTime), 0, N'~/Notification/Detail/a7b2fa9b-93c5-423d-aad4-ced78222d4f5')
INSERT [dbo].[Notification] ([NotificationID], [EmployeeID], [Message], [NotinficationTime], [IsRead], [Url]) VALUES (N'26ddb759-6b56-4a6c-8135-d5423b082b8e', N'20250795-00e5-4355-b986-e2f3f6f9e07e', N'Your timesheet of May-2014 has been recalled', CAST(0x0000A29B00DB5BB1 AS DateTime), 0, N'~/Notification/Detail/26ddb759-6b56-4a6c-8135-d5423b082b8e')
INSERT [dbo].[Notification] ([NotificationID], [EmployeeID], [Message], [NotinficationTime], [IsRead], [Url]) VALUES (N'e1fbb0f5-215e-4ffa-a692-d8080da1025f', N'720d8341-ae54-4d06-b92e-652c25c7cf1e', N'Your request of leave from 2/7/2014 to 2/8/2014 has been approved', CAST(0x0000A2C00138DCBB AS DateTime), 1, N'~/Notification/Detail/e1fbb0f5-215e-4ffa-a692-d8080da1025f')
INSERT [dbo].[Notification] ([NotificationID], [EmployeeID], [Message], [NotinficationTime], [IsRead], [Url]) VALUES (N'52e63d28-f900-49c5-8057-e6f5389cf225', N'd448c4b5-8f24-42fa-8308-9c2e4fdb3de4', N'Your request of leave of 10/10/2013 has been approved', CAST(0x0000A25200D73D6E AS DateTime), 1, N'~/Notification/Detail/52e63d28-f900-49c5-8057-e6f5389cf225')
INSERT [dbo].[Notification] ([NotificationID], [EmployeeID], [Message], [NotinficationTime], [IsRead], [Url]) VALUES (N'18648865-1d25-45c8-92c6-e78677fad7c1', N'20250795-00e5-4355-b986-e2f3f6f9e07e', N'Your request of leave from 2/22/2015 to 2/22/2015 has been disapproved', CAST(0x0000A29D011013C8 AS DateTime), 0, N'~/Notification/Detail/18648865-1d25-45c8-92c6-e78677fad7c1')
INSERT [dbo].[Notification] ([NotificationID], [EmployeeID], [Message], [NotinficationTime], [IsRead], [Url]) VALUES (N'972a8eae-5f52-4a0b-a785-ead9feef3186', N'48983efc-1145-4e2a-a3cf-cf601c9cfe86', N'Your request of leave from 10/25/2013 to 10/26/2013 has been approved', CAST(0x0000A25001234200 AS DateTime), 0, N'~/Notification/Detail/972a8eae-5f52-4a0b-a785-ead9feef3186')
INSERT [dbo].[Notification] ([NotificationID], [EmployeeID], [Message], [NotinficationTime], [IsRead], [Url]) VALUES (N'7d2d09fc-d2e1-4966-be47-eb50cd2688c7', N'20250795-00e5-4355-b986-e2f3f6f9e07e', N'Your request of leave of 5/10/2014 has been approved', CAST(0x0000A29B00C433E3 AS DateTime), 1, N'~/Notification/Detail/7d2d09fc-d2e1-4966-be47-eb50cd2688c7')
INSERT [dbo].[Notification] ([NotificationID], [EmployeeID], [Message], [NotinficationTime], [IsRead], [Url]) VALUES (N'bb9097a0-741b-43a5-adc0-ef76bbd4c720', N'48983efc-1145-4e2a-a3cf-cf601c9cfe86', N'Your request of leave from 10/8/2013 to 10/9/2013 has been approved', CAST(0x0000A25000F0863B AS DateTime), 1, N'~/Notification/Detail/bb9097a0-741b-43a5-adc0-ef76bbd4c720')
INSERT [dbo].[Notification] ([NotificationID], [EmployeeID], [Message], [NotinficationTime], [IsRead], [Url]) VALUES (N'cd6a344c-5c8d-4b2a-b244-eff4c18509e1', N'634814e9-d0a9-48a4-b7eb-1421d09d23d0', N'Your request of leave from 10/9/2013 to 10/12/2013 has been disapproved', CAST(0x0000A245013C6652 AS DateTime), 0, N'~/Notification/Detail/cd6a344c-5c8d-4b2a-b244-eff4c18509e1')
INSERT [dbo].[Notification] ([NotificationID], [EmployeeID], [Message], [NotinficationTime], [IsRead], [Url]) VALUES (N'a466a698-7c72-445d-8430-f0e33e36f84f', N'6fdc4b80-8ae6-4b97-a068-a66a6c230623', N'Your timesheet of Dec-2013 has been recalled', CAST(0x0000A29D0135D271 AS DateTime), 0, N'~/Notification/Detail/a466a698-7c72-445d-8430-f0e33e36f84f')
INSERT [dbo].[Notification] ([NotificationID], [EmployeeID], [Message], [NotinficationTime], [IsRead], [Url]) VALUES (N'33294285-44c9-45fa-a884-f2a23e83f55e', N'20250795-00e5-4355-b986-e2f3f6f9e07e', N'Your request of leave of 4/5/2014 has been approved', CAST(0x0000A29B00BB76C4 AS DateTime), 0, N'~/Notification/Detail/33294285-44c9-45fa-a884-f2a23e83f55e')
INSERT [dbo].[Notification] ([NotificationID], [EmployeeID], [Message], [NotinficationTime], [IsRead], [Url]) VALUES (N'42a607f7-7f91-41b1-bdd9-fc17300125b0', N'20250795-00e5-4355-b986-e2f3f6f9e07e', N'Your request of leave of 3/1/2014 has been approved', CAST(0x0000A29A012C058A AS DateTime), 0, N'~/Notification/Detail/42a607f7-7f91-41b1-bdd9-fc17300125b0')
INSERT [dbo].[Notification] ([NotificationID], [EmployeeID], [Message], [NotinficationTime], [IsRead], [Url]) VALUES (N'142d8fc0-4175-4e3b-b9f2-ff135e0ad5e2', N'20250795-00e5-4355-b986-e2f3f6f9e07e', N'Your timesheet of May-2014 has been recalled', CAST(0x0000A29B0124E65D AS DateTime), 0, N'~/Notification/Detail/142d8fc0-4175-4e3b-b9f2-ff135e0ad5e2')
INSERT [dbo].[Notification] ([NotificationID], [EmployeeID], [Message], [NotinficationTime], [IsRead], [Url]) VALUES (N'2bb6729a-8e93-48cb-90e2-fffd1bc6d0e2', N'81262e83-e417-4732-89d5-933d3a2ab5df', N'Your request of leave from 12/1/2013 to 12/31/2013 has been approved', CAST(0x0000A257013C4292 AS DateTime), 0, N'~/Notification/Detail/2bb6729a-8e93-48cb-90e2-fffd1bc6d0e2')
/****** Object:  Table [dbo].[LeaveType]    Script Date: 02/04/2014 12:06:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LeaveType](
	[LeaveTypeID] [uniqueidentifier] NOT NULL,
	[LeaveTypeName] [nvarchar](50) NULL,
	[LeaveTypeColor] [nvarchar](500) NULL,
	[LeaveTypeCode] [nvarchar](500) NULL,
	[DefaultLeaves] [decimal](18, 1) NULL,
 CONSTRAINT [PK_LeaveType] PRIMARY KEY CLUSTERED 
(
	[LeaveTypeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[LeaveType] ([LeaveTypeID], [LeaveTypeName], [LeaveTypeColor], [LeaveTypeCode], [DefaultLeaves]) VALUES (N'5e346fd2-cec2-4f26-b18d-058585bc936e', N'Vacation Leaves', N'#f5cf11', N'VCLV', CAST(5.0 AS Decimal(18, 1)))
INSERT [dbo].[LeaveType] ([LeaveTypeID], [LeaveTypeName], [LeaveTypeColor], [LeaveTypeCode], [DefaultLeaves]) VALUES (N'f407b5c9-25c0-4788-bf14-6b27f124a735', N'Religious Leave', N'#5555a1', N'RGLV', CAST(24.0 AS Decimal(18, 1)))
INSERT [dbo].[LeaveType] ([LeaveTypeID], [LeaveTypeName], [LeaveTypeColor], [LeaveTypeCode], [DefaultLeaves]) VALUES (N'b08b4c3d-1b3a-48be-8dcb-b3eb28889b0d', N'National Leave', N'#fa870d', N'NL', CAST(2.5 AS Decimal(18, 1)))
INSERT [dbo].[LeaveType] ([LeaveTypeID], [LeaveTypeName], [LeaveTypeColor], [LeaveTypeCode], [DefaultLeaves]) VALUES (N'07acaf8e-d70e-408b-8a06-bbb7781cb55d', N' ‎Pregnancy or Disability Leave', N'#eb117a', N'PRDISLV', CAST(5.0 AS Decimal(18, 1)))
INSERT [dbo].[LeaveType] ([LeaveTypeID], [LeaveTypeName], [LeaveTypeColor], [LeaveTypeCode], [DefaultLeaves]) VALUES (N'b1ec6a94-dce1-4b01-a3a2-d5388cbc6c15', N'Sick Leave', N'#0a0a17', N'SILV', CAST(5.0 AS Decimal(18, 1)))
/****** Object:  Table [dbo].[JobType]    Script Date: 02/04/2014 12:06:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JobType](
	[JobTypeID] [uniqueidentifier] NOT NULL,
	[JobTypeName] [nvarchar](1000) NULL,
	[JobTypeNameAr] [nvarchar](1000) NULL,
	[JobCode] [nvarchar](1000) NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_JobType] PRIMARY KEY CLUSTERED 
(
	[JobTypeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[JobType] ([JobTypeID], [JobTypeName], [JobTypeNameAr], [JobCode], [IsActive]) VALUES (N'8c9c3203-2834-4c86-8b7f-4261754f191e', N'Technical Lead', NULL, NULL, NULL)
INSERT [dbo].[JobType] ([JobTypeID], [JobTypeName], [JobTypeNameAr], [JobCode], [IsActive]) VALUES (N'6dd13b3f-3511-421c-a4f3-4fe0e2024f4f', N'Assistant Developer', N'Assistant Developer', N'AssDev00_11', 1)
/****** Object:  Table [dbo].[CountryOffice]    Script Date: 02/04/2014 12:06:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CountryOffice](
	[CountryOfficeID] [uniqueidentifier] NOT NULL,
	[CountryName] [nvarchar](50) NULL,
	[LicenseKey] [nvarchar](max) NULL,
 CONSTRAINT [PK_CountryOffice] PRIMARY KEY CLUSTERED 
(
	[CountryOfficeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[CountryOffice] ([CountryOfficeID], [CountryName], [LicenseKey]) VALUES (N'80f04243-bd24-4155-8163-2b680387666b', N'US New', NULL)
INSERT [dbo].[CountryOffice] ([CountryOfficeID], [CountryName], [LicenseKey]) VALUES (N'255fff74-c839-4c1d-9670-5e8baddb108c', N'Pakistan', NULL)
INSERT [dbo].[CountryOffice] ([CountryOfficeID], [CountryName], [LicenseKey]) VALUES (N'09a9c46f-19a9-4207-a2e3-75ded54bcd40', N'China', NULL)
INSERT [dbo].[CountryOffice] ([CountryOfficeID], [CountryName], [LicenseKey]) VALUES (N'bf91ed15-02f2-4899-b7ea-b4f666271159', N'India', NULL)
INSERT [dbo].[CountryOffice] ([CountryOfficeID], [CountryName], [LicenseKey]) VALUES (N'885a4067-6ed4-475e-8380-f33034f06791', N'England', NULL)
/****** Object:  Table [dbo].[aspnet_WebEvent_Events]    Script Date: 02/04/2014 12:06:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[aspnet_WebEvent_Events](
	[EventId] [char](32) NOT NULL,
	[EventTimeUtc] [datetime] NOT NULL,
	[EventTime] [datetime] NOT NULL,
	[EventType] [nvarchar](256) NOT NULL,
	[EventSequence] [decimal](19, 0) NOT NULL,
	[EventOccurrence] [decimal](19, 0) NOT NULL,
	[EventCode] [int] NOT NULL,
	[EventDetailCode] [int] NOT NULL,
	[Message] [nvarchar](1024) NULL,
	[ApplicationPath] [nvarchar](256) NULL,
	[ApplicationVirtualPath] [nvarchar](256) NULL,
	[MachineName] [nvarchar](256) NOT NULL,
	[RequestUrl] [nvarchar](1024) NULL,
	[ExceptionType] [nvarchar](256) NULL,
	[Details] [ntext] NULL,
PRIMARY KEY CLUSTERED 
(
	[EventId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Setup_RestorePermissions]    Script Date: 02/04/2014 12:06:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Setup_RestorePermissions]
    @name   sysname
AS
BEGIN
    DECLARE @object sysname
    DECLARE @protectType char(10)
    DECLARE @action varchar(60)
    DECLARE @grantee sysname
    DECLARE @cmd nvarchar(500)
    DECLARE c1 cursor FORWARD_ONLY FOR
        SELECT Object, ProtectType, [Action], Grantee FROM #aspnet_Permissions where Object = @name

    OPEN c1

    FETCH c1 INTO @object, @protectType, @action, @grantee
    WHILE (@@fetch_status = 0)
    BEGIN
        SET @cmd = @protectType + ' ' + @action + ' on ' + @object + ' TO [' + @grantee + ']'
        EXEC (@cmd)
        FETCH c1 INTO @object, @protectType, @action, @grantee
    END

    CLOSE c1
    DEALLOCATE c1
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Setup_RemoveAllRoleMembers]    Script Date: 02/04/2014 12:06:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Setup_RemoveAllRoleMembers]
    @name   sysname
AS
BEGIN
    CREATE TABLE #aspnet_RoleMembers
    (
        Group_name      sysname,
        Group_id        smallint,
        Users_in_group  sysname,
        User_id         smallint
    )

    INSERT INTO #aspnet_RoleMembers
    EXEC sp_helpuser @name

    DECLARE @user_id smallint
    DECLARE @cmd nvarchar(500)
    DECLARE c1 cursor FORWARD_ONLY FOR
        SELECT User_id FROM #aspnet_RoleMembers

    OPEN c1

    FETCH c1 INTO @user_id
    WHILE (@@fetch_status = 0)
    BEGIN
        SET @cmd = 'EXEC sp_droprolemember ' + '''' + @name + ''', ''' + USER_NAME(@user_id) + ''''
        EXEC (@cmd)
        FETCH c1 INTO @user_id
    END

    CLOSE c1
    DEALLOCATE c1
END
GO
/****** Object:  Table [dbo].[aspnet_SchemaVersions]    Script Date: 02/04/2014 12:06:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_SchemaVersions](
	[Feature] [nvarchar](128) NOT NULL,
	[CompatibleSchemaVersion] [nvarchar](128) NOT NULL,
	[IsCurrentVersion] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Feature] ASC,
	[CompatibleSchemaVersion] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[aspnet_SchemaVersions] ([Feature], [CompatibleSchemaVersion], [IsCurrentVersion]) VALUES (N'common', N'1', 1)
INSERT [dbo].[aspnet_SchemaVersions] ([Feature], [CompatibleSchemaVersion], [IsCurrentVersion]) VALUES (N'health monitoring', N'1', 1)
INSERT [dbo].[aspnet_SchemaVersions] ([Feature], [CompatibleSchemaVersion], [IsCurrentVersion]) VALUES (N'membership', N'1', 1)
INSERT [dbo].[aspnet_SchemaVersions] ([Feature], [CompatibleSchemaVersion], [IsCurrentVersion]) VALUES (N'personalization', N'1', 1)
INSERT [dbo].[aspnet_SchemaVersions] ([Feature], [CompatibleSchemaVersion], [IsCurrentVersion]) VALUES (N'profile', N'1', 1)
INSERT [dbo].[aspnet_SchemaVersions] ([Feature], [CompatibleSchemaVersion], [IsCurrentVersion]) VALUES (N'role manager', N'1', 1)
/****** Object:  Table [dbo].[aspnet_Users]    Script Date: 02/04/2014 12:06:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Users](
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
	[LoweredUserName] [nvarchar](256) NOT NULL,
	[MobileAlias] [nvarchar](16) NULL,
	[IsAnonymous] [bit] NOT NULL,
	[LastActivityDate] [datetime] NOT NULL,
PRIMARY KEY NONCLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE UNIQUE CLUSTERED INDEX [aspnet_Users_Index] ON [dbo].[aspnet_Users] 
(
	[ApplicationId] ASC,
	[LoweredUserName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [aspnet_Users_Index2] ON [dbo].[aspnet_Users] 
(
	[ApplicationId] ASC,
	[LastActivityDate] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'8065942f-951b-4796-a5f1-6ebeb60e5566', N'4da47cae-89b3-4944-8a9b-20d30fed93b2', N'abc.test', N'abc.test', NULL, 0, CAST(0x0000A2B500769AA5 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'8065942f-951b-4796-a5f1-6ebeb60e5566', N'cd51e13b-dcfa-4a8a-bf95-315d1845a529', N'abcd', N'abcd', NULL, 0, CAST(0x0000A2B500D18244 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'8065942f-951b-4796-a5f1-6ebeb60e5566', N'64b14fbc-a7b2-43d7-b8ba-8859121328e2', N'admin', N'admin', NULL, 0, CAST(0x0000A2BA00B20AC6 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'8065942f-951b-4796-a5f1-6ebeb60e5566', N'1a4e8d08-2dc8-4a41-82a8-14bd71588c87', N'ankush', N'ankush', NULL, 0, CAST(0x0000A2C8006AF4BD AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'8065942f-951b-4796-a5f1-6ebeb60e5566', N'3ae15168-0a27-4513-aaf3-12857ecb1419', N'harshit@sudmedhasoftech.com', N'harshit@sudmedhasoftech.com', NULL, 0, CAST(0x0000A23600CCA592 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'8065942f-951b-4796-a5f1-6ebeb60e5566', N'2453d657-8dc8-423e-9f6c-96811e8367a5', N'harshit@sumedhasoftech.com', N'harshit@sumedhasoftech.com', NULL, 0, CAST(0x0000A23600BDB7E4 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'8065942f-951b-4796-a5f1-6ebeb60e5566', N'39cf9e12-41d5-479b-b7ce-29c898e9e0a5', N'harshit@sumedhassoftech.com', N'harshit@sumedhassoftech.com', NULL, 0, CAST(0x0000A23600CC0B7A AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'8065942f-951b-4796-a5f1-6ebeb60e5566', N'fe507abe-a65f-4f14-8e24-71bec4e73c12', N'harshit11@sumedhasoftech.com', N'harshit11@sumedhasoftech.com', NULL, 0, CAST(0x0000A23600F7CD8B AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'8065942f-951b-4796-a5f1-6ebeb60e5566', N'b0ace9a4-f051-4e04-baba-3105a15602e8', N'harshit123223@sumedhasoftech.com', N'harshit123223@sumedhasoftech.com', NULL, 0, CAST(0x0000A23600F9734D AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'8065942f-951b-4796-a5f1-6ebeb60e5566', N'c706f096-b49b-4725-8972-48c91c19dbc3', N'hdarji91191@gmail.com', N'hdarji91191@gmail.com', NULL, 0, CAST(0x0000A23600D08EF9 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'8065942f-951b-4796-a5f1-6ebeb60e5566', N'0592f3e1-9562-4fba-90ae-e95c81b9cf43', N'hdarji99@gmail.com', N'hdarji99@gmail.com', NULL, 0, CAST(0x0000A236009A45D2 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'8065942f-951b-4796-a5f1-6ebeb60e5566', N'e110b97b-c5b3-4bc1-82f2-ed3f836cd2fc', N'hdarji9911111111@gmail.com', N'hdarji9911111111@gmail.com', NULL, 0, CAST(0x0000A23600EAF5F7 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'8065942f-951b-4796-a5f1-6ebeb60e5566', N'23ac60df-c96d-4d36-9947-683f8b456999', N'hdarji995555@gmail.com', N'hdarji995555@gmail.com', NULL, 0, CAST(0x0000A23600C9B48C AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'8065942f-951b-4796-a5f1-6ebeb60e5566', N'85600b19-84c8-4958-bfe4-f9503b5dd72b', N'hrmanager', N'hrmanager', NULL, 0, CAST(0x0000A2BE00A0A40F AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'8065942f-951b-4796-a5f1-6ebeb60e5566', N'65ae08b6-8b50-4e39-99c6-1d34b4fc9e12', N'isaac', N'isaac', NULL, 0, CAST(0x0000A244006D8590 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'8065942f-951b-4796-a5f1-6ebeb60e5566', N'b09d6144-17ee-4534-9989-c65d940716f0', N'jh@gmail.com', N'jh@gmail.com', NULL, 0, CAST(0x0000A23500E36812 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'8065942f-951b-4796-a5f1-6ebeb60e5566', N'0604db0c-9d44-48bc-86e9-e41cbb2ff72c', N'jini@gmail.com', N'jini@gmail.com', NULL, 0, CAST(0x0000A23500CD5361 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'8065942f-951b-4796-a5f1-6ebeb60e5566', N'e68785d7-5c38-4fbf-8fdd-4e631e59a428', N'krishan', N'krishan', NULL, 0, CAST(0x0000A2B500AB39FC AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'8065942f-951b-4796-a5f1-6ebeb60e5566', N'a351ed81-7cdd-49a7-a01c-02ce3bddf9db', N'mishra.neeraj007@gmail.com', N'mishra.neeraj007@gmail.com', NULL, 0, CAST(0x0000A29A00A37532 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'8065942f-951b-4796-a5f1-6ebeb60e5566', N'a9fbe8a1-9ca2-4851-9a1e-b654747ad1cf', N'navin', N'navin', NULL, 0, CAST(0x0000A2C80061DC58 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'8065942f-951b-4796-a5f1-6ebeb60e5566', N'22fcf411-38c3-414f-8bd6-11256196859a', N'neer@gmail.com', N'neer@gmail.com', NULL, 0, CAST(0x0000A236004EA8FE AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'8065942f-951b-4796-a5f1-6ebeb60e5566', N'09d611c3-c4db-4c8c-a968-729d1a81ddcc', N'rajesh', N'rajesh', NULL, 0, CAST(0x0000A2C80062D966 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'8065942f-951b-4796-a5f1-6ebeb60e5566', N'ef392243-d0d5-45e9-922a-a5aceb8b55a7', N'rajkumar', N'rajkumar', NULL, 0, CAST(0x0000A2B5008656B5 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'8065942f-951b-4796-a5f1-6ebeb60e5566', N'a127dfec-7742-476a-a475-a8d7db64a981', N'rajkumar@sumedhasoftech.com', N'rajkumar@sumedhasoftech.com', NULL, 0, CAST(0x0000A23500F2402F AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'8065942f-951b-4796-a5f1-6ebeb60e5566', N'aedc10cd-9b08-41e3-8cef-fae79c182d95', N'sadsad', N'sadsad', NULL, 0, CAST(0x0000A29800CFC46C AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'8065942f-951b-4796-a5f1-6ebeb60e5566', N'c63227fb-735e-4654-b227-827130b7e82e', N'shashikant', N'shashikant', NULL, 0, CAST(0x0000A2C500612C2A AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'8065942f-951b-4796-a5f1-6ebeb60e5566', N'a0ece7c0-63df-482f-b757-415fd657ad56', N'shyam@sumedhasoftech.com', N'shyam@sumedhasoftech.com', NULL, 0, CAST(0x0000A23500F8D83D AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'8065942f-951b-4796-a5f1-6ebeb60e5566', N'899dcc83-db4d-4403-92e5-1ce4f1b5b6de', N'superadmin', N'superadmin', NULL, 0, CAST(0x0000A2C800627420 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'8065942f-951b-4796-a5f1-6ebeb60e5566', N'bc2ab491-a3e1-4eaf-b3b6-c5c686d57cf8', N'test', N'test', NULL, 0, CAST(0x0000A2B6005E941C AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'8065942f-951b-4796-a5f1-6ebeb60e5566', N'9437ca69-7a4b-42a3-b454-c49191aa593b', N'vaibhav', N'vaibhav', NULL, 0, CAST(0x0000A2B50086D281 AS DateTime))
/****** Object:  StoredProcedure [dbo].[aspnet_UnRegisterSchemaVersion]    Script Date: 02/04/2014 12:06:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_UnRegisterSchemaVersion]
    @Feature                   nvarchar(128),
    @CompatibleSchemaVersion   nvarchar(128)
AS
BEGIN
    DELETE FROM dbo.aspnet_SchemaVersions
        WHERE   Feature = LOWER(@Feature) AND @CompatibleSchemaVersion = CompatibleSchemaVersion
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_CheckSchemaVersion]    Script Date: 02/04/2014 12:06:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_CheckSchemaVersion]
    @Feature                   nvarchar(128),
    @CompatibleSchemaVersion   nvarchar(128)
AS
BEGIN
    IF (EXISTS( SELECT  *
                FROM    dbo.aspnet_SchemaVersions
                WHERE   Feature = LOWER( @Feature ) AND
                        CompatibleSchemaVersion = @CompatibleSchemaVersion ))
        RETURN 0

    RETURN 1
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Applications_CreateApplication]    Script Date: 02/04/2014 12:06:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Applications_CreateApplication]
    @ApplicationName      nvarchar(256),
    @ApplicationId        uniqueidentifier OUTPUT
AS
BEGIN
    SELECT  @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName

    IF(@ApplicationId IS NULL)
    BEGIN
        DECLARE @TranStarted   bit
        SET @TranStarted = 0

        IF( @@TRANCOUNT = 0 )
        BEGIN
	        BEGIN TRANSACTION
	        SET @TranStarted = 1
        END
        ELSE
    	    SET @TranStarted = 0

        SELECT  @ApplicationId = ApplicationId
        FROM dbo.aspnet_Applications WITH (UPDLOCK, HOLDLOCK)
        WHERE LOWER(@ApplicationName) = LoweredApplicationName

        IF(@ApplicationId IS NULL)
        BEGIN
            SELECT  @ApplicationId = NEWID()
            INSERT  dbo.aspnet_Applications (ApplicationId, ApplicationName, LoweredApplicationName)
            VALUES  (@ApplicationId, @ApplicationName, LOWER(@ApplicationName))
        END


        IF( @TranStarted = 1 )
        BEGIN
            IF(@@ERROR = 0)
            BEGIN
	        SET @TranStarted = 0
	        COMMIT TRANSACTION
            END
            ELSE
            BEGIN
                SET @TranStarted = 0
                ROLLBACK TRANSACTION
            END
        END
    END
END
GO
/****** Object:  Table [dbo].[City]    Script Date: 02/04/2014 12:06:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City](
	[CityID] [uniqueidentifier] NOT NULL,
	[City] [nvarchar](50) NULL,
	[CountryOfficeID] [uniqueidentifier] NULL,
 CONSTRAINT [PK_City] PRIMARY KEY CLUSTERED 
(
	[CityID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[City] ([CityID], [City], [CountryOfficeID]) VALUES (N'223755e7-ac19-4066-82a1-0d97e0a9e1d0', N'London', N'885a4067-6ed4-475e-8380-f33034f06791')
INSERT [dbo].[City] ([CityID], [City], [CountryOfficeID]) VALUES (N'cb828cd7-0985-4586-a1e2-800eafe0a71f', N'Kota', N'bf91ed15-02f2-4899-b7ea-b4f666271159')
INSERT [dbo].[City] ([CityID], [City], [CountryOfficeID]) VALUES (N'4cb2bd0a-eac6-40a6-86d5-95e0cff1f0fd', N'Lahore', N'255fff74-c839-4c1d-9670-5e8baddb108c')
INSERT [dbo].[City] ([CityID], [City], [CountryOfficeID]) VALUES (N'5cefa702-b1ee-4cc2-944c-bdcae2a2ccc6', N'Sanghai', N'09a9c46f-19a9-4207-a2e3-75ded54bcd40')
INSERT [dbo].[City] ([CityID], [City], [CountryOfficeID]) VALUES (N'8c30d969-b5b3-4ce4-beb6-dbd7809d0523', N'Jaipur', N'bf91ed15-02f2-4899-b7ea-b4f666271159')
INSERT [dbo].[City] ([CityID], [City], [CountryOfficeID]) VALUES (N'e373e97e-7e8d-47ba-9536-df106ed5bf44', N'Delhi', N'bf91ed15-02f2-4899-b7ea-b4f666271159')
/****** Object:  StoredProcedure [dbo].[aspnet_WebEvent_LogEvent]    Script Date: 02/04/2014 12:06:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_WebEvent_LogEvent]
        @EventId         char(32),
        @EventTimeUtc    datetime,
        @EventTime       datetime,
        @EventType       nvarchar(256),
        @EventSequence   decimal(19,0),
        @EventOccurrence decimal(19,0),
        @EventCode       int,
        @EventDetailCode int,
        @Message         nvarchar(1024),
        @ApplicationPath nvarchar(256),
        @ApplicationVirtualPath nvarchar(256),
        @MachineName    nvarchar(256),
        @RequestUrl      nvarchar(1024),
        @ExceptionType   nvarchar(256),
        @Details         ntext
AS
BEGIN
    INSERT
        dbo.aspnet_WebEvent_Events
        (
            EventId,
            EventTimeUtc,
            EventTime,
            EventType,
            EventSequence,
            EventOccurrence,
            EventCode,
            EventDetailCode,
            Message,
            ApplicationPath,
            ApplicationVirtualPath,
            MachineName,
            RequestUrl,
            ExceptionType,
            Details
        )
    VALUES
    (
        @EventId,
        @EventTimeUtc,
        @EventTime,
        @EventType,
        @EventSequence,
        @EventOccurrence,
        @EventCode,
        @EventDetailCode,
        @Message,
        @ApplicationPath,
        @ApplicationVirtualPath,
        @MachineName,
        @RequestUrl,
        @ExceptionType,
        @Details
    )
END
GO
/****** Object:  Table [dbo].[Project]    Script Date: 02/04/2014 12:06:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Project](
	[ProjectId] [uniqueidentifier] NOT NULL,
	[ProjectName] [nvarchar](100) NULL,
	[CountryID] [uniqueidentifier] NULL,
	[ProjectNumber] [nvarchar](100) NULL,
	[ProjectNameAr] [nvarchar](max) NULL,
	[FromDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
 CONSTRAINT [PK_Project] PRIMARY KEY CLUSTERED 
(
	[ProjectId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Project] ([ProjectId], [ProjectName], [CountryID], [ProjectNumber], [ProjectNameAr], [FromDate], [EndDate]) VALUES (N'2946664a-12a0-4827-a41b-272b500a770a', N'Tapestry', N'bf91ed15-02f2-4899-b7ea-b4f666271159', N'SS001', NULL, CAST(0x0000A26900000000 AS DateTime), CAST(0x0000A28700000000 AS DateTime))
INSERT [dbo].[Project] ([ProjectId], [ProjectName], [CountryID], [ProjectNumber], [ProjectNameAr], [FromDate], [EndDate]) VALUES (N'49010d13-4567-4c15-b9d9-586e1ec55049', N'Metro', N'bf91ed15-02f2-4899-b7ea-b4f666271159', N'm2010', N'aaa', CAST(0x0000A13900000000 AS DateTime), CAST(0x0000A2A500000000 AS DateTime))
INSERT [dbo].[Project] ([ProjectId], [ProjectName], [CountryID], [ProjectNumber], [ProjectNameAr], [FromDate], [EndDate]) VALUES (N'7c5595da-c05a-416c-b2b3-713c9b9853f5', N'new project', N'bf91ed15-02f2-4899-b7ea-b4f666271159', N'1', N'new project', CAST(0x0000A29A00000000 AS DateTime), CAST(0x0000A2A500000000 AS DateTime))
INSERT [dbo].[Project] ([ProjectId], [ProjectName], [CountryID], [ProjectNumber], [ProjectNameAr], [FromDate], [EndDate]) VALUES (N'b5ad254d-bab8-4af9-b24d-7e982c01287c', N'New Project 2', N'bf91ed15-02f2-4899-b7ea-b4f666271159', N'2', N'New Project 2', CAST(0x0000A29900000000 AS DateTime), CAST(0x0000A2A500000000 AS DateTime))
/****** Object:  View [dbo].[vw_aspnet_Applications]    Script Date: 02/04/2014 12:06:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[vw_aspnet_Applications]
  AS SELECT [dbo].[aspnet_Applications].[ApplicationName], [dbo].[aspnet_Applications].[LoweredApplicationName], [dbo].[aspnet_Applications].[ApplicationId], [dbo].[aspnet_Applications].[Description]
  FROM [dbo].[aspnet_Applications]
GO
/****** Object:  Table [dbo].[aspnet_Paths]    Script Date: 02/04/2014 12:06:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Paths](
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[PathId] [uniqueidentifier] NOT NULL,
	[Path] [nvarchar](256) NOT NULL,
	[LoweredPath] [nvarchar](256) NOT NULL,
PRIMARY KEY NONCLUSTERED 
(
	[PathId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE UNIQUE CLUSTERED INDEX [aspnet_Paths_index] ON [dbo].[aspnet_Paths] 
(
	[ApplicationId] ASC,
	[LoweredPath] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Personalization_GetApplicationId]    Script Date: 02/04/2014 12:06:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Personalization_GetApplicationId] (
    @ApplicationName NVARCHAR(256),
    @ApplicationId UNIQUEIDENTIFIER OUT)
AS
BEGIN
    SELECT @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
END
GO
/****** Object:  Table [dbo].[aspnet_Roles]    Script Date: 02/04/2014 12:06:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Roles](
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[RoleId] [uniqueidentifier] NOT NULL,
	[RoleName] [nvarchar](256) NOT NULL,
	[LoweredRoleName] [nvarchar](256) NOT NULL,
	[Description] [nvarchar](256) NULL,
PRIMARY KEY NONCLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE UNIQUE CLUSTERED INDEX [aspnet_Roles_index1] ON [dbo].[aspnet_Roles] 
(
	[ApplicationId] ASC,
	[LoweredRoleName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
INSERT [dbo].[aspnet_Roles] ([ApplicationId], [RoleId], [RoleName], [LoweredRoleName], [Description]) VALUES (N'8065942f-951b-4796-a5f1-6ebeb60e5566', N'bef6df3f-52e7-4e24-8895-6681646ac410', N'admin', N'admin', NULL)
INSERT [dbo].[aspnet_Roles] ([ApplicationId], [RoleId], [RoleName], [LoweredRoleName], [Description]) VALUES (N'8065942f-951b-4796-a5f1-6ebeb60e5566', N'a6b9b910-0d4c-4df9-827f-5bbd02583196', N'employee', N'employee', NULL)
INSERT [dbo].[aspnet_Roles] ([ApplicationId], [RoleId], [RoleName], [LoweredRoleName], [Description]) VALUES (N'8065942f-951b-4796-a5f1-6ebeb60e5566', N'8ebd27b5-5f04-45a6-a119-cdeea1e0e131', N'hr', N'hr', NULL)
INSERT [dbo].[aspnet_Roles] ([ApplicationId], [RoleId], [RoleName], [LoweredRoleName], [Description]) VALUES (N'8065942f-951b-4796-a5f1-6ebeb60e5566', N'dd2f28a4-b48c-491d-ac39-acff063847a7', N'setup', N'setup', NULL)
INSERT [dbo].[aspnet_Roles] ([ApplicationId], [RoleId], [RoleName], [LoweredRoleName], [Description]) VALUES (N'8065942f-951b-4796-a5f1-6ebeb60e5566', N'cf3c0230-c6f3-4de0-b4c1-c4493024a66e', N'superadmin', N'superadmin', NULL)
/****** Object:  StoredProcedure [dbo].[aspnet_RegisterSchemaVersion]    Script Date: 02/04/2014 12:06:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_RegisterSchemaVersion]
    @Feature                   nvarchar(128),
    @CompatibleSchemaVersion   nvarchar(128),
    @IsCurrentVersion          bit,
    @RemoveIncompatibleSchema  bit
AS
BEGIN
    IF( @RemoveIncompatibleSchema = 1 )
    BEGIN
        DELETE FROM dbo.aspnet_SchemaVersions WHERE Feature = LOWER( @Feature )
    END
    ELSE
    BEGIN
        IF( @IsCurrentVersion = 1 )
        BEGIN
            UPDATE dbo.aspnet_SchemaVersions
            SET IsCurrentVersion = 0
            WHERE Feature = LOWER( @Feature )
        END
    END

    INSERT  dbo.aspnet_SchemaVersions( Feature, CompatibleSchemaVersion, IsCurrentVersion )
    VALUES( LOWER( @Feature ), @CompatibleSchemaVersion, @IsCurrentVersion )
END
GO
/****** Object:  Table [dbo].[aspnet_PersonalizationPerUser]    Script Date: 02/04/2014 12:06:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_PersonalizationPerUser](
	[Id] [uniqueidentifier] NOT NULL,
	[PathId] [uniqueidentifier] NULL,
	[UserId] [uniqueidentifier] NULL,
	[PageSettings] [image] NOT NULL,
	[LastUpdatedDate] [datetime] NOT NULL,
PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE UNIQUE CLUSTERED INDEX [aspnet_PersonalizationPerUser_index1] ON [dbo].[aspnet_PersonalizationPerUser] 
(
	[PathId] ASC,
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [aspnet_PersonalizationPerUser_ncindex2] ON [dbo].[aspnet_PersonalizationPerUser] 
(
	[UserId] ASC,
	[PathId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[aspnet_Profile]    Script Date: 02/04/2014 12:06:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Profile](
	[UserId] [uniqueidentifier] NOT NULL,
	[PropertyNames] [ntext] NOT NULL,
	[PropertyValuesString] [ntext] NOT NULL,
	[PropertyValuesBinary] [image] NOT NULL,
	[LastUpdatedDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[aspnet_Membership]    Script Date: 02/04/2014 12:06:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Membership](
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[Password] [nvarchar](128) NOT NULL,
	[PasswordFormat] [int] NOT NULL,
	[PasswordSalt] [nvarchar](128) NOT NULL,
	[MobilePIN] [nvarchar](16) NULL,
	[Email] [nvarchar](256) NULL,
	[LoweredEmail] [nvarchar](256) NULL,
	[PasswordQuestion] [nvarchar](256) NULL,
	[PasswordAnswer] [nvarchar](128) NULL,
	[IsApproved] [bit] NOT NULL,
	[IsLockedOut] [bit] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[LastLoginDate] [datetime] NOT NULL,
	[LastPasswordChangedDate] [datetime] NOT NULL,
	[LastLockoutDate] [datetime] NOT NULL,
	[FailedPasswordAttemptCount] [int] NOT NULL,
	[FailedPasswordAttemptWindowStart] [datetime] NOT NULL,
	[FailedPasswordAnswerAttemptCount] [int] NOT NULL,
	[FailedPasswordAnswerAttemptWindowStart] [datetime] NOT NULL,
	[Comment] [ntext] NULL,
PRIMARY KEY NONCLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE CLUSTERED INDEX [aspnet_Membership_index] ON [dbo].[aspnet_Membership] 
(
	[ApplicationId] ASC,
	[LoweredEmail] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'8065942f-951b-4796-a5f1-6ebeb60e5566', N'a351ed81-7cdd-49a7-a01c-02ce3bddf9db', N'HUGZ1fx9q6ZJrqRU2HHpPFYEXoU=', 1, N'B0Bz/ptUOK/A+FDnLhCLnw==', NULL, NULL, NULL, NULL, NULL, 1, 0, CAST(0x0000A23400799E60 AS DateTime), CAST(0x0000A29A00A37532 AS DateTime), CAST(0x0000A23400799E60 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'8065942f-951b-4796-a5f1-6ebeb60e5566', N'1a4e8d08-2dc8-4a41-82a8-14bd71588c87', N'j4INFsDdDF0jrtejL7j94bbgR2E=', 1, N'ZaJ8CFz+sbaUyZbJeZi3qA==', NULL, N'ankush@sumedhasoftech.com', N'ankush@sumedhasoftech.com', NULL, NULL, 1, 0, CAST(0x0000A252004AFB50 AS DateTime), CAST(0x0000A2C80069B842 AS DateTime), CAST(0x0000A29A00CD2D9F AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'8065942f-951b-4796-a5f1-6ebeb60e5566', N'aedc10cd-9b08-41e3-8cef-fae79c182d95', N'+s24boeS8we1vn/358E2Avq3K6w=', 1, N'dvfQ2eWgM2O/C+q1CvcRsw==', NULL, N'ashwini.deshmukh@consagous.com', N'ashwini.deshmukh@consagous.com', NULL, NULL, 0, 0, CAST(0x0000A296008C2E54 AS DateTime), CAST(0x0000A29800C4A4E6 AS DateTime), CAST(0x0000A296008C2E54 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'8065942f-951b-4796-a5f1-6ebeb60e5566', N'85600b19-84c8-4958-bfe4-f9503b5dd72b', N'C9tiXgfNo4GxU4JoK758YKkEi1M=', 1, N'lNREszyqGZPbkgGkxAW7ZA==', NULL, N'hrmanager@gmail.com', N'hrmanager@gmail.com', NULL, NULL, 1, 0, CAST(0x0000A22A00D46250 AS DateTime), CAST(0x0000A2BE00A0A40F AS DateTime), CAST(0x0000A22A00D46250 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'8065942f-951b-4796-a5f1-6ebeb60e5566', N'65ae08b6-8b50-4e39-99c6-1d34b4fc9e12', N'ab7BilrVnhmbBfwk5nZBQvXiS/8=', 1, N'Mco8h2xXcVOpCYf8XgI9Tw==', NULL, N'isaac.sspl@gmail.com', N'isaac.sspl@gmail.com', NULL, NULL, 1, 0, CAST(0x0000A24400696FCC AS DateTime), CAST(0x0000A24400696FCC AS DateTime), CAST(0x0000A244006DB8DB AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'8065942f-951b-4796-a5f1-6ebeb60e5566', N'cd51e13b-dcfa-4a8a-bf95-315d1845a529', N'4MqnA3ic1f8Zq/8jBy9H3qp2m/A=', 1, N'5go1ouVPgwFLrND4TLAuYA==', NULL, N'k@gmail.com', N'k@gmail.com', NULL, NULL, 1, 0, CAST(0x0000A2B500CDF3D4 AS DateTime), CAST(0x0000A2B500D16C2C AS DateTime), CAST(0x0000A2B500CDF3D4 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'8065942f-951b-4796-a5f1-6ebeb60e5566', N'e68785d7-5c38-4fbf-8fdd-4e631e59a428', N'yLFLU/ISy8OWlWozT1yLcZuDoTY=', 1, N'FNakW0eWdPM7EPCJU+5gWQ==', NULL, N'krishan.sspl@gmail.com', N'krishan.sspl@gmail.com', NULL, NULL, 1, 0, CAST(0x0000A2B500AB39FC AS DateTime), CAST(0x0000A2B500AB39FC AS DateTime), CAST(0x0000A2B500AB39FC AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'8065942f-951b-4796-a5f1-6ebeb60e5566', N'a9fbe8a1-9ca2-4851-9a1e-b654747ad1cf', N'UW9E26JBfxmj3B5byUa84fhw5lI=', 1, N'UPhmd7yXpPmZNumXC5nPaw==', NULL, N'navin@gmail.com', N'navin@gmail.com', NULL, NULL, 1, 0, CAST(0x0000A29A00A90074 AS DateTime), CAST(0x0000A2C80061291A AS DateTime), CAST(0x0000A2B500BF1A6E AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'8065942f-951b-4796-a5f1-6ebeb60e5566', N'09d611c3-c4db-4c8c-a968-729d1a81ddcc', N'+bDq2AebPeTVDHlyuXZnzD+hDVs=', 1, N'DwZoCyI3BwthhgC59NQ4mQ==', NULL, N'rajesh@gmail.com', N'rajesh@gmail.com', NULL, NULL, 1, 0, CAST(0x0000A2BE00B61804 AS DateTime), CAST(0x0000A2C800628540 AS DateTime), CAST(0x0000A2BE00B61804 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'8065942f-951b-4796-a5f1-6ebeb60e5566', N'ef392243-d0d5-45e9-922a-a5aceb8b55a7', N'6VkP3oAtpPnoZjUXzn03dg1GOZc=', 1, N'Jaq/Rd3i2nNbgLAWIdWBCA==', NULL, N'rajkumar@sumedhasoftech.com', N'rajkumar@sumedhasoftech.com', NULL, NULL, 1, 0, CAST(0x0000A27A00C6CFB4 AS DateTime), CAST(0x0000A2B500860F57 AS DateTime), CAST(0x0000A27A00C6CFB4 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'8065942f-951b-4796-a5f1-6ebeb60e5566', N'c63227fb-735e-4654-b227-827130b7e82e', N'g+QRq54KAkl7VS/1AgEM9x+hn7Y=', 1, N'7nb6kuo1rtBfqsOCD/v+rw==', NULL, N'shashikant.sspl@gmail.com', N'shashikant.sspl@gmail.com', NULL, NULL, 1, 0, CAST(0x0000A29D00C23F58 AS DateTime), CAST(0x0000A2C5006100BE AS DateTime), CAST(0x0000A29D00C23F58 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'8065942f-951b-4796-a5f1-6ebeb60e5566', N'64b14fbc-a7b2-43d7-b8ba-8859121328e2', N'plGT4QidNCBC0gnJoEchumvM9X0=', 1, N'Mc7YUN4UovW60b7zMuNfJA==', NULL, N'ssplmailsender@gmail.com', N'ssplmailsender@gmail.com', NULL, NULL, 1, 0, CAST(0x0000A234006AD8BC AS DateTime), CAST(0x0000A2BA00B20A75 AS DateTime), CAST(0x0000A234006AD8BC AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'8065942f-951b-4796-a5f1-6ebeb60e5566', N'899dcc83-db4d-4403-92e5-1ce4f1b5b6de', N'noMDV18h/yZynuVy6g0u5kezVb0=', 1, N'Tu6AB+HC8kBHF6yuFsQXGw==', NULL, N'superadmin@gmail.com', N'superadmin@gmail.com', NULL, NULL, 1, 0, CAST(0x0000A2340069747C AS DateTime), CAST(0x0000A2C800620BF0 AS DateTime), CAST(0x0000A2340069747C AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'8065942f-951b-4796-a5f1-6ebeb60e5566', N'4da47cae-89b3-4944-8a9b-20d30fed93b2', N'3KULi8MpU68036LQETjsf8VWlUk=', 1, N'+uaBHBF0poeoywEQid5eYA==', NULL, N'test.sumedha@gmail.com', N'test.sumedha@gmail.com', NULL, NULL, 1, 0, CAST(0x0000A25300826734 AS DateTime), CAST(0x0000A2B5007686A0 AS DateTime), CAST(0x0000A25300826734 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'8065942f-951b-4796-a5f1-6ebeb60e5566', N'bc2ab491-a3e1-4eaf-b3b6-c5c686d57cf8', N'WKDzQJuDFa0ulCI8E4egJq1LAe4=', 1, N'uB7uvW/C8BbJUiF5zSm5vA==', NULL, N'testing@gmail.com', N'testing@gmail.com', NULL, NULL, 1, 0, CAST(0x0000A2B6005E941C AS DateTime), CAST(0x0000A2B6005E941C AS DateTime), CAST(0x0000A2B6005E941C AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'8065942f-951b-4796-a5f1-6ebeb60e5566', N'9437ca69-7a4b-42a3-b454-c49191aa593b', N'Jgf7Dl3rSwU0/OZ6Aq6mA4CkJG0=', 1, N'uZgG69sQoG1fV4Qp2PIh/A==', NULL, N'vaibhav.sspl@gmail.com', N'vaibhav.sspl@gmail.com', NULL, NULL, 1, 0, CAST(0x0000A2570066C114 AS DateTime), CAST(0x0000A2B50086BB72 AS DateTime), CAST(0x0000A2570066C114 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
/****** Object:  StoredProcedure [dbo].[aspnet_Paths_CreatePath]    Script Date: 02/04/2014 12:06:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Paths_CreatePath]
    @ApplicationId UNIQUEIDENTIFIER,
    @Path           NVARCHAR(256),
    @PathId         UNIQUEIDENTIFIER OUTPUT
AS
BEGIN
    BEGIN TRANSACTION
    IF (NOT EXISTS(SELECT * FROM dbo.aspnet_Paths WHERE LoweredPath = LOWER(@Path) AND ApplicationId = @ApplicationId))
    BEGIN
        INSERT dbo.aspnet_Paths (ApplicationId, Path, LoweredPath) VALUES (@ApplicationId, @Path, LOWER(@Path))
    END
    COMMIT TRANSACTION
    SELECT @PathId = PathId FROM dbo.aspnet_Paths WHERE LOWER(@Path) = LoweredPath AND ApplicationId = @ApplicationId
END
GO
/****** Object:  Table [dbo].[aspnet_PersonalizationAllUsers]    Script Date: 02/04/2014 12:06:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_PersonalizationAllUsers](
	[PathId] [uniqueidentifier] NOT NULL,
	[PageSettings] [image] NOT NULL,
	[LastUpdatedDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PathId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_aspnet_WebPartState_Paths]    Script Date: 02/04/2014 12:06:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[vw_aspnet_WebPartState_Paths]
  AS SELECT [dbo].[aspnet_Paths].[ApplicationId], [dbo].[aspnet_Paths].[PathId], [dbo].[aspnet_Paths].[Path], [dbo].[aspnet_Paths].[LoweredPath]
  FROM [dbo].[aspnet_Paths]
GO
/****** Object:  View [dbo].[vw_aspnet_Users]    Script Date: 02/04/2014 12:06:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[vw_aspnet_Users]
  AS SELECT [dbo].[aspnet_Users].[ApplicationId], [dbo].[aspnet_Users].[UserId], [dbo].[aspnet_Users].[UserName], [dbo].[aspnet_Users].[LoweredUserName], [dbo].[aspnet_Users].[MobileAlias], [dbo].[aspnet_Users].[IsAnonymous], [dbo].[aspnet_Users].[LastActivityDate]
  FROM [dbo].[aspnet_Users]
GO
/****** Object:  View [dbo].[vw_aspnet_Roles]    Script Date: 02/04/2014 12:06:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[vw_aspnet_Roles]
  AS SELECT [dbo].[aspnet_Roles].[ApplicationId], [dbo].[aspnet_Roles].[RoleId], [dbo].[aspnet_Roles].[RoleName], [dbo].[aspnet_Roles].[LoweredRoleName], [dbo].[aspnet_Roles].[Description]
  FROM [dbo].[aspnet_Roles]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Roles_CreateRole]    Script Date: 02/04/2014 12:06:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Roles_CreateRole]
    @ApplicationName  nvarchar(256),
    @RoleName         nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
        BEGIN TRANSACTION
        SET @TranStarted = 1
    END
    ELSE
        SET @TranStarted = 0

    EXEC dbo.aspnet_Applications_CreateApplication @ApplicationName, @ApplicationId OUTPUT

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF (EXISTS(SELECT RoleId FROM dbo.aspnet_Roles WHERE LoweredRoleName = LOWER(@RoleName) AND ApplicationId = @ApplicationId))
    BEGIN
        SET @ErrorCode = 1
        GOTO Cleanup
    END

    INSERT INTO dbo.aspnet_Roles
                (ApplicationId, RoleName, LoweredRoleName)
         VALUES (@ApplicationId, @RoleName, LOWER(@RoleName))

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
        COMMIT TRANSACTION
    END

    RETURN(0)

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
        ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END
GO
/****** Object:  Table [dbo].[EmployeeLocation]    Script Date: 02/04/2014 12:06:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeLocation](
	[LocationID] [uniqueidentifier] NOT NULL,
	[City] [nvarchar](50) NULL,
	[Country] [nvarchar](50) NULL,
	[LocationName] [nvarchar](50) NULL,
	[CityID] [uniqueidentifier] NULL,
	[CountryID] [uniqueidentifier] NULL,
 CONSTRAINT [PK_EmployeeLocation] PRIMARY KEY CLUSTERED 
(
	[LocationID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[EmployeeLocation] ([LocationID], [City], [Country], [LocationName], [CityID], [CountryID]) VALUES (N'01f80e29-80dd-4bdd-8dfd-3ef6f6125b83', NULL, NULL, N'Lal Chock', N'4cb2bd0a-eac6-40a6-86d5-95e0cff1f0fd', N'255fff74-c839-4c1d-9670-5e8baddb108c')
INSERT [dbo].[EmployeeLocation] ([LocationID], [City], [Country], [LocationName], [CityID], [CountryID]) VALUES (N'054f16bd-d86f-4b82-9ed8-5539ed0c20d1', NULL, NULL, N'8 Howling Lane, Hackney ', N'223755e7-ac19-4066-82a1-0d97e0a9e1d0', N'885a4067-6ed4-475e-8380-f33034f06791')
INSERT [dbo].[EmployeeLocation] ([LocationID], [City], [Country], [LocationName], [CityID], [CountryID]) VALUES (N'5a20bf81-422b-41a6-b3ea-ccaa5c46b273', NULL, NULL, N'Indirapuram', N'e373e97e-7e8d-47ba-9536-df106ed5bf44', N'bf91ed15-02f2-4899-b7ea-b4f666271159')
INSERT [dbo].[EmployeeLocation] ([LocationID], [City], [Country], [LocationName], [CityID], [CountryID]) VALUES (N'dbc51c6d-7cc0-4695-9caa-ce965e113365', NULL, NULL, N'Vaishali Nagar', N'8c30d969-b5b3-4ce4-beb6-dbd7809d0523', N'bf91ed15-02f2-4899-b7ea-b4f666271159')
/****** Object:  StoredProcedure [dbo].[aspnet_Users_CreateUser]    Script Date: 02/04/2014 12:06:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Users_CreateUser]
    @ApplicationId    uniqueidentifier,
    @UserName         nvarchar(256),
    @IsUserAnonymous  bit,
    @LastActivityDate DATETIME,
    @UserId           uniqueidentifier OUTPUT
AS
BEGIN
    IF( @UserId IS NULL )
        SELECT @UserId = NEWID()
    ELSE
    BEGIN
        IF( EXISTS( SELECT UserId FROM dbo.aspnet_Users
                    WHERE @UserId = UserId ) )
            RETURN -1
    END

    INSERT dbo.aspnet_Users (ApplicationId, UserId, UserName, LoweredUserName, IsAnonymous, LastActivityDate)
    VALUES (@ApplicationId, @UserId, @UserName, LOWER(@UserName), @IsUserAnonymous, @LastActivityDate)

    RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Roles_RoleExists]    Script Date: 02/04/2014 12:06:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Roles_RoleExists]
    @ApplicationName  nvarchar(256),
    @RoleName         nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(0)
    IF (EXISTS (SELECT RoleName FROM dbo.aspnet_Roles WHERE LOWER(@RoleName) = LoweredRoleName AND ApplicationId = @ApplicationId ))
        RETURN(1)
    ELSE
        RETURN(0)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Roles_GetAllRoles]    Script Date: 02/04/2014 12:06:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Roles_GetAllRoles] (
    @ApplicationName           nvarchar(256))
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN
    SELECT RoleName
    FROM   dbo.aspnet_Roles WHERE ApplicationId = @ApplicationId
    ORDER BY RoleName
END
GO
/****** Object:  Table [dbo].[aspnet_UsersInRoles]    Script Date: 02/04/2014 12:06:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_UsersInRoles](
	[UserId] [uniqueidentifier] NOT NULL,
	[RoleId] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [aspnet_UsersInRoles_index] ON [dbo].[aspnet_UsersInRoles] 
(
	[RoleId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'a351ed81-7cdd-49a7-a01c-02ce3bddf9db', N'a6b9b910-0d4c-4df9-827f-5bbd02583196')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'22fcf411-38c3-414f-8bd6-11256196859a', N'a6b9b910-0d4c-4df9-827f-5bbd02583196')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'3ae15168-0a27-4513-aaf3-12857ecb1419', N'a6b9b910-0d4c-4df9-827f-5bbd02583196')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'1a4e8d08-2dc8-4a41-82a8-14bd71588c87', N'a6b9b910-0d4c-4df9-827f-5bbd02583196')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'4da47cae-89b3-4944-8a9b-20d30fed93b2', N'a6b9b910-0d4c-4df9-827f-5bbd02583196')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'39cf9e12-41d5-479b-b7ce-29c898e9e0a5', N'a6b9b910-0d4c-4df9-827f-5bbd02583196')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'b0ace9a4-f051-4e04-baba-3105a15602e8', N'a6b9b910-0d4c-4df9-827f-5bbd02583196')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'cd51e13b-dcfa-4a8a-bf95-315d1845a529', N'a6b9b910-0d4c-4df9-827f-5bbd02583196')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'a0ece7c0-63df-482f-b757-415fd657ad56', N'a6b9b910-0d4c-4df9-827f-5bbd02583196')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'c706f096-b49b-4725-8972-48c91c19dbc3', N'a6b9b910-0d4c-4df9-827f-5bbd02583196')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'e68785d7-5c38-4fbf-8fdd-4e631e59a428', N'a6b9b910-0d4c-4df9-827f-5bbd02583196')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'23ac60df-c96d-4d36-9947-683f8b456999', N'a6b9b910-0d4c-4df9-827f-5bbd02583196')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'fe507abe-a65f-4f14-8e24-71bec4e73c12', N'a6b9b910-0d4c-4df9-827f-5bbd02583196')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'09d611c3-c4db-4c8c-a968-729d1a81ddcc', N'a6b9b910-0d4c-4df9-827f-5bbd02583196')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'c63227fb-735e-4654-b227-827130b7e82e', N'a6b9b910-0d4c-4df9-827f-5bbd02583196')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'2453d657-8dc8-423e-9f6c-96811e8367a5', N'a6b9b910-0d4c-4df9-827f-5bbd02583196')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'ef392243-d0d5-45e9-922a-a5aceb8b55a7', N'a6b9b910-0d4c-4df9-827f-5bbd02583196')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'a127dfec-7742-476a-a475-a8d7db64a981', N'a6b9b910-0d4c-4df9-827f-5bbd02583196')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'a9fbe8a1-9ca2-4851-9a1e-b654747ad1cf', N'a6b9b910-0d4c-4df9-827f-5bbd02583196')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'9437ca69-7a4b-42a3-b454-c49191aa593b', N'a6b9b910-0d4c-4df9-827f-5bbd02583196')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'bc2ab491-a3e1-4eaf-b3b6-c5c686d57cf8', N'a6b9b910-0d4c-4df9-827f-5bbd02583196')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'b09d6144-17ee-4534-9989-c65d940716f0', N'a6b9b910-0d4c-4df9-827f-5bbd02583196')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'0604db0c-9d44-48bc-86e9-e41cbb2ff72c', N'a6b9b910-0d4c-4df9-827f-5bbd02583196')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'0592f3e1-9562-4fba-90ae-e95c81b9cf43', N'a6b9b910-0d4c-4df9-827f-5bbd02583196')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'e110b97b-c5b3-4bc1-82f2-ed3f836cd2fc', N'a6b9b910-0d4c-4df9-827f-5bbd02583196')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'aedc10cd-9b08-41e3-8cef-fae79c182d95', N'a6b9b910-0d4c-4df9-827f-5bbd02583196')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'64b14fbc-a7b2-43d7-b8ba-8859121328e2', N'bef6df3f-52e7-4e24-8895-6681646ac410')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'ef392243-d0d5-45e9-922a-a5aceb8b55a7', N'bef6df3f-52e7-4e24-8895-6681646ac410')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'bc2ab491-a3e1-4eaf-b3b6-c5c686d57cf8', N'bef6df3f-52e7-4e24-8895-6681646ac410')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'cd51e13b-dcfa-4a8a-bf95-315d1845a529', N'dd2f28a4-b48c-491d-ac39-acff063847a7')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'ef392243-d0d5-45e9-922a-a5aceb8b55a7', N'dd2f28a4-b48c-491d-ac39-acff063847a7')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'9437ca69-7a4b-42a3-b454-c49191aa593b', N'dd2f28a4-b48c-491d-ac39-acff063847a7')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'aedc10cd-9b08-41e3-8cef-fae79c182d95', N'dd2f28a4-b48c-491d-ac39-acff063847a7')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'899dcc83-db4d-4403-92e5-1ce4f1b5b6de', N'cf3c0230-c6f3-4de0-b4c1-c4493024a66e')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'1a4e8d08-2dc8-4a41-82a8-14bd71588c87', N'8ebd27b5-5f04-45a6-a119-cdeea1e0e131')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'4da47cae-89b3-4944-8a9b-20d30fed93b2', N'8ebd27b5-5f04-45a6-a119-cdeea1e0e131')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'cd51e13b-dcfa-4a8a-bf95-315d1845a529', N'8ebd27b5-5f04-45a6-a119-cdeea1e0e131')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'ef392243-d0d5-45e9-922a-a5aceb8b55a7', N'8ebd27b5-5f04-45a6-a119-cdeea1e0e131')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'bc2ab491-a3e1-4eaf-b3b6-c5c686d57cf8', N'8ebd27b5-5f04-45a6-a119-cdeea1e0e131')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'85600b19-84c8-4958-bfe4-f9503b5dd72b', N'8ebd27b5-5f04-45a6-a119-cdeea1e0e131')
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_RemoveUsersFromRoles]    Script Date: 02/04/2014 12:06:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_RemoveUsersFromRoles]
	@ApplicationName  nvarchar(256),
	@UserNames		  nvarchar(4000),
	@RoleNames		  nvarchar(4000)
AS
BEGIN
	DECLARE @AppId uniqueidentifier
	SELECT  @AppId = NULL
	SELECT  @AppId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
	IF (@AppId IS NULL)
		RETURN(2)


	DECLARE @TranStarted   bit
	SET @TranStarted = 0

	IF( @@TRANCOUNT = 0 )
	BEGIN
		BEGIN TRANSACTION
		SET @TranStarted = 1
	END

	DECLARE @tbNames  table(Name nvarchar(256) NOT NULL PRIMARY KEY)
	DECLARE @tbRoles  table(RoleId uniqueidentifier NOT NULL PRIMARY KEY)
	DECLARE @tbUsers  table(UserId uniqueidentifier NOT NULL PRIMARY KEY)
	DECLARE @Num	  int
	DECLARE @Pos	  int
	DECLARE @NextPos  int
	DECLARE @Name	  nvarchar(256)
	DECLARE @CountAll int
	DECLARE @CountU	  int
	DECLARE @CountR	  int


	SET @Num = 0
	SET @Pos = 1
	WHILE(@Pos <= LEN(@RoleNames))
	BEGIN
		SELECT @NextPos = CHARINDEX(N',', @RoleNames,  @Pos)
		IF (@NextPos = 0 OR @NextPos IS NULL)
			SELECT @NextPos = LEN(@RoleNames) + 1
		SELECT @Name = RTRIM(LTRIM(SUBSTRING(@RoleNames, @Pos, @NextPos - @Pos)))
		SELECT @Pos = @NextPos+1

		INSERT INTO @tbNames VALUES (@Name)
		SET @Num = @Num + 1
	END

	INSERT INTO @tbRoles
	  SELECT RoleId
	  FROM   dbo.aspnet_Roles ar, @tbNames t
	  WHERE  LOWER(t.Name) = ar.LoweredRoleName AND ar.ApplicationId = @AppId
	SELECT @CountR = @@ROWCOUNT

	IF (@CountR <> @Num)
	BEGIN
		SELECT TOP 1 N'', Name
		FROM   @tbNames
		WHERE  LOWER(Name) NOT IN (SELECT ar.LoweredRoleName FROM dbo.aspnet_Roles ar,  @tbRoles r WHERE r.RoleId = ar.RoleId)
		IF( @TranStarted = 1 )
			ROLLBACK TRANSACTION
		RETURN(2)
	END


	DELETE FROM @tbNames WHERE 1=1
	SET @Num = 0
	SET @Pos = 1


	WHILE(@Pos <= LEN(@UserNames))
	BEGIN
		SELECT @NextPos = CHARINDEX(N',', @UserNames,  @Pos)
		IF (@NextPos = 0 OR @NextPos IS NULL)
			SELECT @NextPos = LEN(@UserNames) + 1
		SELECT @Name = RTRIM(LTRIM(SUBSTRING(@UserNames, @Pos, @NextPos - @Pos)))
		SELECT @Pos = @NextPos+1

		INSERT INTO @tbNames VALUES (@Name)
		SET @Num = @Num + 1
	END

	INSERT INTO @tbUsers
	  SELECT UserId
	  FROM   dbo.aspnet_Users ar, @tbNames t
	  WHERE  LOWER(t.Name) = ar.LoweredUserName AND ar.ApplicationId = @AppId

	SELECT @CountU = @@ROWCOUNT
	IF (@CountU <> @Num)
	BEGIN
		SELECT TOP 1 Name, N''
		FROM   @tbNames
		WHERE  LOWER(Name) NOT IN (SELECT au.LoweredUserName FROM dbo.aspnet_Users au,  @tbUsers u WHERE u.UserId = au.UserId)

		IF( @TranStarted = 1 )
			ROLLBACK TRANSACTION
		RETURN(1)
	END

	SELECT  @CountAll = COUNT(*)
	FROM	dbo.aspnet_UsersInRoles ur, @tbUsers u, @tbRoles r
	WHERE   ur.UserId = u.UserId AND ur.RoleId = r.RoleId

	IF (@CountAll <> @CountU * @CountR)
	BEGIN
		SELECT TOP 1 UserName, RoleName
		FROM		 @tbUsers tu, @tbRoles tr, dbo.aspnet_Users u, dbo.aspnet_Roles r
		WHERE		 u.UserId = tu.UserId AND r.RoleId = tr.RoleId AND
					 tu.UserId NOT IN (SELECT ur.UserId FROM dbo.aspnet_UsersInRoles ur WHERE ur.RoleId = tr.RoleId) AND
					 tr.RoleId NOT IN (SELECT ur.RoleId FROM dbo.aspnet_UsersInRoles ur WHERE ur.UserId = tu.UserId)
		IF( @TranStarted = 1 )
			ROLLBACK TRANSACTION
		RETURN(3)
	END

	DELETE FROM dbo.aspnet_UsersInRoles
	WHERE UserId IN (SELECT UserId FROM @tbUsers)
	  AND RoleId IN (SELECT RoleId FROM @tbRoles)
	IF( @TranStarted = 1 )
		COMMIT TRANSACTION
	RETURN(0)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_IsUserInRole]    Script Date: 02/04/2014 12:06:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_IsUserInRole]
    @ApplicationName  nvarchar(256),
    @UserName         nvarchar(256),
    @RoleName         nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(2)
    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL
    DECLARE @RoleId uniqueidentifier
    SELECT  @RoleId = NULL

    SELECT  @UserId = UserId
    FROM    dbo.aspnet_Users
    WHERE   LoweredUserName = LOWER(@UserName) AND ApplicationId = @ApplicationId

    IF (@UserId IS NULL)
        RETURN(2)

    SELECT  @RoleId = RoleId
    FROM    dbo.aspnet_Roles
    WHERE   LoweredRoleName = LOWER(@RoleName) AND ApplicationId = @ApplicationId

    IF (@RoleId IS NULL)
        RETURN(3)

    IF (EXISTS( SELECT * FROM dbo.aspnet_UsersInRoles WHERE  UserId = @UserId AND RoleId = @RoleId))
        RETURN(1)
    ELSE
        RETURN(0)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_GetUsersInRoles]    Script Date: 02/04/2014 12:06:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_GetUsersInRoles]
    @ApplicationName  nvarchar(256),
    @RoleName         nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(1)
     DECLARE @RoleId uniqueidentifier
     SELECT  @RoleId = NULL

     SELECT  @RoleId = RoleId
     FROM    dbo.aspnet_Roles
     WHERE   LOWER(@RoleName) = LoweredRoleName AND ApplicationId = @ApplicationId

     IF (@RoleId IS NULL)
         RETURN(1)

    SELECT u.UserName
    FROM   dbo.aspnet_Users u, dbo.aspnet_UsersInRoles ur
    WHERE  u.UserId = ur.UserId AND @RoleId = ur.RoleId AND u.ApplicationId = @ApplicationId
    ORDER BY u.UserName
    RETURN(0)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_GetRolesForUser]    Script Date: 02/04/2014 12:06:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_GetRolesForUser]
    @ApplicationName  nvarchar(256),
    @UserName         nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(1)
    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL

    SELECT  @UserId = UserId
    FROM    dbo.aspnet_Users
    WHERE   LoweredUserName = LOWER(@UserName) AND ApplicationId = @ApplicationId

    IF (@UserId IS NULL)
        RETURN(1)

    SELECT r.RoleName
    FROM   dbo.aspnet_Roles r, dbo.aspnet_UsersInRoles ur
    WHERE  r.RoleId = ur.RoleId AND r.ApplicationId = @ApplicationId AND ur.UserId = @UserId
    ORDER BY r.RoleName
    RETURN (0)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_FindUsersInRole]    Script Date: 02/04/2014 12:06:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_FindUsersInRole]
    @ApplicationName  nvarchar(256),
    @RoleName         nvarchar(256),
    @UserNameToMatch  nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(1)
     DECLARE @RoleId uniqueidentifier
     SELECT  @RoleId = NULL

     SELECT  @RoleId = RoleId
     FROM    dbo.aspnet_Roles
     WHERE   LOWER(@RoleName) = LoweredRoleName AND ApplicationId = @ApplicationId

     IF (@RoleId IS NULL)
         RETURN(1)

    SELECT u.UserName
    FROM   dbo.aspnet_Users u, dbo.aspnet_UsersInRoles ur
    WHERE  u.UserId = ur.UserId AND @RoleId = ur.RoleId AND u.ApplicationId = @ApplicationId AND LoweredUserName LIKE LOWER(@UserNameToMatch)
    ORDER BY u.UserName
    RETURN(0)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_AddUsersToRoles]    Script Date: 02/04/2014 12:06:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_AddUsersToRoles]
	@ApplicationName  nvarchar(256),
	@UserNames		  nvarchar(4000),
	@RoleNames		  nvarchar(4000),
	@CurrentTimeUtc   datetime
AS
BEGIN
	DECLARE @AppId uniqueidentifier
	SELECT  @AppId = NULL
	SELECT  @AppId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
	IF (@AppId IS NULL)
		RETURN(2)
	DECLARE @TranStarted   bit
	SET @TranStarted = 0

	IF( @@TRANCOUNT = 0 )
	BEGIN
		BEGIN TRANSACTION
		SET @TranStarted = 1
	END

	DECLARE @tbNames	table(Name nvarchar(256) NOT NULL PRIMARY KEY)
	DECLARE @tbRoles	table(RoleId uniqueidentifier NOT NULL PRIMARY KEY)
	DECLARE @tbUsers	table(UserId uniqueidentifier NOT NULL PRIMARY KEY)
	DECLARE @Num		int
	DECLARE @Pos		int
	DECLARE @NextPos	int
	DECLARE @Name		nvarchar(256)

	SET @Num = 0
	SET @Pos = 1
	WHILE(@Pos <= LEN(@RoleNames))
	BEGIN
		SELECT @NextPos = CHARINDEX(N',', @RoleNames,  @Pos)
		IF (@NextPos = 0 OR @NextPos IS NULL)
			SELECT @NextPos = LEN(@RoleNames) + 1
		SELECT @Name = RTRIM(LTRIM(SUBSTRING(@RoleNames, @Pos, @NextPos - @Pos)))
		SELECT @Pos = @NextPos+1

		INSERT INTO @tbNames VALUES (@Name)
		SET @Num = @Num + 1
	END

	INSERT INTO @tbRoles
	  SELECT RoleId
	  FROM   dbo.aspnet_Roles ar, @tbNames t
	  WHERE  LOWER(t.Name) = ar.LoweredRoleName AND ar.ApplicationId = @AppId

	IF (@@ROWCOUNT <> @Num)
	BEGIN
		SELECT TOP 1 Name
		FROM   @tbNames
		WHERE  LOWER(Name) NOT IN (SELECT ar.LoweredRoleName FROM dbo.aspnet_Roles ar,  @tbRoles r WHERE r.RoleId = ar.RoleId)
		IF( @TranStarted = 1 )
			ROLLBACK TRANSACTION
		RETURN(2)
	END

	DELETE FROM @tbNames WHERE 1=1
	SET @Num = 0
	SET @Pos = 1

	WHILE(@Pos <= LEN(@UserNames))
	BEGIN
		SELECT @NextPos = CHARINDEX(N',', @UserNames,  @Pos)
		IF (@NextPos = 0 OR @NextPos IS NULL)
			SELECT @NextPos = LEN(@UserNames) + 1
		SELECT @Name = RTRIM(LTRIM(SUBSTRING(@UserNames, @Pos, @NextPos - @Pos)))
		SELECT @Pos = @NextPos+1

		INSERT INTO @tbNames VALUES (@Name)
		SET @Num = @Num + 1
	END

	INSERT INTO @tbUsers
	  SELECT UserId
	  FROM   dbo.aspnet_Users ar, @tbNames t
	  WHERE  LOWER(t.Name) = ar.LoweredUserName AND ar.ApplicationId = @AppId

	IF (@@ROWCOUNT <> @Num)
	BEGIN
		DELETE FROM @tbNames
		WHERE LOWER(Name) IN (SELECT LoweredUserName FROM dbo.aspnet_Users au,  @tbUsers u WHERE au.UserId = u.UserId)

		INSERT dbo.aspnet_Users (ApplicationId, UserId, UserName, LoweredUserName, IsAnonymous, LastActivityDate)
		  SELECT @AppId, NEWID(), Name, LOWER(Name), 0, @CurrentTimeUtc
		  FROM   @tbNames

		INSERT INTO @tbUsers
		  SELECT  UserId
		  FROM	dbo.aspnet_Users au, @tbNames t
		  WHERE   LOWER(t.Name) = au.LoweredUserName AND au.ApplicationId = @AppId
	END

	IF (EXISTS (SELECT * FROM dbo.aspnet_UsersInRoles ur, @tbUsers tu, @tbRoles tr WHERE tu.UserId = ur.UserId AND tr.RoleId = ur.RoleId))
	BEGIN
		SELECT TOP 1 UserName, RoleName
		FROM		 dbo.aspnet_UsersInRoles ur, @tbUsers tu, @tbRoles tr, aspnet_Users u, aspnet_Roles r
		WHERE		u.UserId = tu.UserId AND r.RoleId = tr.RoleId AND tu.UserId = ur.UserId AND tr.RoleId = ur.RoleId

		IF( @TranStarted = 1 )
			ROLLBACK TRANSACTION
		RETURN(3)
	END

	INSERT INTO dbo.aspnet_UsersInRoles (UserId, RoleId)
	SELECT UserId, RoleId
	FROM @tbUsers, @tbRoles

	IF( @TranStarted = 1 )
		COMMIT TRANSACTION
	RETURN(0)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Users_DeleteUser]    Script Date: 02/04/2014 12:06:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Users_DeleteUser]
    @ApplicationName  nvarchar(256),
    @UserName         nvarchar(256),
    @TablesToDeleteFrom int,
    @NumTablesDeletedFrom int OUTPUT
AS
BEGIN
    DECLARE @UserId               uniqueidentifier
    SELECT  @UserId               = NULL
    SELECT  @NumTablesDeletedFrom = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
	SET @TranStarted = 0

    DECLARE @ErrorCode   int
    DECLARE @RowCount    int

    SET @ErrorCode = 0
    SET @RowCount  = 0

    SELECT  @UserId = u.UserId
    FROM    dbo.aspnet_Users u, dbo.aspnet_Applications a
    WHERE   u.LoweredUserName       = LOWER(@UserName)
        AND u.ApplicationId         = a.ApplicationId
        AND LOWER(@ApplicationName) = a.LoweredApplicationName

    IF (@UserId IS NULL)
    BEGIN
        GOTO Cleanup
    END

    -- Delete from Membership table if (@TablesToDeleteFrom & 1) is set
    IF ((@TablesToDeleteFrom & 1) <> 0 AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_MembershipUsers') AND (type = 'V'))))
    BEGIN
        DELETE FROM dbo.aspnet_Membership WHERE @UserId = UserId

        SELECT @ErrorCode = @@ERROR,
               @RowCount = @@ROWCOUNT

        IF( @ErrorCode <> 0 )
            GOTO Cleanup

        IF (@RowCount <> 0)
            SELECT  @NumTablesDeletedFrom = @NumTablesDeletedFrom + 1
    END

    -- Delete from aspnet_UsersInRoles table if (@TablesToDeleteFrom & 2) is set
    IF ((@TablesToDeleteFrom & 2) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_UsersInRoles') AND (type = 'V'))) )
    BEGIN
        DELETE FROM dbo.aspnet_UsersInRoles WHERE @UserId = UserId

        SELECT @ErrorCode = @@ERROR,
                @RowCount = @@ROWCOUNT

        IF( @ErrorCode <> 0 )
            GOTO Cleanup

        IF (@RowCount <> 0)
            SELECT  @NumTablesDeletedFrom = @NumTablesDeletedFrom + 1
    END

    -- Delete from aspnet_Profile table if (@TablesToDeleteFrom & 4) is set
    IF ((@TablesToDeleteFrom & 4) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_Profiles') AND (type = 'V'))) )
    BEGIN
        DELETE FROM dbo.aspnet_Profile WHERE @UserId = UserId

        SELECT @ErrorCode = @@ERROR,
                @RowCount = @@ROWCOUNT

        IF( @ErrorCode <> 0 )
            GOTO Cleanup

        IF (@RowCount <> 0)
            SELECT  @NumTablesDeletedFrom = @NumTablesDeletedFrom + 1
    END

    -- Delete from aspnet_PersonalizationPerUser table if (@TablesToDeleteFrom & 8) is set
    IF ((@TablesToDeleteFrom & 8) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_WebPartState_User') AND (type = 'V'))) )
    BEGIN
        DELETE FROM dbo.aspnet_PersonalizationPerUser WHERE @UserId = UserId

        SELECT @ErrorCode = @@ERROR,
                @RowCount = @@ROWCOUNT

        IF( @ErrorCode <> 0 )
            GOTO Cleanup

        IF (@RowCount <> 0)
            SELECT  @NumTablesDeletedFrom = @NumTablesDeletedFrom + 1
    END

    -- Delete from aspnet_Users table if (@TablesToDeleteFrom & 1,2,4 & 8) are all set
    IF ((@TablesToDeleteFrom & 1) <> 0 AND
        (@TablesToDeleteFrom & 2) <> 0 AND
        (@TablesToDeleteFrom & 4) <> 0 AND
        (@TablesToDeleteFrom & 8) <> 0 AND
        (EXISTS (SELECT UserId FROM dbo.aspnet_Users WHERE @UserId = UserId)))
    BEGIN
        DELETE FROM dbo.aspnet_Users WHERE @UserId = UserId

        SELECT @ErrorCode = @@ERROR,
                @RowCount = @@ROWCOUNT

        IF( @ErrorCode <> 0 )
            GOTO Cleanup

        IF (@RowCount <> 0)
            SELECT  @NumTablesDeletedFrom = @NumTablesDeletedFrom + 1
    END

    IF( @TranStarted = 1 )
    BEGIN
	    SET @TranStarted = 0
	    COMMIT TRANSACTION
    END

    RETURN 0

Cleanup:
    SET @NumTablesDeletedFrom = 0

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
	    ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Roles_DeleteRole]    Script Date: 02/04/2014 12:06:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Roles_DeleteRole]
    @ApplicationName            nvarchar(256),
    @RoleName                   nvarchar(256),
    @DeleteOnlyIfRoleIsEmpty    bit
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(1)

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
        BEGIN TRANSACTION
        SET @TranStarted = 1
    END
    ELSE
        SET @TranStarted = 0

    DECLARE @RoleId   uniqueidentifier
    SELECT  @RoleId = NULL
    SELECT  @RoleId = RoleId FROM dbo.aspnet_Roles WHERE LoweredRoleName = LOWER(@RoleName) AND ApplicationId = @ApplicationId

    IF (@RoleId IS NULL)
    BEGIN
        SELECT @ErrorCode = 1
        GOTO Cleanup
    END
    IF (@DeleteOnlyIfRoleIsEmpty <> 0)
    BEGIN
        IF (EXISTS (SELECT RoleId FROM dbo.aspnet_UsersInRoles  WHERE @RoleId = RoleId))
        BEGIN
            SELECT @ErrorCode = 2
            GOTO Cleanup
        END
    END


    DELETE FROM dbo.aspnet_UsersInRoles  WHERE @RoleId = RoleId

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    DELETE FROM dbo.aspnet_Roles WHERE @RoleId = RoleId  AND ApplicationId = @ApplicationId

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
        COMMIT TRANSACTION
    END

    RETURN(0)

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
        ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode
END
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 02/04/2014 12:06:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[EmployeeID] [uniqueidentifier] NOT NULL,
	[UserID] [uniqueidentifier] NULL,
	[FirstNameAr] [nvarchar](100) NULL,
	[SecondNameAr] [nvarchar](100) NULL,
	[ThirdNameAr] [nvarchar](100) NULL,
	[LastNameAr] [nvarchar](100) NULL,
	[FirstNameEn] [nvarchar](100) NULL,
	[SecondNameEn] [nvarchar](100) NULL,
	[ThirdNameEn] [nvarchar](100) NULL,
	[LastNameEn] [nvarchar](100) NULL,
	[DateOfBirth] [datetime] NULL,
	[MaritalStatus] [bit] NULL,
	[HireDate] [datetime] NULL,
	[OfficeLocationID] [uniqueidentifier] NULL,
	[DepartmentID] [uniqueidentifier] NULL,
	[JobID] [uniqueidentifier] NULL,
	[EmployeeStatus] [bit] NULL,
	[SupervisorID] [uniqueidentifier] NULL,
	[Email] [nvarchar](200) NULL,
	[AlternativeSupervisorID] [uniqueidentifier] NULL,
	[AltFromDate] [datetime] NULL,
	[AltEndDate] [datetime] NULL,
	[CountryID] [uniqueidentifier] NULL,
	[Termination_Date] [datetime] NULL,
	[Termination_Reason] [nvarchar](200) NULL,
	[Comments] [nvarchar](max) NULL,
	[LeaveBalacneAtTermination] [decimal](18, 1) NULL,
	[IsTerminated] [bit] NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Employee] ([EmployeeID], [UserID], [FirstNameAr], [SecondNameAr], [ThirdNameAr], [LastNameAr], [FirstNameEn], [SecondNameEn], [ThirdNameEn], [LastNameEn], [DateOfBirth], [MaritalStatus], [HireDate], [OfficeLocationID], [DepartmentID], [JobID], [EmployeeStatus], [SupervisorID], [Email], [AlternativeSupervisorID], [AltFromDate], [AltEndDate], [CountryID], [Termination_Date], [Termination_Reason], [Comments], [LeaveBalacneAtTermination], [IsTerminated]) VALUES (N'62995f97-51be-4353-bd83-0745e5f24f07', N'9437ca69-7a4b-42a3-b454-c49191aa593b', N'vaibhav', NULL, NULL, N'jain', N'vaibhav', NULL, NULL, N'mehta', CAST(0x0000810700000000 AS DateTime), 0, CAST(0x0000A01000000000 AS DateTime), N'dbc51c6d-7cc0-4695-9caa-ce965e113365', N'07a75ef5-2ace-417b-81c9-9c6808d94b2f', N'6dd13b3f-3511-421c-a4f3-4fe0e2024f4f', 1, N'd448c4b5-8f24-42fa-8308-9c2e4fdb3de4', N'vaibhav.sspl@gmail.com', N'20250795-00e5-4355-b986-e2f3f6f9e07e', CAST(0x0000A28A00000000 AS DateTime), CAST(0x0000A2A400000000 AS DateTime), N'bf91ed15-02f2-4899-b7ea-b4f666271159', NULL, N'', N'', NULL, 0)
INSERT [dbo].[Employee] ([EmployeeID], [UserID], [FirstNameAr], [SecondNameAr], [ThirdNameAr], [LastNameAr], [FirstNameEn], [SecondNameEn], [ThirdNameEn], [LastNameEn], [DateOfBirth], [MaritalStatus], [HireDate], [OfficeLocationID], [DepartmentID], [JobID], [EmployeeStatus], [SupervisorID], [Email], [AlternativeSupervisorID], [AltFromDate], [AltEndDate], [CountryID], [Termination_Date], [Termination_Reason], [Comments], [LeaveBalacneAtTermination], [IsTerminated]) VALUES (N'b0218d84-1700-4efa-a743-2e86f4e7feac', N'bc2ab491-a3e1-4eaf-b3b6-c5c686d57cf8', NULL, NULL, NULL, NULL, N'Test', NULL, NULL, N'Test', CAST(0x000077E900000000 AS DateTime), 1, CAST(0x0000A2BD00000000 AS DateTime), N'dbc51c6d-7cc0-4695-9caa-ce965e113365', N'07a75ef5-2ace-417b-81c9-9c6808d94b2f', N'8c9c3203-2834-4c86-8b7f-4261754f191e', 1, N'f0250795-00e5-4355-b986-e2f3f6f9e07a', N'testing@gmail.com', N'20250795-00e5-4355-b986-e2f3f6f9e07e', CAST(0x0000A2B000000000 AS DateTime), CAST(0x0000A2C400000000 AS DateTime), N'bf91ed15-02f2-4899-b7ea-b4f666271159', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([EmployeeID], [UserID], [FirstNameAr], [SecondNameAr], [ThirdNameAr], [LastNameAr], [FirstNameEn], [SecondNameEn], [ThirdNameEn], [LastNameEn], [DateOfBirth], [MaritalStatus], [HireDate], [OfficeLocationID], [DepartmentID], [JobID], [EmployeeStatus], [SupervisorID], [Email], [AlternativeSupervisorID], [AltFromDate], [AltEndDate], [CountryID], [Termination_Date], [Termination_Reason], [Comments], [LeaveBalacneAtTermination], [IsTerminated]) VALUES (N'f3603335-129c-4f6c-9cdd-3268a29a505a', N'aedc10cd-9b08-41e3-8cef-fae79c182d95', N'Rahul', N'Kumar', NULL, N'Sharma', N'Rahul', NULL, NULL, N'Sharma', CAST(0x0000A26600000000 AS DateTime), 1, CAST(0x0000A29200000000 AS DateTime), N'5a20bf81-422b-41a6-b3ea-ccaa5c46b273', N'86075a92-a26e-4061-88d5-bf7f9d75fa58', N'6dd13b3f-3511-421c-a4f3-4fe0e2024f4f', 1, N'770acc2b-d5d4-4c57-ab57-7a3451f8a86c', N'ashwini.deshmukh@consagous.com', N'd44eea62-6415-4c75-af42-8888760e8bf4', CAST(0x0000A28B00000000 AS DateTime), CAST(0x0000A2A500000000 AS DateTime), N'bf91ed15-02f2-4899-b7ea-b4f666271159', NULL, N'', N'', NULL, 0)
INSERT [dbo].[Employee] ([EmployeeID], [UserID], [FirstNameAr], [SecondNameAr], [ThirdNameAr], [LastNameAr], [FirstNameEn], [SecondNameEn], [ThirdNameEn], [LastNameEn], [DateOfBirth], [MaritalStatus], [HireDate], [OfficeLocationID], [DepartmentID], [JobID], [EmployeeStatus], [SupervisorID], [Email], [AlternativeSupervisorID], [AltFromDate], [AltEndDate], [CountryID], [Termination_Date], [Termination_Reason], [Comments], [LeaveBalacneAtTermination], [IsTerminated]) VALUES (N'720d8341-ae54-4d06-b92e-652c25c7cf1e', N'09d611c3-c4db-4c8c-a968-729d1a81ddcc', N'Rajesh', NULL, NULL, N'Mishra', N'Rajesh', NULL, NULL, N'Mishra', CAST(0x00007F6700000000 AS DateTime), 0, CAST(0x0000A2C500000000 AS DateTime), N'dbc51c6d-7cc0-4695-9caa-ce965e113365', N'd71420dd-aa85-48f8-ba0d-9d19ffac6b5f', N'6dd13b3f-3511-421c-a4f3-4fe0e2024f4f', 1, N'd448c4b5-8f24-42fa-8308-9c2e4fdb3de4', N'rajesh@gmail.com', NULL, NULL, NULL, N'bf91ed15-02f2-4899-b7ea-b4f666271159', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([EmployeeID], [UserID], [FirstNameAr], [SecondNameAr], [ThirdNameAr], [LastNameAr], [FirstNameEn], [SecondNameEn], [ThirdNameEn], [LastNameEn], [DateOfBirth], [MaritalStatus], [HireDate], [OfficeLocationID], [DepartmentID], [JobID], [EmployeeStatus], [SupervisorID], [Email], [AlternativeSupervisorID], [AltFromDate], [AltEndDate], [CountryID], [Termination_Date], [Termination_Reason], [Comments], [LeaveBalacneAtTermination], [IsTerminated]) VALUES (N'770acc2b-d5d4-4c57-ab57-7a3451f8a86c', N'ef392243-d0d5-45e9-922a-a5aceb8b55a7', N'rajkumar', NULL, NULL, N'Yadav', N'rajkumar', NULL, NULL, N'yadav', CAST(0x00007BD900000000 AS DateTime), 1, CAST(0x00009F6400000000 AS DateTime), N'5a20bf81-422b-41a6-b3ea-ccaa5c46b273', N'07a75ef5-2ace-417b-81c9-9c6808d94b2f', N'8c9c3203-2834-4c86-8b7f-4261754f191e', 1, N'd448c4b5-8f24-42fa-8308-9c2e4fdb3de4', N'rajkumar@sumedhasoftech.com', N'f3603335-129c-4f6c-9cdd-3268a29a505a', CAST(0x0000A29600000000 AS DateTime), CAST(0x0000A2A400000000 AS DateTime), N'bf91ed15-02f2-4899-b7ea-b4f666271159', NULL, N'', N'', NULL, 0)
INSERT [dbo].[Employee] ([EmployeeID], [UserID], [FirstNameAr], [SecondNameAr], [ThirdNameAr], [LastNameAr], [FirstNameEn], [SecondNameEn], [ThirdNameEn], [LastNameEn], [DateOfBirth], [MaritalStatus], [HireDate], [OfficeLocationID], [DepartmentID], [JobID], [EmployeeStatus], [SupervisorID], [Email], [AlternativeSupervisorID], [AltFromDate], [AltEndDate], [CountryID], [Termination_Date], [Termination_Reason], [Comments], [LeaveBalacneAtTermination], [IsTerminated]) VALUES (N'5af736f6-c404-47b2-92cb-81c890441f7f', N'e68785d7-5c38-4fbf-8fdd-4e631e59a428', N'Krishan', NULL, NULL, N'Kumar', N'Krishan', NULL, NULL, N'Kumar', CAST(0x000081D500000000 AS DateTime), 0, CAST(0x0000A2AD00000000 AS DateTime), N'dbc51c6d-7cc0-4695-9caa-ce965e113365', N'd71420dd-aa85-48f8-ba0d-9d19ffac6b5f', N'6dd13b3f-3511-421c-a4f3-4fe0e2024f4f', 1, N'20250795-00e5-4355-b986-e2f3f6f9e07e', N'krishan.sspl@gmail.com', NULL, NULL, NULL, N'bf91ed15-02f2-4899-b7ea-b4f666271159', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([EmployeeID], [UserID], [FirstNameAr], [SecondNameAr], [ThirdNameAr], [LastNameAr], [FirstNameEn], [SecondNameEn], [ThirdNameEn], [LastNameEn], [DateOfBirth], [MaritalStatus], [HireDate], [OfficeLocationID], [DepartmentID], [JobID], [EmployeeStatus], [SupervisorID], [Email], [AlternativeSupervisorID], [AltFromDate], [AltEndDate], [CountryID], [Termination_Date], [Termination_Reason], [Comments], [LeaveBalacneAtTermination], [IsTerminated]) VALUES (N'd44eea62-6415-4c75-af42-8888760e8bf4', N'4da47cae-89b3-4944-8a9b-20d30fed93b2', N'Raj', N'Kumar', NULL, N'Meena', N'Raj', N'Kumar', NULL, N'Meena', CAST(0x0000A26600000000 AS DateTime), 1, CAST(0x0000A29700000000 AS DateTime), N'dbc51c6d-7cc0-4695-9caa-ce965e113365', N'86075a92-a26e-4061-88d5-bf7f9d75fa58', N'8c9c3203-2834-4c86-8b7f-4261754f191e', 1, N'20250795-00e5-4355-b986-e2f3f6f9e07e', N'test.sumedha@gmail.com', N'd448c4b5-8f24-42fa-8308-9c2e4fdb3de4', CAST(0x0000A29F00000000 AS DateTime), CAST(0x0000A2A400000000 AS DateTime), N'bf91ed15-02f2-4899-b7ea-b4f666271159', NULL, N'', N'', NULL, 0)
INSERT [dbo].[Employee] ([EmployeeID], [UserID], [FirstNameAr], [SecondNameAr], [ThirdNameAr], [LastNameAr], [FirstNameEn], [SecondNameEn], [ThirdNameEn], [LastNameEn], [DateOfBirth], [MaritalStatus], [HireDate], [OfficeLocationID], [DepartmentID], [JobID], [EmployeeStatus], [SupervisorID], [Email], [AlternativeSupervisorID], [AltFromDate], [AltEndDate], [CountryID], [Termination_Date], [Termination_Reason], [Comments], [LeaveBalacneAtTermination], [IsTerminated]) VALUES (N'd448c4b5-8f24-42fa-8308-9c2e4fdb3de4', N'1a4e8d08-2dc8-4a41-82a8-14bd71588c87', N'ankush', NULL, NULL, N'jain', N'ankush', NULL, NULL, N'jain', CAST(0x0000810700000000 AS DateTime), 1, CAST(0x0000A25400000000 AS DateTime), N'dbc51c6d-7cc0-4695-9caa-ce965e113365', N'd71420dd-aa85-48f8-ba0d-9d19ffac6b5f', N'8c9c3203-2834-4c86-8b7f-4261754f191e', 1, NULL, N'ankush@sumedhasoftech.com', NULL, NULL, NULL, N'bf91ed15-02f2-4899-b7ea-b4f666271159', CAST(0x0000A28800000000 AS DateTime), N'aa', N'bb', CAST(3.0 AS Decimal(18, 1)), 0)
INSERT [dbo].[Employee] ([EmployeeID], [UserID], [FirstNameAr], [SecondNameAr], [ThirdNameAr], [LastNameAr], [FirstNameEn], [SecondNameEn], [ThirdNameEn], [LastNameEn], [DateOfBirth], [MaritalStatus], [HireDate], [OfficeLocationID], [DepartmentID], [JobID], [EmployeeStatus], [SupervisorID], [Email], [AlternativeSupervisorID], [AltFromDate], [AltEndDate], [CountryID], [Termination_Date], [Termination_Reason], [Comments], [LeaveBalacneAtTermination], [IsTerminated]) VALUES (N'6fdc4b80-8ae6-4b97-a068-a66a6c230623', N'c63227fb-735e-4654-b227-827130b7e82e', NULL, NULL, NULL, NULL, N'Shashi', N'Kant', NULL, N'Kumar', CAST(0x0000820C00000000 AS DateTime), 0, CAST(0x0000A1D600000000 AS DateTime), N'dbc51c6d-7cc0-4695-9caa-ce965e113365', N'd71420dd-aa85-48f8-ba0d-9d19ffac6b5f', N'6dd13b3f-3511-421c-a4f3-4fe0e2024f4f', 1, N'f0250795-00e5-4355-b986-e2f3f6f9e07a', N'shashikant.sspl@gmail.com', NULL, NULL, NULL, N'bf91ed15-02f2-4899-b7ea-b4f666271159', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employee] ([EmployeeID], [UserID], [FirstNameAr], [SecondNameAr], [ThirdNameAr], [LastNameAr], [FirstNameEn], [SecondNameEn], [ThirdNameEn], [LastNameEn], [DateOfBirth], [MaritalStatus], [HireDate], [OfficeLocationID], [DepartmentID], [JobID], [EmployeeStatus], [SupervisorID], [Email], [AlternativeSupervisorID], [AltFromDate], [AltEndDate], [CountryID], [Termination_Date], [Termination_Reason], [Comments], [LeaveBalacneAtTermination], [IsTerminated]) VALUES (N'f0250795-00e5-4355-b986-e2f3f6f9e07a', N'64b14fbc-a7b2-43d7-b8ba-8859121328e2', NULL, NULL, NULL, NULL, N'Admin', NULL, NULL, N'Admin', CAST(0x00007DA000000000 AS DateTime), 1, CAST(0x00009D0E00000000 AS DateTime), N'dbc51c6d-7cc0-4695-9caa-ce965e113365', N'd71420dd-aa85-48f8-ba0d-9d19ffac6b5f', N'8c9c3203-2834-4c86-8b7f-4261754f191e', 1, N'20250795-00e5-4355-b986-e2f3f6f9e07f', N'ssplmailsender@gmail.com', NULL, NULL, NULL, N'bf91ed15-02f2-4899-b7ea-b4f666271159', NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[Employee] ([EmployeeID], [UserID], [FirstNameAr], [SecondNameAr], [ThirdNameAr], [LastNameAr], [FirstNameEn], [SecondNameEn], [ThirdNameEn], [LastNameEn], [DateOfBirth], [MaritalStatus], [HireDate], [OfficeLocationID], [DepartmentID], [JobID], [EmployeeStatus], [SupervisorID], [Email], [AlternativeSupervisorID], [AltFromDate], [AltEndDate], [CountryID], [Termination_Date], [Termination_Reason], [Comments], [LeaveBalacneAtTermination], [IsTerminated]) VALUES (N'20250795-00e5-4355-b986-e2f3f6f9e07e', N'a9fbe8a1-9ca2-4851-9a1e-b654747ad1cf', N'Navin', NULL, NULL, N'Saini', N'Navin', NULL, NULL, N'Saini', CAST(0x0000864800000000 AS DateTime), 0, CAST(0x0000A29900000000 AS DateTime), N'5a20bf81-422b-41a6-b3ea-ccaa5c46b273', N'd71420dd-aa85-48f8-ba0d-9d19ffac6b5f', N'6dd13b3f-3511-421c-a4f3-4fe0e2024f4f', 1, N'720d8341-ae54-4d06-b92e-652c25c7cf1e', N'navin@gmail.com', NULL, NULL, NULL, N'bf91ed15-02f2-4899-b7ea-b4f666271159', NULL, N'', N'', NULL, 0)
INSERT [dbo].[Employee] ([EmployeeID], [UserID], [FirstNameAr], [SecondNameAr], [ThirdNameAr], [LastNameAr], [FirstNameEn], [SecondNameEn], [ThirdNameEn], [LastNameEn], [DateOfBirth], [MaritalStatus], [HireDate], [OfficeLocationID], [DepartmentID], [JobID], [EmployeeStatus], [SupervisorID], [Email], [AlternativeSupervisorID], [AltFromDate], [AltEndDate], [CountryID], [Termination_Date], [Termination_Reason], [Comments], [LeaveBalacneAtTermination], [IsTerminated]) VALUES (N'20250795-00e5-4355-b986-e2f3f6f9e07f', N'899dcc83-db4d-4403-92e5-1ce4f1b5b6de', NULL, NULL, NULL, NULL, N'SuperAdmin', NULL, NULL, N'SuperAdmin', CAST(0x000076ED00000000 AS DateTime), 1, CAST(0x000097BC00000000 AS DateTime), N'dbc51c6d-7cc0-4695-9caa-ce965e113365', N'd71420dd-aa85-48f8-ba0d-9d19ffac6b5f', N'8c9c3203-2834-4c86-8b7f-4261754f191e', 1, NULL, N'superadmin@gmail.com', NULL, NULL, NULL, N'bf91ed15-02f2-4899-b7ea-b4f666271159', NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[Employee] ([EmployeeID], [UserID], [FirstNameAr], [SecondNameAr], [ThirdNameAr], [LastNameAr], [FirstNameEn], [SecondNameEn], [ThirdNameEn], [LastNameEn], [DateOfBirth], [MaritalStatus], [HireDate], [OfficeLocationID], [DepartmentID], [JobID], [EmployeeStatus], [SupervisorID], [Email], [AlternativeSupervisorID], [AltFromDate], [AltEndDate], [CountryID], [Termination_Date], [Termination_Reason], [Comments], [LeaveBalacneAtTermination], [IsTerminated]) VALUES (N'e23b88c4-fa7a-481e-b0e7-f372cb7b52d2', N'cd51e13b-dcfa-4a8a-bf95-315d1845a529', NULL, NULL, NULL, NULL, N'k', NULL, NULL, N'k', CAST(0x0000A2C100000000 AS DateTime), 0, CAST(0x0000A2B500000000 AS DateTime), N'5a20bf81-422b-41a6-b3ea-ccaa5c46b273', N'07a75ef5-2ace-417b-81c9-9c6808d94b2f', N'6dd13b3f-3511-421c-a4f3-4fe0e2024f4f', 1, N'20250795-00e5-4355-b986-e2f3f6f9e07e', N'k@gmail.com', NULL, NULL, NULL, N'bf91ed15-02f2-4899-b7ea-b4f666271159', NULL, NULL, NULL, NULL, NULL)
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_DeleteInactiveProfiles]    Script Date: 02/04/2014 12:06:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Profile_DeleteInactiveProfiles]
    @ApplicationName        nvarchar(256),
    @ProfileAuthOptions     int,
    @InactiveSinceDate      datetime
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
    BEGIN
        SELECT  0
        RETURN
    END

    DELETE
    FROM    dbo.aspnet_Profile
    WHERE   UserId IN
            (   SELECT  UserId
                FROM    dbo.aspnet_Users u
                WHERE   ApplicationId = @ApplicationId
                        AND (LastActivityDate <= @InactiveSinceDate)
                        AND (
                                (@ProfileAuthOptions = 2)
                             OR (@ProfileAuthOptions = 0 AND IsAnonymous = 1)
                             OR (@ProfileAuthOptions = 1 AND IsAnonymous = 0)
                            )
            )

    SELECT  @@ROWCOUNT
END
GO
/****** Object:  View [dbo].[vw_aspnet_Profiles]    Script Date: 02/04/2014 12:06:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[vw_aspnet_Profiles]
  AS SELECT [dbo].[aspnet_Profile].[UserId], [dbo].[aspnet_Profile].[LastUpdatedDate],
      [DataSize]=  DATALENGTH([dbo].[aspnet_Profile].[PropertyNames])
                 + DATALENGTH([dbo].[aspnet_Profile].[PropertyValuesString])
                 + DATALENGTH([dbo].[aspnet_Profile].[PropertyValuesBinary])
  FROM [dbo].[aspnet_Profile]
GO
/****** Object:  View [dbo].[vw_aspnet_MembershipUsers]    Script Date: 02/04/2014 12:06:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[vw_aspnet_MembershipUsers]
  AS SELECT [dbo].[aspnet_Membership].[UserId],
            [dbo].[aspnet_Membership].[PasswordFormat],
            [dbo].[aspnet_Membership].[MobilePIN],
            [dbo].[aspnet_Membership].[Email],
            [dbo].[aspnet_Membership].[LoweredEmail],
            [dbo].[aspnet_Membership].[PasswordQuestion],
            [dbo].[aspnet_Membership].[PasswordAnswer],
            [dbo].[aspnet_Membership].[IsApproved],
            [dbo].[aspnet_Membership].[IsLockedOut],
            [dbo].[aspnet_Membership].[CreateDate],
            [dbo].[aspnet_Membership].[LastLoginDate],
            [dbo].[aspnet_Membership].[LastPasswordChangedDate],
            [dbo].[aspnet_Membership].[LastLockoutDate],
            [dbo].[aspnet_Membership].[FailedPasswordAttemptCount],
            [dbo].[aspnet_Membership].[FailedPasswordAttemptWindowStart],
            [dbo].[aspnet_Membership].[FailedPasswordAnswerAttemptCount],
            [dbo].[aspnet_Membership].[FailedPasswordAnswerAttemptWindowStart],
            [dbo].[aspnet_Membership].[Comment],
            [dbo].[aspnet_Users].[ApplicationId],
            [dbo].[aspnet_Users].[UserName],
            [dbo].[aspnet_Users].[MobileAlias],
            [dbo].[aspnet_Users].[IsAnonymous],
            [dbo].[aspnet_Users].[LastActivityDate]
  FROM [dbo].[aspnet_Membership] INNER JOIN [dbo].[aspnet_Users]
      ON [dbo].[aspnet_Membership].[UserId] = [dbo].[aspnet_Users].[UserId]
GO
/****** Object:  View [dbo].[vw_aspnet_UsersInRoles]    Script Date: 02/04/2014 12:06:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[vw_aspnet_UsersInRoles]
  AS SELECT [dbo].[aspnet_UsersInRoles].[UserId], [dbo].[aspnet_UsersInRoles].[RoleId]
  FROM [dbo].[aspnet_UsersInRoles]
GO
/****** Object:  View [dbo].[vw_aspnet_WebPartState_User]    Script Date: 02/04/2014 12:06:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[vw_aspnet_WebPartState_User]
  AS SELECT [dbo].[aspnet_PersonalizationPerUser].[PathId], [dbo].[aspnet_PersonalizationPerUser].[UserId], [DataSize]=DATALENGTH([dbo].[aspnet_PersonalizationPerUser].[PageSettings]), [dbo].[aspnet_PersonalizationPerUser].[LastUpdatedDate]
  FROM [dbo].[aspnet_PersonalizationPerUser]
GO
/****** Object:  View [dbo].[vw_aspnet_WebPartState_Shared]    Script Date: 02/04/2014 12:06:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[vw_aspnet_WebPartState_Shared]
  AS SELECT [dbo].[aspnet_PersonalizationAllUsers].[PathId], [DataSize]=DATALENGTH([dbo].[aspnet_PersonalizationAllUsers].[PageSettings]), [dbo].[aspnet_PersonalizationAllUsers].[LastUpdatedDate]
  FROM [dbo].[aspnet_PersonalizationAllUsers]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_UpdateUserInfo]    Script Date: 02/04/2014 12:06:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_UpdateUserInfo]
    @ApplicationName                nvarchar(256),
    @UserName                       nvarchar(256),
    @IsPasswordCorrect              bit,
    @UpdateLastLoginActivityDate    bit,
    @MaxInvalidPasswordAttempts     int,
    @PasswordAttemptWindow          int,
    @CurrentTimeUtc                 datetime,
    @LastLoginDate                  datetime,
    @LastActivityDate               datetime
AS
BEGIN
    DECLARE @UserId                                 uniqueidentifier
    DECLARE @IsApproved                             bit
    DECLARE @IsLockedOut                            bit
    DECLARE @LastLockoutDate                        datetime
    DECLARE @FailedPasswordAttemptCount             int
    DECLARE @FailedPasswordAttemptWindowStart       datetime
    DECLARE @FailedPasswordAnswerAttemptCount       int
    DECLARE @FailedPasswordAnswerAttemptWindowStart datetime

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
    	SET @TranStarted = 0

    SELECT  @UserId = u.UserId,
            @IsApproved = m.IsApproved,
            @IsLockedOut = m.IsLockedOut,
            @LastLockoutDate = m.LastLockoutDate,
            @FailedPasswordAttemptCount = m.FailedPasswordAttemptCount,
            @FailedPasswordAttemptWindowStart = m.FailedPasswordAttemptWindowStart,
            @FailedPasswordAnswerAttemptCount = m.FailedPasswordAnswerAttemptCount,
            @FailedPasswordAnswerAttemptWindowStart = m.FailedPasswordAnswerAttemptWindowStart
    FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m WITH ( UPDLOCK )
    WHERE   LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.ApplicationId = a.ApplicationId    AND
            u.UserId = m.UserId AND
            LOWER(@UserName) = u.LoweredUserName

    IF ( @@rowcount = 0 )
    BEGIN
        SET @ErrorCode = 1
        GOTO Cleanup
    END

    IF( @IsLockedOut = 1 )
    BEGIN
        GOTO Cleanup
    END

    IF( @IsPasswordCorrect = 0 )
    BEGIN
        IF( @CurrentTimeUtc > DATEADD( minute, @PasswordAttemptWindow, @FailedPasswordAttemptWindowStart ) )
        BEGIN
            SET @FailedPasswordAttemptWindowStart = @CurrentTimeUtc
            SET @FailedPasswordAttemptCount = 1
        END
        ELSE
        BEGIN
            SET @FailedPasswordAttemptWindowStart = @CurrentTimeUtc
            SET @FailedPasswordAttemptCount = @FailedPasswordAttemptCount + 1
        END

        BEGIN
            IF( @FailedPasswordAttemptCount >= @MaxInvalidPasswordAttempts )
            BEGIN
                SET @IsLockedOut = 1
                SET @LastLockoutDate = @CurrentTimeUtc
            END
        END
    END
    ELSE
    BEGIN
        IF( @FailedPasswordAttemptCount > 0 OR @FailedPasswordAnswerAttemptCount > 0 )
        BEGIN
            SET @FailedPasswordAttemptCount = 0
            SET @FailedPasswordAttemptWindowStart = CONVERT( datetime, '17540101', 112 )
            SET @FailedPasswordAnswerAttemptCount = 0
            SET @FailedPasswordAnswerAttemptWindowStart = CONVERT( datetime, '17540101', 112 )
            SET @LastLockoutDate = CONVERT( datetime, '17540101', 112 )
        END
    END

    IF( @UpdateLastLoginActivityDate = 1 )
    BEGIN
        UPDATE  dbo.aspnet_Users
        SET     LastActivityDate = @LastActivityDate
        WHERE   @UserId = UserId

        IF( @@ERROR <> 0 )
        BEGIN
            SET @ErrorCode = -1
            GOTO Cleanup
        END

        UPDATE  dbo.aspnet_Membership
        SET     LastLoginDate = @LastLoginDate
        WHERE   UserId = @UserId

        IF( @@ERROR <> 0 )
        BEGIN
            SET @ErrorCode = -1
            GOTO Cleanup
        END
    END


    UPDATE dbo.aspnet_Membership
    SET IsLockedOut = @IsLockedOut, LastLockoutDate = @LastLockoutDate,
        FailedPasswordAttemptCount = @FailedPasswordAttemptCount,
        FailedPasswordAttemptWindowStart = @FailedPasswordAttemptWindowStart,
        FailedPasswordAnswerAttemptCount = @FailedPasswordAnswerAttemptCount,
        FailedPasswordAnswerAttemptWindowStart = @FailedPasswordAnswerAttemptWindowStart
    WHERE @UserId = UserId

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @TranStarted = 1 )
    BEGIN
	SET @TranStarted = 0
	COMMIT TRANSACTION
    END

    RETURN @ErrorCode

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_UpdateUser]    Script Date: 02/04/2014 12:06:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_UpdateUser]
    @ApplicationName      nvarchar(256),
    @UserName             nvarchar(256),
    @Email                nvarchar(256),
    @Comment              ntext,
    @IsApproved           bit,
    @LastLoginDate        datetime,
    @LastActivityDate     datetime,
    @UniqueEmail          int,
    @CurrentTimeUtc       datetime
AS
BEGIN
    DECLARE @UserId uniqueidentifier
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @UserId = NULL
    SELECT  @UserId = u.UserId, @ApplicationId = a.ApplicationId
    FROM    dbo.aspnet_Users u, dbo.aspnet_Applications a, dbo.aspnet_Membership m
    WHERE   LoweredUserName = LOWER(@UserName) AND
            u.ApplicationId = a.ApplicationId  AND
            LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.UserId = m.UserId

    IF (@UserId IS NULL)
        RETURN(1)

    IF (@UniqueEmail = 1)
    BEGIN
        IF (EXISTS (SELECT *
                    FROM  dbo.aspnet_Membership WITH (UPDLOCK, HOLDLOCK)
                    WHERE ApplicationId = @ApplicationId  AND @UserId <> UserId AND LoweredEmail = LOWER(@Email)))
        BEGIN
            RETURN(7)
        END
    END

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
	SET @TranStarted = 0

    UPDATE dbo.aspnet_Users WITH (ROWLOCK)
    SET
         LastActivityDate = @LastActivityDate
    WHERE
       @UserId = UserId

    IF( @@ERROR <> 0 )
        GOTO Cleanup

    UPDATE dbo.aspnet_Membership WITH (ROWLOCK)
    SET
         Email            = @Email,
         LoweredEmail     = LOWER(@Email),
         Comment          = @Comment,
         IsApproved       = @IsApproved,
         LastLoginDate    = @LastLoginDate
    WHERE
       @UserId = UserId

    IF( @@ERROR <> 0 )
        GOTO Cleanup

    IF( @TranStarted = 1 )
    BEGIN
	SET @TranStarted = 0
	COMMIT TRANSACTION
    END

    RETURN 0

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END

    RETURN -1
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_UnlockUser]    Script Date: 02/04/2014 12:06:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_UnlockUser]
    @ApplicationName                         nvarchar(256),
    @UserName                                nvarchar(256)
AS
BEGIN
    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL
    SELECT  @UserId = u.UserId
    FROM    dbo.aspnet_Users u, dbo.aspnet_Applications a, dbo.aspnet_Membership m
    WHERE   LoweredUserName = LOWER(@UserName) AND
            u.ApplicationId = a.ApplicationId  AND
            LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.UserId = m.UserId

    IF ( @UserId IS NULL )
        RETURN 1

    UPDATE dbo.aspnet_Membership
    SET IsLockedOut = 0,
        FailedPasswordAttemptCount = 0,
        FailedPasswordAttemptWindowStart = CONVERT( datetime, '17540101', 112 ),
        FailedPasswordAnswerAttemptCount = 0,
        FailedPasswordAnswerAttemptWindowStart = CONVERT( datetime, '17540101', 112 ),
        LastLockoutDate = CONVERT( datetime, '17540101', 112 )
    WHERE @UserId = UserId

    RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_SetPassword]    Script Date: 02/04/2014 12:06:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_SetPassword]
    @ApplicationName  nvarchar(256),
    @UserName         nvarchar(256),
    @NewPassword      nvarchar(128),
    @PasswordSalt     nvarchar(128),
    @CurrentTimeUtc   datetime,
    @PasswordFormat   int = 0
AS
BEGIN
    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL
    SELECT  @UserId = u.UserId
    FROM    dbo.aspnet_Users u, dbo.aspnet_Applications a, dbo.aspnet_Membership m
    WHERE   LoweredUserName = LOWER(@UserName) AND
            u.ApplicationId = a.ApplicationId  AND
            LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.UserId = m.UserId

    IF (@UserId IS NULL)
        RETURN(1)

    UPDATE dbo.aspnet_Membership
    SET Password = @NewPassword, PasswordFormat = @PasswordFormat, PasswordSalt = @PasswordSalt,
        LastPasswordChangedDate = @CurrentTimeUtc
    WHERE @UserId = UserId
    RETURN(0)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_ResetPassword]    Script Date: 02/04/2014 12:06:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_ResetPassword]
    @ApplicationName             nvarchar(256),
    @UserName                    nvarchar(256),
    @NewPassword                 nvarchar(128),
    @MaxInvalidPasswordAttempts  int,
    @PasswordAttemptWindow       int,
    @PasswordSalt                nvarchar(128),
    @CurrentTimeUtc              datetime,
    @PasswordFormat              int = 0,
    @PasswordAnswer              nvarchar(128) = NULL
AS
BEGIN
    DECLARE @IsLockedOut                            bit
    DECLARE @LastLockoutDate                        datetime
    DECLARE @FailedPasswordAttemptCount             int
    DECLARE @FailedPasswordAttemptWindowStart       datetime
    DECLARE @FailedPasswordAnswerAttemptCount       int
    DECLARE @FailedPasswordAnswerAttemptWindowStart datetime

    DECLARE @UserId                                 uniqueidentifier
    SET     @UserId = NULL

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
    	SET @TranStarted = 0

    SELECT  @UserId = u.UserId
    FROM    dbo.aspnet_Users u, dbo.aspnet_Applications a, dbo.aspnet_Membership m
    WHERE   LoweredUserName = LOWER(@UserName) AND
            u.ApplicationId = a.ApplicationId  AND
            LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.UserId = m.UserId

    IF ( @UserId IS NULL )
    BEGIN
        SET @ErrorCode = 1
        GOTO Cleanup
    END

    SELECT @IsLockedOut = IsLockedOut,
           @LastLockoutDate = LastLockoutDate,
           @FailedPasswordAttemptCount = FailedPasswordAttemptCount,
           @FailedPasswordAttemptWindowStart = FailedPasswordAttemptWindowStart,
           @FailedPasswordAnswerAttemptCount = FailedPasswordAnswerAttemptCount,
           @FailedPasswordAnswerAttemptWindowStart = FailedPasswordAnswerAttemptWindowStart
    FROM dbo.aspnet_Membership WITH ( UPDLOCK )
    WHERE @UserId = UserId

    IF( @IsLockedOut = 1 )
    BEGIN
        SET @ErrorCode = 99
        GOTO Cleanup
    END

    UPDATE dbo.aspnet_Membership
    SET    Password = @NewPassword,
           LastPasswordChangedDate = @CurrentTimeUtc,
           PasswordFormat = @PasswordFormat,
           PasswordSalt = @PasswordSalt
    WHERE  @UserId = UserId AND
           ( ( @PasswordAnswer IS NULL ) OR ( LOWER( PasswordAnswer ) = LOWER( @PasswordAnswer ) ) )

    IF ( @@ROWCOUNT = 0 )
        BEGIN
            IF( @CurrentTimeUtc > DATEADD( minute, @PasswordAttemptWindow, @FailedPasswordAnswerAttemptWindowStart ) )
            BEGIN
                SET @FailedPasswordAnswerAttemptWindowStart = @CurrentTimeUtc
                SET @FailedPasswordAnswerAttemptCount = 1
            END
            ELSE
            BEGIN
                SET @FailedPasswordAnswerAttemptWindowStart = @CurrentTimeUtc
                SET @FailedPasswordAnswerAttemptCount = @FailedPasswordAnswerAttemptCount + 1
            END

            BEGIN
                IF( @FailedPasswordAnswerAttemptCount >= @MaxInvalidPasswordAttempts )
                BEGIN
                    SET @IsLockedOut = 1
                    SET @LastLockoutDate = @CurrentTimeUtc
                END
            END

            SET @ErrorCode = 3
        END
    ELSE
        BEGIN
            IF( @FailedPasswordAnswerAttemptCount > 0 )
            BEGIN
                SET @FailedPasswordAnswerAttemptCount = 0
                SET @FailedPasswordAnswerAttemptWindowStart = CONVERT( datetime, '17540101', 112 )
            END
        END

    IF( NOT ( @PasswordAnswer IS NULL ) )
    BEGIN
        UPDATE dbo.aspnet_Membership
        SET IsLockedOut = @IsLockedOut, LastLockoutDate = @LastLockoutDate,
            FailedPasswordAttemptCount = @FailedPasswordAttemptCount,
            FailedPasswordAttemptWindowStart = @FailedPasswordAttemptWindowStart,
            FailedPasswordAnswerAttemptCount = @FailedPasswordAnswerAttemptCount,
            FailedPasswordAnswerAttemptWindowStart = @FailedPasswordAnswerAttemptWindowStart
        WHERE @UserId = UserId

        IF( @@ERROR <> 0 )
        BEGIN
            SET @ErrorCode = -1
            GOTO Cleanup
        END
    END

    IF( @TranStarted = 1 )
    BEGIN
	SET @TranStarted = 0
	COMMIT TRANSACTION
    END

    RETURN @ErrorCode

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetUserByUserId]    Script Date: 02/04/2014 12:06:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_GetUserByUserId]
    @UserId               uniqueidentifier,
    @CurrentTimeUtc       datetime,
    @UpdateLastActivity   bit = 0
AS
BEGIN
    IF ( @UpdateLastActivity = 1 )
    BEGIN
        UPDATE   dbo.aspnet_Users
        SET      LastActivityDate = @CurrentTimeUtc
        FROM     dbo.aspnet_Users
        WHERE    @UserId = UserId

        IF ( @@ROWCOUNT = 0 ) -- User ID not found
            RETURN -1
    END

    SELECT  m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
            m.CreateDate, m.LastLoginDate, u.LastActivityDate,
            m.LastPasswordChangedDate, u.UserName, m.IsLockedOut,
            m.LastLockoutDate
    FROM    dbo.aspnet_Users u, dbo.aspnet_Membership m
    WHERE   @UserId = u.UserId AND u.UserId = m.UserId

    IF ( @@ROWCOUNT = 0 ) -- User ID not found
       RETURN -1

    RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetUserByName]    Script Date: 02/04/2014 12:06:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_GetUserByName]
    @ApplicationName      nvarchar(256),
    @UserName             nvarchar(256),
    @CurrentTimeUtc       datetime,
    @UpdateLastActivity   bit = 0
AS
BEGIN
    DECLARE @UserId uniqueidentifier

    IF (@UpdateLastActivity = 1)
    BEGIN
        -- select user ID from aspnet_users table
        SELECT TOP 1 @UserId = u.UserId
        FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE    LOWER(@ApplicationName) = a.LoweredApplicationName AND
                u.ApplicationId = a.ApplicationId    AND
                LOWER(@UserName) = u.LoweredUserName AND u.UserId = m.UserId

        IF (@@ROWCOUNT = 0) -- Username not found
            RETURN -1

        UPDATE   dbo.aspnet_Users
        SET      LastActivityDate = @CurrentTimeUtc
        WHERE    @UserId = UserId

        SELECT m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
                m.CreateDate, m.LastLoginDate, u.LastActivityDate, m.LastPasswordChangedDate,
                u.UserId, m.IsLockedOut, m.LastLockoutDate
        FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE  @UserId = u.UserId AND u.UserId = m.UserId 
    END
    ELSE
    BEGIN
        SELECT TOP 1 m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
                m.CreateDate, m.LastLoginDate, u.LastActivityDate, m.LastPasswordChangedDate,
                u.UserId, m.IsLockedOut,m.LastLockoutDate
        FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE    LOWER(@ApplicationName) = a.LoweredApplicationName AND
                u.ApplicationId = a.ApplicationId    AND
                LOWER(@UserName) = u.LoweredUserName AND u.UserId = m.UserId

        IF (@@ROWCOUNT = 0) -- Username not found
            RETURN -1
    END

    RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetUserByEmail]    Script Date: 02/04/2014 12:06:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_GetUserByEmail]
    @ApplicationName  nvarchar(256),
    @Email            nvarchar(256)
AS
BEGIN
    IF( @Email IS NULL )
        SELECT  u.UserName
        FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE   LOWER(@ApplicationName) = a.LoweredApplicationName AND
                u.ApplicationId = a.ApplicationId    AND
                u.UserId = m.UserId AND
                m.ApplicationId = a.ApplicationId AND
                m.LoweredEmail IS NULL
    ELSE
        SELECT  u.UserName
        FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE   LOWER(@ApplicationName) = a.LoweredApplicationName AND
                u.ApplicationId = a.ApplicationId    AND
                u.UserId = m.UserId AND
                m.ApplicationId = a.ApplicationId AND
                LOWER(@Email) = m.LoweredEmail

    IF (@@rowcount = 0)
        RETURN(1)
    RETURN(0)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetPasswordWithFormat]    Script Date: 02/04/2014 12:06:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_GetPasswordWithFormat]
    @ApplicationName                nvarchar(256),
    @UserName                       nvarchar(256),
    @UpdateLastLoginActivityDate    bit,
    @CurrentTimeUtc                 datetime
AS
BEGIN
    DECLARE @IsLockedOut                        bit
    DECLARE @UserId                             uniqueidentifier
    DECLARE @Password                           nvarchar(128)
    DECLARE @PasswordSalt                       nvarchar(128)
    DECLARE @PasswordFormat                     int
    DECLARE @FailedPasswordAttemptCount         int
    DECLARE @FailedPasswordAnswerAttemptCount   int
    DECLARE @IsApproved                         bit
    DECLARE @LastActivityDate                   datetime
    DECLARE @LastLoginDate                      datetime

    SELECT  @UserId          = NULL

    SELECT  @UserId = u.UserId, @IsLockedOut = m.IsLockedOut, @Password=Password, @PasswordFormat=PasswordFormat,
            @PasswordSalt=PasswordSalt, @FailedPasswordAttemptCount=FailedPasswordAttemptCount,
		    @FailedPasswordAnswerAttemptCount=FailedPasswordAnswerAttemptCount, @IsApproved=IsApproved,
            @LastActivityDate = LastActivityDate, @LastLoginDate = LastLoginDate
    FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
    WHERE   LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.ApplicationId = a.ApplicationId    AND
            u.UserId = m.UserId AND
            LOWER(@UserName) = u.LoweredUserName

    IF (@UserId IS NULL)
        RETURN 1

    IF (@IsLockedOut = 1)
        RETURN 99

    SELECT   @Password, @PasswordFormat, @PasswordSalt, @FailedPasswordAttemptCount,
             @FailedPasswordAnswerAttemptCount, @IsApproved, @LastLoginDate, @LastActivityDate

    IF (@UpdateLastLoginActivityDate = 1 AND @IsApproved = 1)
    BEGIN
        UPDATE  dbo.aspnet_Membership
        SET     LastLoginDate = @CurrentTimeUtc
        WHERE   UserId = @UserId

        UPDATE  dbo.aspnet_Users
        SET     LastActivityDate = @CurrentTimeUtc
        WHERE   @UserId = UserId
    END


    RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetPassword]    Script Date: 02/04/2014 12:06:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_GetPassword]
    @ApplicationName                nvarchar(256),
    @UserName                       nvarchar(256),
    @MaxInvalidPasswordAttempts     int,
    @PasswordAttemptWindow          int,
    @CurrentTimeUtc                 datetime,
    @PasswordAnswer                 nvarchar(128) = NULL
AS
BEGIN
    DECLARE @UserId                                 uniqueidentifier
    DECLARE @PasswordFormat                         int
    DECLARE @Password                               nvarchar(128)
    DECLARE @passAns                                nvarchar(128)
    DECLARE @IsLockedOut                            bit
    DECLARE @LastLockoutDate                        datetime
    DECLARE @FailedPasswordAttemptCount             int
    DECLARE @FailedPasswordAttemptWindowStart       datetime
    DECLARE @FailedPasswordAnswerAttemptCount       int
    DECLARE @FailedPasswordAnswerAttemptWindowStart datetime

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
    	SET @TranStarted = 0

    SELECT  @UserId = u.UserId,
            @Password = m.Password,
            @passAns = m.PasswordAnswer,
            @PasswordFormat = m.PasswordFormat,
            @IsLockedOut = m.IsLockedOut,
            @LastLockoutDate = m.LastLockoutDate,
            @FailedPasswordAttemptCount = m.FailedPasswordAttemptCount,
            @FailedPasswordAttemptWindowStart = m.FailedPasswordAttemptWindowStart,
            @FailedPasswordAnswerAttemptCount = m.FailedPasswordAnswerAttemptCount,
            @FailedPasswordAnswerAttemptWindowStart = m.FailedPasswordAnswerAttemptWindowStart
    FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m WITH ( UPDLOCK )
    WHERE   LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.ApplicationId = a.ApplicationId    AND
            u.UserId = m.UserId AND
            LOWER(@UserName) = u.LoweredUserName

    IF ( @@rowcount = 0 )
    BEGIN
        SET @ErrorCode = 1
        GOTO Cleanup
    END

    IF( @IsLockedOut = 1 )
    BEGIN
        SET @ErrorCode = 99
        GOTO Cleanup
    END

    IF ( NOT( @PasswordAnswer IS NULL ) )
    BEGIN
        IF( ( @passAns IS NULL ) OR ( LOWER( @passAns ) <> LOWER( @PasswordAnswer ) ) )
        BEGIN
            IF( @CurrentTimeUtc > DATEADD( minute, @PasswordAttemptWindow, @FailedPasswordAnswerAttemptWindowStart ) )
            BEGIN
                SET @FailedPasswordAnswerAttemptWindowStart = @CurrentTimeUtc
                SET @FailedPasswordAnswerAttemptCount = 1
            END
            ELSE
            BEGIN
                SET @FailedPasswordAnswerAttemptCount = @FailedPasswordAnswerAttemptCount + 1
                SET @FailedPasswordAnswerAttemptWindowStart = @CurrentTimeUtc
            END

            BEGIN
                IF( @FailedPasswordAnswerAttemptCount >= @MaxInvalidPasswordAttempts )
                BEGIN
                    SET @IsLockedOut = 1
                    SET @LastLockoutDate = @CurrentTimeUtc
                END
            END

            SET @ErrorCode = 3
        END
        ELSE
        BEGIN
            IF( @FailedPasswordAnswerAttemptCount > 0 )
            BEGIN
                SET @FailedPasswordAnswerAttemptCount = 0
                SET @FailedPasswordAnswerAttemptWindowStart = CONVERT( datetime, '17540101', 112 )
            END
        END

        UPDATE dbo.aspnet_Membership
        SET IsLockedOut = @IsLockedOut, LastLockoutDate = @LastLockoutDate,
            FailedPasswordAttemptCount = @FailedPasswordAttemptCount,
            FailedPasswordAttemptWindowStart = @FailedPasswordAttemptWindowStart,
            FailedPasswordAnswerAttemptCount = @FailedPasswordAnswerAttemptCount,
            FailedPasswordAnswerAttemptWindowStart = @FailedPasswordAnswerAttemptWindowStart
        WHERE @UserId = UserId

        IF( @@ERROR <> 0 )
        BEGIN
            SET @ErrorCode = -1
            GOTO Cleanup
        END
    END

    IF( @TranStarted = 1 )
    BEGIN
	SET @TranStarted = 0
	COMMIT TRANSACTION
    END

    IF( @ErrorCode = 0 )
        SELECT @Password, @PasswordFormat

    RETURN @ErrorCode

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetNumberOfUsersOnline]    Script Date: 02/04/2014 12:06:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_GetNumberOfUsersOnline]
    @ApplicationName            nvarchar(256),
    @MinutesSinceLastInActive   int,
    @CurrentTimeUtc             datetime
AS
BEGIN
    DECLARE @DateActive datetime
    SELECT  @DateActive = DATEADD(minute,  -(@MinutesSinceLastInActive), @CurrentTimeUtc)

    DECLARE @NumOnline int
    SELECT  @NumOnline = COUNT(*)
    FROM    dbo.aspnet_Users u(NOLOCK),
            dbo.aspnet_Applications a(NOLOCK),
            dbo.aspnet_Membership m(NOLOCK)
    WHERE   u.ApplicationId = a.ApplicationId                  AND
            LastActivityDate > @DateActive                     AND
            a.LoweredApplicationName = LOWER(@ApplicationName) AND
            u.UserId = m.UserId
    RETURN(@NumOnline)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetAllUsers]    Script Date: 02/04/2014 12:06:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_GetAllUsers]
    @ApplicationName       nvarchar(256),
    @PageIndex             int,
    @PageSize              int
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN 0


    -- Set the page bounds
    DECLARE @PageLowerBound int
    DECLARE @PageUpperBound int
    DECLARE @TotalRecords   int
    SET @PageLowerBound = @PageSize * @PageIndex
    SET @PageUpperBound = @PageSize - 1 + @PageLowerBound

    -- Create a temp table TO store the select results
    CREATE TABLE #PageIndexForUsers
    (
        IndexId int IDENTITY (0, 1) NOT NULL,
        UserId uniqueidentifier
    )

    -- Insert into our temp table
    INSERT INTO #PageIndexForUsers (UserId)
    SELECT u.UserId
    FROM   dbo.aspnet_Membership m, dbo.aspnet_Users u
    WHERE  u.ApplicationId = @ApplicationId AND u.UserId = m.UserId
    ORDER BY u.UserName

    SELECT @TotalRecords = @@ROWCOUNT

    SELECT u.UserName, m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
            m.CreateDate,
            m.LastLoginDate,
            u.LastActivityDate,
            m.LastPasswordChangedDate,
            u.UserId, m.IsLockedOut,
            m.LastLockoutDate
    FROM   dbo.aspnet_Membership m, dbo.aspnet_Users u, #PageIndexForUsers p
    WHERE  u.UserId = p.UserId AND u.UserId = m.UserId AND
           p.IndexId >= @PageLowerBound AND p.IndexId <= @PageUpperBound
    ORDER BY u.UserName
    RETURN @TotalRecords
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_FindUsersByName]    Script Date: 02/04/2014 12:06:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_FindUsersByName]
    @ApplicationName       nvarchar(256),
    @UserNameToMatch       nvarchar(256),
    @PageIndex             int,
    @PageSize              int
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN 0

    -- Set the page bounds
    DECLARE @PageLowerBound int
    DECLARE @PageUpperBound int
    DECLARE @TotalRecords   int
    SET @PageLowerBound = @PageSize * @PageIndex
    SET @PageUpperBound = @PageSize - 1 + @PageLowerBound

    -- Create a temp table TO store the select results
    CREATE TABLE #PageIndexForUsers
    (
        IndexId int IDENTITY (0, 1) NOT NULL,
        UserId uniqueidentifier
    )

    -- Insert into our temp table
    INSERT INTO #PageIndexForUsers (UserId)
        SELECT u.UserId
        FROM   dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE  u.ApplicationId = @ApplicationId AND m.UserId = u.UserId AND u.LoweredUserName LIKE LOWER(@UserNameToMatch)
        ORDER BY u.UserName


    SELECT  u.UserName, m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
            m.CreateDate,
            m.LastLoginDate,
            u.LastActivityDate,
            m.LastPasswordChangedDate,
            u.UserId, m.IsLockedOut,
            m.LastLockoutDate
    FROM   dbo.aspnet_Membership m, dbo.aspnet_Users u, #PageIndexForUsers p
    WHERE  u.UserId = p.UserId AND u.UserId = m.UserId AND
           p.IndexId >= @PageLowerBound AND p.IndexId <= @PageUpperBound
    ORDER BY u.UserName

    SELECT  @TotalRecords = COUNT(*)
    FROM    #PageIndexForUsers
    RETURN @TotalRecords
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_FindUsersByEmail]    Script Date: 02/04/2014 12:06:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_FindUsersByEmail]
    @ApplicationName       nvarchar(256),
    @EmailToMatch          nvarchar(256),
    @PageIndex             int,
    @PageSize              int
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN 0

    -- Set the page bounds
    DECLARE @PageLowerBound int
    DECLARE @PageUpperBound int
    DECLARE @TotalRecords   int
    SET @PageLowerBound = @PageSize * @PageIndex
    SET @PageUpperBound = @PageSize - 1 + @PageLowerBound

    -- Create a temp table TO store the select results
    CREATE TABLE #PageIndexForUsers
    (
        IndexId int IDENTITY (0, 1) NOT NULL,
        UserId uniqueidentifier
    )

    -- Insert into our temp table
    IF( @EmailToMatch IS NULL )
        INSERT INTO #PageIndexForUsers (UserId)
            SELECT u.UserId
            FROM   dbo.aspnet_Users u, dbo.aspnet_Membership m
            WHERE  u.ApplicationId = @ApplicationId AND m.UserId = u.UserId AND m.Email IS NULL
            ORDER BY m.LoweredEmail
    ELSE
        INSERT INTO #PageIndexForUsers (UserId)
            SELECT u.UserId
            FROM   dbo.aspnet_Users u, dbo.aspnet_Membership m
            WHERE  u.ApplicationId = @ApplicationId AND m.UserId = u.UserId AND m.LoweredEmail LIKE LOWER(@EmailToMatch)
            ORDER BY m.LoweredEmail

    SELECT  u.UserName, m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
            m.CreateDate,
            m.LastLoginDate,
            u.LastActivityDate,
            m.LastPasswordChangedDate,
            u.UserId, m.IsLockedOut,
            m.LastLockoutDate
    FROM   dbo.aspnet_Membership m, dbo.aspnet_Users u, #PageIndexForUsers p
    WHERE  u.UserId = p.UserId AND u.UserId = m.UserId AND
           p.IndexId >= @PageLowerBound AND p.IndexId <= @PageUpperBound
    ORDER BY m.LoweredEmail

    SELECT  @TotalRecords = COUNT(*)
    FROM    #PageIndexForUsers
    RETURN @TotalRecords
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_CreateUser]    Script Date: 02/04/2014 12:06:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_CreateUser]
    @ApplicationName                        nvarchar(256),
    @UserName                               nvarchar(256),
    @Password                               nvarchar(128),
    @PasswordSalt                           nvarchar(128),
    @Email                                  nvarchar(256),
    @PasswordQuestion                       nvarchar(256),
    @PasswordAnswer                         nvarchar(128),
    @IsApproved                             bit,
    @CurrentTimeUtc                         datetime,
    @CreateDate                             datetime = NULL,
    @UniqueEmail                            int      = 0,
    @PasswordFormat                         int      = 0,
    @UserId                                 uniqueidentifier OUTPUT
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL

    DECLARE @NewUserId uniqueidentifier
    SELECT @NewUserId = NULL

    DECLARE @IsLockedOut bit
    SET @IsLockedOut = 0

    DECLARE @LastLockoutDate  datetime
    SET @LastLockoutDate = CONVERT( datetime, '17540101', 112 )

    DECLARE @FailedPasswordAttemptCount int
    SET @FailedPasswordAttemptCount = 0

    DECLARE @FailedPasswordAttemptWindowStart  datetime
    SET @FailedPasswordAttemptWindowStart = CONVERT( datetime, '17540101', 112 )

    DECLARE @FailedPasswordAnswerAttemptCount int
    SET @FailedPasswordAnswerAttemptCount = 0

    DECLARE @FailedPasswordAnswerAttemptWindowStart  datetime
    SET @FailedPasswordAnswerAttemptWindowStart = CONVERT( datetime, '17540101', 112 )

    DECLARE @NewUserCreated bit
    DECLARE @ReturnValue   int
    SET @ReturnValue = 0

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
    	SET @TranStarted = 0

    EXEC dbo.aspnet_Applications_CreateApplication @ApplicationName, @ApplicationId OUTPUT

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    SET @CreateDate = @CurrentTimeUtc

    SELECT  @NewUserId = UserId FROM dbo.aspnet_Users WHERE LOWER(@UserName) = LoweredUserName AND @ApplicationId = ApplicationId
    IF ( @NewUserId IS NULL )
    BEGIN
        SET @NewUserId = @UserId
        EXEC @ReturnValue = dbo.aspnet_Users_CreateUser @ApplicationId, @UserName, 0, @CreateDate, @NewUserId OUTPUT
        SET @NewUserCreated = 1
    END
    ELSE
    BEGIN
        SET @NewUserCreated = 0
        IF( @NewUserId <> @UserId AND @UserId IS NOT NULL )
        BEGIN
            SET @ErrorCode = 6
            GOTO Cleanup
        END
    END

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @ReturnValue = -1 )
    BEGIN
        SET @ErrorCode = 10
        GOTO Cleanup
    END

    IF ( EXISTS ( SELECT UserId
                  FROM   dbo.aspnet_Membership
                  WHERE  @NewUserId = UserId ) )
    BEGIN
        SET @ErrorCode = 6
        GOTO Cleanup
    END

    SET @UserId = @NewUserId

    IF (@UniqueEmail = 1)
    BEGIN
        IF (EXISTS (SELECT *
                    FROM  dbo.aspnet_Membership m WITH ( UPDLOCK, HOLDLOCK )
                    WHERE ApplicationId = @ApplicationId AND LoweredEmail = LOWER(@Email)))
        BEGIN
            SET @ErrorCode = 7
            GOTO Cleanup
        END
    END

    IF (@NewUserCreated = 0)
    BEGIN
        UPDATE dbo.aspnet_Users
        SET    LastActivityDate = @CreateDate
        WHERE  @UserId = UserId
        IF( @@ERROR <> 0 )
        BEGIN
            SET @ErrorCode = -1
            GOTO Cleanup
        END
    END

    INSERT INTO dbo.aspnet_Membership
                ( ApplicationId,
                  UserId,
                  Password,
                  PasswordSalt,
                  Email,
                  LoweredEmail,
                  PasswordQuestion,
                  PasswordAnswer,
                  PasswordFormat,
                  IsApproved,
                  IsLockedOut,
                  CreateDate,
                  LastLoginDate,
                  LastPasswordChangedDate,
                  LastLockoutDate,
                  FailedPasswordAttemptCount,
                  FailedPasswordAttemptWindowStart,
                  FailedPasswordAnswerAttemptCount,
                  FailedPasswordAnswerAttemptWindowStart )
         VALUES ( @ApplicationId,
                  @UserId,
                  @Password,
                  @PasswordSalt,
                  @Email,
                  LOWER(@Email),
                  @PasswordQuestion,
                  @PasswordAnswer,
                  @PasswordFormat,
                  @IsApproved,
                  @IsLockedOut,
                  @CreateDate,
                  @CreateDate,
                  @CreateDate,
                  @LastLockoutDate,
                  @FailedPasswordAttemptCount,
                  @FailedPasswordAttemptWindowStart,
                  @FailedPasswordAnswerAttemptCount,
                  @FailedPasswordAnswerAttemptWindowStart )

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @TranStarted = 1 )
    BEGIN
	    SET @TranStarted = 0
	    COMMIT TRANSACTION
    END

    RETURN 0

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_ChangePasswordQuestionAndAnswer]    Script Date: 02/04/2014 12:06:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_ChangePasswordQuestionAndAnswer]
    @ApplicationName       nvarchar(256),
    @UserName              nvarchar(256),
    @NewPasswordQuestion   nvarchar(256),
    @NewPasswordAnswer     nvarchar(128)
AS
BEGIN
    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL
    SELECT  @UserId = u.UserId
    FROM    dbo.aspnet_Membership m, dbo.aspnet_Users u, dbo.aspnet_Applications a
    WHERE   LoweredUserName = LOWER(@UserName) AND
            u.ApplicationId = a.ApplicationId  AND
            LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.UserId = m.UserId
    IF (@UserId IS NULL)
    BEGIN
        RETURN(1)
    END

    UPDATE dbo.aspnet_Membership
    SET    PasswordQuestion = @NewPasswordQuestion, PasswordAnswer = @NewPasswordAnswer
    WHERE  UserId=@UserId
    RETURN(0)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_AnyDataInTables]    Script Date: 02/04/2014 12:06:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_AnyDataInTables]
    @TablesToCheck int
AS
BEGIN
    -- Check Membership table if (@TablesToCheck & 1) is set
    IF ((@TablesToCheck & 1) <> 0 AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_MembershipUsers') AND (type = 'V'))))
    BEGIN
        IF (EXISTS(SELECT TOP 1 UserId FROM dbo.aspnet_Membership))
        BEGIN
            SELECT N'aspnet_Membership'
            RETURN
        END
    END

    -- Check aspnet_Roles table if (@TablesToCheck & 2) is set
    IF ((@TablesToCheck & 2) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_Roles') AND (type = 'V'))) )
    BEGIN
        IF (EXISTS(SELECT TOP 1 RoleId FROM dbo.aspnet_Roles))
        BEGIN
            SELECT N'aspnet_Roles'
            RETURN
        END
    END

    -- Check aspnet_Profile table if (@TablesToCheck & 4) is set
    IF ((@TablesToCheck & 4) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_Profiles') AND (type = 'V'))) )
    BEGIN
        IF (EXISTS(SELECT TOP 1 UserId FROM dbo.aspnet_Profile))
        BEGIN
            SELECT N'aspnet_Profile'
            RETURN
        END
    END

    -- Check aspnet_PersonalizationPerUser table if (@TablesToCheck & 8) is set
    IF ((@TablesToCheck & 8) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_WebPartState_User') AND (type = 'V'))) )
    BEGIN
        IF (EXISTS(SELECT TOP 1 UserId FROM dbo.aspnet_PersonalizationPerUser))
        BEGIN
            SELECT N'aspnet_PersonalizationPerUser'
            RETURN
        END
    END

    -- Check aspnet_PersonalizationPerUser table if (@TablesToCheck & 16) is set
    IF ((@TablesToCheck & 16) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'aspnet_WebEvent_LogEvent') AND (type = 'P'))) )
    BEGIN
        IF (EXISTS(SELECT TOP 1 * FROM dbo.aspnet_WebEvent_Events))
        BEGIN
            SELECT N'aspnet_WebEvent_Events'
            RETURN
        END
    END

    -- Check aspnet_Users table if (@TablesToCheck & 1,2,4 & 8) are all set
    IF ((@TablesToCheck & 1) <> 0 AND
        (@TablesToCheck & 2) <> 0 AND
        (@TablesToCheck & 4) <> 0 AND
        (@TablesToCheck & 8) <> 0 AND
        (@TablesToCheck & 32) <> 0 AND
        (@TablesToCheck & 128) <> 0 AND
        (@TablesToCheck & 256) <> 0 AND
        (@TablesToCheck & 512) <> 0 AND
        (@TablesToCheck & 1024) <> 0)
    BEGIN
        IF (EXISTS(SELECT TOP 1 UserId FROM dbo.aspnet_Users))
        BEGIN
            SELECT N'aspnet_Users'
            RETURN
        END
        IF (EXISTS(SELECT TOP 1 ApplicationId FROM dbo.aspnet_Applications))
        BEGIN
            SELECT N'aspnet_Applications'
            RETURN
        END
    END
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAdministration_ResetUserState]    Script Date: 02/04/2014 12:06:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAdministration_ResetUserState] (
    @Count                  int                 OUT,
    @ApplicationName        NVARCHAR(256),
    @InactiveSinceDate      DATETIME            = NULL,
    @UserName               NVARCHAR(256)       = NULL,
    @Path                   NVARCHAR(256)       = NULL)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
        SELECT @Count = 0
    ELSE
    BEGIN
        DELETE FROM dbo.aspnet_PersonalizationPerUser
        WHERE Id IN (SELECT PerUser.Id
                     FROM dbo.aspnet_PersonalizationPerUser PerUser, dbo.aspnet_Users Users, dbo.aspnet_Paths Paths
                     WHERE Paths.ApplicationId = @ApplicationId
                           AND PerUser.UserId = Users.UserId
                           AND PerUser.PathId = Paths.PathId
                           AND (@InactiveSinceDate IS NULL OR Users.LastActivityDate <= @InactiveSinceDate)
                           AND (@UserName IS NULL OR Users.LoweredUserName = LOWER(@UserName))
                           AND (@Path IS NULL OR Paths.LoweredPath = LOWER(@Path)))

        SELECT @Count = @@ROWCOUNT
    END
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAdministration_ResetSharedState]    Script Date: 02/04/2014 12:06:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAdministration_ResetSharedState] (
    @Count int OUT,
    @ApplicationName NVARCHAR(256),
    @Path NVARCHAR(256))
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
        SELECT @Count = 0
    ELSE
    BEGIN
        DELETE FROM dbo.aspnet_PersonalizationAllUsers
        WHERE PathId IN
            (SELECT AllUsers.PathId
             FROM dbo.aspnet_PersonalizationAllUsers AllUsers, dbo.aspnet_Paths Paths
             WHERE Paths.ApplicationId = @ApplicationId
                   AND AllUsers.PathId = Paths.PathId
                   AND Paths.LoweredPath = LOWER(@Path))

        SELECT @Count = @@ROWCOUNT
    END
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAdministration_GetCountOfState]    Script Date: 02/04/2014 12:06:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAdministration_GetCountOfState] (
    @Count int OUT,
    @AllUsersScope bit,
    @ApplicationName NVARCHAR(256),
    @Path NVARCHAR(256) = NULL,
    @UserName NVARCHAR(256) = NULL,
    @InactiveSinceDate DATETIME = NULL)
AS
BEGIN

    DECLARE @ApplicationId UNIQUEIDENTIFIER
    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
        SELECT @Count = 0
    ELSE
        IF (@AllUsersScope = 1)
            SELECT @Count = COUNT(*)
            FROM dbo.aspnet_PersonalizationAllUsers AllUsers, dbo.aspnet_Paths Paths
            WHERE Paths.ApplicationId = @ApplicationId
                  AND AllUsers.PathId = Paths.PathId
                  AND (@Path IS NULL OR Paths.LoweredPath LIKE LOWER(@Path))
        ELSE
            SELECT @Count = COUNT(*)
            FROM dbo.aspnet_PersonalizationPerUser PerUser, dbo.aspnet_Users Users, dbo.aspnet_Paths Paths
            WHERE Paths.ApplicationId = @ApplicationId
                  AND PerUser.UserId = Users.UserId
                  AND PerUser.PathId = Paths.PathId
                  AND (@Path IS NULL OR Paths.LoweredPath LIKE LOWER(@Path))
                  AND (@UserName IS NULL OR Users.LoweredUserName LIKE LOWER(@UserName))
                  AND (@InactiveSinceDate IS NULL OR Users.LastActivityDate <= @InactiveSinceDate)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAdministration_FindState]    Script Date: 02/04/2014 12:06:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAdministration_FindState] (
    @AllUsersScope bit,
    @ApplicationName NVARCHAR(256),
    @PageIndex              INT,
    @PageSize               INT,
    @Path NVARCHAR(256) = NULL,
    @UserName NVARCHAR(256) = NULL,
    @InactiveSinceDate DATETIME = NULL)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
        RETURN

    -- Set the page bounds
    DECLARE @PageLowerBound INT
    DECLARE @PageUpperBound INT
    DECLARE @TotalRecords   INT
    SET @PageLowerBound = @PageSize * @PageIndex
    SET @PageUpperBound = @PageSize - 1 + @PageLowerBound

    -- Create a temp table to store the selected results
    CREATE TABLE #PageIndex (
        IndexId int IDENTITY (0, 1) NOT NULL,
        ItemId UNIQUEIDENTIFIER
    )

    IF (@AllUsersScope = 1)
    BEGIN
        -- Insert into our temp table
        INSERT INTO #PageIndex (ItemId)
        SELECT Paths.PathId
        FROM dbo.aspnet_Paths Paths,
             ((SELECT Paths.PathId
               FROM dbo.aspnet_PersonalizationAllUsers AllUsers, dbo.aspnet_Paths Paths
               WHERE Paths.ApplicationId = @ApplicationId
                      AND AllUsers.PathId = Paths.PathId
                      AND (@Path IS NULL OR Paths.LoweredPath LIKE LOWER(@Path))
              ) AS SharedDataPerPath
              FULL OUTER JOIN
              (SELECT DISTINCT Paths.PathId
               FROM dbo.aspnet_PersonalizationPerUser PerUser, dbo.aspnet_Paths Paths
               WHERE Paths.ApplicationId = @ApplicationId
                      AND PerUser.PathId = Paths.PathId
                      AND (@Path IS NULL OR Paths.LoweredPath LIKE LOWER(@Path))
              ) AS UserDataPerPath
              ON SharedDataPerPath.PathId = UserDataPerPath.PathId
             )
        WHERE Paths.PathId = SharedDataPerPath.PathId OR Paths.PathId = UserDataPerPath.PathId
        ORDER BY Paths.Path ASC

        SELECT @TotalRecords = @@ROWCOUNT

        SELECT Paths.Path,
               SharedDataPerPath.LastUpdatedDate,
               SharedDataPerPath.SharedDataLength,
               UserDataPerPath.UserDataLength,
               UserDataPerPath.UserCount
        FROM dbo.aspnet_Paths Paths,
             ((SELECT PageIndex.ItemId AS PathId,
                      AllUsers.LastUpdatedDate AS LastUpdatedDate,
                      DATALENGTH(AllUsers.PageSettings) AS SharedDataLength
               FROM dbo.aspnet_PersonalizationAllUsers AllUsers, #PageIndex PageIndex
               WHERE AllUsers.PathId = PageIndex.ItemId
                     AND PageIndex.IndexId >= @PageLowerBound AND PageIndex.IndexId <= @PageUpperBound
              ) AS SharedDataPerPath
              FULL OUTER JOIN
              (SELECT PageIndex.ItemId AS PathId,
                      SUM(DATALENGTH(PerUser.PageSettings)) AS UserDataLength,
                      COUNT(*) AS UserCount
               FROM aspnet_PersonalizationPerUser PerUser, #PageIndex PageIndex
               WHERE PerUser.PathId = PageIndex.ItemId
                     AND PageIndex.IndexId >= @PageLowerBound AND PageIndex.IndexId <= @PageUpperBound
               GROUP BY PageIndex.ItemId
              ) AS UserDataPerPath
              ON SharedDataPerPath.PathId = UserDataPerPath.PathId
             )
        WHERE Paths.PathId = SharedDataPerPath.PathId OR Paths.PathId = UserDataPerPath.PathId
        ORDER BY Paths.Path ASC
    END
    ELSE
    BEGIN
        -- Insert into our temp table
        INSERT INTO #PageIndex (ItemId)
        SELECT PerUser.Id
        FROM dbo.aspnet_PersonalizationPerUser PerUser, dbo.aspnet_Users Users, dbo.aspnet_Paths Paths
        WHERE Paths.ApplicationId = @ApplicationId
              AND PerUser.UserId = Users.UserId
              AND PerUser.PathId = Paths.PathId
              AND (@Path IS NULL OR Paths.LoweredPath LIKE LOWER(@Path))
              AND (@UserName IS NULL OR Users.LoweredUserName LIKE LOWER(@UserName))
              AND (@InactiveSinceDate IS NULL OR Users.LastActivityDate <= @InactiveSinceDate)
        ORDER BY Paths.Path ASC, Users.UserName ASC

        SELECT @TotalRecords = @@ROWCOUNT

        SELECT Paths.Path, PerUser.LastUpdatedDate, DATALENGTH(PerUser.PageSettings), Users.UserName, Users.LastActivityDate
        FROM dbo.aspnet_PersonalizationPerUser PerUser, dbo.aspnet_Users Users, dbo.aspnet_Paths Paths, #PageIndex PageIndex
        WHERE PerUser.Id = PageIndex.ItemId
              AND PerUser.UserId = Users.UserId
              AND PerUser.PathId = Paths.PathId
              AND PageIndex.IndexId >= @PageLowerBound AND PageIndex.IndexId <= @PageUpperBound
        ORDER BY Paths.Path ASC, Users.UserName ASC
    END

    RETURN @TotalRecords
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAdministration_DeleteAllState]    Script Date: 02/04/2014 12:06:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAdministration_DeleteAllState] (
    @AllUsersScope bit,
    @ApplicationName NVARCHAR(256),
    @Count int OUT)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
        SELECT @Count = 0
    ELSE
    BEGIN
        IF (@AllUsersScope = 1)
            DELETE FROM aspnet_PersonalizationAllUsers
            WHERE PathId IN
               (SELECT Paths.PathId
                FROM dbo.aspnet_Paths Paths
                WHERE Paths.ApplicationId = @ApplicationId)
        ELSE
            DELETE FROM aspnet_PersonalizationPerUser
            WHERE PathId IN
               (SELECT Paths.PathId
                FROM dbo.aspnet_Paths Paths
                WHERE Paths.ApplicationId = @ApplicationId)

        SELECT @Count = @@ROWCOUNT
    END
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationPerUser_SetPageSettings]    Script Date: 02/04/2014 12:06:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationPerUser_SetPageSettings] (
    @ApplicationName  NVARCHAR(256),
    @UserName         NVARCHAR(256),
    @Path             NVARCHAR(256),
    @PageSettings     IMAGE,
    @CurrentTimeUtc   DATETIME)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    DECLARE @PathId UNIQUEIDENTIFIER
    DECLARE @UserId UNIQUEIDENTIFIER

    SELECT @ApplicationId = NULL
    SELECT @PathId = NULL
    SELECT @UserId = NULL

    EXEC dbo.aspnet_Applications_CreateApplication @ApplicationName, @ApplicationId OUTPUT

    SELECT @PathId = u.PathId FROM dbo.aspnet_Paths u WHERE u.ApplicationId = @ApplicationId AND u.LoweredPath = LOWER(@Path)
    IF (@PathId IS NULL)
    BEGIN
        EXEC dbo.aspnet_Paths_CreatePath @ApplicationId, @Path, @PathId OUTPUT
    END

    SELECT @UserId = u.UserId FROM dbo.aspnet_Users u WHERE u.ApplicationId = @ApplicationId AND u.LoweredUserName = LOWER(@UserName)
    IF (@UserId IS NULL)
    BEGIN
        EXEC dbo.aspnet_Users_CreateUser @ApplicationId, @UserName, 0, @CurrentTimeUtc, @UserId OUTPUT
    END

    UPDATE   dbo.aspnet_Users WITH (ROWLOCK)
    SET      LastActivityDate = @CurrentTimeUtc
    WHERE    UserId = @UserId
    IF (@@ROWCOUNT = 0) -- Username not found
        RETURN

    IF (EXISTS(SELECT PathId FROM dbo.aspnet_PersonalizationPerUser WHERE UserId = @UserId AND PathId = @PathId))
        UPDATE dbo.aspnet_PersonalizationPerUser SET PageSettings = @PageSettings, LastUpdatedDate = @CurrentTimeUtc WHERE UserId = @UserId AND PathId = @PathId
    ELSE
        INSERT INTO dbo.aspnet_PersonalizationPerUser(UserId, PathId, PageSettings, LastUpdatedDate) VALUES (@UserId, @PathId, @PageSettings, @CurrentTimeUtc)
    RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationPerUser_ResetPageSettings]    Script Date: 02/04/2014 12:06:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationPerUser_ResetPageSettings] (
    @ApplicationName  NVARCHAR(256),
    @UserName         NVARCHAR(256),
    @Path             NVARCHAR(256),
    @CurrentTimeUtc   DATETIME)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    DECLARE @PathId UNIQUEIDENTIFIER
    DECLARE @UserId UNIQUEIDENTIFIER

    SELECT @ApplicationId = NULL
    SELECT @PathId = NULL
    SELECT @UserId = NULL

    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
    BEGIN
        RETURN
    END

    SELECT @PathId = u.PathId FROM dbo.aspnet_Paths u WHERE u.ApplicationId = @ApplicationId AND u.LoweredPath = LOWER(@Path)
    IF (@PathId IS NULL)
    BEGIN
        RETURN
    END

    SELECT @UserId = u.UserId FROM dbo.aspnet_Users u WHERE u.ApplicationId = @ApplicationId AND u.LoweredUserName = LOWER(@UserName)
    IF (@UserId IS NULL)
    BEGIN
        RETURN
    END

    UPDATE   dbo.aspnet_Users WITH (ROWLOCK)
    SET      LastActivityDate = @CurrentTimeUtc
    WHERE    UserId = @UserId
    IF (@@ROWCOUNT = 0) -- Username not found
        RETURN

    DELETE FROM dbo.aspnet_PersonalizationPerUser WHERE PathId = @PathId AND UserId = @UserId
    RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationPerUser_GetPageSettings]    Script Date: 02/04/2014 12:06:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationPerUser_GetPageSettings] (
    @ApplicationName  NVARCHAR(256),
    @UserName         NVARCHAR(256),
    @Path             NVARCHAR(256),
    @CurrentTimeUtc   DATETIME)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    DECLARE @PathId UNIQUEIDENTIFIER
    DECLARE @UserId UNIQUEIDENTIFIER

    SELECT @ApplicationId = NULL
    SELECT @PathId = NULL
    SELECT @UserId = NULL

    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
    BEGIN
        RETURN
    END

    SELECT @PathId = u.PathId FROM dbo.aspnet_Paths u WHERE u.ApplicationId = @ApplicationId AND u.LoweredPath = LOWER(@Path)
    IF (@PathId IS NULL)
    BEGIN
        RETURN
    END

    SELECT @UserId = u.UserId FROM dbo.aspnet_Users u WHERE u.ApplicationId = @ApplicationId AND u.LoweredUserName = LOWER(@UserName)
    IF (@UserId IS NULL)
    BEGIN
        RETURN
    END

    UPDATE   dbo.aspnet_Users WITH (ROWLOCK)
    SET      LastActivityDate = @CurrentTimeUtc
    WHERE    UserId = @UserId
    IF (@@ROWCOUNT = 0) -- Username not found
        RETURN

    SELECT p.PageSettings FROM dbo.aspnet_PersonalizationPerUser p WHERE p.PathId = @PathId AND p.UserId = @UserId
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAllUsers_SetPageSettings]    Script Date: 02/04/2014 12:06:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAllUsers_SetPageSettings] (
    @ApplicationName  NVARCHAR(256),
    @Path             NVARCHAR(256),
    @PageSettings     IMAGE,
    @CurrentTimeUtc   DATETIME)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    DECLARE @PathId UNIQUEIDENTIFIER

    SELECT @ApplicationId = NULL
    SELECT @PathId = NULL

    EXEC dbo.aspnet_Applications_CreateApplication @ApplicationName, @ApplicationId OUTPUT

    SELECT @PathId = u.PathId FROM dbo.aspnet_Paths u WHERE u.ApplicationId = @ApplicationId AND u.LoweredPath = LOWER(@Path)
    IF (@PathId IS NULL)
    BEGIN
        EXEC dbo.aspnet_Paths_CreatePath @ApplicationId, @Path, @PathId OUTPUT
    END

    IF (EXISTS(SELECT PathId FROM dbo.aspnet_PersonalizationAllUsers WHERE PathId = @PathId))
        UPDATE dbo.aspnet_PersonalizationAllUsers SET PageSettings = @PageSettings, LastUpdatedDate = @CurrentTimeUtc WHERE PathId = @PathId
    ELSE
        INSERT INTO dbo.aspnet_PersonalizationAllUsers(PathId, PageSettings, LastUpdatedDate) VALUES (@PathId, @PageSettings, @CurrentTimeUtc)
    RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAllUsers_ResetPageSettings]    Script Date: 02/04/2014 12:06:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAllUsers_ResetPageSettings] (
    @ApplicationName  NVARCHAR(256),
    @Path              NVARCHAR(256))
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    DECLARE @PathId UNIQUEIDENTIFIER

    SELECT @ApplicationId = NULL
    SELECT @PathId = NULL

    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
    BEGIN
        RETURN
    END

    SELECT @PathId = u.PathId FROM dbo.aspnet_Paths u WHERE u.ApplicationId = @ApplicationId AND u.LoweredPath = LOWER(@Path)
    IF (@PathId IS NULL)
    BEGIN
        RETURN
    END

    DELETE FROM dbo.aspnet_PersonalizationAllUsers WHERE PathId = @PathId
    RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAllUsers_GetPageSettings]    Script Date: 02/04/2014 12:06:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAllUsers_GetPageSettings] (
    @ApplicationName  NVARCHAR(256),
    @Path              NVARCHAR(256))
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    DECLARE @PathId UNIQUEIDENTIFIER

    SELECT @ApplicationId = NULL
    SELECT @PathId = NULL

    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
    BEGIN
        RETURN
    END

    SELECT @PathId = u.PathId FROM dbo.aspnet_Paths u WHERE u.ApplicationId = @ApplicationId AND u.LoweredPath = LOWER(@Path)
    IF (@PathId IS NULL)
    BEGIN
        RETURN
    END

    SELECT p.PageSettings FROM dbo.aspnet_PersonalizationAllUsers p WHERE p.PathId = @PathId
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_SetProperties]    Script Date: 02/04/2014 12:06:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Profile_SetProperties]
    @ApplicationName        nvarchar(256),
    @PropertyNames          ntext,
    @PropertyValuesString   ntext,
    @PropertyValuesBinary   image,
    @UserName               nvarchar(256),
    @IsUserAnonymous        bit,
    @CurrentTimeUtc         datetime
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
       BEGIN TRANSACTION
       SET @TranStarted = 1
    END
    ELSE
    	SET @TranStarted = 0

    EXEC dbo.aspnet_Applications_CreateApplication @ApplicationName, @ApplicationId OUTPUT

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    DECLARE @UserId uniqueidentifier
    DECLARE @LastActivityDate datetime
    SELECT  @UserId = NULL
    SELECT  @LastActivityDate = @CurrentTimeUtc

    SELECT @UserId = UserId
    FROM   dbo.aspnet_Users
    WHERE  ApplicationId = @ApplicationId AND LoweredUserName = LOWER(@UserName)
    IF (@UserId IS NULL)
        EXEC dbo.aspnet_Users_CreateUser @ApplicationId, @UserName, @IsUserAnonymous, @LastActivityDate, @UserId OUTPUT

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    UPDATE dbo.aspnet_Users
    SET    LastActivityDate=@CurrentTimeUtc
    WHERE  UserId = @UserId

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF (EXISTS( SELECT *
               FROM   dbo.aspnet_Profile
               WHERE  UserId = @UserId))
        UPDATE dbo.aspnet_Profile
        SET    PropertyNames=@PropertyNames, PropertyValuesString = @PropertyValuesString,
               PropertyValuesBinary = @PropertyValuesBinary, LastUpdatedDate=@CurrentTimeUtc
        WHERE  UserId = @UserId
    ELSE
        INSERT INTO dbo.aspnet_Profile(UserId, PropertyNames, PropertyValuesString, PropertyValuesBinary, LastUpdatedDate)
             VALUES (@UserId, @PropertyNames, @PropertyValuesString, @PropertyValuesBinary, @CurrentTimeUtc)

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @TranStarted = 1 )
    BEGIN
    	SET @TranStarted = 0
    	COMMIT TRANSACTION
    END

    RETURN 0

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_GetProperties]    Script Date: 02/04/2014 12:06:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Profile_GetProperties]
    @ApplicationName      nvarchar(256),
    @UserName             nvarchar(256),
    @CurrentTimeUtc       datetime
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN

    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL

    SELECT @UserId = UserId
    FROM   dbo.aspnet_Users
    WHERE  ApplicationId = @ApplicationId AND LoweredUserName = LOWER(@UserName)

    IF (@UserId IS NULL)
        RETURN
    SELECT TOP 1 PropertyNames, PropertyValuesString, PropertyValuesBinary
    FROM         dbo.aspnet_Profile
    WHERE        UserId = @UserId

    IF (@@ROWCOUNT > 0)
    BEGIN
        UPDATE dbo.aspnet_Users
        SET    LastActivityDate=@CurrentTimeUtc
        WHERE  UserId = @UserId
    END
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_GetProfiles]    Script Date: 02/04/2014 12:06:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Profile_GetProfiles]
    @ApplicationName        nvarchar(256),
    @ProfileAuthOptions     int,
    @PageIndex              int,
    @PageSize               int,
    @UserNameToMatch        nvarchar(256) = NULL,
    @InactiveSinceDate      datetime      = NULL
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN

    -- Set the page bounds
    DECLARE @PageLowerBound int
    DECLARE @PageUpperBound int
    DECLARE @TotalRecords   int
    SET @PageLowerBound = @PageSize * @PageIndex
    SET @PageUpperBound = @PageSize - 1 + @PageLowerBound

    -- Create a temp table TO store the select results
    CREATE TABLE #PageIndexForUsers
    (
        IndexId int IDENTITY (0, 1) NOT NULL,
        UserId uniqueidentifier
    )

    -- Insert into our temp table
    INSERT INTO #PageIndexForUsers (UserId)
        SELECT  u.UserId
        FROM    dbo.aspnet_Users u, dbo.aspnet_Profile p
        WHERE   ApplicationId = @ApplicationId
            AND u.UserId = p.UserId
            AND (@InactiveSinceDate IS NULL OR LastActivityDate <= @InactiveSinceDate)
            AND (     (@ProfileAuthOptions = 2)
                   OR (@ProfileAuthOptions = 0 AND IsAnonymous = 1)
                   OR (@ProfileAuthOptions = 1 AND IsAnonymous = 0)
                 )
            AND (@UserNameToMatch IS NULL OR LoweredUserName LIKE LOWER(@UserNameToMatch))
        ORDER BY UserName

    SELECT  u.UserName, u.IsAnonymous, u.LastActivityDate, p.LastUpdatedDate,
            DATALENGTH(p.PropertyNames) + DATALENGTH(p.PropertyValuesString) + DATALENGTH(p.PropertyValuesBinary)
    FROM    dbo.aspnet_Users u, dbo.aspnet_Profile p, #PageIndexForUsers i
    WHERE   u.UserId = p.UserId AND p.UserId = i.UserId AND i.IndexId >= @PageLowerBound AND i.IndexId <= @PageUpperBound

    SELECT COUNT(*)
    FROM   #PageIndexForUsers

    DROP TABLE #PageIndexForUsers
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_GetNumberOfInactiveProfiles]    Script Date: 02/04/2014 12:06:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Profile_GetNumberOfInactiveProfiles]
    @ApplicationName        nvarchar(256),
    @ProfileAuthOptions     int,
    @InactiveSinceDate      datetime
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
    BEGIN
        SELECT 0
        RETURN
    END

    SELECT  COUNT(*)
    FROM    dbo.aspnet_Users u, dbo.aspnet_Profile p
    WHERE   ApplicationId = @ApplicationId
        AND u.UserId = p.UserId
        AND (LastActivityDate <= @InactiveSinceDate)
        AND (
                (@ProfileAuthOptions = 2)
                OR (@ProfileAuthOptions = 0 AND IsAnonymous = 1)
                OR (@ProfileAuthOptions = 1 AND IsAnonymous = 0)
            )
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_DeleteProfiles]    Script Date: 02/04/2014 12:06:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Profile_DeleteProfiles]
    @ApplicationName        nvarchar(256),
    @UserNames              nvarchar(4000)
AS
BEGIN
    DECLARE @UserName     nvarchar(256)
    DECLARE @CurrentPos   int
    DECLARE @NextPos      int
    DECLARE @NumDeleted   int
    DECLARE @DeletedUser  int
    DECLARE @TranStarted  bit
    DECLARE @ErrorCode    int

    SET @ErrorCode = 0
    SET @CurrentPos = 1
    SET @NumDeleted = 0
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
        BEGIN TRANSACTION
        SET @TranStarted = 1
    END
    ELSE
    	SET @TranStarted = 0

    WHILE (@CurrentPos <= LEN(@UserNames))
    BEGIN
        SELECT @NextPos = CHARINDEX(N',', @UserNames,  @CurrentPos)
        IF (@NextPos = 0 OR @NextPos IS NULL)
            SELECT @NextPos = LEN(@UserNames) + 1

        SELECT @UserName = SUBSTRING(@UserNames, @CurrentPos, @NextPos - @CurrentPos)
        SELECT @CurrentPos = @NextPos+1

        IF (LEN(@UserName) > 0)
        BEGIN
            SELECT @DeletedUser = 0
            EXEC dbo.aspnet_Users_DeleteUser @ApplicationName, @UserName, 4, @DeletedUser OUTPUT
            IF( @@ERROR <> 0 )
            BEGIN
                SET @ErrorCode = -1
                GOTO Cleanup
            END
            IF (@DeletedUser <> 0)
                SELECT @NumDeleted = @NumDeleted + 1
        END
    END
    SELECT @NumDeleted
    IF (@TranStarted = 1)
    BEGIN
    	SET @TranStarted = 0
    	COMMIT TRANSACTION
    END
    SET @TranStarted = 0

    RETURN 0

Cleanup:
    IF (@TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END
    RETURN @ErrorCode
END
GO
/****** Object:  Table [dbo].[EmployeeProjects]    Script Date: 02/04/2014 12:06:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeProjects](
	[EmpProjectsID] [uniqueidentifier] NOT NULL,
	[EmployeeID] [uniqueidentifier] NULL,
	[ProjectID] [uniqueidentifier] NULL,
	[JobID] [uniqueidentifier] NULL,
	[FromDate] [datetime] NULL,
	[ToDate] [datetime] NULL,
	[IsActive] [bit] NULL,
	[Working] [bit] NULL,
 CONSTRAINT [PK_EmployeeProjects] PRIMARY KEY CLUSTERED 
(
	[EmpProjectsID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[EmployeeProjects] ([EmpProjectsID], [EmployeeID], [ProjectID], [JobID], [FromDate], [ToDate], [IsActive], [Working]) VALUES (N'e908159a-3e3c-4508-94ae-08553cfc892c', N'd44eea62-6415-4c75-af42-8888760e8bf4', N'7c5595da-c05a-416c-b2b3-713c9b9853f5', N'8c9c3203-2834-4c86-8b7f-4261754f191e', CAST(0x0000A2A600000000 AS DateTime), CAST(0x0000A35B00000000 AS DateTime), 1, 1)
INSERT [dbo].[EmployeeProjects] ([EmpProjectsID], [EmployeeID], [ProjectID], [JobID], [FromDate], [ToDate], [IsActive], [Working]) VALUES (N'05a77422-243b-438c-a94c-09ce2d7f400a', N'770acc2b-d5d4-4c57-ab57-7a3451f8a86c', N'7c5595da-c05a-416c-b2b3-713c9b9853f5', N'8c9c3203-2834-4c86-8b7f-4261754f191e', CAST(0x0000A2C500000000 AS DateTime), CAST(0x0000A2E000000000 AS DateTime), 1, 1)
INSERT [dbo].[EmployeeProjects] ([EmpProjectsID], [EmployeeID], [ProjectID], [JobID], [FromDate], [ToDate], [IsActive], [Working]) VALUES (N'8fa8d5bd-3b7b-41ee-8ff0-0cb56af028cd', N'20250795-00e5-4355-b986-e2f3f6f9e07f', N'49010d13-4567-4c15-b9d9-586e1ec55049', N'8c9c3203-2834-4c86-8b7f-4261754f191e', CAST(0x0000A2AD00000000 AS DateTime), CAST(0x0000A2C200000000 AS DateTime), 1, 1)
INSERT [dbo].[EmployeeProjects] ([EmpProjectsID], [EmployeeID], [ProjectID], [JobID], [FromDate], [ToDate], [IsActive], [Working]) VALUES (N'b6208e3d-5e08-48c9-be30-13a3d64b02eb', N'20250795-00e5-4355-b986-e2f3f6f9e07e', N'2946664a-12a0-4827-a41b-272b500a770a', N'6dd13b3f-3511-421c-a4f3-4fe0e2024f4f', CAST(0x0000A28700000000 AS DateTime), CAST(0x0000A2A600000000 AS DateTime), 1, 1)
INSERT [dbo].[EmployeeProjects] ([EmpProjectsID], [EmployeeID], [ProjectID], [JobID], [FromDate], [ToDate], [IsActive], [Working]) VALUES (N'94043887-9dea-44ec-9f46-1b9035660383', N'720d8341-ae54-4d06-b92e-652c25c7cf1e', N'2946664a-12a0-4827-a41b-272b500a770a', N'6dd13b3f-3511-421c-a4f3-4fe0e2024f4f', CAST(0x0000A2C500000000 AS DateTime), CAST(0x0000A30000000000 AS DateTime), 1, 1)
INSERT [dbo].[EmployeeProjects] ([EmpProjectsID], [EmployeeID], [ProjectID], [JobID], [FromDate], [ToDate], [IsActive], [Working]) VALUES (N'f5a7296c-45d0-44b9-82d3-38881adbc999', N'770acc2b-d5d4-4c57-ab57-7a3451f8a86c', N'2946664a-12a0-4827-a41b-272b500a770a', N'8c9c3203-2834-4c86-8b7f-4261754f191e', CAST(0x0000A29200000000 AS DateTime), CAST(0x0000A2A500000000 AS DateTime), 1, 1)
INSERT [dbo].[EmployeeProjects] ([EmpProjectsID], [EmployeeID], [ProjectID], [JobID], [FromDate], [ToDate], [IsActive], [Working]) VALUES (N'6ef12a10-cdcb-4230-9fb3-4cac7b158d2e', N'720d8341-ae54-4d06-b92e-652c25c7cf1e', N'49010d13-4567-4c15-b9d9-586e1ec55049', N'6dd13b3f-3511-421c-a4f3-4fe0e2024f4f', CAST(0x0000A2C500000000 AS DateTime), CAST(0x0000A2E800000000 AS DateTime), 1, 1)
INSERT [dbo].[EmployeeProjects] ([EmpProjectsID], [EmployeeID], [ProjectID], [JobID], [FromDate], [ToDate], [IsActive], [Working]) VALUES (N'06289078-00eb-41d4-87a1-6b1d3a0a2c22', N'f0250795-00e5-4355-b986-e2f3f6f9e07a', N'49010d13-4567-4c15-b9d9-586e1ec55049', N'8c9c3203-2834-4c86-8b7f-4261754f191e', CAST(0x0000A2AC00000000 AS DateTime), CAST(0x0000A2C100000000 AS DateTime), 1, 1)
INSERT [dbo].[EmployeeProjects] ([EmpProjectsID], [EmployeeID], [ProjectID], [JobID], [FromDate], [ToDate], [IsActive], [Working]) VALUES (N'43ae2241-e9f1-4bca-8c7c-6ddc8fdd2217', N'6fdc4b80-8ae6-4b97-a068-a66a6c230623', N'49010d13-4567-4c15-b9d9-586e1ec55049', N'6dd13b3f-3511-421c-a4f3-4fe0e2024f4f', CAST(0x0000A1D600000000 AS DateTime), CAST(0x0000A2A500000000 AS DateTime), 1, 1)
INSERT [dbo].[EmployeeProjects] ([EmpProjectsID], [EmployeeID], [ProjectID], [JobID], [FromDate], [ToDate], [IsActive], [Working]) VALUES (N'a7312650-8a87-44ed-b5ea-729f3fd0dd3c', N'5af736f6-c404-47b2-92cb-81c890441f7f', N'2946664a-12a0-4827-a41b-272b500a770a', N'6dd13b3f-3511-421c-a4f3-4fe0e2024f4f', CAST(0x0000A2A600000000 AS DateTime), CAST(0x0000A2C300000000 AS DateTime), 1, 1)
INSERT [dbo].[EmployeeProjects] ([EmpProjectsID], [EmployeeID], [ProjectID], [JobID], [FromDate], [ToDate], [IsActive], [Working]) VALUES (N'3857ade2-87f8-4bfe-a19b-7448e97d544f', N'd448c4b5-8f24-42fa-8308-9c2e4fdb3de4', N'20cd934f-ba3f-4595-b2f1-ab1e3eb04b7b', N'8c9c3203-2834-4c86-8b7f-4261754f191e', CAST(0x0000A25200000000 AS DateTime), CAST(0x0000A25C00000000 AS DateTime), 1, 1)
INSERT [dbo].[EmployeeProjects] ([EmpProjectsID], [EmployeeID], [ProjectID], [JobID], [FromDate], [ToDate], [IsActive], [Working]) VALUES (N'fb6aacca-d9b0-4575-ba8e-75c2148b474c', N'd448c4b5-8f24-42fa-8308-9c2e4fdb3de4', N'8a45396c-c249-486d-a7cd-acf67299d00b', N'8c9c3203-2834-4c86-8b7f-4261754f191e', CAST(0x0000A26700000000 AS DateTime), CAST(0x0000A26800000000 AS DateTime), 1, 1)
INSERT [dbo].[EmployeeProjects] ([EmpProjectsID], [EmployeeID], [ProjectID], [JobID], [FromDate], [ToDate], [IsActive], [Working]) VALUES (N'f790a923-0776-4cdc-a41d-7f5e1b340d03', N'770acc2b-d5d4-4c57-ab57-7a3451f8a86c', N'b5ad254d-bab8-4af9-b24d-7e982c01287c', N'8c9c3203-2834-4c86-8b7f-4261754f191e', CAST(0x0000A29D00000000 AS DateTime), CAST(0x0000A2C400000000 AS DateTime), 1, 1)
INSERT [dbo].[EmployeeProjects] ([EmpProjectsID], [EmployeeID], [ProjectID], [JobID], [FromDate], [ToDate], [IsActive], [Working]) VALUES (N'09cf2a4e-1bce-48ae-8045-826636f9b01a', N'20250795-00e5-4355-b986-e2f3f6f9e07e', N'49010d13-4567-4c15-b9d9-586e1ec55049', N'6dd13b3f-3511-421c-a4f3-4fe0e2024f4f', CAST(0x0000A28700000000 AS DateTime), CAST(0x0000A2A600000000 AS DateTime), 1, 1)
INSERT [dbo].[EmployeeProjects] ([EmpProjectsID], [EmployeeID], [ProjectID], [JobID], [FromDate], [ToDate], [IsActive], [Working]) VALUES (N'a60a9f6b-6ac5-44d1-969f-9325fc84e3b2', N'6fdc4b80-8ae6-4b97-a068-a66a6c230623', N'2946664a-12a0-4827-a41b-272b500a770a', N'6dd13b3f-3511-421c-a4f3-4fe0e2024f4f', CAST(0x0000A1D600000000 AS DateTime), CAST(0x0000A2A500000000 AS DateTime), 1, 1)
INSERT [dbo].[EmployeeProjects] ([EmpProjectsID], [EmployeeID], [ProjectID], [JobID], [FromDate], [ToDate], [IsActive], [Working]) VALUES (N'220f6c57-a3da-4fc8-8ca4-c712d88a1447', N'5af736f6-c404-47b2-92cb-81c890441f7f', N'49010d13-4567-4c15-b9d9-586e1ec55049', N'8c9c3203-2834-4c86-8b7f-4261754f191e', CAST(0x0000A2A900000000 AS DateTime), CAST(0x0000A2C400000000 AS DateTime), 1, 0)
INSERT [dbo].[EmployeeProjects] ([EmpProjectsID], [EmployeeID], [ProjectID], [JobID], [FromDate], [ToDate], [IsActive], [Working]) VALUES (N'bc6cfcaf-6324-4a57-ab5b-c9fb248ab6e7', N'f3603335-129c-4f6c-9cdd-3268a29a505a', N'7c5595da-c05a-416c-b2b3-713c9b9853f5', N'8c9c3203-2834-4c86-8b7f-4261754f191e', CAST(0x0000A28A00000000 AS DateTime), CAST(0x0000A29700000000 AS DateTime), 1, 1)
INSERT [dbo].[EmployeeProjects] ([EmpProjectsID], [EmployeeID], [ProjectID], [JobID], [FromDate], [ToDate], [IsActive], [Working]) VALUES (N'740cac9c-b71b-48d1-a706-d2b44813a3ef', N'd448c4b5-8f24-42fa-8308-9c2e4fdb3de4', N'c6166f35-9877-4686-8932-aad265ee668a', N'8c9c3203-2834-4c86-8b7f-4261754f191e', CAST(0x0000A24C00000000 AS DateTime), CAST(0x0000A26700000000 AS DateTime), 1, 1)
INSERT [dbo].[EmployeeProjects] ([EmpProjectsID], [EmployeeID], [ProjectID], [JobID], [FromDate], [ToDate], [IsActive], [Working]) VALUES (N'e3e87a12-5ebe-461f-a35e-e44ac22eb3ef', N'770acc2b-d5d4-4c57-ab57-7a3451f8a86c', N'49010d13-4567-4c15-b9d9-586e1ec55049', N'8c9c3203-2834-4c86-8b7f-4261754f191e', CAST(0x0000A28700000000 AS DateTime), CAST(0x0000A2A500000000 AS DateTime), 1, 1)
INSERT [dbo].[EmployeeProjects] ([EmpProjectsID], [EmployeeID], [ProjectID], [JobID], [FromDate], [ToDate], [IsActive], [Working]) VALUES (N'34b3a958-e1a3-45d4-96e0-ef01d71f1e66', N'd44eea62-6415-4c75-af42-8888760e8bf4', N'49010d13-4567-4c15-b9d9-586e1ec55049', N'8c9c3203-2834-4c86-8b7f-4261754f191e', CAST(0x0000A29200000000 AS DateTime), CAST(0x0000A56A00000000 AS DateTime), 1, 1)
INSERT [dbo].[EmployeeProjects] ([EmpProjectsID], [EmployeeID], [ProjectID], [JobID], [FromDate], [ToDate], [IsActive], [Working]) VALUES (N'11efa023-ea2d-45f9-a801-f0a9be583156', N'e23b88c4-fa7a-481e-b0e7-f372cb7b52d2', N'49010d13-4567-4c15-b9d9-586e1ec55049', N'6dd13b3f-3511-421c-a4f3-4fe0e2024f4f', CAST(0x0000A2AC00000000 AS DateTime), CAST(0x0000A2B900000000 AS DateTime), 1, 1)
INSERT [dbo].[EmployeeProjects] ([EmpProjectsID], [EmployeeID], [ProjectID], [JobID], [FromDate], [ToDate], [IsActive], [Working]) VALUES (N'ee209fda-ef30-47eb-b3b1-fa176de3eaac', N'b0218d84-1700-4efa-a743-2e86f4e7feac', N'2946664a-12a0-4827-a41b-272b500a770a', N'8c9c3203-2834-4c86-8b7f-4261754f191e', CAST(0x0000A2A600000000 AS DateTime), CAST(0x0000A41300000000 AS DateTime), 1, 1)
INSERT [dbo].[EmployeeProjects] ([EmpProjectsID], [EmployeeID], [ProjectID], [JobID], [FromDate], [ToDate], [IsActive], [Working]) VALUES (N'bbb9d72e-85ca-4d8f-9aed-ff309652c364', N'720d8341-ae54-4d06-b92e-652c25c7cf1e', N'b5ad254d-bab8-4af9-b24d-7e982c01287c', N'6dd13b3f-3511-421c-a4f3-4fe0e2024f4f', CAST(0x0000A2C500000000 AS DateTime), CAST(0x0000A30100000000 AS DateTime), 1, 1)
/****** Object:  Table [dbo].[Weekend]    Script Date: 02/04/2014 12:06:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Weekend](
	[WeekendID] [uniqueidentifier] NOT NULL,
	[EmployeeID] [uniqueidentifier] NOT NULL,
	[WeekEndName] [nvarchar](500) NULL,
 CONSTRAINT [PK_Weekend] PRIMARY KEY CLUSTERED 
(
	[WeekendID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Weekend] ([WeekendID], [EmployeeID], [WeekEndName]) VALUES (N'e3e9c057-4cd5-4037-b7da-0d6f1fd4206e', N'62995f97-51be-4353-bd83-0745e5f24f07', N'Saturday')
INSERT [dbo].[Weekend] ([WeekendID], [EmployeeID], [WeekEndName]) VALUES (N'938fff07-9445-4e54-9bed-1a724c876e42', N'd44eea62-6415-4c75-af42-8888760e8bf4', N'Thursday')
INSERT [dbo].[Weekend] ([WeekendID], [EmployeeID], [WeekEndName]) VALUES (N'a31a5d98-8219-4d71-861c-1b704d2444ec', N'720d8341-ae54-4d06-b92e-652c25c7cf1e', N'Sunday')
INSERT [dbo].[Weekend] ([WeekendID], [EmployeeID], [WeekEndName]) VALUES (N'2e8eff9a-b02d-48b6-93ec-2aaa7def3077', N'770acc2b-d5d4-4c57-ab57-7a3451f8a86c', N'Monday')
INSERT [dbo].[Weekend] ([WeekendID], [EmployeeID], [WeekEndName]) VALUES (N'90a314a3-0e6c-4358-b5cb-34e64aa13695', N'd448c4b5-8f24-42fa-8308-9c2e4fdb3de4', N'Tuesday')
INSERT [dbo].[Weekend] ([WeekendID], [EmployeeID], [WeekEndName]) VALUES (N'5cadf43a-edc8-42c6-a256-3aa2659ff8f0', N'5af736f6-c404-47b2-92cb-81c890441f7f', N'Friday')
INSERT [dbo].[Weekend] ([WeekendID], [EmployeeID], [WeekEndName]) VALUES (N'4636cdce-56f9-4387-9506-3bd5c51b2760', N'6fdc4b80-8ae6-4b97-a068-a66a6c230623', N'Friday')
INSERT [dbo].[Weekend] ([WeekendID], [EmployeeID], [WeekEndName]) VALUES (N'90d45ef7-b3ca-403c-9cb8-3d20c6f623a5', N'd44eea62-6415-4c75-af42-8888760e8bf4', N'Tuesday')
INSERT [dbo].[Weekend] ([WeekendID], [EmployeeID], [WeekEndName]) VALUES (N'f2ba3563-f968-477e-9aab-532454436dab', N'f0250795-00e5-4355-b986-e2f3f6f9e07a', N'Saturday')
INSERT [dbo].[Weekend] ([WeekendID], [EmployeeID], [WeekEndName]) VALUES (N'f981be57-a322-4365-8715-5448f298d699', N'62995f97-51be-4353-bd83-0745e5f24f07', N'Friday')
INSERT [dbo].[Weekend] ([WeekendID], [EmployeeID], [WeekEndName]) VALUES (N'277b0d42-45d0-406b-8c81-55c62a4afa15', N'f0250795-00e5-4355-b986-e2f3f6f9e07a', N'Monday')
INSERT [dbo].[Weekend] ([WeekendID], [EmployeeID], [WeekEndName]) VALUES (N'8aa4dc71-a75d-4a97-99f3-604b881bb6be', N'770acc2b-d5d4-4c57-ab57-7a3451f8a86c', N'Thursday')
INSERT [dbo].[Weekend] ([WeekendID], [EmployeeID], [WeekEndName]) VALUES (N'd564b9f5-fd60-4718-804e-61c3c78ead7c', N'f0250795-00e5-4355-b986-e2f3f6f9e07a', N'Tuesday')
INSERT [dbo].[Weekend] ([WeekendID], [EmployeeID], [WeekEndName]) VALUES (N'499515ea-3577-40fd-a443-6803bbff7a38', N'5af736f6-c404-47b2-92cb-81c890441f7f', N'Wednesday')
INSERT [dbo].[Weekend] ([WeekendID], [EmployeeID], [WeekEndName]) VALUES (N'd8a8ce09-f6a4-4a69-9f7b-759715c89e06', N'5af736f6-c404-47b2-92cb-81c890441f7f', N'Saturday')
INSERT [dbo].[Weekend] ([WeekendID], [EmployeeID], [WeekEndName]) VALUES (N'83a40506-7059-4526-ba3c-76bd5622a50c', N'b0218d84-1700-4efa-a743-2e86f4e7feac', N'Monday')
INSERT [dbo].[Weekend] ([WeekendID], [EmployeeID], [WeekEndName]) VALUES (N'44c240ac-b7b7-4411-9a1f-8e19340c92c5', N'770acc2b-d5d4-4c57-ab57-7a3451f8a86c', N'Tuesday')
INSERT [dbo].[Weekend] ([WeekendID], [EmployeeID], [WeekEndName]) VALUES (N'ee4d0998-9127-472c-9ee4-999c93b5bb1a', N'e23b88c4-fa7a-481e-b0e7-f372cb7b52d2', N'Tuesday')
INSERT [dbo].[Weekend] ([WeekendID], [EmployeeID], [WeekEndName]) VALUES (N'820f1a89-087e-4f30-a87b-9a33b6bc1cba', N'20250795-00e5-4355-b986-e2f3f6f9e07e', N'Friday')
INSERT [dbo].[Weekend] ([WeekendID], [EmployeeID], [WeekEndName]) VALUES (N'04ed4598-642c-4316-9764-a16ce2f4110f', N'd44eea62-6415-4c75-af42-8888760e8bf4', N'Monday')
INSERT [dbo].[Weekend] ([WeekendID], [EmployeeID], [WeekEndName]) VALUES (N'b8fe6f44-f834-44b7-afe4-a646d04d7975', N'770acc2b-d5d4-4c57-ab57-7a3451f8a86c', N'Friday')
INSERT [dbo].[Weekend] ([WeekendID], [EmployeeID], [WeekEndName]) VALUES (N'd2fc6a7a-f5ce-4c4a-897e-aa30edeaff9f', N'6fdc4b80-8ae6-4b97-a068-a66a6c230623', N'Thursday')
INSERT [dbo].[Weekend] ([WeekendID], [EmployeeID], [WeekEndName]) VALUES (N'91f7066c-7c92-458b-898b-b0fe633e5911', N'f0250795-00e5-4355-b986-e2f3f6f9e07a', N'Friday')
INSERT [dbo].[Weekend] ([WeekendID], [EmployeeID], [WeekEndName]) VALUES (N'7a121c07-40fc-45cc-be1a-bb4de75e5ca3', N'e23b88c4-fa7a-481e-b0e7-f372cb7b52d2', N'Friday')
INSERT [dbo].[Weekend] ([WeekendID], [EmployeeID], [WeekEndName]) VALUES (N'6d6c6ff4-1b0c-4f62-9fe6-c2435aac2f97', N'd448c4b5-8f24-42fa-8308-9c2e4fdb3de4', N'Monday')
INSERT [dbo].[Weekend] ([WeekendID], [EmployeeID], [WeekEndName]) VALUES (N'eec8e92b-80ca-47b4-8144-c7d119cb79c7', N'd44eea62-6415-4c75-af42-8888760e8bf4', N'Friday')
INSERT [dbo].[Weekend] ([WeekendID], [EmployeeID], [WeekEndName]) VALUES (N'67670220-5d8f-4fab-9e86-cecbf83493be', N'720d8341-ae54-4d06-b92e-652c25c7cf1e', N'Saturday')
INSERT [dbo].[Weekend] ([WeekendID], [EmployeeID], [WeekEndName]) VALUES (N'14e530e5-b2d3-47d5-acfa-dd7f58f49c67', N'5af736f6-c404-47b2-92cb-81c890441f7f', N'Monday')
INSERT [dbo].[Weekend] ([WeekendID], [EmployeeID], [WeekEndName]) VALUES (N'a374c66f-b8ba-4583-9393-e249fd48ed2e', N'5af736f6-c404-47b2-92cb-81c890441f7f', N'Thursday')
INSERT [dbo].[Weekend] ([WeekendID], [EmployeeID], [WeekEndName]) VALUES (N'2127bd9e-73d3-42e8-8324-f053cb99d4d6', N'f0250795-00e5-4355-b986-e2f3f6f9e07a', N'Thursday')
INSERT [dbo].[Weekend] ([WeekendID], [EmployeeID], [WeekEndName]) VALUES (N'af1a87cc-02b3-4a60-bff2-f137d22a8992', N'20250795-00e5-4355-b986-e2f3f6f9e07e', N'Thursday')
INSERT [dbo].[Weekend] ([WeekendID], [EmployeeID], [WeekEndName]) VALUES (N'2d838022-dc19-4e8a-8aff-f4bd4c5751e7', N'5af736f6-c404-47b2-92cb-81c890441f7f', N'Tuesday')
INSERT [dbo].[Weekend] ([WeekendID], [EmployeeID], [WeekEndName]) VALUES (N'03c5d089-7f5c-4bac-9c93-fba05a2f034b', N'f0250795-00e5-4355-b986-e2f3f6f9e07a', N'Wednesday')
/****** Object:  Table [dbo].[LogTable]    Script Date: 02/04/2014 12:06:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LogTable](
	[LogID] [uniqueidentifier] NOT NULL,
	[ItemID] [uniqueidentifier] NULL,
	[Operation] [nvarchar](50) NULL,
	[EmployeeID] [uniqueidentifier] NULL,
	[RecordDate] [datetime] NULL,
	[Notes] [nvarchar](max) NULL,
 CONSTRAINT [PK_LogTable] PRIMARY KEY CLUSTERED 
(
	[LogID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[LogTable] ([LogID], [ItemID], [Operation], [EmployeeID], [RecordDate], [Notes]) VALUES (N'45f05226-67b3-458c-92f9-00c39bebf834', N'46b9f383-8af9-4be1-a330-3ccec876f36d', N'approve', N'd448c4b5-8f24-42fa-8308-9c2e4fdb3de4', CAST(0x0000A29600C8B117 AS DateTime), N'appp')
INSERT [dbo].[LogTable] ([LogID], [ItemID], [Operation], [EmployeeID], [RecordDate], [Notes]) VALUES (N'5ca3e621-7488-42a1-a784-012b294c38cf', N'212825aa-1bb4-4255-bd78-81229debe566', N'submit', N'6fdc4b80-8ae6-4b97-a068-a66a6c230623', CAST(0x0000A29D01305994 AS DateTime), N'')
INSERT [dbo].[LogTable] ([LogID], [ItemID], [Operation], [EmployeeID], [RecordDate], [Notes]) VALUES (N'a94fad2b-fdf9-4f88-a215-03bc3a26fc92', N'd2aa9f43-73ef-4a46-bdab-22504f7200fd', N'approve', N'd448c4b5-8f24-42fa-8308-9c2e4fdb3de4', CAST(0x0000A29B00DDDB98 AS DateTime), N'')
INSERT [dbo].[LogTable] ([LogID], [ItemID], [Operation], [EmployeeID], [RecordDate], [Notes]) VALUES (N'c7bf421f-8abf-4f55-a409-0858a92989bb', N'2d101463-213a-45e9-99d1-16e626507541', N'submit', N'720d8341-ae54-4d06-b92e-652c25c7cf1e', CAST(0x0000A2C501010BC4 AS DateTime), N'')
INSERT [dbo].[LogTable] ([LogID], [ItemID], [Operation], [EmployeeID], [RecordDate], [Notes]) VALUES (N'4fee2623-93f2-4383-b4ce-0924156765b6', N'2404653e-698b-4e7a-873b-9ce5fd1602e8', N'approve', NULL, CAST(0x0000A25700F49CF2 AS DateTime), N'enjoy...leave aaproved')
INSERT [dbo].[LogTable] ([LogID], [ItemID], [Operation], [EmployeeID], [RecordDate], [Notes]) VALUES (N'e4b390ef-e84c-4c1c-bb41-0a33046c4c7a', N'212825aa-1bb4-4255-bd78-81229debe566', N'submit', N'6fdc4b80-8ae6-4b97-a068-a66a6c230623', CAST(0x0000A29D0135F401 AS DateTime), N'')
INSERT [dbo].[LogTable] ([LogID], [ItemID], [Operation], [EmployeeID], [RecordDate], [Notes]) VALUES (N'6ea0956f-9896-43c0-a646-0b2ed47cd335', N'9d1419ba-926e-41f0-b644-508cc939a076', N'submit', N'd448c4b5-8f24-42fa-8308-9c2e4fdb3de4', CAST(0x0000A252012868EE AS DateTime), N'')
INSERT [dbo].[LogTable] ([LogID], [ItemID], [Operation], [EmployeeID], [RecordDate], [Notes]) VALUES (N'05ec75d5-a847-4d59-8a2c-0d25487d081a', N'f36c5969-f942-423f-bd0b-31ba281c353a', N'approve', N'd448c4b5-8f24-42fa-8308-9c2e4fdb3de4', CAST(0x0000A29A010979EF AS DateTime), N'')
INSERT [dbo].[LogTable] ([LogID], [ItemID], [Operation], [EmployeeID], [RecordDate], [Notes]) VALUES (N'4c587989-185a-4613-9725-0d8727bc716a', N'212825aa-1bb4-4255-bd78-81229debe566', N'approve', N'd448c4b5-8f24-42fa-8308-9c2e4fdb3de4', CAST(0x0000A29D01362C53 AS DateTime), N'')
INSERT [dbo].[LogTable] ([LogID], [ItemID], [Operation], [EmployeeID], [RecordDate], [Notes]) VALUES (N'597e3c8a-ee03-4f16-ae3a-0df34e3a8756', N'2b94c0d3-1e90-4d37-ad1f-4b737cdb8968', N'reject', N'd448c4b5-8f24-42fa-8308-9c2e4fdb3de4', CAST(0x0000A2C5012CD9E8 AS DateTime), N'Not Now')
INSERT [dbo].[LogTable] ([LogID], [ItemID], [Operation], [EmployeeID], [RecordDate], [Notes]) VALUES (N'd31890ca-cff6-4814-8257-0e3b8b061731', N'2e23e454-9ad6-46e7-a469-61e873290f4f', N'submit', N'20250795-00e5-4355-b986-e2f3f6f9e07e', CAST(0x0000A29D0113B6CF AS DateTime), N'')
INSERT [dbo].[LogTable] ([LogID], [ItemID], [Operation], [EmployeeID], [RecordDate], [Notes]) VALUES (N'aa80f165-7923-493c-94b3-1151a35b5e4b', N'8bcfdfc5-add6-4f22-b903-1436fbcba048', N'submit', N'20250795-00e5-4355-b986-e2f3f6f9e07e', CAST(0x0000A2B500C92BAA AS DateTime), N'')
INSERT [dbo].[LogTable] ([LogID], [ItemID], [Operation], [EmployeeID], [RecordDate], [Notes]) VALUES (N'dc65e0e9-0e9e-4834-84ec-132bfffce41a', N'03123830-0075-4f84-a8c0-f16d087c8e2e', N'approve', N'd448c4b5-8f24-42fa-8308-9c2e4fdb3de4', CAST(0x0000A2B500C8CF90 AS DateTime), N'Ok Done')
INSERT [dbo].[LogTable] ([LogID], [ItemID], [Operation], [EmployeeID], [RecordDate], [Notes]) VALUES (N'083d7d5a-6f3c-466f-a848-14da0cab1654', N'076fea5a-de37-4ba7-99cf-5c0a58a16d8d', N'approve', N'd448c4b5-8f24-42fa-8308-9c2e4fdb3de4', CAST(0x0000A25801091C4D AS DateTime), N'approved by ankush')
INSERT [dbo].[LogTable] ([LogID], [ItemID], [Operation], [EmployeeID], [RecordDate], [Notes]) VALUES (N'33375d02-f1ca-4557-b7bf-161361f13218', N'bbc32873-b8eb-4014-bf34-d2d5c40dace3', N'approve', N'd448c4b5-8f24-42fa-8308-9c2e4fdb3de4', CAST(0x0000A29D011000BA AS DateTime), N'')
INSERT [dbo].[LogTable] ([LogID], [ItemID], [Operation], [EmployeeID], [RecordDate], [Notes]) VALUES (N'25df3bbe-e47d-491e-851a-1843a827675e', N'2404653e-698b-4e7a-873b-9ce5fd1602e8', N'submit', N'd448c4b5-8f24-42fa-8308-9c2e4fdb3de4', CAST(0x0000A25300D0E47C AS DateTime), N'')
INSERT [dbo].[LogTable] ([LogID], [ItemID], [Operation], [EmployeeID], [RecordDate], [Notes]) VALUES (N'f7345997-d6ea-4f40-8113-18901f735098', N'f64305c0-568c-42b6-877b-70437c106c02', N'submit', N'20250795-00e5-4355-b986-e2f3f6f9e07e', CAST(0x0000A29A012A26BC AS DateTime), N'')
INSERT [dbo].[LogTable] ([LogID], [ItemID], [Operation], [EmployeeID], [RecordDate], [Notes]) VALUES (N'7091a99f-97f4-4a56-80c2-1b47d3297ad3', N'81a4cce2-7a54-4d05-85fd-d1be31eee680', N'submit', N'd448c4b5-8f24-42fa-8308-9c2e4fdb3de4', CAST(0x0000A25300CFB7E2 AS DateTime), N'')
INSERT [dbo].[LogTable] ([LogID], [ItemID], [Operation], [EmployeeID], [RecordDate], [Notes]) VALUES (N'3eaaa6b0-c194-4475-9c27-1bd6f7701d09', N'dcbeda40-9cc2-4144-a32c-e0a625f174db', N'submit', N'20250795-00e5-4355-b986-e2f3f6f9e07e', CAST(0x0000A29D01128000 AS DateTime), N'')
INSERT [dbo].[LogTable] ([LogID], [ItemID], [Operation], [EmployeeID], [RecordDate], [Notes]) VALUES (N'2ca5a368-3e61-480a-bc2b-1ce512ccb126', N'411de207-c682-4cc8-aa32-d122509600c0', N'submit', N'20250795-00e5-4355-b986-e2f3f6f9e07e', CAST(0x0000A2B600B98A7D AS DateTime), N'')
INSERT [dbo].[LogTable] ([LogID], [ItemID], [Operation], [EmployeeID], [RecordDate], [Notes]) VALUES (N'ef50a746-8b75-4a10-9c8d-1d234d2ec53d', N'd2aa9f43-73ef-4a46-bdab-22504f7200fd', N'approve', N'20250795-00e5-4355-b986-e2f3f6f9e07f', CAST(0x0000A2C400D3E333 AS DateTime), N'')
INSERT [dbo].[LogTable] ([LogID], [ItemID], [Operation], [EmployeeID], [RecordDate], [Notes]) VALUES (N'1d6330cb-aad9-4c29-8c6d-1d32004e1fc6', N'5e6b165b-ed28-48a8-983b-087f198f2a88', N'approve', NULL, CAST(0x0000A257013C428E AS DateTime), N'dsfdsf')
INSERT [dbo].[LogTable] ([LogID], [ItemID], [Operation], [EmployeeID], [RecordDate], [Notes]) VALUES (N'a403d21e-d551-4e43-9370-1ec4c2975cd8', N'2b94c0d3-1e90-4d37-ad1f-4b737cdb8968', N'submit', N'720d8341-ae54-4d06-b92e-652c25c7cf1e', CAST(0x0000A2C50130AE3A AS DateTime), N'')
INSERT [dbo].[LogTable] ([LogID], [ItemID], [Operation], [EmployeeID], [RecordDate], [Notes]) VALUES (N'f18e59d9-2816-40a2-8742-1f0e8e4d3883', N'd0d1e6d3-69d4-4525-a896-0a7fa696ea4b', N'submit', N'720d8341-ae54-4d06-b92e-652c25c7cf1e', CAST(0x0000A2C200CDD100 AS DateTime), N'')
INSERT [dbo].[LogTable] ([LogID], [ItemID], [Operation], [EmployeeID], [RecordDate], [Notes]) VALUES (N'29f2bd04-c261-4dc9-9712-1f19d4241441', N'6fbb0ef4-be0a-4c32-8204-22b1b972db11', N'submit', N'd448c4b5-8f24-42fa-8308-9c2e4fdb3de4', CAST(0x0000A25700F46BFA AS DateTime), N'')
INSERT [dbo].[LogTable] ([LogID], [ItemID], [Operation], [EmployeeID], [RecordDate], [Notes]) VALUES (N'fc6bac81-716a-4b7a-a2ac-200f2635d7aa', N'076fea5a-de37-4ba7-99cf-5c0a58a16d8d', N'approve', NULL, CAST(0x0000A29900F5A8AE AS DateTime), N'')
INSERT [dbo].[LogTable] ([LogID], [ItemID], [Operation], [EmployeeID], [RecordDate], [Notes]) VALUES (N'71c33cfa-3a9d-482f-bc80-23a719a0b84a', N'11bb36b4-2c12-42dd-8c6f-ae67fa32abd0', N'submit', N'20250795-00e5-4355-b986-e2f3f6f9e07e', CAST(0x0000A29A013B0992 AS DateTime), N'')
INSERT [dbo].[LogTable] ([LogID], [ItemID], [Operation], [EmployeeID], [RecordDate], [Notes]) VALUES (N'9c362748-cb8b-43e5-b7c2-262df3b27079', N'6fbb0ef4-be0a-4c32-8204-22b1b972db11', N'approve', NULL, CAST(0x0000A25700F4FECB AS DateTime), N'')
INSERT [dbo].[LogTable] ([LogID], [ItemID], [Operation], [EmployeeID], [RecordDate], [Notes]) VALUES (N'bd073fa6-7cd0-49ca-adda-290e65dc56b2', N'2d101463-213a-45e9-99d1-16e626507541', N'reject', N'd448c4b5-8f24-42fa-8308-9c2e4fdb3de4', CAST(0x0000A2C5012B6CE2 AS DateTime), N'Not Now')
INSERT [dbo].[LogTable] ([LogID], [ItemID], [Operation], [EmployeeID], [RecordDate], [Notes]) VALUES (N'1781f627-2155-42d3-b048-2d0d1648fc1e', N'81530680-dd37-4681-aaa4-679745a7fb89', N'approve', N'd448c4b5-8f24-42fa-8308-9c2e4fdb3de4', CAST(0x0000A29B00BBB263 AS DateTime), N'')
INSERT [dbo].[LogTable] ([LogID], [ItemID], [Operation], [EmployeeID], [RecordDate], [Notes]) VALUES (N'15fc4e19-5514-49b0-8508-30ae4b752f52', N'4ead1a34-7428-4dfc-983e-3c6d371a442c', N'approve', NULL, CAST(0x0000A25000F08638 AS DateTime), N'go..approved')
INSERT [dbo].[LogTable] ([LogID], [ItemID], [Operation], [EmployeeID], [RecordDate], [Notes]) VALUES (N'30dfa6be-b472-4e53-9a91-31d32d811bab', N'298de147-f4f6-492a-90eb-0c14ca5c8c70', N'submit', N'20250795-00e5-4355-b986-e2f3f6f9e07e', CAST(0x0000A29B01263BA6 AS DateTime), N'')
INSERT [dbo].[LogTable] ([LogID], [ItemID], [Operation], [EmployeeID], [RecordDate], [Notes]) VALUES (N'0757d3cf-472e-42ca-a3be-3213994c8dff', N'2b94c0d3-1e90-4d37-ad1f-4b737cdb8968', N'submit', N'720d8341-ae54-4d06-b92e-652c25c7cf1e', CAST(0x0000A2C5013692BA AS DateTime), N'')
INSERT [dbo].[LogTable] ([LogID], [ItemID], [Operation], [EmployeeID], [RecordDate], [Notes]) VALUES (N'e7f6eac4-b47e-4839-8b87-3350c54f9383', N'cab23a69-8b2c-4b53-a42a-2179ddb2825f', N'submit', N'6fdc4b80-8ae6-4b97-a068-a66a6c230623', CAST(0x0000A2B500DEC6FA AS DateTime), N'')
INSERT [dbo].[LogTable] ([LogID], [ItemID], [Operation], [EmployeeID], [RecordDate], [Notes]) VALUES (N'a5695145-9964-40fe-9169-3454a9ac9153', N'af8a1a83-53d5-4d57-b901-47fda29393e6', N'approve', NULL, CAST(0x0000A250012341F9 AS DateTime), N'go enjoy')
INSERT [dbo].[LogTable] ([LogID], [ItemID], [Operation], [EmployeeID], [RecordDate], [Notes]) VALUES (N'5a2a73e8-94df-467b-a2e6-35edba3b5375', N'5a5d8679-f4f4-4e3b-a21f-2b2dd836acfd', N'submit', N'20250795-00e5-4355-b986-e2f3f6f9e07e', CAST(0x0000A29B012A323B AS DateTime), N'')
INSERT [dbo].[LogTable] ([LogID], [ItemID], [Operation], [EmployeeID], [RecordDate], [Notes]) VALUES (N'f2d0a2fc-e8be-4e1a-9c03-36f675e7fbd7', NULL, N'Delete', N'20250795-00e5-4355-b986-e2f3f6f9e07e', CAST(0x0000A2B500CC6E0F AS DateTime), N'Leave Request was deleted')
INSERT [dbo].[LogTable] ([LogID], [ItemID], [Operation], [EmployeeID], [RecordDate], [Notes]) VALUES (N'1ddffc41-b24d-42a7-806d-36f7b4d021d6', N'd90d8629-732d-4d72-8711-ca31d23b4ee2', N'approve', NULL, CAST(0x0000A25700D0A6E5 AS DateTime), N'sadsad')
INSERT [dbo].[LogTable] ([LogID], [ItemID], [Operation], [EmployeeID], [RecordDate], [Notes]) VALUES (N'9ace463b-9d94-48c4-8dcb-3c214d00dd71', N'12fbcc64-1e99-44be-9d8a-916194a3673c', N'submit', N'6fdc4b80-8ae6-4b97-a068-a66a6c230623', CAST(0x0000A29D01218344 AS DateTime), N'')
INSERT [dbo].[LogTable] ([LogID], [ItemID], [Operation], [EmployeeID], [RecordDate], [Notes]) VALUES (N'71fabd2a-9b11-42b9-b102-3f702e5609d6', N'298de147-f4f6-492a-90eb-0c14ca5c8c70', N'submit', N'20250795-00e5-4355-b986-e2f3f6f9e07e', CAST(0x0000A29B00CB005A AS DateTime), N'')
INSERT [dbo].[LogTable] ([LogID], [ItemID], [Operation], [EmployeeID], [RecordDate], [Notes]) VALUES (N'bd3fea55-65b7-42ac-9a6f-41cdbf475396', N'212825aa-1bb4-4255-bd78-81229debe566', N'approve', N'd448c4b5-8f24-42fa-8308-9c2e4fdb3de4', CAST(0x0000A29D012726D9 AS DateTime), N'')
INSERT [dbo].[LogTable] ([LogID], [ItemID], [Operation], [EmployeeID], [RecordDate], [Notes]) VALUES (N'ef8c3df2-5a08-465e-805e-437519c2ff7f', N'32381411-25ca-4c48-a5a6-e5c2568b6618', N'approve', N'd448c4b5-8f24-42fa-8308-9c2e4fdb3de4', CAST(0x0000A29D01121F90 AS DateTime), N'')
INSERT [dbo].[LogTable] ([LogID], [ItemID], [Operation], [EmployeeID], [RecordDate], [Notes]) VALUES (N'dd292ffc-c8aa-4714-9713-4b3ee8f114c8', N'2b94c0d3-1e90-4d37-ad1f-4b737cdb8968', N'submit', N'720d8341-ae54-4d06-b92e-652c25c7cf1e', CAST(0x0000A2C5012FFD34 AS DateTime), N'')
INSERT [dbo].[LogTable] ([LogID], [ItemID], [Operation], [EmployeeID], [RecordDate], [Notes]) VALUES (N'81e97011-9ed2-4f01-9b92-4bc4c2347338', N'a494caad-a2a0-4122-8a81-6b119ec47f1c', N'submit', N'20250795-00e5-4355-b986-e2f3f6f9e07e', CAST(0x0000A29B00B9C6CB AS DateTime), N'')
INSERT [dbo].[LogTable] ([LogID], [ItemID], [Operation], [EmployeeID], [RecordDate], [Notes]) VALUES (N'b92ece99-392b-492e-8faf-4ea03988a82d', N'a494caad-a2a0-4122-8a81-6b119ec47f1c', N'approve', N'd448c4b5-8f24-42fa-8308-9c2e4fdb3de4', CAST(0x0000A29B00BB76C1 AS DateTime), N'')
INSERT [dbo].[LogTable] ([LogID], [ItemID], [Operation], [EmployeeID], [RecordDate], [Notes]) VALUES (N'e6bface6-3464-47cd-b12b-4fae0cae1e9e', N'72a8cc5c-598e-4bfa-8753-9708150050f8', N'submit', N'720d8341-ae54-4d06-b92e-652c25c7cf1e', CAST(0x0000A2BE012B3F8F AS DateTime), N'')
INSERT [dbo].[LogTable] ([LogID], [ItemID], [Operation], [EmployeeID], [RecordDate], [Notes]) VALUES (N'595cbbca-becd-4955-a622-4fc9a7ac02c8', N'c5cb6272-8c77-4682-bf7c-c2ccd3491980', N'submit', N'20250795-00e5-4355-b986-e2f3f6f9e07e', CAST(0x0000A29B01303E09 AS DateTime), N'')
INSERT [dbo].[LogTable] ([LogID], [ItemID], [Operation], [EmployeeID], [RecordDate], [Notes]) VALUES (N'e5c98fde-ea76-4488-a97f-522ef4fe3856', N'3ea772f1-d503-4684-bbe0-a0faedc24455', N'submit', N'20250795-00e5-4355-b986-e2f3f6f9e07e', CAST(0x0000A29A01085AA7 AS DateTime), N'')
INSERT [dbo].[LogTable] ([LogID], [ItemID], [Operation], [EmployeeID], [RecordDate], [Notes]) VALUES (N'e0426788-0c05-4226-aa56-5728f6c3dbea', N'2b94c0d3-1e90-4d37-ad1f-4b737cdb8968', N'reject', N'd448c4b5-8f24-42fa-8308-9c2e4fdb3de4', CAST(0x0000A2C5013055FC AS DateTime), N'Not Now')
INSERT [dbo].[LogTable] ([LogID], [ItemID], [Operation], [EmployeeID], [RecordDate], [Notes]) VALUES (N'74b08ef3-47e1-416d-b62e-599e931f7e00', N'2d101463-213a-45e9-99d1-16e626507541', N'reject', N'd448c4b5-8f24-42fa-8308-9c2e4fdb3de4', CAST(0x0000A2C500FF5588 AS DateTime), N'Not Now')
INSERT [dbo].[LogTable] ([LogID], [ItemID], [Operation], [EmployeeID], [RecordDate], [Notes]) VALUES (N'0445e5f4-0272-4259-a102-5a897fc82719', N'bbae8cce-65d1-4711-8300-76d217235e5f', N'submit', N'20250795-00e5-4355-b986-e2f3f6f9e07e', CAST(0x0000A29B00DE9B42 AS DateTime), N'')
INSERT [dbo].[LogTable] ([LogID], [ItemID], [Operation], [EmployeeID], [RecordDate], [Notes]) VALUES (N'47e72ffc-a849-456c-bbeb-5da0074f2a0f', N'2d101463-213a-45e9-99d1-16e626507541', N'submit', N'720d8341-ae54-4d06-b92e-652c25c7cf1e', CAST(0x0000A2C10131C33B AS DateTime), N'')
INSERT [dbo].[LogTable] ([LogID], [ItemID], [Operation], [EmployeeID], [RecordDate], [Notes]) VALUES (N'9bd33633-4bd3-4dca-a061-5dd0e63df008', N'8bcfdfc5-add6-4f22-b903-1436fbcba048', N'reject', N'd448c4b5-8f24-42fa-8308-9c2e4fdb3de4', CAST(0x0000A2B500C9735C AS DateTime), N'Not Approved')
INSERT [dbo].[LogTable] ([LogID], [ItemID], [Operation], [EmployeeID], [RecordDate], [Notes]) VALUES (N'3b6fcad6-88f3-49d9-87cf-5fff32c77a8c', N'03d50396-e537-4f92-b495-297d4b99bfdb', N'approve', NULL, CAST(0x0000A25700CEA79C AS DateTime), N'okay ...enjoy')
INSERT [dbo].[LogTable] ([LogID], [ItemID], [Operation], [EmployeeID], [RecordDate], [Notes]) VALUES (N'4be2ef7e-85ca-4afb-a9bf-6060066962c3', N'605b1b94-3b66-4d95-8c30-6db6589f8541', N'approve', NULL, CAST(0x0000A25701076FA5 AS DateTime), N'ok')
INSERT [dbo].[LogTable] ([LogID], [ItemID], [Operation], [EmployeeID], [RecordDate], [Notes]) VALUES (N'd882b9e2-1094-4eeb-85e1-634e1b453d54', N'605b1b94-3b66-4d95-8c30-6db6589f8541', N'approve', NULL, CAST(0x0000A25700F882D8 AS DateTime), N'okay...approved')
INSERT [dbo].[LogTable] ([LogID], [ItemID], [Operation], [EmployeeID], [RecordDate], [Notes]) VALUES (N'a5fb799d-d7a0-47f1-aa14-644b238f0bdf', N'bbc32873-b8eb-4014-bf34-d2d5c40dace3', N'submit', N'20250795-00e5-4355-b986-e2f3f6f9e07e', CAST(0x0000A29D010F99CD AS DateTime), N'')
INSERT [dbo].[LogTable] ([LogID], [ItemID], [Operation], [EmployeeID], [RecordDate], [Notes]) VALUES (N'b3e14263-cad4-48b8-aa34-6791392d5142', N'a0c529d5-9435-49eb-84d1-dc2630942b7a', N'approve', N'd448c4b5-8f24-42fa-8308-9c2e4fdb3de4', CAST(0x0000A29B00C433E1 AS DateTime), N'')
INSERT [dbo].[LogTable] ([LogID], [ItemID], [Operation], [EmployeeID], [RecordDate], [Notes]) VALUES (N'e7c0a4b8-6b62-4637-8340-6a31a615d8c7', N'e5652493-9b83-49a3-8c84-6bf402979288', N'reject', N'd448c4b5-8f24-42fa-8308-9c2e4fdb3de4', CAST(0x0000A29D011013C5 AS DateTime), N'')
INSERT [dbo].[LogTable] ([LogID], [ItemID], [Operation], [EmployeeID], [RecordDate], [Notes]) VALUES (N'0eb845f8-3f76-45d8-b73a-6a71ff7d9146', N'1c910438-8ecc-434d-84a8-2fe69bff0a43', N'approve', N'd448c4b5-8f24-42fa-8308-9c2e4fdb3de4', CAST(0x0000A2BE012849A2 AS DateTime), N'')
INSERT [dbo].[LogTable] ([LogID], [ItemID], [Operation], [EmployeeID], [RecordDate], [Notes]) VALUES (N'6b1e3721-d885-4acd-90d6-6c2116c37b32', N'298de147-f4f6-492a-90eb-0c14ca5c8c70', N'submit', N'20250795-00e5-4355-b986-e2f3f6f9e07e', CAST(0x0000A29B00DDAEA3 AS DateTime), N'')
INSERT [dbo].[LogTable] ([LogID], [ItemID], [Operation], [EmployeeID], [RecordDate], [Notes]) VALUES (N'10ed952b-79db-4e3f-ae98-6cd5d805040f', N'dcbeda40-9cc2-4144-a32c-e0a625f174db', N'approve', N'd448c4b5-8f24-42fa-8308-9c2e4fdb3de4', CAST(0x0000A29D0112A35A AS DateTime), N'')
INSERT [dbo].[LogTable] ([LogID], [ItemID], [Operation], [EmployeeID], [RecordDate], [Notes]) VALUES (N'4e5cace8-aaf2-4658-b53a-6d6d365128c5', N'e248f3d4-3928-41aa-b7ce-5cf50f4d9e3c', N'approve', N'd448c4b5-8f24-42fa-8308-9c2e4fdb3de4', CAST(0x0000A29B00DBEA33 AS DateTime), N'')
INSERT [dbo].[LogTable] ([LogID], [ItemID], [Operation], [EmployeeID], [RecordDate], [Notes]) VALUES (N'2ef508cc-7ccc-4ee5-9bc7-6f61f58c8190', N'298de147-f4f6-492a-90eb-0c14ca5c8c70', N'approve', N'd448c4b5-8f24-42fa-8308-9c2e4fdb3de4', CAST(0x0000A29B00DDCC28 AS DateTime), N'')
INSERT [dbo].[LogTable] ([LogID], [ItemID], [Operation], [EmployeeID], [RecordDate], [Notes]) VALUES (N'6238e189-69d0-496e-93c5-70602cf0eeb1', NULL, NULL, N'd448c4b5-8f24-42fa-8308-9c2e4fdb3de4', CAST(0x0000A29700F2AE87 AS DateTime), N'Leave Request was deleted')
INSERT [dbo].[LogTable] ([LogID], [ItemID], [Operation], [EmployeeID], [RecordDate], [Notes]) VALUES (N'9aabf162-0669-4394-8fbc-719d05503e0b', N'e9adf832-0ad0-4022-b0f7-3884882f2ba9', N'approve', N'd448c4b5-8f24-42fa-8308-9c2e4fdb3de4', CAST(0x0000A2C1012F5CF3 AS DateTime), N'')
INSERT [dbo].[LogTable] ([LogID], [ItemID], [Operation], [EmployeeID], [RecordDate], [Notes]) VALUES (N'59ce4e07-64ff-4df8-9b47-72b1fff08c6f', N'2b94c0d3-1e90-4d37-ad1f-4b737cdb8968', N'reject', N'd448c4b5-8f24-42fa-8308-9c2e4fdb3de4', CAST(0x0000A2C50135B21D AS DateTime), N'')
INSERT [dbo].[LogTable] ([LogID], [ItemID], [Operation], [EmployeeID], [RecordDate], [Notes]) VALUES (N'1eec8cee-6d14-4513-8f94-72bc80b297dd', N'2dd2fbba-9850-42c5-8a84-8a954fe11172', N'approve', N'd448c4b5-8f24-42fa-8308-9c2e4fdb3de4', CAST(0x0000A29A0130FAE5 AS DateTime), N'')
INSERT [dbo].[LogTable] ([LogID], [ItemID], [Operation], [EmployeeID], [RecordDate], [Notes]) VALUES (N'6511bfd5-e6c3-4138-8fca-7346254fede8', N'3849e923-9e6d-437b-a155-b9a16434d47c', N'submit', N'd448c4b5-8f24-42fa-8308-9c2e4fdb3de4', CAST(0x0000A298011B4CBA AS DateTime), N'')
INSERT [dbo].[LogTable] ([LogID], [ItemID], [Operation], [EmployeeID], [RecordDate], [Notes]) VALUES (N'e87b83c9-2980-47f5-a0f4-74fd608207a3', N'b7a2973d-ff20-496d-a06b-f9ffc4bb45f7', N'approve', NULL, CAST(0x0000A24B00AE8C5D AS DateTime), N'ok, enjoy')
INSERT [dbo].[LogTable] ([LogID], [ItemID], [Operation], [EmployeeID], [RecordDate], [Notes]) VALUES (N'6fc836e2-e710-4c13-a328-77de23216664', N'fae0ade0-f078-45f2-aa4d-ae50c74d6605', N'approve', NULL, CAST(0x0000A29900F594D3 AS DateTime), N'')
INSERT [dbo].[LogTable] ([LogID], [ItemID], [Operation], [EmployeeID], [RecordDate], [Notes]) VALUES (N'72d9c9dc-f784-4ee1-a996-77e39275ceb6', N'de748519-8e74-4104-b860-feaff722ee2e', N'approve', N'd448c4b5-8f24-42fa-8308-9c2e4fdb3de4', CAST(0x0000A29D0135BD15 AS DateTime), N'')
INSERT [dbo].[LogTable] ([LogID], [ItemID], [Operation], [EmployeeID], [RecordDate], [Notes]) VALUES (N'd6b0e14a-8216-4041-9889-784281266e0b', N'dbc76cd4-91dd-4180-aa2f-aae164c39344', N'approve', N'd448c4b5-8f24-42fa-8308-9c2e4fdb3de4', CAST(0x0000A29B01260730 AS DateTime), N'')
INSERT [dbo].[LogTable] ([LogID], [ItemID], [Operation], [EmployeeID], [RecordDate], [Notes]) VALUES (N'65b3c343-9278-4b5c-9c03-79772f1db93d', N'03d50396-e537-4f92-b495-297d4b99bfdb', N'submit', N'd448c4b5-8f24-42fa-8308-9c2e4fdb3de4', CAST(0x0000A25700CE6C40 AS DateTime), N'')
INSERT [dbo].[LogTable] ([LogID], [ItemID], [Operation], [EmployeeID], [RecordDate], [Notes]) VALUES (N'b64fc69c-828a-4257-9952-7f95f261694b', N'e9adf832-0ad0-4022-b0f7-3884882f2ba9', N'submit', N'20250795-00e5-4355-b986-e2f3f6f9e07e', CAST(0x0000A29B01307EC9 AS DateTime), N'')
INSERT [dbo].[LogTable] ([LogID], [ItemID], [Operation], [EmployeeID], [RecordDate], [Notes]) VALUES (N'94d61a70-55b6-41aa-95cc-7ff1cd264c7a', N'81a4cce2-7a54-4d05-85fd-d1be31eee680', N'cancel', NULL, CAST(0x0000A2530108F439 AS DateTime), N'sorry ...leaves cancelled')
INSERT [dbo].[LogTable] ([LogID], [ItemID], [Operation], [EmployeeID], [RecordDate], [Notes]) VALUES (N'ea70d514-7f29-4d30-af9e-80d7a6bbd132', N'dcbeda40-9cc2-4144-a32c-e0a625f174db', N'approve', N'd448c4b5-8f24-42fa-8308-9c2e4fdb3de4', CAST(0x0000A29D011432A7 AS DateTime), N'')
INSERT [dbo].[LogTable] ([LogID], [ItemID], [Operation], [EmployeeID], [RecordDate], [Notes]) VALUES (N'1e6b3b85-043c-43d3-aab0-82fe690231ed', N'd0d1e6d3-69d4-4525-a896-0a7fa696ea4b', N'submit', N'720d8341-ae54-4d06-b92e-652c25c7cf1e', CAST(0x0000A2C500D44C6F AS DateTime), N'')
INSERT [dbo].[LogTable] ([LogID], [ItemID], [Operation], [EmployeeID], [RecordDate], [Notes]) VALUES (N'5ae7a87d-fd28-4711-8242-860158d3ea30', N'f18d3a10-2899-4ccb-b969-506b9e9e50ef', N'submit', N'd448c4b5-8f24-42fa-8308-9c2e4fdb3de4', CAST(0x0000A298011EAF20 AS DateTime), N'')
INSERT [dbo].[LogTable] ([LogID], [ItemID], [Operation], [EmployeeID], [RecordDate], [Notes]) VALUES (N'19dde812-c206-490f-9e33-8722a0fa58aa', N'2dd2fbba-9850-42c5-8a84-8a954fe11172', N'submit', N'20250795-00e5-4355-b986-e2f3f6f9e07e', CAST(0x0000A29A01307FAF AS DateTime), N'')
INSERT [dbo].[LogTable] ([LogID], [ItemID], [Operation], [EmployeeID], [RecordDate], [Notes]) VALUES (N'592c5989-a8bb-4aa3-8b20-87ed674836cf', N'bbae8cce-65d1-4711-8300-76d217235e5f', N'approve', NULL, CAST(0x0000A2B500E24085 AS DateTime), N'')
INSERT [dbo].[LogTable] ([LogID], [ItemID], [Operation], [EmployeeID], [RecordDate], [Notes]) VALUES (N'f5eee934-de93-44ba-a6d1-88cec8f0fb4d', N'dbc76cd4-91dd-4180-aa2f-aae164c39344', N'submit', N'20250795-00e5-4355-b986-e2f3f6f9e07e', CAST(0x0000A29B0125CD68 AS DateTime), N'')
INSERT [dbo].[LogTable] ([LogID], [ItemID], [Operation], [EmployeeID], [RecordDate], [Notes]) VALUES (N'62a55e0b-9994-43dd-a320-89d5819b5e87', N'b6d00ff2-5b50-41b9-bd4f-e4a2f0687705', N'submit', N'720d8341-ae54-4d06-b92e-652c25c7cf1e', CAST(0x0000A2C00138B01E AS DateTime), N'')
INSERT [dbo].[LogTable] ([LogID], [ItemID], [Operation], [EmployeeID], [RecordDate], [Notes]) VALUES (N'6bd4bac5-d88c-4368-82b7-8a3a8b9a3c73', N'e248f3d4-3928-41aa-b7ce-5cf50f4d9e3c', N'submit', N'20250795-00e5-4355-b986-e2f3f6f9e07e', CAST(0x0000A29B00DBAAF7 AS DateTime), N'')
INSERT [dbo].[LogTable] ([LogID], [ItemID], [Operation], [EmployeeID], [RecordDate], [Notes]) VALUES (N'a2e82a64-17d4-4270-ad4b-8abcd2aed359', N'298de147-f4f6-492a-90eb-0c14ca5c8c70', N'approve', N'd448c4b5-8f24-42fa-8308-9c2e4fdb3de4', CAST(0x0000A29B01265F32 AS DateTime), N'')
INSERT [dbo].[LogTable] ([LogID], [ItemID], [Operation], [EmployeeID], [RecordDate], [Notes]) VALUES (N'e705fc2e-62a5-49e0-b80a-8ae434e1e55f', N'dcbeda40-9cc2-4144-a32c-e0a625f174db', N'submit', N'20250795-00e5-4355-b986-e2f3f6f9e07e', CAST(0x0000A29D01138C0D AS DateTime), N'')
INSERT [dbo].[LogTable] ([LogID], [ItemID], [Operation], [EmployeeID], [RecordDate], [Notes]) VALUES (N'1849e5e8-54fe-4a62-9d3e-8b61e337942f', NULL, NULL, N'd448c4b5-8f24-42fa-8308-9c2e4fdb3de4', CAST(0x0000A29700EF1F3A AS DateTime), N'Leave Request was deleted')
INSERT [dbo].[LogTable] ([LogID], [ItemID], [Operation], [EmployeeID], [RecordDate], [Notes]) VALUES (N'91219d28-0083-4884-af85-8ba8b0c21eaa', N'e03dc434-69ed-44c6-bdbb-6106175a8d31', N'approve', NULL, CAST(0x0000A24B009EFA93 AS DateTime), N'appproved by superadmin')
INSERT [dbo].[LogTable] ([LogID], [ItemID], [Operation], [EmployeeID], [RecordDate], [Notes]) VALUES (N'aa6b8558-f17d-4d3c-8346-8deed7de36ff', NULL, NULL, N'd448c4b5-8f24-42fa-8308-9c2e4fdb3de4', CAST(0x0000A29700F2E7E4 AS DateTime), N'Leave Request was deleted')
INSERT [dbo].[LogTable] ([LogID], [ItemID], [Operation], [EmployeeID], [RecordDate], [Notes]) VALUES (N'3bd72adf-0289-4076-852d-8e0bfcd14327', N'411de207-c682-4cc8-aa32-d122509600c0', N'approve', N'd448c4b5-8f24-42fa-8308-9c2e4fdb3de4', CAST(0x0000A2B600B9CE23 AS DateTime), N'hello')
INSERT [dbo].[LogTable] ([LogID], [ItemID], [Operation], [EmployeeID], [RecordDate], [Notes]) VALUES (N'42120af7-4039-479e-bcb7-8f411235c7ce', N'f64305c0-568c-42b6-877b-70437c106c02', N'approve', N'd448c4b5-8f24-42fa-8308-9c2e4fdb3de4', CAST(0x0000A29A012B33F7 AS DateTime), N'ok')
INSERT [dbo].[LogTable] ([LogID], [ItemID], [Operation], [EmployeeID], [RecordDate], [Notes]) VALUES (N'00ebb8cb-1df2-460a-bb08-901f4f33f433', N'43429904-1953-4054-a059-8a45ed75e871', N'approve', NULL, CAST(0x0000A2B500E230A3 AS DateTime), N'')
INSERT [dbo].[LogTable] ([LogID], [ItemID], [Operation], [EmployeeID], [RecordDate], [Notes]) VALUES (N'25f13af4-dcbc-4cca-abed-937207194a19', N'3ea772f1-d503-4684-bbe0-a0faedc24455', N'approve', N'd448c4b5-8f24-42fa-8308-9c2e4fdb3de4', CAST(0x0000A29A01096721 AS DateTime), N'done')
INSERT [dbo].[LogTable] ([LogID], [ItemID], [Operation], [EmployeeID], [RecordDate], [Notes]) VALUES (N'7df2abab-2aa8-4132-a45a-944a280caaf6', N'9c2b6a01-b218-4db3-b632-5725eddb5d5f', N'approve', NULL, CAST(0x0000A25300D039EF AS DateTime), N'')
INSERT [dbo].[LogTable] ([LogID], [ItemID], [Operation], [EmployeeID], [RecordDate], [Notes]) VALUES (N'26e1bcd2-41aa-403f-9d08-9c31da9dbb24', N'cab23a69-8b2c-4b53-a42a-2179ddb2825f', N'approve', NULL, CAST(0x0000A2B500E21800 AS DateTime), N'')
INSERT [dbo].[LogTable] ([LogID], [ItemID], [Operation], [EmployeeID], [RecordDate], [Notes]) VALUES (N'28be11dd-4a11-4804-affc-9c987197f407', N'81530680-dd37-4681-aaa4-679745a7fb89', N'submit', N'20250795-00e5-4355-b986-e2f3f6f9e07e', CAST(0x0000A29A0138A359 AS DateTime), N'')
INSERT [dbo].[LogTable] ([LogID], [ItemID], [Operation], [EmployeeID], [RecordDate], [Notes]) VALUES (N'0b34d4b2-85b5-4f26-a65e-a687ddc78a25', N'12fbcc64-1e99-44be-9d8a-916194a3673c', N'approve', N'd448c4b5-8f24-42fa-8308-9c2e4fdb3de4', CAST(0x0000A29D0121B1E6 AS DateTime), N'')
INSERT [dbo].[LogTable] ([LogID], [ItemID], [Operation], [EmployeeID], [RecordDate], [Notes]) VALUES (N'd5959492-678c-404f-8744-a68ed919dc61', N'9d1419ba-926e-41f0-b644-508cc939a076', N'approve', N'd448c4b5-8f24-42fa-8308-9c2e4fdb3de4', CAST(0x0000A25300A288B0 AS DateTime), N'ankush.. iam approving your time sheet this time..but in future ..please fill it on time')
INSERT [dbo].[LogTable] ([LogID], [ItemID], [Operation], [EmployeeID], [RecordDate], [Notes]) VALUES (N'0d47c6f1-c7e6-430e-9209-a70a000d4e9a', N'212825aa-1bb4-4255-bd78-81229debe566', N'submit', N'6fdc4b80-8ae6-4b97-a068-a66a6c230623', CAST(0x0000A29D011F6878 AS DateTime), N'')
INSERT [dbo].[LogTable] ([LogID], [ItemID], [Operation], [EmployeeID], [RecordDate], [Notes]) VALUES (N'21f0ad62-77ff-419b-82f1-a71fde9a04cb', N'72a8cc5c-598e-4bfa-8753-9708150050f8', N'approve', N'd448c4b5-8f24-42fa-8308-9c2e4fdb3de4', CAST(0x0000A2BE012B5F7D AS DateTime), N'')
INSERT [dbo].[LogTable] ([LogID], [ItemID], [Operation], [EmployeeID], [RecordDate], [Notes]) VALUES (N'1fe5c70e-240f-41f9-9a81-a8581f46024a', N'3f696e9b-c0b3-445d-b8e6-8da6a55b82c6', N'submit', N'20250795-00e5-4355-b986-e2f3f6f9e07e', CAST(0x0000A29B00F3316F AS DateTime), N'')
GO
print 'Processed 100 total records'
INSERT [dbo].[LogTable] ([LogID], [ItemID], [Operation], [EmployeeID], [RecordDate], [Notes]) VALUES (N'626675f6-489e-4a22-8a8b-a89a862bdb10', N'e5652493-9b83-49a3-8c84-6bf402979288', N'submit', N'20250795-00e5-4355-b986-e2f3f6f9e07e', CAST(0x0000A29D010FBDA5 AS DateTime), N'')
INSERT [dbo].[LogTable] ([LogID], [ItemID], [Operation], [EmployeeID], [RecordDate], [Notes]) VALUES (N'95078ffb-8742-41e8-925c-b53860831ed2', N'212825aa-1bb4-4255-bd78-81229debe566', N'approve', N'd448c4b5-8f24-42fa-8308-9c2e4fdb3de4', CAST(0x0000A29D013079D0 AS DateTime), N'')
INSERT [dbo].[LogTable] ([LogID], [ItemID], [Operation], [EmployeeID], [RecordDate], [Notes]) VALUES (N'001fc735-46f8-4e43-85d4-bc133c823c23', N'f8c66c7e-914f-4ac7-8adc-f302c4109119', N'approve', NULL, CAST(0x0000A25200D73D5C AS DateTime), N'ok ankush...this time we are considering your leave...but for half day only')
INSERT [dbo].[LogTable] ([LogID], [ItemID], [Operation], [EmployeeID], [RecordDate], [Notes]) VALUES (N'3aeafeaa-112e-446f-9d05-bc756b8eb62d', NULL, N'Delete', N'd448c4b5-8f24-42fa-8308-9c2e4fdb3de4', CAST(0x0000A29B00BA5B69 AS DateTime), N'Leave Request was deleted')
INSERT [dbo].[LogTable] ([LogID], [ItemID], [Operation], [EmployeeID], [RecordDate], [Notes]) VALUES (N'a21ff4e2-929c-4a2f-83c7-bc7ffb3670cb', N'32381411-25ca-4c48-a5a6-e5c2568b6618', N'submit', N'20250795-00e5-4355-b986-e2f3f6f9e07e', CAST(0x0000A29B01316325 AS DateTime), N'')
INSERT [dbo].[LogTable] ([LogID], [ItemID], [Operation], [EmployeeID], [RecordDate], [Notes]) VALUES (N'e24cdce1-f293-4f90-a6f4-bee6acde0cb1', N'f8c66c7e-914f-4ac7-8adc-f302c4109119', N'submit', N'd448c4b5-8f24-42fa-8308-9c2e4fdb3de4', CAST(0x0000A25200D6F27B AS DateTime), N'')
INSERT [dbo].[LogTable] ([LogID], [ItemID], [Operation], [EmployeeID], [RecordDate], [Notes]) VALUES (N'76f36035-2312-45fd-88e7-c6b79d9f0605', N'43429904-1953-4054-a059-8a45ed75e871', N'submit', N'20250795-00e5-4355-b986-e2f3f6f9e07e', CAST(0x0000A29B00AD3392 AS DateTime), N'')
INSERT [dbo].[LogTable] ([LogID], [ItemID], [Operation], [EmployeeID], [RecordDate], [Notes]) VALUES (N'47646264-83ae-4ec8-a245-c795defc526e', N'6116e4c7-f44e-4cfc-822e-3e0875bb3969', N'approve', NULL, CAST(0x0000A29900D3388A AS DateTime), N'ok done')
INSERT [dbo].[LogTable] ([LogID], [ItemID], [Operation], [EmployeeID], [RecordDate], [Notes]) VALUES (N'84f40948-3ade-4abc-a233-c942e607519b', NULL, N'Delete', N'd448c4b5-8f24-42fa-8308-9c2e4fdb3de4', CAST(0x0000A29B00B92103 AS DateTime), N'Leave Request was deleted')
INSERT [dbo].[LogTable] ([LogID], [ItemID], [Operation], [EmployeeID], [RecordDate], [Notes]) VALUES (N'bc53d952-81d9-4cef-bd1b-c99949b242cd', N'1c910438-8ecc-434d-84a8-2fe69bff0a43', N'submit', N'720d8341-ae54-4d06-b92e-652c25c7cf1e', CAST(0x0000A2BE01282398 AS DateTime), N'')
INSERT [dbo].[LogTable] ([LogID], [ItemID], [Operation], [EmployeeID], [RecordDate], [Notes]) VALUES (N'4b40a7d0-4c98-4342-ac0c-ccc80c2470e0', N'eecc0206-511d-4966-a056-b52f90592a6a', N'submit', N'20250795-00e5-4355-b986-e2f3f6f9e07e', CAST(0x0000A29A012C63B5 AS DateTime), N'')
INSERT [dbo].[LogTable] ([LogID], [ItemID], [Operation], [EmployeeID], [RecordDate], [Notes]) VALUES (N'b63e5876-1e9f-4993-b9c0-cd5bad891b1e', N'212825aa-1bb4-4255-bd78-81229debe566', N'approve', N'd448c4b5-8f24-42fa-8308-9c2e4fdb3de4', CAST(0x0000A29D0120825C AS DateTime), N'')
INSERT [dbo].[LogTable] ([LogID], [ItemID], [Operation], [EmployeeID], [RecordDate], [Notes]) VALUES (N'adbed458-700e-40d4-a750-cfb19e9e3e53', N'b6d00ff2-5b50-41b9-bd4f-e4a2f0687705', N'approve', N'd448c4b5-8f24-42fa-8308-9c2e4fdb3de4', CAST(0x0000A2C00138DCB5 AS DateTime), N'hi')
INSERT [dbo].[LogTable] ([LogID], [ItemID], [Operation], [EmployeeID], [RecordDate], [Notes]) VALUES (N'ab44b678-808c-4d29-8030-cff6af0d70dd', NULL, N'Delete', N'd448c4b5-8f24-42fa-8308-9c2e4fdb3de4', CAST(0x0000A29B00B9A1AA AS DateTime), N'Leave Request was deleted')
INSERT [dbo].[LogTable] ([LogID], [ItemID], [Operation], [EmployeeID], [RecordDate], [Notes]) VALUES (N'c11c70a5-b109-4037-8cbd-d02ca1148851', NULL, N'Delete', N'20250795-00e5-4355-b986-e2f3f6f9e07e', CAST(0x0000A2B500CC6B73 AS DateTime), N'Leave Request was deleted')
INSERT [dbo].[LogTable] ([LogID], [ItemID], [Operation], [EmployeeID], [RecordDate], [Notes]) VALUES (N'1b7040d2-a904-4662-85ca-d5ad0ad2c5f9', N'03123830-0075-4f84-a8c0-f16d087c8e2e', N'submit', N'20250795-00e5-4355-b986-e2f3f6f9e07e', CAST(0x0000A2B500C69F25 AS DateTime), N'')
INSERT [dbo].[LogTable] ([LogID], [ItemID], [Operation], [EmployeeID], [RecordDate], [Notes]) VALUES (N'568ae8a4-419f-4bcb-be34-d9701edd2650', N'd90d8629-732d-4d72-8711-ca31d23b4ee2', N'submit', N'd448c4b5-8f24-42fa-8308-9c2e4fdb3de4', CAST(0x0000A25700D087AE AS DateTime), N'')
INSERT [dbo].[LogTable] ([LogID], [ItemID], [Operation], [EmployeeID], [RecordDate], [Notes]) VALUES (N'd01c8fb1-9684-4a77-882b-d9e8f767a23e', N'298de147-f4f6-492a-90eb-0c14ca5c8c70', N'approve', N'd448c4b5-8f24-42fa-8308-9c2e4fdb3de4', CAST(0x0000A29B00CB6A3D AS DateTime), N'')
INSERT [dbo].[LogTable] ([LogID], [ItemID], [Operation], [EmployeeID], [RecordDate], [Notes]) VALUES (N'd56a8baf-b884-487c-b5a8-da2c762ef1b2', N'2e23e454-9ad6-46e7-a469-61e873290f4f', N'approve', N'd448c4b5-8f24-42fa-8308-9c2e4fdb3de4', CAST(0x0000A29D01141E0D AS DateTime), N'')
INSERT [dbo].[LogTable] ([LogID], [ItemID], [Operation], [EmployeeID], [RecordDate], [Notes]) VALUES (N'3c5fea44-1719-48de-8b8a-da95ded5bb10', N'478cb821-f1df-4d4b-bd3c-ca81554fe7b0', N'submit', N'20250795-00e5-4355-b986-e2f3f6f9e07e', CAST(0x0000A29B011E16C4 AS DateTime), N'')
INSERT [dbo].[LogTable] ([LogID], [ItemID], [Operation], [EmployeeID], [RecordDate], [Notes]) VALUES (N'de0f7e75-9197-4f47-999d-dce4ad3893a0', N'de748519-8e74-4104-b860-feaff722ee2e', N'submit', N'6fdc4b80-8ae6-4b97-a068-a66a6c230623', CAST(0x0000A29D01358D47 AS DateTime), N'')
INSERT [dbo].[LogTable] ([LogID], [ItemID], [Operation], [EmployeeID], [RecordDate], [Notes]) VALUES (N'203d5597-86a7-4363-9e1f-dcf3cd2507a6', NULL, N'Delete', N'20250795-00e5-4355-b986-e2f3f6f9e07e', CAST(0x0000A29B00BC8BBC AS DateTime), N'Leave Request was deleted')
INSERT [dbo].[LogTable] ([LogID], [ItemID], [Operation], [EmployeeID], [RecordDate], [Notes]) VALUES (N'517bb584-cbdb-4b98-a249-df53918f5f3d', N'7850b98a-75e9-4694-bc97-53701690da8a', N'approve', NULL, CAST(0x0000A2570139B0C8 AS DateTime), N'enjoy !!')
INSERT [dbo].[LogTable] ([LogID], [ItemID], [Operation], [EmployeeID], [RecordDate], [Notes]) VALUES (N'aaf93108-9308-4371-a6f9-e43f73f0c57d', N'2b94c0d3-1e90-4d37-ad1f-4b737cdb8968', N'submit', N'720d8341-ae54-4d06-b92e-652c25c7cf1e', CAST(0x0000A2C5012C8B42 AS DateTime), N'')
INSERT [dbo].[LogTable] ([LogID], [ItemID], [Operation], [EmployeeID], [RecordDate], [Notes]) VALUES (N'01bfca1f-803f-47a7-ae40-e44424abf056', N'eecc0206-511d-4966-a056-b52f90592a6a', N'approve', N'd448c4b5-8f24-42fa-8308-9c2e4fdb3de4', CAST(0x0000A29A012D05E3 AS DateTime), N'ok')
INSERT [dbo].[LogTable] ([LogID], [ItemID], [Operation], [EmployeeID], [RecordDate], [Notes]) VALUES (N'411efddd-0898-4b19-a16a-e48c706dc359', N'212825aa-1bb4-4255-bd78-81229debe566', N'submit', N'6fdc4b80-8ae6-4b97-a068-a66a6c230623', CAST(0x0000A29D0126969E AS DateTime), N'')
INSERT [dbo].[LogTable] ([LogID], [ItemID], [Operation], [EmployeeID], [RecordDate], [Notes]) VALUES (N'a70715f4-ad64-4971-b889-e56100540a94', N'3f696e9b-c0b3-445d-b8e6-8da6a55b82c6', N'approve', N'd448c4b5-8f24-42fa-8308-9c2e4fdb3de4', CAST(0x0000A29B00F4C5D9 AS DateTime), N'')
INSERT [dbo].[LogTable] ([LogID], [ItemID], [Operation], [EmployeeID], [RecordDate], [Notes]) VALUES (N'7da126b7-25ba-4a65-a9d2-e77a2a9731a3', N'd2aa9f43-73ef-4a46-bdab-22504f7200fd', N'submit', N'20250795-00e5-4355-b986-e2f3f6f9e07e', CAST(0x0000A29B00DD9493 AS DateTime), N'')
INSERT [dbo].[LogTable] ([LogID], [ItemID], [Operation], [EmployeeID], [RecordDate], [Notes]) VALUES (N'16da2d14-4bd0-4468-9709-e85f56b4326b', N'd2aa9f43-73ef-4a46-bdab-22504f7200fd', N'submit', N'20250795-00e5-4355-b986-e2f3f6f9e07e', CAST(0x0000A29D01120267 AS DateTime), N'')
INSERT [dbo].[LogTable] ([LogID], [ItemID], [Operation], [EmployeeID], [RecordDate], [Notes]) VALUES (N'f18cd5d1-e63b-4390-a5ad-e86bf5f6e056', N'a0c529d5-9435-49eb-84d1-dc2630942b7a', N'submit', N'20250795-00e5-4355-b986-e2f3f6f9e07e', CAST(0x0000A29B00C3FDB2 AS DateTime), N'')
INSERT [dbo].[LogTable] ([LogID], [ItemID], [Operation], [EmployeeID], [RecordDate], [Notes]) VALUES (N'6ca9c692-4383-439e-84f1-e887f61d1237', N'478cb821-f1df-4d4b-bd3c-ca81554fe7b0', N'approve', N'd448c4b5-8f24-42fa-8308-9c2e4fdb3de4', CAST(0x0000A29D01376490 AS DateTime), N' k')
INSERT [dbo].[LogTable] ([LogID], [ItemID], [Operation], [EmployeeID], [RecordDate], [Notes]) VALUES (N'4a8d5b5e-b631-4279-b198-ea7bc2ee8f7f', N'81a4cce2-7a54-4d05-85fd-d1be31eee680', N'approve', NULL, CAST(0x0000A25300D48692 AS DateTime), N'')
INSERT [dbo].[LogTable] ([LogID], [ItemID], [Operation], [EmployeeID], [RecordDate], [Notes]) VALUES (N'f5e45c55-e304-4ca6-b1f3-ec55e7671507', N'101631df-ca39-430c-89a4-497e5b12406d', N'approve', NULL, CAST(0x0000A24B01324CB5 AS DateTime), N'go, enjoy')
INSERT [dbo].[LogTable] ([LogID], [ItemID], [Operation], [EmployeeID], [RecordDate], [Notes]) VALUES (N'627e7816-ea54-4ddd-89c2-eda892ba2095', NULL, N'Delete', N'd448c4b5-8f24-42fa-8308-9c2e4fdb3de4', CAST(0x0000A29B00BA4684 AS DateTime), N'Leave Request was deleted')
INSERT [dbo].[LogTable] ([LogID], [ItemID], [Operation], [EmployeeID], [RecordDate], [Notes]) VALUES (N'59b3540c-931c-4290-bd72-ee9c6d041964', N'078b0fcf-2429-4f46-a97b-b98859781276', N'submit', N'20250795-00e5-4355-b986-e2f3f6f9e07e', CAST(0x0000A29A012BDBB9 AS DateTime), N'')
INSERT [dbo].[LogTable] ([LogID], [ItemID], [Operation], [EmployeeID], [RecordDate], [Notes]) VALUES (N'469b829d-aceb-484f-b9f3-f2d102391bd5', N'078b0fcf-2429-4f46-a97b-b98859781276', N'approve', N'd448c4b5-8f24-42fa-8308-9c2e4fdb3de4', CAST(0x0000A29A012C0589 AS DateTime), N'done')
INSERT [dbo].[LogTable] ([LogID], [ItemID], [Operation], [EmployeeID], [RecordDate], [Notes]) VALUES (N'2a37a7fd-f9f2-4910-8119-f4a5a72f4f00', NULL, N'Delete', N'd448c4b5-8f24-42fa-8308-9c2e4fdb3de4', CAST(0x0000A29B00B909D2 AS DateTime), N'Leave Request was deleted')
INSERT [dbo].[LogTable] ([LogID], [ItemID], [Operation], [EmployeeID], [RecordDate], [Notes]) VALUES (N'fb43583e-c18a-4b35-9b72-f50f8f9a9c0a', N'fae0ade0-f078-45f2-aa4d-ae50c74d6605', N'submit', N'770acc2b-d5d4-4c57-ab57-7a3451f8a86c', CAST(0x0000A29900F558BB AS DateTime), N'')
INSERT [dbo].[LogTable] ([LogID], [ItemID], [Operation], [EmployeeID], [RecordDate], [Notes]) VALUES (N'5ffd6191-30f4-4d55-976f-f5d0752064af', N'6116e4c7-f44e-4cfc-822e-3e0875bb3969', N'submit', N'd448c4b5-8f24-42fa-8308-9c2e4fdb3de4', CAST(0x0000A25300D7DFD9 AS DateTime), N'')
INSERT [dbo].[LogTable] ([LogID], [ItemID], [Operation], [EmployeeID], [RecordDate], [Notes]) VALUES (N'1109ac91-4035-42c4-ab48-f829c62a5153', N'9c2b6a01-b218-4db3-b632-5725eddb5d5f', N'submit', N'd448c4b5-8f24-42fa-8308-9c2e4fdb3de4', CAST(0x0000A25300CFED1A AS DateTime), N'')
INSERT [dbo].[LogTable] ([LogID], [ItemID], [Operation], [EmployeeID], [RecordDate], [Notes]) VALUES (N'f7f609de-0384-4f40-91d5-fbbbdb5246ac', N'd0d1e6d3-69d4-4525-a896-0a7fa696ea4b', N'reject', N'20250795-00e5-4355-b986-e2f3f6f9e07f', CAST(0x0000A2C500C05BEE AS DateTime), N'')
/****** Object:  Table [dbo].[TimeSheetMaster]    Script Date: 02/04/2014 12:06:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TimeSheetMaster](
	[TimeSheetMasterID] [uniqueidentifier] NOT NULL,
	[EmpID] [uniqueidentifier] NULL,
	[Month] [nvarchar](max) NULL,
	[Year] [nvarchar](max) NULL,
	[CreatedDate] [datetime] NULL,
	[IsSubmit] [bit] NULL,
	[Status] [nvarchar](50) NULL,
	[MonthNumber] [int] NULL,
 CONSTRAINT [PK_TimeSheetMaster] PRIMARY KEY CLUSTERED 
(
	[TimeSheetMasterID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[TimeSheetMaster] ([TimeSheetMasterID], [EmpID], [Month], [Year], [CreatedDate], [IsSubmit], [Status], [MonthNumber]) VALUES (N'9e7c8d21-2e45-4c34-912d-036d9e9147cf', N'6fdc4b80-8ae6-4b97-a068-a66a6c230623', N'Feb', N'2014', CAST(0x0000A2BE013CC67B AS DateTime), 0, NULL, 2)
INSERT [dbo].[TimeSheetMaster] ([TimeSheetMasterID], [EmpID], [Month], [Year], [CreatedDate], [IsSubmit], [Status], [MonthNumber]) VALUES (N'421f636a-d553-4b50-8347-0a4d9a9db06b', N'd44eea62-6415-4c75-af42-8888760e8bf4', N'Dec', N'2013', CAST(0x0000A29700C3C37F AS DateTime), 0, NULL, 12)
INSERT [dbo].[TimeSheetMaster] ([TimeSheetMasterID], [EmpID], [Month], [Year], [CreatedDate], [IsSubmit], [Status], [MonthNumber]) VALUES (N'298de147-f4f6-492a-90eb-0c14ca5c8c70', N'20250795-00e5-4355-b986-e2f3f6f9e07e', N'May', N'2014', CAST(0x0000A29B00C46A66 AS DateTime), 1, N'approved', 5)
INSERT [dbo].[TimeSheetMaster] ([TimeSheetMasterID], [EmpID], [Month], [Year], [CreatedDate], [IsSubmit], [Status], [MonthNumber]) VALUES (N'2d101463-213a-45e9-99d1-16e626507541', N'720d8341-ae54-4d06-b92e-652c25c7cf1e', N'Jan', N'2014', CAST(0x0000A2BE013E4200 AS DateTime), 0, N'disapproved', 1)
INSERT [dbo].[TimeSheetMaster] ([TimeSheetMasterID], [EmpID], [Month], [Year], [CreatedDate], [IsSubmit], [Status], [MonthNumber]) VALUES (N'4066af84-094c-4e5b-9dd3-20927e4e39d0', N'd448c4b5-8f24-42fa-8308-9c2e4fdb3de4', N'Feb', N'2014', CAST(0x0000A29900D9FD6F AS DateTime), 0, NULL, 2)
INSERT [dbo].[TimeSheetMaster] ([TimeSheetMasterID], [EmpID], [Month], [Year], [CreatedDate], [IsSubmit], [Status], [MonthNumber]) VALUES (N'd2aa9f43-73ef-4a46-bdab-22504f7200fd', N'20250795-00e5-4355-b986-e2f3f6f9e07e', N'Dec', N'2013', CAST(0x0000A29B00DD8790 AS DateTime), 1, N'approved', 12)
INSERT [dbo].[TimeSheetMaster] ([TimeSheetMasterID], [EmpID], [Month], [Year], [CreatedDate], [IsSubmit], [Status], [MonthNumber]) VALUES (N'2a6beec4-e8ab-43a8-aaf6-28b58f42ae9f', N'720d8341-ae54-4d06-b92e-652c25c7cf1e', N'Jan', N'2015', CAST(0x0000A2C500DB3CAA AS DateTime), 0, NULL, 1)
INSERT [dbo].[TimeSheetMaster] ([TimeSheetMasterID], [EmpID], [Month], [Year], [CreatedDate], [IsSubmit], [Status], [MonthNumber]) VALUES (N'5a5d8679-f4f4-4e3b-a21f-2b2dd836acfd', N'20250795-00e5-4355-b986-e2f3f6f9e07e', N'Feb', N'2014', CAST(0x0000A29A012B5A7A AS DateTime), 1, NULL, 2)
INSERT [dbo].[TimeSheetMaster] ([TimeSheetMasterID], [EmpID], [Month], [Year], [CreatedDate], [IsSubmit], [Status], [MonthNumber]) VALUES (N'e9adf832-0ad0-4022-b0f7-3884882f2ba9', N'20250795-00e5-4355-b986-e2f3f6f9e07e', N'Jan', N'2014', CAST(0x0000A29B01306B16 AS DateTime), 1, N'approved', 1)
INSERT [dbo].[TimeSheetMaster] ([TimeSheetMasterID], [EmpID], [Month], [Year], [CreatedDate], [IsSubmit], [Status], [MonthNumber]) VALUES (N'6116e4c7-f44e-4cfc-822e-3e0875bb3969', N'd448c4b5-8f24-42fa-8308-9c2e4fdb3de4', N'Nov', N'2013', CAST(0x0000A252012A2267 AS DateTime), 1, N'approved', 11)
INSERT [dbo].[TimeSheetMaster] ([TimeSheetMasterID], [EmpID], [Month], [Year], [CreatedDate], [IsSubmit], [Status], [MonthNumber]) VALUES (N'474dd670-399c-425c-b3c6-3e73132144d3', N'd448c4b5-8f24-42fa-8308-9c2e4fdb3de4', N'Jan', N'2013', CAST(0x0000A29900B1C090 AS DateTime), 0, NULL, 1)
INSERT [dbo].[TimeSheetMaster] ([TimeSheetMasterID], [EmpID], [Month], [Year], [CreatedDate], [IsSubmit], [Status], [MonthNumber]) VALUES (N'7f54179d-42c2-4844-838f-49f3b90029aa', N'720d8341-ae54-4d06-b92e-652c25c7cf1e', N'Mar', N'2014', CAST(0x0000A2C5012DDDB7 AS DateTime), 0, NULL, 3)
INSERT [dbo].[TimeSheetMaster] ([TimeSheetMasterID], [EmpID], [Month], [Year], [CreatedDate], [IsSubmit], [Status], [MonthNumber]) VALUES (N'2b94c0d3-1e90-4d37-ad1f-4b737cdb8968', N'720d8341-ae54-4d06-b92e-652c25c7cf1e', N'Feb', N'2014', CAST(0x0000A2C5012C53CD AS DateTime), 1, NULL, 2)
INSERT [dbo].[TimeSheetMaster] ([TimeSheetMasterID], [EmpID], [Month], [Year], [CreatedDate], [IsSubmit], [Status], [MonthNumber]) VALUES (N'9d1419ba-926e-41f0-b644-508cc939a076', N'd448c4b5-8f24-42fa-8308-9c2e4fdb3de4', N'Oct', N'2013', CAST(0x0000A252012802B4 AS DateTime), 1, N'approved', 10)
INSERT [dbo].[TimeSheetMaster] ([TimeSheetMasterID], [EmpID], [Month], [Year], [CreatedDate], [IsSubmit], [Status], [MonthNumber]) VALUES (N'81530680-dd37-4681-aaa4-679745a7fb89', N'20250795-00e5-4355-b986-e2f3f6f9e07e', N'Apr', N'2014', CAST(0x0000A29A01312700 AS DateTime), 0, NULL, 4)
INSERT [dbo].[TimeSheetMaster] ([TimeSheetMasterID], [EmpID], [Month], [Year], [CreatedDate], [IsSubmit], [Status], [MonthNumber]) VALUES (N'889c1d0a-4263-4fb1-a3eb-7d3e6212e247', N'd448c4b5-8f24-42fa-8308-9c2e4fdb3de4', N'Feb', N'2013', CAST(0x0000A29900B2E804 AS DateTime), 0, NULL, 2)
INSERT [dbo].[TimeSheetMaster] ([TimeSheetMasterID], [EmpID], [Month], [Year], [CreatedDate], [IsSubmit], [Status], [MonthNumber]) VALUES (N'212825aa-1bb4-4255-bd78-81229debe566', N'6fdc4b80-8ae6-4b97-a068-a66a6c230623', N'Dec', N'2013', CAST(0x0000A29D011D2A57 AS DateTime), 1, N'approved', 12)
INSERT [dbo].[TimeSheetMaster] ([TimeSheetMasterID], [EmpID], [Month], [Year], [CreatedDate], [IsSubmit], [Status], [MonthNumber]) VALUES (N'f66bcc6b-19a7-420c-be11-8f952a9d344b', N'd448c4b5-8f24-42fa-8308-9c2e4fdb3de4', N'Dec', N'2013', CAST(0x0000A29900ABCCE1 AS DateTime), 0, NULL, 12)
INSERT [dbo].[TimeSheetMaster] ([TimeSheetMasterID], [EmpID], [Month], [Year], [CreatedDate], [IsSubmit], [Status], [MonthNumber]) VALUES (N'691d91f7-bec2-423a-91b9-97cf827bc977', N'f3603335-129c-4f6c-9cdd-3268a29a505a', N'Dec', N'2013', CAST(0x0000A298011680EB AS DateTime), 0, NULL, 12)
INSERT [dbo].[TimeSheetMaster] ([TimeSheetMasterID], [EmpID], [Month], [Year], [CreatedDate], [IsSubmit], [Status], [MonthNumber]) VALUES (N'22250e0f-8265-43e8-9fcb-a697f59744a7', N'd448c4b5-8f24-42fa-8308-9c2e4fdb3de4', N'Oct', N'2015', CAST(0x0000A29B01318D35 AS DateTime), 0, NULL, 10)
INSERT [dbo].[TimeSheetMaster] ([TimeSheetMasterID], [EmpID], [Month], [Year], [CreatedDate], [IsSubmit], [Status], [MonthNumber]) VALUES (N'fae0ade0-f078-45f2-aa4d-ae50c74d6605', N'770acc2b-d5d4-4c57-ab57-7a3451f8a86c', N'Dec', N'2013', CAST(0x0000A29900F532AF AS DateTime), 1, N'approved', 12)
INSERT [dbo].[TimeSheetMaster] ([TimeSheetMasterID], [EmpID], [Month], [Year], [CreatedDate], [IsSubmit], [Status], [MonthNumber]) VALUES (N'eecc0206-511d-4966-a056-b52f90592a6a', N'20250795-00e5-4355-b986-e2f3f6f9e07e', N'Mar', N'2014', CAST(0x0000A29A012C1639 AS DateTime), 1, N'approved', 3)
INSERT [dbo].[TimeSheetMaster] ([TimeSheetMasterID], [EmpID], [Month], [Year], [CreatedDate], [IsSubmit], [Status], [MonthNumber]) VALUES (N'c5cb6272-8c77-4682-bf7c-c2ccd3491980', N'20250795-00e5-4355-b986-e2f3f6f9e07e', N'Aug', N'2013', CAST(0x0000A29B013025C1 AS DateTime), 1, NULL, 8)
INSERT [dbo].[TimeSheetMaster] ([TimeSheetMasterID], [EmpID], [Month], [Year], [CreatedDate], [IsSubmit], [Status], [MonthNumber]) VALUES (N'9a2d99e8-1c2a-4bac-a840-c4f6692041b9', N'd448c4b5-8f24-42fa-8308-9c2e4fdb3de4', N'Jan', N'2014', CAST(0x0000A29900C6107F AS DateTime), 0, NULL, 1)
INSERT [dbo].[TimeSheetMaster] ([TimeSheetMasterID], [EmpID], [Month], [Year], [CreatedDate], [IsSubmit], [Status], [MonthNumber]) VALUES (N'478cb821-f1df-4d4b-bd3c-ca81554fe7b0', N'20250795-00e5-4355-b986-e2f3f6f9e07e', N'Feb', N'2013', CAST(0x0000A29A01286DAF AS DateTime), 1, N'approved', 2)
INSERT [dbo].[TimeSheetMaster] ([TimeSheetMasterID], [EmpID], [Month], [Year], [CreatedDate], [IsSubmit], [Status], [MonthNumber]) VALUES (N'41a4c6c4-9288-4c60-aec2-d76cd8910c8e', N'd448c4b5-8f24-42fa-8308-9c2e4fdb3de4', N'Mar', N'2013', CAST(0x0000A29900DACB05 AS DateTime), 0, NULL, 3)
INSERT [dbo].[TimeSheetMaster] ([TimeSheetMasterID], [EmpID], [Month], [Year], [CreatedDate], [IsSubmit], [Status], [MonthNumber]) VALUES (N'e90e53e1-5605-44b2-aed7-df1f195c53c1', N'd448c4b5-8f24-42fa-8308-9c2e4fdb3de4', N'Mar', N'2015', CAST(0x0000A29900DC9506 AS DateTime), 0, NULL, 3)
INSERT [dbo].[TimeSheetMaster] ([TimeSheetMasterID], [EmpID], [Month], [Year], [CreatedDate], [IsSubmit], [Status], [MonthNumber]) VALUES (N'dcbeda40-9cc2-4144-a32c-e0a625f174db', N'20250795-00e5-4355-b986-e2f3f6f9e07e', N'Feb', N'2015', CAST(0x0000A29D010F5133 AS DateTime), 1, N'approved', 2)
INSERT [dbo].[TimeSheetMaster] ([TimeSheetMasterID], [EmpID], [Month], [Year], [CreatedDate], [IsSubmit], [Status], [MonthNumber]) VALUES (N'32381411-25ca-4c48-a5a6-e5c2568b6618', N'20250795-00e5-4355-b986-e2f3f6f9e07e', N'Jan', N'2015', CAST(0x0000A29B01314F18 AS DateTime), 1, N'approved', 1)
INSERT [dbo].[TimeSheetMaster] ([TimeSheetMasterID], [EmpID], [Month], [Year], [CreatedDate], [IsSubmit], [Status], [MonthNumber]) VALUES (N'166857d3-c4b3-415f-9fd4-eaaf7c1aab75', N'770acc2b-d5d4-4c57-ab57-7a3451f8a86c', N'Jan', N'2013', CAST(0x0000A29900F523E5 AS DateTime), 0, NULL, 1)
INSERT [dbo].[TimeSheetMaster] ([TimeSheetMasterID], [EmpID], [Month], [Year], [CreatedDate], [IsSubmit], [Status], [MonthNumber]) VALUES (N'62212af0-bbbb-4984-81be-ed97d14425a0', N'20250795-00e5-4355-b986-e2f3f6f9e07e', N'Nov', N'2014', CAST(0x0000A29B00D535E5 AS DateTime), 0, NULL, 11)
/****** Object:  Table [dbo].[EmployeeLeaves]    Script Date: 02/04/2014 12:06:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeLeaves](
	[EmployeeLeaveID] [uniqueidentifier] NOT NULL,
	[EmpId] [uniqueidentifier] NOT NULL,
	[LeaveTypeID] [uniqueidentifier] NOT NULL,
	[BalanceLeaves] [decimal](18, 2) NULL,
	[IssuedLeaves] [decimal](18, 2) NULL,
	[TotalLeaves] [decimal](18, 2) NULL,
	[Year] [int] NULL,
	[CreatedDate] [datetime] NULL,
 CONSTRAINT [PK_EmployeeLeaves] PRIMARY KEY CLUSTERED 
(
	[EmployeeLeaveID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[EmployeeLeaves] ([EmployeeLeaveID], [EmpId], [LeaveTypeID], [BalanceLeaves], [IssuedLeaves], [TotalLeaves], [Year], [CreatedDate]) VALUES (N'152d6b4f-1834-4ec8-8a17-0565559bada9', N'f0250795-00e5-4355-b986-e2f3f6f9e07a', N'5e346fd2-cec2-4f26-b18d-058585bc936e', CAST(0.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), 2014, NULL)
INSERT [dbo].[EmployeeLeaves] ([EmployeeLeaveID], [EmpId], [LeaveTypeID], [BalanceLeaves], [IssuedLeaves], [TotalLeaves], [Year], [CreatedDate]) VALUES (N'83f4532a-ea9d-427f-a1ce-1168e25b2ef3', N'720d8341-ae54-4d06-b92e-652c25c7cf1e', N'b08b4c3d-1b3a-48be-8dcb-b3eb28889b0d', CAST(0.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), 2014, NULL)
INSERT [dbo].[EmployeeLeaves] ([EmployeeLeaveID], [EmpId], [LeaveTypeID], [BalanceLeaves], [IssuedLeaves], [TotalLeaves], [Year], [CreatedDate]) VALUES (N'994077ee-828b-49c7-b6b0-1f209ee508d0', N'5af736f6-c404-47b2-92cb-81c890441f7f', N'07acaf8e-d70e-408b-8a06-bbb7781cb55d', CAST(0.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), 2014, NULL)
INSERT [dbo].[EmployeeLeaves] ([EmployeeLeaveID], [EmpId], [LeaveTypeID], [BalanceLeaves], [IssuedLeaves], [TotalLeaves], [Year], [CreatedDate]) VALUES (N'ccb520b4-c19c-4c79-965b-23fbe94815b7', N'6fdc4b80-8ae6-4b97-a068-a66a6c230623', N'5e346fd2-cec2-4f26-b18d-058585bc936e', CAST(0.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), 2014, NULL)
INSERT [dbo].[EmployeeLeaves] ([EmployeeLeaveID], [EmpId], [LeaveTypeID], [BalanceLeaves], [IssuedLeaves], [TotalLeaves], [Year], [CreatedDate]) VALUES (N'04fb8200-9062-4dc3-8a92-2fafe5812012', N'6fdc4b80-8ae6-4b97-a068-a66a6c230623', N'b08b4c3d-1b3a-48be-8dcb-b3eb28889b0d', CAST(0.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), 2014, NULL)
INSERT [dbo].[EmployeeLeaves] ([EmployeeLeaveID], [EmpId], [LeaveTypeID], [BalanceLeaves], [IssuedLeaves], [TotalLeaves], [Year], [CreatedDate]) VALUES (N'75844eb7-3504-4a19-b59a-3d463862d24a', N'd448c4b5-8f24-42fa-8308-9c2e4fdb3de4', N'5e346fd2-cec2-4f26-b18d-058585bc936e', CAST(0.00 AS Decimal(18, 2)), CAST(45.00 AS Decimal(18, 2)), CAST(45.00 AS Decimal(18, 2)), 2013, NULL)
INSERT [dbo].[EmployeeLeaves] ([EmployeeLeaveID], [EmpId], [LeaveTypeID], [BalanceLeaves], [IssuedLeaves], [TotalLeaves], [Year], [CreatedDate]) VALUES (N'aaccbade-ecf9-4b4f-a766-59067aa8e49f', N'720d8341-ae54-4d06-b92e-652c25c7cf1e', N'b1ec6a94-dce1-4b01-a3a2-d5388cbc6c15', CAST(0.00 AS Decimal(18, 2)), CAST(7.00 AS Decimal(18, 2)), CAST(7.00 AS Decimal(18, 2)), 2014, NULL)
INSERT [dbo].[EmployeeLeaves] ([EmployeeLeaveID], [EmpId], [LeaveTypeID], [BalanceLeaves], [IssuedLeaves], [TotalLeaves], [Year], [CreatedDate]) VALUES (N'e6a4e7c3-8dcf-4e75-923f-5dfb3f151161', N'6fdc4b80-8ae6-4b97-a068-a66a6c230623', N'b1ec6a94-dce1-4b01-a3a2-d5388cbc6c15', CAST(0.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), 2014, NULL)
INSERT [dbo].[EmployeeLeaves] ([EmployeeLeaveID], [EmpId], [LeaveTypeID], [BalanceLeaves], [IssuedLeaves], [TotalLeaves], [Year], [CreatedDate]) VALUES (N'34af8e53-bdec-4bd4-b579-5e4b80e6e60e', N'f0250795-00e5-4355-b986-e2f3f6f9e07a', N'b08b4c3d-1b3a-48be-8dcb-b3eb28889b0d', CAST(0.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), 2014, NULL)
INSERT [dbo].[EmployeeLeaves] ([EmployeeLeaveID], [EmpId], [LeaveTypeID], [BalanceLeaves], [IssuedLeaves], [TotalLeaves], [Year], [CreatedDate]) VALUES (N'3fef5c45-ec4e-43cb-aa84-5ead9a8b57e9', N'5af736f6-c404-47b2-92cb-81c890441f7f', N'5e346fd2-cec2-4f26-b18d-058585bc936e', CAST(0.00 AS Decimal(18, 2)), CAST(8.00 AS Decimal(18, 2)), CAST(8.00 AS Decimal(18, 2)), 2014, NULL)
INSERT [dbo].[EmployeeLeaves] ([EmployeeLeaveID], [EmpId], [LeaveTypeID], [BalanceLeaves], [IssuedLeaves], [TotalLeaves], [Year], [CreatedDate]) VALUES (N'acefbb13-326f-42a2-8e09-5eeb90ef081b', N'770acc2b-d5d4-4c57-ab57-7a3451f8a86c', N'07acaf8e-d70e-408b-8a06-bbb7781cb55d', CAST(0.00 AS Decimal(18, 2)), CAST(7.00 AS Decimal(18, 2)), CAST(7.00 AS Decimal(18, 2)), 2013, NULL)
INSERT [dbo].[EmployeeLeaves] ([EmployeeLeaveID], [EmpId], [LeaveTypeID], [BalanceLeaves], [IssuedLeaves], [TotalLeaves], [Year], [CreatedDate]) VALUES (N'538583d7-7a19-4c60-8279-5fa1aa66f9cd', N'd44eea62-6415-4c75-af42-8888760e8bf4', N'07acaf8e-d70e-408b-8a06-bbb7781cb55d', CAST(0.00 AS Decimal(18, 2)), CAST(10.50 AS Decimal(18, 2)), CAST(10.50 AS Decimal(18, 2)), 2013, NULL)
INSERT [dbo].[EmployeeLeaves] ([EmployeeLeaveID], [EmpId], [LeaveTypeID], [BalanceLeaves], [IssuedLeaves], [TotalLeaves], [Year], [CreatedDate]) VALUES (N'7cebebde-b5f4-4ab6-bc38-7c13c3148367', N'720d8341-ae54-4d06-b92e-652c25c7cf1e', N'5e346fd2-cec2-4f26-b18d-058585bc936e', CAST(0.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), 2014, NULL)
INSERT [dbo].[EmployeeLeaves] ([EmployeeLeaveID], [EmpId], [LeaveTypeID], [BalanceLeaves], [IssuedLeaves], [TotalLeaves], [Year], [CreatedDate]) VALUES (N'61685bed-c140-487d-b1b6-83f65905eef5', N'720d8341-ae54-4d06-b92e-652c25c7cf1e', N'07acaf8e-d70e-408b-8a06-bbb7781cb55d', CAST(0.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), 2014, NULL)
INSERT [dbo].[EmployeeLeaves] ([EmployeeLeaveID], [EmpId], [LeaveTypeID], [BalanceLeaves], [IssuedLeaves], [TotalLeaves], [Year], [CreatedDate]) VALUES (N'805a1517-26cd-424a-84a1-8895cd2be373', N'62995f97-51be-4353-bd83-0745e5f24f07', N'5e346fd2-cec2-4f26-b18d-058585bc936e', CAST(0.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), 2013, NULL)
INSERT [dbo].[EmployeeLeaves] ([EmployeeLeaveID], [EmpId], [LeaveTypeID], [BalanceLeaves], [IssuedLeaves], [TotalLeaves], [Year], [CreatedDate]) VALUES (N'5ed34a9f-2d67-4446-b2b4-89d8c901aa83', N'770acc2b-d5d4-4c57-ab57-7a3451f8a86c', N'f407b5c9-25c0-4788-bf14-6b27f124a735', CAST(0.00 AS Decimal(18, 2)), CAST(7.00 AS Decimal(18, 2)), CAST(7.00 AS Decimal(18, 2)), 2013, NULL)
INSERT [dbo].[EmployeeLeaves] ([EmployeeLeaveID], [EmpId], [LeaveTypeID], [BalanceLeaves], [IssuedLeaves], [TotalLeaves], [Year], [CreatedDate]) VALUES (N'f884514e-624a-420e-b020-8d59f5a042ee', N'720d8341-ae54-4d06-b92e-652c25c7cf1e', N'f407b5c9-25c0-4788-bf14-6b27f124a735', CAST(0.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), 2014, NULL)
INSERT [dbo].[EmployeeLeaves] ([EmployeeLeaveID], [EmpId], [LeaveTypeID], [BalanceLeaves], [IssuedLeaves], [TotalLeaves], [Year], [CreatedDate]) VALUES (N'5e1c3b10-70ea-485d-90f6-9369405c2a99', N'6fdc4b80-8ae6-4b97-a068-a66a6c230623', N'f407b5c9-25c0-4788-bf14-6b27f124a735', CAST(0.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), 2014, NULL)
INSERT [dbo].[EmployeeLeaves] ([EmployeeLeaveID], [EmpId], [LeaveTypeID], [BalanceLeaves], [IssuedLeaves], [TotalLeaves], [Year], [CreatedDate]) VALUES (N'445474b3-c65a-4512-bced-97d28922a0d6', N'62995f97-51be-4353-bd83-0745e5f24f07', N'f407b5c9-25c0-4788-bf14-6b27f124a735', CAST(0.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), 2013, NULL)
INSERT [dbo].[EmployeeLeaves] ([EmployeeLeaveID], [EmpId], [LeaveTypeID], [BalanceLeaves], [IssuedLeaves], [TotalLeaves], [Year], [CreatedDate]) VALUES (N'1830e039-15d6-461d-af79-9b811d454bf3', N'd448c4b5-8f24-42fa-8308-9c2e4fdb3de4', N'07acaf8e-d70e-408b-8a06-bbb7781cb55d', CAST(0.00 AS Decimal(18, 2)), CAST(72.00 AS Decimal(18, 2)), CAST(72.00 AS Decimal(18, 2)), 2013, NULL)
INSERT [dbo].[EmployeeLeaves] ([EmployeeLeaveID], [EmpId], [LeaveTypeID], [BalanceLeaves], [IssuedLeaves], [TotalLeaves], [Year], [CreatedDate]) VALUES (N'f0382dca-203f-4203-aa5c-9c9dfa4627f3', N'e23b88c4-fa7a-481e-b0e7-f372cb7b52d2', N'b08b4c3d-1b3a-48be-8dcb-b3eb28889b0d', CAST(0.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), 2014, NULL)
INSERT [dbo].[EmployeeLeaves] ([EmployeeLeaveID], [EmpId], [LeaveTypeID], [BalanceLeaves], [IssuedLeaves], [TotalLeaves], [Year], [CreatedDate]) VALUES (N'd6459363-db70-4e75-8135-a08dd83bfc1b', N'770acc2b-d5d4-4c57-ab57-7a3451f8a86c', N'b08b4c3d-1b3a-48be-8dcb-b3eb28889b0d', CAST(0.00 AS Decimal(18, 2)), CAST(4.00 AS Decimal(18, 2)), CAST(4.00 AS Decimal(18, 2)), 2013, NULL)
INSERT [dbo].[EmployeeLeaves] ([EmployeeLeaveID], [EmpId], [LeaveTypeID], [BalanceLeaves], [IssuedLeaves], [TotalLeaves], [Year], [CreatedDate]) VALUES (N'5e4e78c5-6752-467c-8f51-aaf9641675cd', N'770acc2b-d5d4-4c57-ab57-7a3451f8a86c', N'5e346fd2-cec2-4f26-b18d-058585bc936e', CAST(0.00 AS Decimal(18, 2)), CAST(6.00 AS Decimal(18, 2)), CAST(6.00 AS Decimal(18, 2)), 2013, NULL)
INSERT [dbo].[EmployeeLeaves] ([EmployeeLeaveID], [EmpId], [LeaveTypeID], [BalanceLeaves], [IssuedLeaves], [TotalLeaves], [Year], [CreatedDate]) VALUES (N'82f2b160-414c-4b7a-9fc3-b147a7209420', N'5af736f6-c404-47b2-92cb-81c890441f7f', N'b1ec6a94-dce1-4b01-a3a2-d5388cbc6c15', CAST(0.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), 2014, NULL)
INSERT [dbo].[EmployeeLeaves] ([EmployeeLeaveID], [EmpId], [LeaveTypeID], [BalanceLeaves], [IssuedLeaves], [TotalLeaves], [Year], [CreatedDate]) VALUES (N'e3cb6dde-0b53-44f4-a775-b4ac7095af91', N'6fdc4b80-8ae6-4b97-a068-a66a6c230623', N'07acaf8e-d70e-408b-8a06-bbb7781cb55d', CAST(0.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), 2014, NULL)
INSERT [dbo].[EmployeeLeaves] ([EmployeeLeaveID], [EmpId], [LeaveTypeID], [BalanceLeaves], [IssuedLeaves], [TotalLeaves], [Year], [CreatedDate]) VALUES (N'02abac95-29ce-4daf-9cca-b66263b005e9', N'770acc2b-d5d4-4c57-ab57-7a3451f8a86c', N'b1ec6a94-dce1-4b01-a3a2-d5388cbc6c15', CAST(0.00 AS Decimal(18, 2)), CAST(15.00 AS Decimal(18, 2)), CAST(15.00 AS Decimal(18, 2)), 2013, NULL)
INSERT [dbo].[EmployeeLeaves] ([EmployeeLeaveID], [EmpId], [LeaveTypeID], [BalanceLeaves], [IssuedLeaves], [TotalLeaves], [Year], [CreatedDate]) VALUES (N'5f8f00e6-9fb3-437e-9af0-c248a1d5ef2f', N'd44eea62-6415-4c75-af42-8888760e8bf4', N'f407b5c9-25c0-4788-bf14-6b27f124a735', CAST(0.00 AS Decimal(18, 2)), CAST(1.50 AS Decimal(18, 2)), CAST(1.50 AS Decimal(18, 2)), 2013, NULL)
INSERT [dbo].[EmployeeLeaves] ([EmployeeLeaveID], [EmpId], [LeaveTypeID], [BalanceLeaves], [IssuedLeaves], [TotalLeaves], [Year], [CreatedDate]) VALUES (N'7f638123-f40f-40b1-9899-d2d73f1927a8', N'd44eea62-6415-4c75-af42-8888760e8bf4', N'5e346fd2-cec2-4f26-b18d-058585bc936e', CAST(0.00 AS Decimal(18, 2)), CAST(5.50 AS Decimal(18, 2)), CAST(5.50 AS Decimal(18, 2)), 2013, NULL)
INSERT [dbo].[EmployeeLeaves] ([EmployeeLeaveID], [EmpId], [LeaveTypeID], [BalanceLeaves], [IssuedLeaves], [TotalLeaves], [Year], [CreatedDate]) VALUES (N'02e9698f-2825-49e5-968e-e7ca8ab76e37', N'b0218d84-1700-4efa-a743-2e86f4e7feac', N'5e346fd2-cec2-4f26-b18d-058585bc936e', CAST(0.00 AS Decimal(18, 2)), CAST(15.00 AS Decimal(18, 2)), CAST(15.00 AS Decimal(18, 2)), 2014, NULL)
INSERT [dbo].[EmployeeLeaves] ([EmployeeLeaveID], [EmpId], [LeaveTypeID], [BalanceLeaves], [IssuedLeaves], [TotalLeaves], [Year], [CreatedDate]) VALUES (N'838b929c-ca45-46b5-9a14-ed23eaa568cd', N'd448c4b5-8f24-42fa-8308-9c2e4fdb3de4', N'f407b5c9-25c0-4788-bf14-6b27f124a735', CAST(0.00 AS Decimal(18, 2)), CAST(24.50 AS Decimal(18, 2)), CAST(24.50 AS Decimal(18, 2)), 2013, NULL)
INSERT [dbo].[EmployeeLeaves] ([EmployeeLeaveID], [EmpId], [LeaveTypeID], [BalanceLeaves], [IssuedLeaves], [TotalLeaves], [Year], [CreatedDate]) VALUES (N'3ac96b5d-a2dd-472b-92f5-ed559f92b04c', N'5af736f6-c404-47b2-92cb-81c890441f7f', N'f407b5c9-25c0-4788-bf14-6b27f124a735', CAST(0.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), 2014, NULL)
INSERT [dbo].[EmployeeLeaves] ([EmployeeLeaveID], [EmpId], [LeaveTypeID], [BalanceLeaves], [IssuedLeaves], [TotalLeaves], [Year], [CreatedDate]) VALUES (N'c8d02de0-e194-4737-ba54-ee3f5165eaf4', N'd448c4b5-8f24-42fa-8308-9c2e4fdb3de4', N'b08b4c3d-1b3a-48be-8dcb-b3eb28889b0d', CAST(0.00 AS Decimal(18, 2)), CAST(7.50 AS Decimal(18, 2)), CAST(7.50 AS Decimal(18, 2)), 2013, NULL)
INSERT [dbo].[EmployeeLeaves] ([EmployeeLeaveID], [EmpId], [LeaveTypeID], [BalanceLeaves], [IssuedLeaves], [TotalLeaves], [Year], [CreatedDate]) VALUES (N'ca512209-8394-4ee9-8a28-ef473be57a1d', N'd44eea62-6415-4c75-af42-8888760e8bf4', N'b08b4c3d-1b3a-48be-8dcb-b3eb28889b0d', CAST(0.00 AS Decimal(18, 2)), CAST(11.50 AS Decimal(18, 2)), CAST(11.50 AS Decimal(18, 2)), 2013, NULL)
INSERT [dbo].[EmployeeLeaves] ([EmployeeLeaveID], [EmpId], [LeaveTypeID], [BalanceLeaves], [IssuedLeaves], [TotalLeaves], [Year], [CreatedDate]) VALUES (N'd77c93bb-43a6-424d-8f9b-f46f48063d7b', N'20250795-00e5-4355-b986-e2f3f6f9e07e', N'5e346fd2-cec2-4f26-b18d-058585bc936e', CAST(0.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), 2014, NULL)
INSERT [dbo].[EmployeeLeaves] ([EmployeeLeaveID], [EmpId], [LeaveTypeID], [BalanceLeaves], [IssuedLeaves], [TotalLeaves], [Year], [CreatedDate]) VALUES (N'35b53576-0786-4f2b-a902-fe75407fe7b2', N'62995f97-51be-4353-bd83-0745e5f24f07', N'b08b4c3d-1b3a-48be-8dcb-b3eb28889b0d', CAST(0.00 AS Decimal(18, 2)), CAST(10.50 AS Decimal(18, 2)), CAST(10.50 AS Decimal(18, 2)), 2013, NULL)
INSERT [dbo].[EmployeeLeaves] ([EmployeeLeaveID], [EmpId], [LeaveTypeID], [BalanceLeaves], [IssuedLeaves], [TotalLeaves], [Year], [CreatedDate]) VALUES (N'3cd4bc6a-50a4-4872-9968-ff6477254647', N'5af736f6-c404-47b2-92cb-81c890441f7f', N'b08b4c3d-1b3a-48be-8dcb-b3eb28889b0d', CAST(0.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), 2014, NULL)
/****** Object:  Table [dbo].[EmployeeLeaveRequest]    Script Date: 02/04/2014 12:06:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeLeaveRequest](
	[EmployeeLeaveRequestID] [uniqueidentifier] NOT NULL,
	[EmployeeID] [uniqueidentifier] NULL,
	[LeaveTypeID] [uniqueidentifier] NULL,
	[LeaveReason] [nvarchar](100) NULL,
	[FromDate] [datetime] NULL,
	[Status] [nvarchar](50) NULL,
	[ToDate] [datetime] NULL,
	[ActualDate] [int] NULL,
	[AssignedDate] [int] NULL,
	[LeaveDetectionReason] [nvarchar](max) NULL,
	[CreateDate] [datetime] NULL,
	[HalfDay] [bit] NULL,
	[Cancel] [bit] NULL,
 CONSTRAINT [PK_EmployeeLeaveRequest] PRIMARY KEY CLUSTERED 
(
	[EmployeeLeaveRequestID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[EmployeeLeaveRequest] ([EmployeeLeaveRequestID], [EmployeeID], [LeaveTypeID], [LeaveReason], [FromDate], [Status], [ToDate], [ActualDate], [AssignedDate], [LeaveDetectionReason], [CreateDate], [HalfDay], [Cancel]) VALUES (N'8bcfdfc5-add6-4f22-b903-1436fbcba048', N'20250795-00e5-4355-b986-e2f3f6f9e07e', N'5e346fd2-cec2-4f26-b18d-058585bc936e', NULL, CAST(0x0000A2A600000000 AS DateTime), N'disapproved', CAST(0x0000A2AE00000000 AS DateTime), 9, 5, N'', CAST(0x0000A2B500C92BA8 AS DateTime), NULL, NULL)
INSERT [dbo].[EmployeeLeaveRequest] ([EmployeeLeaveRequestID], [EmployeeID], [LeaveTypeID], [LeaveReason], [FromDate], [Status], [ToDate], [ActualDate], [AssignedDate], [LeaveDetectionReason], [CreateDate], [HalfDay], [Cancel]) VALUES (N'cab23a69-8b2c-4b53-a42a-2179ddb2825f', N'6fdc4b80-8ae6-4b97-a068-a66a6c230623', N'f407b5c9-25c0-4788-bf14-6b27f124a735', NULL, CAST(0x0000A2A600000000 AS DateTime), N'approved', CAST(0x0000A2B300000000 AS DateTime), 14, 10, N'', CAST(0x0000A2B500DEC6F5 AS DateTime), NULL, NULL)
INSERT [dbo].[EmployeeLeaveRequest] ([EmployeeLeaveRequestID], [EmployeeID], [LeaveTypeID], [LeaveReason], [FromDate], [Status], [ToDate], [ActualDate], [AssignedDate], [LeaveDetectionReason], [CreateDate], [HalfDay], [Cancel]) VALUES (N'1c910438-8ecc-434d-84a8-2fe69bff0a43', N'720d8341-ae54-4d06-b92e-652c25c7cf1e', N'5e346fd2-cec2-4f26-b18d-058585bc936e', NULL, CAST(0x0000A2A600000000 AS DateTime), N'approved', CAST(0x0000A2A700000000 AS DateTime), 2, 2, N'', CAST(0x0000A2BE01282262 AS DateTime), NULL, NULL)
INSERT [dbo].[EmployeeLeaveRequest] ([EmployeeLeaveRequestID], [EmployeeID], [LeaveTypeID], [LeaveReason], [FromDate], [Status], [ToDate], [ActualDate], [AssignedDate], [LeaveDetectionReason], [CreateDate], [HalfDay], [Cancel]) VALUES (N'e248f3d4-3928-41aa-b7ce-5cf50f4d9e3c', N'20250795-00e5-4355-b986-e2f3f6f9e07e', N'b1ec6a94-dce1-4b01-a3a2-d5388cbc6c15', NULL, CAST(0x0000A29C00000000 AS DateTime), N'approved', CAST(0x0000A29C00000000 AS DateTime), 1, 1, NULL, CAST(0x0000A29B00DBAAEC AS DateTime), 1, NULL)
INSERT [dbo].[EmployeeLeaveRequest] ([EmployeeLeaveRequestID], [EmployeeID], [LeaveTypeID], [LeaveReason], [FromDate], [Status], [ToDate], [ActualDate], [AssignedDate], [LeaveDetectionReason], [CreateDate], [HalfDay], [Cancel]) VALUES (N'2e23e454-9ad6-46e7-a469-61e873290f4f', N'20250795-00e5-4355-b986-e2f3f6f9e07e', N'b1ec6a94-dce1-4b01-a3a2-d5388cbc6c15', NULL, CAST(0x0000A44700000000 AS DateTime), N'approved', CAST(0x0000A44800000000 AS DateTime), 1, 1, NULL, CAST(0x0000A29D0113B6CE AS DateTime), 1, NULL)
INSERT [dbo].[EmployeeLeaveRequest] ([EmployeeLeaveRequestID], [EmployeeID], [LeaveTypeID], [LeaveReason], [FromDate], [Status], [ToDate], [ActualDate], [AssignedDate], [LeaveDetectionReason], [CreateDate], [HalfDay], [Cancel]) VALUES (N'a494caad-a2a0-4122-8a81-6b119ec47f1c', N'20250795-00e5-4355-b986-e2f3f6f9e07e', N'b1ec6a94-dce1-4b01-a3a2-d5388cbc6c15', NULL, CAST(0x0000A30400000000 AS DateTime), N'approved', CAST(0x0000A30400000000 AS DateTime), 1, 1, NULL, CAST(0x0000A29B00B953E9 AS DateTime), 1, NULL)
INSERT [dbo].[EmployeeLeaveRequest] ([EmployeeLeaveRequestID], [EmployeeID], [LeaveTypeID], [LeaveReason], [FromDate], [Status], [ToDate], [ActualDate], [AssignedDate], [LeaveDetectionReason], [CreateDate], [HalfDay], [Cancel]) VALUES (N'f64305c0-568c-42b6-877b-70437c106c02', N'20250795-00e5-4355-b986-e2f3f6f9e07e', N'b08b4c3d-1b3a-48be-8dcb-b3eb28889b0d', NULL, CAST(0x0000A2C500000000 AS DateTime), N'approved', CAST(0x0000A2C600000000 AS DateTime), 2, 2, N'', CAST(0x0000A29A012A2654 AS DateTime), NULL, NULL)
INSERT [dbo].[EmployeeLeaveRequest] ([EmployeeLeaveRequestID], [EmployeeID], [LeaveTypeID], [LeaveReason], [FromDate], [Status], [ToDate], [ActualDate], [AssignedDate], [LeaveDetectionReason], [CreateDate], [HalfDay], [Cancel]) VALUES (N'bbae8cce-65d1-4711-8300-76d217235e5f', N'20250795-00e5-4355-b986-e2f3f6f9e07e', N'5e346fd2-cec2-4f26-b18d-058585bc936e', NULL, CAST(0x0000A2A200000000 AS DateTime), N'approved', CAST(0x0000A2A400000000 AS DateTime), 3, 3, N'', CAST(0x0000A29B00DE9B0C AS DateTime), NULL, NULL)
INSERT [dbo].[EmployeeLeaveRequest] ([EmployeeLeaveRequestID], [EmployeeID], [LeaveTypeID], [LeaveReason], [FromDate], [Status], [ToDate], [ActualDate], [AssignedDate], [LeaveDetectionReason], [CreateDate], [HalfDay], [Cancel]) VALUES (N'43429904-1953-4054-a059-8a45ed75e871', N'20250795-00e5-4355-b986-e2f3f6f9e07e', N'5e346fd2-cec2-4f26-b18d-058585bc936e', NULL, CAST(0x0000A2AF00000000 AS DateTime), N'approved', CAST(0x0000A2B000000000 AS DateTime), 2, 1, N'', CAST(0x0000A29B00AD3376 AS DateTime), NULL, NULL)
INSERT [dbo].[EmployeeLeaveRequest] ([EmployeeLeaveRequestID], [EmployeeID], [LeaveTypeID], [LeaveReason], [FromDate], [Status], [ToDate], [ActualDate], [AssignedDate], [LeaveDetectionReason], [CreateDate], [HalfDay], [Cancel]) VALUES (N'2dd2fbba-9850-42c5-8a84-8a954fe11172', N'20250795-00e5-4355-b986-e2f3f6f9e07e', N'b1ec6a94-dce1-4b01-a3a2-d5388cbc6c15', NULL, CAST(0x0000A30100000000 AS DateTime), N'approved', CAST(0x0000A30100000000 AS DateTime), 1, 1, NULL, CAST(0x0000A29A01307FAD AS DateTime), 1, NULL)
INSERT [dbo].[EmployeeLeaveRequest] ([EmployeeLeaveRequestID], [EmployeeID], [LeaveTypeID], [LeaveReason], [FromDate], [Status], [ToDate], [ActualDate], [AssignedDate], [LeaveDetectionReason], [CreateDate], [HalfDay], [Cancel]) VALUES (N'12fbcc64-1e99-44be-9d8a-916194a3673c', N'6fdc4b80-8ae6-4b97-a068-a66a6c230623', N'b08b4c3d-1b3a-48be-8dcb-b3eb28889b0d', NULL, CAST(0x0000A29D00000000 AS DateTime), N'approved', CAST(0x0000A29D00000000 AS DateTime), 1, 1, NULL, CAST(0x0000A29D01218340 AS DateTime), 1, NULL)
INSERT [dbo].[EmployeeLeaveRequest] ([EmployeeLeaveRequestID], [EmployeeID], [LeaveTypeID], [LeaveReason], [FromDate], [Status], [ToDate], [ActualDate], [AssignedDate], [LeaveDetectionReason], [CreateDate], [HalfDay], [Cancel]) VALUES (N'72a8cc5c-598e-4bfa-8753-9708150050f8', N'720d8341-ae54-4d06-b92e-652c25c7cf1e', N'f407b5c9-25c0-4788-bf14-6b27f124a735', NULL, CAST(0x0000A2A800000000 AS DateTime), N'approved', CAST(0x0000A2A800000000 AS DateTime), 1, 1, NULL, CAST(0x0000A2BE012B3F5C AS DateTime), 0, NULL)
INSERT [dbo].[EmployeeLeaveRequest] ([EmployeeLeaveRequestID], [EmployeeID], [LeaveTypeID], [LeaveReason], [FromDate], [Status], [ToDate], [ActualDate], [AssignedDate], [LeaveDetectionReason], [CreateDate], [HalfDay], [Cancel]) VALUES (N'dbc76cd4-91dd-4180-aa2f-aae164c39344', N'20250795-00e5-4355-b986-e2f3f6f9e07e', N'b1ec6a94-dce1-4b01-a3a2-d5388cbc6c15', NULL, CAST(0x0000A32000000000 AS DateTime), N'approved', CAST(0x0000A32000000000 AS DateTime), 1, 1, NULL, CAST(0x0000A29B0125CD64 AS DateTime), 0, NULL)
INSERT [dbo].[EmployeeLeaveRequest] ([EmployeeLeaveRequestID], [EmployeeID], [LeaveTypeID], [LeaveReason], [FromDate], [Status], [ToDate], [ActualDate], [AssignedDate], [LeaveDetectionReason], [CreateDate], [HalfDay], [Cancel]) VALUES (N'078b0fcf-2429-4f46-a97b-b98859781276', N'20250795-00e5-4355-b986-e2f3f6f9e07e', N'b08b4c3d-1b3a-48be-8dcb-b3eb28889b0d', NULL, CAST(0x0000A2E100000000 AS DateTime), N'approved', CAST(0x0000A2E100000000 AS DateTime), 1, 1, NULL, CAST(0x0000A29A012BDBB7 AS DateTime), 1, NULL)
INSERT [dbo].[EmployeeLeaveRequest] ([EmployeeLeaveRequestID], [EmployeeID], [LeaveTypeID], [LeaveReason], [FromDate], [Status], [ToDate], [ActualDate], [AssignedDate], [LeaveDetectionReason], [CreateDate], [HalfDay], [Cancel]) VALUES (N'411de207-c682-4cc8-aa32-d122509600c0', N'20250795-00e5-4355-b986-e2f3f6f9e07e', N'5e346fd2-cec2-4f26-b18d-058585bc936e', NULL, CAST(0x0000A2A800000000 AS DateTime), N'approved', CAST(0x0000A2A900000000 AS DateTime), 2, 1, N'', CAST(0x0000A2B600B98A74 AS DateTime), NULL, NULL)
INSERT [dbo].[EmployeeLeaveRequest] ([EmployeeLeaveRequestID], [EmployeeID], [LeaveTypeID], [LeaveReason], [FromDate], [Status], [ToDate], [ActualDate], [AssignedDate], [LeaveDetectionReason], [CreateDate], [HalfDay], [Cancel]) VALUES (N'bbc32873-b8eb-4014-bf34-d2d5c40dace3', N'20250795-00e5-4355-b986-e2f3f6f9e07e', N'b1ec6a94-dce1-4b01-a3a2-d5388cbc6c15', NULL, CAST(0x0000A44300000000 AS DateTime), N'approved', CAST(0x0000A44300000000 AS DateTime), 1, 1, NULL, CAST(0x0000A29D010F99CA AS DateTime), 1, NULL)
INSERT [dbo].[EmployeeLeaveRequest] ([EmployeeLeaveRequestID], [EmployeeID], [LeaveTypeID], [LeaveReason], [FromDate], [Status], [ToDate], [ActualDate], [AssignedDate], [LeaveDetectionReason], [CreateDate], [HalfDay], [Cancel]) VALUES (N'a0c529d5-9435-49eb-84d1-dc2630942b7a', N'20250795-00e5-4355-b986-e2f3f6f9e07e', N'b1ec6a94-dce1-4b01-a3a2-d5388cbc6c15', NULL, CAST(0x0000A32700000000 AS DateTime), N'approved', CAST(0x0000A32700000000 AS DateTime), 1, 1, NULL, CAST(0x0000A29B00C3FDAF AS DateTime), 1, NULL)
INSERT [dbo].[EmployeeLeaveRequest] ([EmployeeLeaveRequestID], [EmployeeID], [LeaveTypeID], [LeaveReason], [FromDate], [Status], [ToDate], [ActualDate], [AssignedDate], [LeaveDetectionReason], [CreateDate], [HalfDay], [Cancel]) VALUES (N'b6d00ff2-5b50-41b9-bd4f-e4a2f0687705', N'720d8341-ae54-4d06-b92e-652c25c7cf1e', N'b08b4c3d-1b3a-48be-8dcb-b3eb28889b0d', NULL, CAST(0x0000A2CB00000000 AS DateTime), N'approved', CAST(0x0000A2CC00000000 AS DateTime), 2, 1, N'', CAST(0x0000A2C00138AFAD AS DateTime), NULL, NULL)
INSERT [dbo].[EmployeeLeaveRequest] ([EmployeeLeaveRequestID], [EmployeeID], [LeaveTypeID], [LeaveReason], [FromDate], [Status], [ToDate], [ActualDate], [AssignedDate], [LeaveDetectionReason], [CreateDate], [HalfDay], [Cancel]) VALUES (N'03123830-0075-4f84-a8c0-f16d087c8e2e', N'20250795-00e5-4355-b986-e2f3f6f9e07e', N'5e346fd2-cec2-4f26-b18d-058585bc936e', NULL, CAST(0x0000A2B100000000 AS DateTime), N'approved', CAST(0x0000A2B300000000 AS DateTime), 3, 3, N'', CAST(0x0000A2B500C69EE7 AS DateTime), NULL, NULL)
INSERT [dbo].[EmployeeLeaveRequest] ([EmployeeLeaveRequestID], [EmployeeID], [LeaveTypeID], [LeaveReason], [FromDate], [Status], [ToDate], [ActualDate], [AssignedDate], [LeaveDetectionReason], [CreateDate], [HalfDay], [Cancel]) VALUES (N'de748519-8e74-4104-b860-feaff722ee2e', N'6fdc4b80-8ae6-4b97-a068-a66a6c230623', N'b1ec6a94-dce1-4b01-a3a2-d5388cbc6c15', NULL, CAST(0x0000A29E00000000 AS DateTime), N'approved', CAST(0x0000A29E00000000 AS DateTime), 1, 1, NULL, CAST(0x0000A29D01358D45 AS DateTime), 1, NULL)
/****** Object:  Table [dbo].[EmployeeHoildays]    Script Date: 02/04/2014 12:06:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeHoildays](
	[EmployeeHoildayID] [uniqueidentifier] NOT NULL,
	[EmpID] [uniqueidentifier] NULL,
	[HolidayID] [uniqueidentifier] NULL,
 CONSTRAINT [PK_EmployeeHoilday] PRIMARY KEY CLUSTERED 
(
	[EmployeeHoildayID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[EmployeeHoildays] ([EmployeeHoildayID], [EmpID], [HolidayID]) VALUES (N'25469165-ac08-48c6-a507-003e19a16079', N'20250795-00e5-4355-b986-e2f3f6f9e07f', N'3e34a88a-c249-45e5-b0f6-939806945be2')
INSERT [dbo].[EmployeeHoildays] ([EmployeeHoildayID], [EmpID], [HolidayID]) VALUES (N'eac573cf-e504-4d39-97d6-01811cc95438', N'770acc2b-d5d4-4c57-ab57-7a3451f8a86c', N'362e8162-ec9e-4eae-9470-eea8e7f5f27e')
INSERT [dbo].[EmployeeHoildays] ([EmployeeHoildayID], [EmpID], [HolidayID]) VALUES (N'2d53f718-be23-444e-a1d8-024c5f12bbd7', N'b0218d84-1700-4efa-a743-2e86f4e7feac', N'c3408338-56f5-4d78-a6f0-6915d382bbdf')
INSERT [dbo].[EmployeeHoildays] ([EmployeeHoildayID], [EmpID], [HolidayID]) VALUES (N'f21589e3-3d37-4089-b167-0414ad18db67', N'62995f97-51be-4353-bd83-0745e5f24f07', N'3e34a88a-c249-45e5-b0f6-939806945be2')
INSERT [dbo].[EmployeeHoildays] ([EmployeeHoildayID], [EmpID], [HolidayID]) VALUES (N'4b4c49a8-731d-4582-b481-04c57c1e669e', N'62995f97-51be-4353-bd83-0745e5f24f07', N'e69fbb03-1c27-4aa8-a79b-55b459286bb5')
INSERT [dbo].[EmployeeHoildays] ([EmployeeHoildayID], [EmpID], [HolidayID]) VALUES (N'36387a2f-db72-454e-8ae9-05e4aba9c977', N'b0218d84-1700-4efa-a743-2e86f4e7feac', N'6c849f7c-7960-4d5a-9245-3639abe08e66')
INSERT [dbo].[EmployeeHoildays] ([EmployeeHoildayID], [EmpID], [HolidayID]) VALUES (N'e9b286c2-c7fd-4339-9c9b-06c10159b49e', N'd448c4b5-8f24-42fa-8308-9c2e4fdb3de4', N'5458917a-5257-4d64-8810-2be6632a3c53')
INSERT [dbo].[EmployeeHoildays] ([EmployeeHoildayID], [EmpID], [HolidayID]) VALUES (N'9afd4757-2f52-481b-a9ba-06d741fed92b', N'6fdc4b80-8ae6-4b97-a068-a66a6c230623', N'a49e4f64-1130-428c-8b58-551cdb5a30ca')
INSERT [dbo].[EmployeeHoildays] ([EmployeeHoildayID], [EmpID], [HolidayID]) VALUES (N'60508f67-c712-4cf6-ae11-0a5a0e7badad', N'62995f97-51be-4353-bd83-0745e5f24f07', N'482d881c-3af6-40bd-bfca-5d6b80a7267d')
INSERT [dbo].[EmployeeHoildays] ([EmployeeHoildayID], [EmpID], [HolidayID]) VALUES (N'f7cb67be-d9bb-4bcc-9e55-0b71ed78d2fb', N'5af736f6-c404-47b2-92cb-81c890441f7f', N'bd334efe-f112-4b4a-9f74-4b0101d5d007')
INSERT [dbo].[EmployeeHoildays] ([EmployeeHoildayID], [EmpID], [HolidayID]) VALUES (N'00c0dd34-0147-4cdd-b58b-0c9843ccd524', N'6fdc4b80-8ae6-4b97-a068-a66a6c230623', N'bd334efe-f112-4b4a-9f74-4b0101d5d007')
INSERT [dbo].[EmployeeHoildays] ([EmployeeHoildayID], [EmpID], [HolidayID]) VALUES (N'6be6529f-f24c-4847-81a4-10f005989144', N'720d8341-ae54-4d06-b92e-652c25c7cf1e', N'1abbb23e-8d3d-435d-9eec-96bb818a270e')
INSERT [dbo].[EmployeeHoildays] ([EmployeeHoildayID], [EmpID], [HolidayID]) VALUES (N'001e057e-bcf9-4690-81c0-118591064f93', N'62995f97-51be-4353-bd83-0745e5f24f07', N'b9324131-6b19-4b19-aed5-52bb1ad34d4a')
INSERT [dbo].[EmployeeHoildays] ([EmployeeHoildayID], [EmpID], [HolidayID]) VALUES (N'0397a5a9-3d67-4ea6-aa8a-119afe14ba64', N'd448c4b5-8f24-42fa-8308-9c2e4fdb3de4', N'482d881c-3af6-40bd-bfca-5d6b80a7267d')
INSERT [dbo].[EmployeeHoildays] ([EmployeeHoildayID], [EmpID], [HolidayID]) VALUES (N'2d255e2c-e803-405f-b89e-12f5c57aedac', N'770acc2b-d5d4-4c57-ab57-7a3451f8a86c', N'25a08ddd-7bb9-450f-90f7-ba726efeafd8')
INSERT [dbo].[EmployeeHoildays] ([EmployeeHoildayID], [EmpID], [HolidayID]) VALUES (N'b2ddf994-7b4b-463b-a550-1d6025b2a554', N'62995f97-51be-4353-bd83-0745e5f24f07', N'a49e4f64-1130-428c-8b58-551cdb5a30ca')
INSERT [dbo].[EmployeeHoildays] ([EmployeeHoildayID], [EmpID], [HolidayID]) VALUES (N'877c5747-fbba-4df6-b254-1e05cdc8ac62', N'd448c4b5-8f24-42fa-8308-9c2e4fdb3de4', N'b61cc77f-37aa-4eb8-9d44-9a1bd38f66ff')
INSERT [dbo].[EmployeeHoildays] ([EmployeeHoildayID], [EmpID], [HolidayID]) VALUES (N'deded6d4-62bb-4d40-8e16-1ea7a9d8430f', N'20250795-00e5-4355-b986-e2f3f6f9e07e', N'5458917a-5257-4d64-8810-2be6632a3c53')
INSERT [dbo].[EmployeeHoildays] ([EmployeeHoildayID], [EmpID], [HolidayID]) VALUES (N'5b3994c1-de91-479a-a776-212a4023aaa2', N'f0250795-00e5-4355-b986-e2f3f6f9e07a', N'c82d2b6c-59db-49ad-96c0-9a91e78efd48')
INSERT [dbo].[EmployeeHoildays] ([EmployeeHoildayID], [EmpID], [HolidayID]) VALUES (N'91c5ba08-f5e6-4e64-a9eb-22d89054902b', N'20250795-00e5-4355-b986-e2f3f6f9e07e', N'f126981e-8df5-4944-a5ee-15d6f9d6c5b2')
INSERT [dbo].[EmployeeHoildays] ([EmployeeHoildayID], [EmpID], [HolidayID]) VALUES (N'22671dae-e0b2-443a-b4fa-23689bc8e421', N'20250795-00e5-4355-b986-e2f3f6f9e07e', N'd94e4fbd-34c5-47ce-9fa5-28563e32b64c')
INSERT [dbo].[EmployeeHoildays] ([EmployeeHoildayID], [EmpID], [HolidayID]) VALUES (N'd9aa1c9f-15f7-418a-ac68-252839c625c4', N'd44eea62-6415-4c75-af42-8888760e8bf4', N'c3408338-56f5-4d78-a6f0-6915d382bbdf')
INSERT [dbo].[EmployeeHoildays] ([EmployeeHoildayID], [EmpID], [HolidayID]) VALUES (N'ad9fd0d7-bf8b-46f7-a58e-26b674ca025f', N'd44eea62-6415-4c75-af42-8888760e8bf4', N'3e34a88a-c249-45e5-b0f6-939806945be2')
INSERT [dbo].[EmployeeHoildays] ([EmployeeHoildayID], [EmpID], [HolidayID]) VALUES (N'ade03292-cf7a-40d1-9094-28d536201593', N'62995f97-51be-4353-bd83-0745e5f24f07', N'2f53d736-09bf-4057-9890-bd09bb87b538')
INSERT [dbo].[EmployeeHoildays] ([EmployeeHoildayID], [EmpID], [HolidayID]) VALUES (N'5488a491-c09f-4530-bfe3-296567647b9d', N'20250795-00e5-4355-b986-e2f3f6f9e07e', N'fe03f200-2b93-4c9f-9881-074285eb8b83')
INSERT [dbo].[EmployeeHoildays] ([EmployeeHoildayID], [EmpID], [HolidayID]) VALUES (N'979622cf-3ae9-461b-b948-2cedbaf1c7f5', N'f3603335-129c-4f6c-9cdd-3268a29a505a', N'5458917a-5257-4d64-8810-2be6632a3c53')
INSERT [dbo].[EmployeeHoildays] ([EmployeeHoildayID], [EmpID], [HolidayID]) VALUES (N'5540d371-85f4-4e99-b326-2d68cbae9ce1', N'd448c4b5-8f24-42fa-8308-9c2e4fdb3de4', N'3e34a88a-c249-45e5-b0f6-939806945be2')
INSERT [dbo].[EmployeeHoildays] ([EmployeeHoildayID], [EmpID], [HolidayID]) VALUES (N'b570cecc-a914-4023-84e8-2d95a7f191d8', N'62995f97-51be-4353-bd83-0745e5f24f07', N'c3408338-56f5-4d78-a6f0-6915d382bbdf')
INSERT [dbo].[EmployeeHoildays] ([EmployeeHoildayID], [EmpID], [HolidayID]) VALUES (N'd4aa5008-b9da-4904-b1c0-2ee1409fe0a2', N'720d8341-ae54-4d06-b92e-652c25c7cf1e', N'7432373c-9057-4994-b7e0-08d93c25d6f9')
INSERT [dbo].[EmployeeHoildays] ([EmployeeHoildayID], [EmpID], [HolidayID]) VALUES (N'498f4272-7f28-43de-a9a5-304b9218fc2e', N'd44eea62-6415-4c75-af42-8888760e8bf4', N'd94e4fbd-34c5-47ce-9fa5-28563e32b64c')
INSERT [dbo].[EmployeeHoildays] ([EmployeeHoildayID], [EmpID], [HolidayID]) VALUES (N'8ac064fe-509b-47ed-9f71-3250913e4f3b', N'd448c4b5-8f24-42fa-8308-9c2e4fdb3de4', N'6c849f7c-7960-4d5a-9245-3639abe08e66')
INSERT [dbo].[EmployeeHoildays] ([EmployeeHoildayID], [EmpID], [HolidayID]) VALUES (N'49f56ce2-fbca-465f-92b5-3587d14ea8d1', N'e23b88c4-fa7a-481e-b0e7-f372cb7b52d2', N'f126981e-8df5-4944-a5ee-15d6f9d6c5b2')
INSERT [dbo].[EmployeeHoildays] ([EmployeeHoildayID], [EmpID], [HolidayID]) VALUES (N'3bc52c0b-a7fb-4de8-ab6e-37ccc05d3c4b', N'e23b88c4-fa7a-481e-b0e7-f372cb7b52d2', N'9fb5bfc6-861b-48e9-a114-999ade049ee2')
INSERT [dbo].[EmployeeHoildays] ([EmployeeHoildayID], [EmpID], [HolidayID]) VALUES (N'1e79828b-658c-4265-ab08-37fba095f8f8', N'62995f97-51be-4353-bd83-0745e5f24f07', N'fe03f200-2b93-4c9f-9881-074285eb8b83')
INSERT [dbo].[EmployeeHoildays] ([EmployeeHoildayID], [EmpID], [HolidayID]) VALUES (N'4ce9cc4e-4e8c-43c9-b674-383f9cccb2ad', N'720d8341-ae54-4d06-b92e-652c25c7cf1e', N'482d881c-3af6-40bd-bfca-5d6b80a7267d')
INSERT [dbo].[EmployeeHoildays] ([EmployeeHoildayID], [EmpID], [HolidayID]) VALUES (N'f3c01be4-a5a9-41f4-a187-38ba4e44c771', N'f0250795-00e5-4355-b986-e2f3f6f9e07a', N'3e34a88a-c249-45e5-b0f6-939806945be2')
INSERT [dbo].[EmployeeHoildays] ([EmployeeHoildayID], [EmpID], [HolidayID]) VALUES (N'48430427-c336-4408-89de-3a08a10b978d', N'770acc2b-d5d4-4c57-ab57-7a3451f8a86c', N'a824885b-f59c-4559-a939-3dbf335fc4f9')
INSERT [dbo].[EmployeeHoildays] ([EmployeeHoildayID], [EmpID], [HolidayID]) VALUES (N'008477fd-2d50-4066-8478-3cc610c3df5d', N'e23b88c4-fa7a-481e-b0e7-f372cb7b52d2', N'362e8162-ec9e-4eae-9470-eea8e7f5f27e')
INSERT [dbo].[EmployeeHoildays] ([EmployeeHoildayID], [EmpID], [HolidayID]) VALUES (N'8e45f923-115c-4270-9c54-3cd0568f5cae', N'f3603335-129c-4f6c-9cdd-3268a29a505a', N'a824885b-f59c-4559-a939-3dbf335fc4f9')
INSERT [dbo].[EmployeeHoildays] ([EmployeeHoildayID], [EmpID], [HolidayID]) VALUES (N'c4e5f6fd-7544-4742-8e52-3cd1912f32a7', N'd44eea62-6415-4c75-af42-8888760e8bf4', N'f7eb2c29-6f9e-464a-ab58-11df6ea55d7e')
INSERT [dbo].[EmployeeHoildays] ([EmployeeHoildayID], [EmpID], [HolidayID]) VALUES (N'bb53dad8-b50d-4fae-8420-3ec89bdf692f', N'20250795-00e5-4355-b986-e2f3f6f9e07e', N'94221f40-340f-4510-9162-685d4709d472')
INSERT [dbo].[EmployeeHoildays] ([EmployeeHoildayID], [EmpID], [HolidayID]) VALUES (N'fe92f137-1f65-48f8-82c7-3fcf89facb6d', N'62995f97-51be-4353-bd83-0745e5f24f07', N'5458917a-5257-4d64-8810-2be6632a3c53')
INSERT [dbo].[EmployeeHoildays] ([EmployeeHoildayID], [EmpID], [HolidayID]) VALUES (N'd5c177fe-d064-42c2-bfef-4430a7c13901', N'770acc2b-d5d4-4c57-ab57-7a3451f8a86c', N'2f53d736-09bf-4057-9890-bd09bb87b538')
INSERT [dbo].[EmployeeHoildays] ([EmployeeHoildayID], [EmpID], [HolidayID]) VALUES (N'f30bbf98-f552-40ef-96f2-456367e5f93b', N'd448c4b5-8f24-42fa-8308-9c2e4fdb3de4', N'a49e4f64-1130-428c-8b58-551cdb5a30ca')
INSERT [dbo].[EmployeeHoildays] ([EmployeeHoildayID], [EmpID], [HolidayID]) VALUES (N'0381f915-c3fc-4a84-bb1a-48a287cdbf2e', N'd448c4b5-8f24-42fa-8308-9c2e4fdb3de4', N'b9324131-6b19-4b19-aed5-52bb1ad34d4a')
INSERT [dbo].[EmployeeHoildays] ([EmployeeHoildayID], [EmpID], [HolidayID]) VALUES (N'd06b2de9-ac1e-427f-9a7c-48fd29367e7e', N'd44eea62-6415-4c75-af42-8888760e8bf4', N'a49e4f64-1130-428c-8b58-551cdb5a30ca')
INSERT [dbo].[EmployeeHoildays] ([EmployeeHoildayID], [EmpID], [HolidayID]) VALUES (N'8a0fa25c-ab80-4f1a-afee-4b0de9f4020f', N'20250795-00e5-4355-b986-e2f3f6f9e07f', N'1abbb23e-8d3d-435d-9eec-96bb818a270e')
INSERT [dbo].[EmployeeHoildays] ([EmployeeHoildayID], [EmpID], [HolidayID]) VALUES (N'3add55e0-c5e2-4f44-8208-4efe0ab9b192', N'f3603335-129c-4f6c-9cdd-3268a29a505a', N'b9324131-6b19-4b19-aed5-52bb1ad34d4a')
INSERT [dbo].[EmployeeHoildays] ([EmployeeHoildayID], [EmpID], [HolidayID]) VALUES (N'4717ee09-1698-4bd5-a751-52c6028568af', N'f0250795-00e5-4355-b986-e2f3f6f9e07a', N'f7eb2c29-6f9e-464a-ab58-11df6ea55d7e')
INSERT [dbo].[EmployeeHoildays] ([EmployeeHoildayID], [EmpID], [HolidayID]) VALUES (N'8fd8f58f-e665-4b91-9fb0-55363a444ef9', N'd448c4b5-8f24-42fa-8308-9c2e4fdb3de4', N'c3408338-56f5-4d78-a6f0-6915d382bbdf')
INSERT [dbo].[EmployeeHoildays] ([EmployeeHoildayID], [EmpID], [HolidayID]) VALUES (N'555ec630-36e1-4657-902a-57ac033ffa42', N'62995f97-51be-4353-bd83-0745e5f24f07', N'1abbb23e-8d3d-435d-9eec-96bb818a270e')
INSERT [dbo].[EmployeeHoildays] ([EmployeeHoildayID], [EmpID], [HolidayID]) VALUES (N'd7e35d53-7b9b-42af-8cc1-58bc1baea35e', N'20250795-00e5-4355-b986-e2f3f6f9e07e', N'caf2457f-534b-4a29-b5b4-2f74a24baa51')
INSERT [dbo].[EmployeeHoildays] ([EmployeeHoildayID], [EmpID], [HolidayID]) VALUES (N'0c9dfc35-78c6-4d5f-ad05-59a62ac64b7f', N'20250795-00e5-4355-b986-e2f3f6f9e07e', N'482d881c-3af6-40bd-bfca-5d6b80a7267d')
INSERT [dbo].[EmployeeHoildays] ([EmployeeHoildayID], [EmpID], [HolidayID]) VALUES (N'f160e392-80dc-4117-ad6b-5c2873ca3341', N'f3603335-129c-4f6c-9cdd-3268a29a505a', N'caf2457f-534b-4a29-b5b4-2f74a24baa51')
INSERT [dbo].[EmployeeHoildays] ([EmployeeHoildayID], [EmpID], [HolidayID]) VALUES (N'5ad6e35f-c8ea-447e-9ac2-5d8ee8e6644d', N'20250795-00e5-4355-b986-e2f3f6f9e07e', N'7432373c-9057-4994-b7e0-08d93c25d6f9')
INSERT [dbo].[EmployeeHoildays] ([EmployeeHoildayID], [EmpID], [HolidayID]) VALUES (N'fbde7b5c-d07a-480d-a144-5f86271b74d1', N'62995f97-51be-4353-bd83-0745e5f24f07', N'c82d2b6c-59db-49ad-96c0-9a91e78efd48')
INSERT [dbo].[EmployeeHoildays] ([EmployeeHoildayID], [EmpID], [HolidayID]) VALUES (N'4f129cd1-ed32-4f7e-aac7-5fae51c2a1dc', N'20250795-00e5-4355-b986-e2f3f6f9e07f', N'6c849f7c-7960-4d5a-9245-3639abe08e66')
INSERT [dbo].[EmployeeHoildays] ([EmployeeHoildayID], [EmpID], [HolidayID]) VALUES (N'b80fedb6-f7c8-4d35-955e-63d1030c203a', N'd448c4b5-8f24-42fa-8308-9c2e4fdb3de4', N'a824885b-f59c-4559-a939-3dbf335fc4f9')
INSERT [dbo].[EmployeeHoildays] ([EmployeeHoildayID], [EmpID], [HolidayID]) VALUES (N'af7c9206-9175-44d1-b97b-64ccb8163698', N'f0250795-00e5-4355-b986-e2f3f6f9e07a', N'6c849f7c-7960-4d5a-9245-3639abe08e66')
INSERT [dbo].[EmployeeHoildays] ([EmployeeHoildayID], [EmpID], [HolidayID]) VALUES (N'173ee950-03df-4616-a2e4-6772410fb6f5', N'5af736f6-c404-47b2-92cb-81c890441f7f', N'a49e4f64-1130-428c-8b58-551cdb5a30ca')
INSERT [dbo].[EmployeeHoildays] ([EmployeeHoildayID], [EmpID], [HolidayID]) VALUES (N'b302ff5b-192b-470b-adf9-6810690bcf33', N'770acc2b-d5d4-4c57-ab57-7a3451f8a86c', N'b9324131-6b19-4b19-aed5-52bb1ad34d4a')
INSERT [dbo].[EmployeeHoildays] ([EmployeeHoildayID], [EmpID], [HolidayID]) VALUES (N'fab7e534-74e7-4f87-b0e6-6a53ce8f1fdb', N'5af736f6-c404-47b2-92cb-81c890441f7f', N'f7eb2c29-6f9e-464a-ab58-11df6ea55d7e')
INSERT [dbo].[EmployeeHoildays] ([EmployeeHoildayID], [EmpID], [HolidayID]) VALUES (N'b7bc0698-8f1e-476b-ac61-6d1087b010eb', N'770acc2b-d5d4-4c57-ab57-7a3451f8a86c', N'94221f40-340f-4510-9162-685d4709d472')
INSERT [dbo].[EmployeeHoildays] ([EmployeeHoildayID], [EmpID], [HolidayID]) VALUES (N'fe7e6ea7-13d3-49c3-b524-6dcaf8a284ff', N'b0218d84-1700-4efa-a743-2e86f4e7feac', N'3e34a88a-c249-45e5-b0f6-939806945be2')
INSERT [dbo].[EmployeeHoildays] ([EmployeeHoildayID], [EmpID], [HolidayID]) VALUES (N'5df70b29-22ef-4894-a9b4-6e4fb63b360f', N'b0218d84-1700-4efa-a743-2e86f4e7feac', N'1abbb23e-8d3d-435d-9eec-96bb818a270e')
INSERT [dbo].[EmployeeHoildays] ([EmployeeHoildayID], [EmpID], [HolidayID]) VALUES (N'f023d0ec-2297-4ca7-a349-6f85d091480d', N'd448c4b5-8f24-42fa-8308-9c2e4fdb3de4', N'1abbb23e-8d3d-435d-9eec-96bb818a270e')
INSERT [dbo].[EmployeeHoildays] ([EmployeeHoildayID], [EmpID], [HolidayID]) VALUES (N'612d6aff-1224-4c61-a251-6fb4b0ea1b09', N'e23b88c4-fa7a-481e-b0e7-f372cb7b52d2', N'7432373c-9057-4994-b7e0-08d93c25d6f9')
INSERT [dbo].[EmployeeHoildays] ([EmployeeHoildayID], [EmpID], [HolidayID]) VALUES (N'ebd64376-0578-4af8-ac0e-70a89432d094', N'6fdc4b80-8ae6-4b97-a068-a66a6c230623', N'5458917a-5257-4d64-8810-2be6632a3c53')
INSERT [dbo].[EmployeeHoildays] ([EmployeeHoildayID], [EmpID], [HolidayID]) VALUES (N'079f17c3-ee11-45a0-a3ba-7234228fb42d', N'd44eea62-6415-4c75-af42-8888760e8bf4', N'6c849f7c-7960-4d5a-9245-3639abe08e66')
INSERT [dbo].[EmployeeHoildays] ([EmployeeHoildayID], [EmpID], [HolidayID]) VALUES (N'169e9801-4baf-460c-b431-74d563b2bdec', N'5af736f6-c404-47b2-92cb-81c890441f7f', N'c3408338-56f5-4d78-a6f0-6915d382bbdf')
INSERT [dbo].[EmployeeHoildays] ([EmployeeHoildayID], [EmpID], [HolidayID]) VALUES (N'cb4dc48e-485b-49a3-9116-74db7e292d49', N'f3603335-129c-4f6c-9cdd-3268a29a505a', N'25a08ddd-7bb9-450f-90f7-ba726efeafd8')
INSERT [dbo].[EmployeeHoildays] ([EmployeeHoildayID], [EmpID], [HolidayID]) VALUES (N'ee52083b-a91c-47b6-bcf9-76174275b8e3', N'f3603335-129c-4f6c-9cdd-3268a29a505a', N'482d881c-3af6-40bd-bfca-5d6b80a7267d')
INSERT [dbo].[EmployeeHoildays] ([EmployeeHoildayID], [EmpID], [HolidayID]) VALUES (N'151c73e6-b021-4f4c-b5c5-779553d04038', N'20250795-00e5-4355-b986-e2f3f6f9e07f', N'bd334efe-f112-4b4a-9f74-4b0101d5d007')
INSERT [dbo].[EmployeeHoildays] ([EmployeeHoildayID], [EmpID], [HolidayID]) VALUES (N'da6c3c9f-2348-4a47-bada-788302229f2c', N'770acc2b-d5d4-4c57-ab57-7a3451f8a86c', N'9fb5bfc6-861b-48e9-a114-999ade049ee2')
INSERT [dbo].[EmployeeHoildays] ([EmployeeHoildayID], [EmpID], [HolidayID]) VALUES (N'ff967ad5-2cef-40f2-8144-7891eff42b49', N'f3603335-129c-4f6c-9cdd-3268a29a505a', N'd94e4fbd-34c5-47ce-9fa5-28563e32b64c')
INSERT [dbo].[EmployeeHoildays] ([EmployeeHoildayID], [EmpID], [HolidayID]) VALUES (N'88e16b43-5a13-48ab-bd16-793939130ad5', N'f3603335-129c-4f6c-9cdd-3268a29a505a', N'7432373c-9057-4994-b7e0-08d93c25d6f9')
INSERT [dbo].[EmployeeHoildays] ([EmployeeHoildayID], [EmpID], [HolidayID]) VALUES (N'c36166cc-37bf-4acb-acb3-7ce157dc57ca', N'720d8341-ae54-4d06-b92e-652c25c7cf1e', N'c82d2b6c-59db-49ad-96c0-9a91e78efd48')
INSERT [dbo].[EmployeeHoildays] ([EmployeeHoildayID], [EmpID], [HolidayID]) VALUES (N'0986c16e-ae6a-4eb6-9d89-7e1c1d378fbd', N'720d8341-ae54-4d06-b92e-652c25c7cf1e', N'08afffaa-559f-4531-9cfc-846b6e1398d4')
INSERT [dbo].[EmployeeHoildays] ([EmployeeHoildayID], [EmpID], [HolidayID]) VALUES (N'cde98ac2-61c3-4fbd-b0fb-7ea76ab2ead0', N'e23b88c4-fa7a-481e-b0e7-f372cb7b52d2', N'94221f40-340f-4510-9162-685d4709d472')
INSERT [dbo].[EmployeeHoildays] ([EmployeeHoildayID], [EmpID], [HolidayID]) VALUES (N'f69e1c83-9912-4317-8612-7ed05807c725', N'd44eea62-6415-4c75-af42-8888760e8bf4', N'1abbb23e-8d3d-435d-9eec-96bb818a270e')
INSERT [dbo].[EmployeeHoildays] ([EmployeeHoildayID], [EmpID], [HolidayID]) VALUES (N'3aba7439-e47b-48c1-824c-7ff270231f36', N'720d8341-ae54-4d06-b92e-652c25c7cf1e', N'3e34a88a-c249-45e5-b0f6-939806945be2')
INSERT [dbo].[EmployeeHoildays] ([EmployeeHoildayID], [EmpID], [HolidayID]) VALUES (N'6b85139b-7a05-4e04-8e0f-81263a046e8e', N'720d8341-ae54-4d06-b92e-652c25c7cf1e', N'a49e4f64-1130-428c-8b58-551cdb5a30ca')
INSERT [dbo].[EmployeeHoildays] ([EmployeeHoildayID], [EmpID], [HolidayID]) VALUES (N'27e02fe7-0e4d-4cb8-8782-812fd52cbebf', N'6fdc4b80-8ae6-4b97-a068-a66a6c230623', N'f7eb2c29-6f9e-464a-ab58-11df6ea55d7e')
INSERT [dbo].[EmployeeHoildays] ([EmployeeHoildayID], [EmpID], [HolidayID]) VALUES (N'b2bcc6ef-df07-4d32-8a51-81dd50f1ee14', N'720d8341-ae54-4d06-b92e-652c25c7cf1e', N'6c849f7c-7960-4d5a-9245-3639abe08e66')
INSERT [dbo].[EmployeeHoildays] ([EmployeeHoildayID], [EmpID], [HolidayID]) VALUES (N'879cc96f-04b7-4237-af3a-8425d0c3f603', N'b0218d84-1700-4efa-a743-2e86f4e7feac', N'f7eb2c29-6f9e-464a-ab58-11df6ea55d7e')
INSERT [dbo].[EmployeeHoildays] ([EmployeeHoildayID], [EmpID], [HolidayID]) VALUES (N'2ba1165b-d8dc-47cc-ab8e-8a40ba922f9c', N'20250795-00e5-4355-b986-e2f3f6f9e07f', N'c3408338-56f5-4d78-a6f0-6915d382bbdf')
INSERT [dbo].[EmployeeHoildays] ([EmployeeHoildayID], [EmpID], [HolidayID]) VALUES (N'0eda0add-fe97-4da2-8b8f-8ac91ca575c1', N'b0218d84-1700-4efa-a743-2e86f4e7feac', N'a49e4f64-1130-428c-8b58-551cdb5a30ca')
INSERT [dbo].[EmployeeHoildays] ([EmployeeHoildayID], [EmpID], [HolidayID]) VALUES (N'91056882-b1ba-47fb-93ea-8dbd92892e84', N'20250795-00e5-4355-b986-e2f3f6f9e07e', N'362e8162-ec9e-4eae-9470-eea8e7f5f27e')
INSERT [dbo].[EmployeeHoildays] ([EmployeeHoildayID], [EmpID], [HolidayID]) VALUES (N'64358c1b-fcf0-41cd-9012-8f984694aaaf', N'20250795-00e5-4355-b986-e2f3f6f9e07e', N'b9324131-6b19-4b19-aed5-52bb1ad34d4a')
INSERT [dbo].[EmployeeHoildays] ([EmployeeHoildayID], [EmpID], [HolidayID]) VALUES (N'3fc82874-04f1-405c-9ed2-90a2e132dd85', N'20250795-00e5-4355-b986-e2f3f6f9e07f', N'08afffaa-559f-4531-9cfc-846b6e1398d4')
INSERT [dbo].[EmployeeHoildays] ([EmployeeHoildayID], [EmpID], [HolidayID]) VALUES (N'a08f5c44-93c9-4c32-8910-920dc8e44a0b', N'62995f97-51be-4353-bd83-0745e5f24f07', N'b61cc77f-37aa-4eb8-9d44-9a1bd38f66ff')
INSERT [dbo].[EmployeeHoildays] ([EmployeeHoildayID], [EmpID], [HolidayID]) VALUES (N'fb25bcd3-ee04-49c0-a73a-92e091f6abc1', N'd44eea62-6415-4c75-af42-8888760e8bf4', N'482d881c-3af6-40bd-bfca-5d6b80a7267d')
INSERT [dbo].[EmployeeHoildays] ([EmployeeHoildayID], [EmpID], [HolidayID]) VALUES (N'a98a9f48-b667-4c1f-a073-944d75a7e43a', N'f0250795-00e5-4355-b986-e2f3f6f9e07a', N'08afffaa-559f-4531-9cfc-846b6e1398d4')
INSERT [dbo].[EmployeeHoildays] ([EmployeeHoildayID], [EmpID], [HolidayID]) VALUES (N'0dbca6c8-b659-4dec-8fc6-964cee4f7f08', N'd44eea62-6415-4c75-af42-8888760e8bf4', N'fe03f200-2b93-4c9f-9881-074285eb8b83')
INSERT [dbo].[EmployeeHoildays] ([EmployeeHoildayID], [EmpID], [HolidayID]) VALUES (N'6d892633-a579-4d75-8947-966cc4749b20', N'20250795-00e5-4355-b986-e2f3f6f9e07f', N'c82d2b6c-59db-49ad-96c0-9a91e78efd48')
INSERT [dbo].[EmployeeHoildays] ([EmployeeHoildayID], [EmpID], [HolidayID]) VALUES (N'fed9c38a-f46a-4fc4-bbca-96e508ccb495', N'f3603335-129c-4f6c-9cdd-3268a29a505a', N'362e8162-ec9e-4eae-9470-eea8e7f5f27e')
INSERT [dbo].[EmployeeHoildays] ([EmployeeHoildayID], [EmpID], [HolidayID]) VALUES (N'7a207d97-8043-43c4-b293-98263d02f1a8', N'770acc2b-d5d4-4c57-ab57-7a3451f8a86c', N'f126981e-8df5-4944-a5ee-15d6f9d6c5b2')
INSERT [dbo].[EmployeeHoildays] ([EmployeeHoildayID], [EmpID], [HolidayID]) VALUES (N'e40211d2-77eb-4af9-91b4-9838249d4902', N'5af736f6-c404-47b2-92cb-81c890441f7f', N'3e34a88a-c249-45e5-b0f6-939806945be2')
INSERT [dbo].[EmployeeHoildays] ([EmployeeHoildayID], [EmpID], [HolidayID]) VALUES (N'dc73b413-82a7-417e-9907-98a7991bfe3b', N'62995f97-51be-4353-bd83-0745e5f24f07', N'bd334efe-f112-4b4a-9f74-4b0101d5d007')
INSERT [dbo].[EmployeeHoildays] ([EmployeeHoildayID], [EmpID], [HolidayID]) VALUES (N'adf3dc52-ce13-4679-87d9-9a2f9e53d892', N'f0250795-00e5-4355-b986-e2f3f6f9e07a', N'bd334efe-f112-4b4a-9f74-4b0101d5d007')
INSERT [dbo].[EmployeeHoildays] ([EmployeeHoildayID], [EmpID], [HolidayID]) VALUES (N'0308d6ee-b1d0-4561-9141-9bc69ea25b8c', N'720d8341-ae54-4d06-b92e-652c25c7cf1e', N'c3408338-56f5-4d78-a6f0-6915d382bbdf')
GO
print 'Processed 100 total records'
INSERT [dbo].[EmployeeHoildays] ([EmployeeHoildayID], [EmpID], [HolidayID]) VALUES (N'a8dc336c-f22b-4bf0-afe7-9d8a8bb9976c', N'720d8341-ae54-4d06-b92e-652c25c7cf1e', N'f7eb2c29-6f9e-464a-ab58-11df6ea55d7e')
INSERT [dbo].[EmployeeHoildays] ([EmployeeHoildayID], [EmpID], [HolidayID]) VALUES (N'8882c5d8-e418-41d2-b2f1-9e989a515ed7', N'6fdc4b80-8ae6-4b97-a068-a66a6c230623', N'08afffaa-559f-4531-9cfc-846b6e1398d4')
INSERT [dbo].[EmployeeHoildays] ([EmployeeHoildayID], [EmpID], [HolidayID]) VALUES (N'b7dffcc7-6c75-41da-9e49-a0e1fbc6c7ca', N'770acc2b-d5d4-4c57-ab57-7a3451f8a86c', N'482d881c-3af6-40bd-bfca-5d6b80a7267d')
INSERT [dbo].[EmployeeHoildays] ([EmployeeHoildayID], [EmpID], [HolidayID]) VALUES (N'7c25d4d4-14d3-4494-9c1d-a0fbfc17e6f0', N'd44eea62-6415-4c75-af42-8888760e8bf4', N'5458917a-5257-4d64-8810-2be6632a3c53')
INSERT [dbo].[EmployeeHoildays] ([EmployeeHoildayID], [EmpID], [HolidayID]) VALUES (N'9e26e00c-a0e5-42da-933f-a2ddb1350446', N'e23b88c4-fa7a-481e-b0e7-f372cb7b52d2', N'327a471c-1c43-4842-8fbe-5ee2045e80b0')
INSERT [dbo].[EmployeeHoildays] ([EmployeeHoildayID], [EmpID], [HolidayID]) VALUES (N'85435dcd-142e-4e55-9886-a3961c695539', N'770acc2b-d5d4-4c57-ab57-7a3451f8a86c', N'5458917a-5257-4d64-8810-2be6632a3c53')
INSERT [dbo].[EmployeeHoildays] ([EmployeeHoildayID], [EmpID], [HolidayID]) VALUES (N'65a80337-ff65-4486-b8f4-a46d81082e65', N'f3603335-129c-4f6c-9cdd-3268a29a505a', N'b61cc77f-37aa-4eb8-9d44-9a1bd38f66ff')
INSERT [dbo].[EmployeeHoildays] ([EmployeeHoildayID], [EmpID], [HolidayID]) VALUES (N'af0cff6b-ebca-47c0-a829-a5de51c1dc47', N'6fdc4b80-8ae6-4b97-a068-a66a6c230623', N'1abbb23e-8d3d-435d-9eec-96bb818a270e')
INSERT [dbo].[EmployeeHoildays] ([EmployeeHoildayID], [EmpID], [HolidayID]) VALUES (N'e0210bc8-28db-413c-93dd-a9b6371520fb', N'6fdc4b80-8ae6-4b97-a068-a66a6c230623', N'6c849f7c-7960-4d5a-9245-3639abe08e66')
INSERT [dbo].[EmployeeHoildays] ([EmployeeHoildayID], [EmpID], [HolidayID]) VALUES (N'aaab95ec-aaf7-4289-94bc-adb4d121934a', N'd448c4b5-8f24-42fa-8308-9c2e4fdb3de4', N'2f53d736-09bf-4057-9890-bd09bb87b538')
INSERT [dbo].[EmployeeHoildays] ([EmployeeHoildayID], [EmpID], [HolidayID]) VALUES (N'32142b6e-238e-4ab2-b82e-af9a309b7cd1', N'b0218d84-1700-4efa-a743-2e86f4e7feac', N'bd334efe-f112-4b4a-9f74-4b0101d5d007')
INSERT [dbo].[EmployeeHoildays] ([EmployeeHoildayID], [EmpID], [HolidayID]) VALUES (N'5d5b7d8d-d4cb-4d2c-bb59-b16d9314e3df', N'770acc2b-d5d4-4c57-ab57-7a3451f8a86c', N'7432373c-9057-4994-b7e0-08d93c25d6f9')
INSERT [dbo].[EmployeeHoildays] ([EmployeeHoildayID], [EmpID], [HolidayID]) VALUES (N'6af2b71d-05e9-4565-aa6c-b3af0efb9a71', N'e23b88c4-fa7a-481e-b0e7-f372cb7b52d2', N'caf2457f-534b-4a29-b5b4-2f74a24baa51')
INSERT [dbo].[EmployeeHoildays] ([EmployeeHoildayID], [EmpID], [HolidayID]) VALUES (N'2d06012b-8212-48e4-9f36-b518ccd521b7', N'6fdc4b80-8ae6-4b97-a068-a66a6c230623', N'b9324131-6b19-4b19-aed5-52bb1ad34d4a')
INSERT [dbo].[EmployeeHoildays] ([EmployeeHoildayID], [EmpID], [HolidayID]) VALUES (N'dd28b16c-34ff-483e-b696-b5570bb70240', N'20250795-00e5-4355-b986-e2f3f6f9e07f', N'a49e4f64-1130-428c-8b58-551cdb5a30ca')
INSERT [dbo].[EmployeeHoildays] ([EmployeeHoildayID], [EmpID], [HolidayID]) VALUES (N'7ea5e5a2-0001-4ee7-8ece-b5d9b1abb29b', N'f0250795-00e5-4355-b986-e2f3f6f9e07a', N'a49e4f64-1130-428c-8b58-551cdb5a30ca')
INSERT [dbo].[EmployeeHoildays] ([EmployeeHoildayID], [EmpID], [HolidayID]) VALUES (N'28f297cc-fb3f-4a30-96fc-ba687851a7ed', N'd448c4b5-8f24-42fa-8308-9c2e4fdb3de4', N'08afffaa-559f-4531-9cfc-846b6e1398d4')
INSERT [dbo].[EmployeeHoildays] ([EmployeeHoildayID], [EmpID], [HolidayID]) VALUES (N'22b72b88-6db8-4b15-a640-bdcdf3126931', N'd448c4b5-8f24-42fa-8308-9c2e4fdb3de4', N'c82d2b6c-59db-49ad-96c0-9a91e78efd48')
INSERT [dbo].[EmployeeHoildays] ([EmployeeHoildayID], [EmpID], [HolidayID]) VALUES (N'96a3798f-6e68-4542-8641-bfcdb6f96f22', N'62995f97-51be-4353-bd83-0745e5f24f07', N'd94e4fbd-34c5-47ce-9fa5-28563e32b64c')
INSERT [dbo].[EmployeeHoildays] ([EmployeeHoildayID], [EmpID], [HolidayID]) VALUES (N'd51a50be-d6b6-47d5-988c-c1464b80daca', N'f3603335-129c-4f6c-9cdd-3268a29a505a', N'9fb5bfc6-861b-48e9-a114-999ade049ee2')
INSERT [dbo].[EmployeeHoildays] ([EmployeeHoildayID], [EmpID], [HolidayID]) VALUES (N'dec23d63-5706-42e6-8610-c1d04b487d2b', N'770acc2b-d5d4-4c57-ab57-7a3451f8a86c', N'caf2457f-534b-4a29-b5b4-2f74a24baa51')
INSERT [dbo].[EmployeeHoildays] ([EmployeeHoildayID], [EmpID], [HolidayID]) VALUES (N'bd3b9aca-8f09-44a4-9a79-c4a655d1f19f', N'770acc2b-d5d4-4c57-ab57-7a3451f8a86c', N'327a471c-1c43-4842-8fbe-5ee2045e80b0')
INSERT [dbo].[EmployeeHoildays] ([EmployeeHoildayID], [EmpID], [HolidayID]) VALUES (N'2028d5a1-9b17-43da-bf89-c5e669546fd4', N'd44eea62-6415-4c75-af42-8888760e8bf4', N'b9324131-6b19-4b19-aed5-52bb1ad34d4a')
INSERT [dbo].[EmployeeHoildays] ([EmployeeHoildayID], [EmpID], [HolidayID]) VALUES (N'38559978-619b-45b8-8f23-c6134472a152', N'd448c4b5-8f24-42fa-8308-9c2e4fdb3de4', N'fe03f200-2b93-4c9f-9881-074285eb8b83')
INSERT [dbo].[EmployeeHoildays] ([EmployeeHoildayID], [EmpID], [HolidayID]) VALUES (N'08dc0d61-7fff-48d7-8a66-c88d9da3b290', N'62995f97-51be-4353-bd83-0745e5f24f07', N'f7eb2c29-6f9e-464a-ab58-11df6ea55d7e')
INSERT [dbo].[EmployeeHoildays] ([EmployeeHoildayID], [EmpID], [HolidayID]) VALUES (N'd804b32e-3a74-4a65-b20a-cd7b630cf170', N'6fdc4b80-8ae6-4b97-a068-a66a6c230623', N'c82d2b6c-59db-49ad-96c0-9a91e78efd48')
INSERT [dbo].[EmployeeHoildays] ([EmployeeHoildayID], [EmpID], [HolidayID]) VALUES (N'9a58f2a3-d0e1-42e9-bf07-cf30b2b1ff37', N'f0250795-00e5-4355-b986-e2f3f6f9e07a', N'1abbb23e-8d3d-435d-9eec-96bb818a270e')
INSERT [dbo].[EmployeeHoildays] ([EmployeeHoildayID], [EmpID], [HolidayID]) VALUES (N'6b714b26-4e88-473d-ad22-cf31f581f42a', N'770acc2b-d5d4-4c57-ab57-7a3451f8a86c', N'd94e4fbd-34c5-47ce-9fa5-28563e32b64c')
INSERT [dbo].[EmployeeHoildays] ([EmployeeHoildayID], [EmpID], [HolidayID]) VALUES (N'4c14dd34-6921-4dd0-ab58-cf51cbbc89f0', N'f3603335-129c-4f6c-9cdd-3268a29a505a', N'327a471c-1c43-4842-8fbe-5ee2045e80b0')
INSERT [dbo].[EmployeeHoildays] ([EmployeeHoildayID], [EmpID], [HolidayID]) VALUES (N'6a03dfa8-4ab7-4309-91f8-d05223839602', N'20250795-00e5-4355-b986-e2f3f6f9e07e', N'327a471c-1c43-4842-8fbe-5ee2045e80b0')
INSERT [dbo].[EmployeeHoildays] ([EmployeeHoildayID], [EmpID], [HolidayID]) VALUES (N'a9c581e6-8a64-479a-98e1-d0a8449ed651', N'62995f97-51be-4353-bd83-0745e5f24f07', N'08afffaa-559f-4531-9cfc-846b6e1398d4')
INSERT [dbo].[EmployeeHoildays] ([EmployeeHoildayID], [EmpID], [HolidayID]) VALUES (N'60010ca8-b117-4e44-9b54-d2325a0ba813', N'5af736f6-c404-47b2-92cb-81c890441f7f', N'6c849f7c-7960-4d5a-9245-3639abe08e66')
INSERT [dbo].[EmployeeHoildays] ([EmployeeHoildayID], [EmpID], [HolidayID]) VALUES (N'36e05a26-ffd3-459d-8a22-d3e23f288182', N'e23b88c4-fa7a-481e-b0e7-f372cb7b52d2', N'25a08ddd-7bb9-450f-90f7-ba726efeafd8')
INSERT [dbo].[EmployeeHoildays] ([EmployeeHoildayID], [EmpID], [HolidayID]) VALUES (N'fde7402e-a456-4bee-8b44-d4fa48e022ae', N'20250795-00e5-4355-b986-e2f3f6f9e07e', N'a824885b-f59c-4559-a939-3dbf335fc4f9')
INSERT [dbo].[EmployeeHoildays] ([EmployeeHoildayID], [EmpID], [HolidayID]) VALUES (N'5b2ee1ad-569a-434f-8e7f-d84d0ff033bd', N'62995f97-51be-4353-bd83-0745e5f24f07', N'6c849f7c-7960-4d5a-9245-3639abe08e66')
INSERT [dbo].[EmployeeHoildays] ([EmployeeHoildayID], [EmpID], [HolidayID]) VALUES (N'03fa4f82-98de-4ca1-ac64-d89335cf1481', N'f3603335-129c-4f6c-9cdd-3268a29a505a', N'2f53d736-09bf-4057-9890-bd09bb87b538')
INSERT [dbo].[EmployeeHoildays] ([EmployeeHoildayID], [EmpID], [HolidayID]) VALUES (N'bc62a87d-8c46-40d1-9332-da63e20920e4', N'720d8341-ae54-4d06-b92e-652c25c7cf1e', N'5458917a-5257-4d64-8810-2be6632a3c53')
INSERT [dbo].[EmployeeHoildays] ([EmployeeHoildayID], [EmpID], [HolidayID]) VALUES (N'1da4b078-0ae5-4277-b362-dc23f617763d', N'20250795-00e5-4355-b986-e2f3f6f9e07e', N'9fb5bfc6-861b-48e9-a114-999ade049ee2')
INSERT [dbo].[EmployeeHoildays] ([EmployeeHoildayID], [EmpID], [HolidayID]) VALUES (N'01b32abe-b632-4cd2-97bd-dc30c9e032e0', N'20250795-00e5-4355-b986-e2f3f6f9e07e', N'b61cc77f-37aa-4eb8-9d44-9a1bd38f66ff')
INSERT [dbo].[EmployeeHoildays] ([EmployeeHoildayID], [EmpID], [HolidayID]) VALUES (N'dd5a56e9-9f27-43ec-b3d7-dd7cc83d679d', N'770acc2b-d5d4-4c57-ab57-7a3451f8a86c', N'fe03f200-2b93-4c9f-9881-074285eb8b83')
INSERT [dbo].[EmployeeHoildays] ([EmployeeHoildayID], [EmpID], [HolidayID]) VALUES (N'2af1dc77-d5d4-448b-8712-dff07cdda46c', N'5af736f6-c404-47b2-92cb-81c890441f7f', N'1abbb23e-8d3d-435d-9eec-96bb818a270e')
INSERT [dbo].[EmployeeHoildays] ([EmployeeHoildayID], [EmpID], [HolidayID]) VALUES (N'a78f62fa-af38-41f8-af9a-e10aeeb12073', N'd44eea62-6415-4c75-af42-8888760e8bf4', N'b61cc77f-37aa-4eb8-9d44-9a1bd38f66ff')
INSERT [dbo].[EmployeeHoildays] ([EmployeeHoildayID], [EmpID], [HolidayID]) VALUES (N'88977263-6a79-4b8d-a18e-e168a21f1287', N'f0250795-00e5-4355-b986-e2f3f6f9e07a', N'c3408338-56f5-4d78-a6f0-6915d382bbdf')
INSERT [dbo].[EmployeeHoildays] ([EmployeeHoildayID], [EmpID], [HolidayID]) VALUES (N'4157276c-568e-4ae7-9df7-e1d5411a8e0f', N'd44eea62-6415-4c75-af42-8888760e8bf4', N'a824885b-f59c-4559-a939-3dbf335fc4f9')
INSERT [dbo].[EmployeeHoildays] ([EmployeeHoildayID], [EmpID], [HolidayID]) VALUES (N'17a7c93d-1b38-4c03-af7d-e2ad981886cf', N'5af736f6-c404-47b2-92cb-81c890441f7f', N'c82d2b6c-59db-49ad-96c0-9a91e78efd48')
INSERT [dbo].[EmployeeHoildays] ([EmployeeHoildayID], [EmpID], [HolidayID]) VALUES (N'29cf46d9-87f0-4c12-952d-e36670b34b9b', N'd44eea62-6415-4c75-af42-8888760e8bf4', N'bd334efe-f112-4b4a-9f74-4b0101d5d007')
INSERT [dbo].[EmployeeHoildays] ([EmployeeHoildayID], [EmpID], [HolidayID]) VALUES (N'f2a428e0-4fcf-4f84-afb6-e3ed3e94ec0e', N'd44eea62-6415-4c75-af42-8888760e8bf4', N'08afffaa-559f-4531-9cfc-846b6e1398d4')
INSERT [dbo].[EmployeeHoildays] ([EmployeeHoildayID], [EmpID], [HolidayID]) VALUES (N'2b1e3b89-9d21-40bd-9237-e4ddc12883fe', N'6fdc4b80-8ae6-4b97-a068-a66a6c230623', N'b61cc77f-37aa-4eb8-9d44-9a1bd38f66ff')
INSERT [dbo].[EmployeeHoildays] ([EmployeeHoildayID], [EmpID], [HolidayID]) VALUES (N'28791bd5-b6fa-4bc5-acf8-e5194c71ead8', N'6fdc4b80-8ae6-4b97-a068-a66a6c230623', N'3e34a88a-c249-45e5-b0f6-939806945be2')
INSERT [dbo].[EmployeeHoildays] ([EmployeeHoildayID], [EmpID], [HolidayID]) VALUES (N'3022955d-6bd0-4a7a-819a-e721b723be8b', N'd448c4b5-8f24-42fa-8308-9c2e4fdb3de4', N'f7eb2c29-6f9e-464a-ab58-11df6ea55d7e')
INSERT [dbo].[EmployeeHoildays] ([EmployeeHoildayID], [EmpID], [HolidayID]) VALUES (N'1fd43927-cb58-4848-bfa6-e907b992575f', N'20250795-00e5-4355-b986-e2f3f6f9e07e', N'25a08ddd-7bb9-450f-90f7-ba726efeafd8')
INSERT [dbo].[EmployeeHoildays] ([EmployeeHoildayID], [EmpID], [HolidayID]) VALUES (N'7436d68c-5b52-4251-8d46-eaf983e92bec', N'5af736f6-c404-47b2-92cb-81c890441f7f', N'08afffaa-559f-4531-9cfc-846b6e1398d4')
INSERT [dbo].[EmployeeHoildays] ([EmployeeHoildayID], [EmpID], [HolidayID]) VALUES (N'd6e45394-e32a-4c32-b888-ec2f841e9b53', N'd448c4b5-8f24-42fa-8308-9c2e4fdb3de4', N'd94e4fbd-34c5-47ce-9fa5-28563e32b64c')
INSERT [dbo].[EmployeeHoildays] ([EmployeeHoildayID], [EmpID], [HolidayID]) VALUES (N'1e8eef68-2209-4bcd-937f-ecdc65812791', N'd44eea62-6415-4c75-af42-8888760e8bf4', N'c82d2b6c-59db-49ad-96c0-9a91e78efd48')
INSERT [dbo].[EmployeeHoildays] ([EmployeeHoildayID], [EmpID], [HolidayID]) VALUES (N'cfe60f5c-08c5-4861-a20d-ed20d93f2445', N'f3603335-129c-4f6c-9cdd-3268a29a505a', N'94221f40-340f-4510-9162-685d4709d472')
INSERT [dbo].[EmployeeHoildays] ([EmployeeHoildayID], [EmpID], [HolidayID]) VALUES (N'62dc8293-a8d6-4787-972f-edf5fcf91819', N'6fdc4b80-8ae6-4b97-a068-a66a6c230623', N'327a471c-1c43-4842-8fbe-5ee2045e80b0')
INSERT [dbo].[EmployeeHoildays] ([EmployeeHoildayID], [EmpID], [HolidayID]) VALUES (N'd5c4b7bc-012d-423b-af2a-f2508147bd32', N'd44eea62-6415-4c75-af42-8888760e8bf4', N'2f53d736-09bf-4057-9890-bd09bb87b538')
INSERT [dbo].[EmployeeHoildays] ([EmployeeHoildayID], [EmpID], [HolidayID]) VALUES (N'fcf4d1f7-329b-4060-aefe-f3b5b28f5881', N'b0218d84-1700-4efa-a743-2e86f4e7feac', N'08afffaa-559f-4531-9cfc-846b6e1398d4')
INSERT [dbo].[EmployeeHoildays] ([EmployeeHoildayID], [EmpID], [HolidayID]) VALUES (N'35b2042e-f43d-4e14-83b4-f5e3ebe3a57e', N'f3603335-129c-4f6c-9cdd-3268a29a505a', N'fe03f200-2b93-4c9f-9881-074285eb8b83')
INSERT [dbo].[EmployeeHoildays] ([EmployeeHoildayID], [EmpID], [HolidayID]) VALUES (N'4bac2b75-c0c1-44ff-9547-f896ab271be0', N'f3603335-129c-4f6c-9cdd-3268a29a505a', N'f126981e-8df5-4944-a5ee-15d6f9d6c5b2')
INSERT [dbo].[EmployeeHoildays] ([EmployeeHoildayID], [EmpID], [HolidayID]) VALUES (N'4ce618cc-5d6a-46b2-aca5-f8ce5d526d7a', N'd448c4b5-8f24-42fa-8308-9c2e4fdb3de4', N'e69fbb03-1c27-4aa8-a79b-55b459286bb5')
INSERT [dbo].[EmployeeHoildays] ([EmployeeHoildayID], [EmpID], [HolidayID]) VALUES (N'102dabb2-eab6-4f77-9ac8-f8e3f8cb1c1e', N'b0218d84-1700-4efa-a743-2e86f4e7feac', N'c82d2b6c-59db-49ad-96c0-9a91e78efd48')
INSERT [dbo].[EmployeeHoildays] ([EmployeeHoildayID], [EmpID], [HolidayID]) VALUES (N'dc94efbd-9696-41d9-b4c6-f90007e02a61', N'd448c4b5-8f24-42fa-8308-9c2e4fdb3de4', N'bd334efe-f112-4b4a-9f74-4b0101d5d007')
INSERT [dbo].[EmployeeHoildays] ([EmployeeHoildayID], [EmpID], [HolidayID]) VALUES (N'b24d55da-a3d0-40f5-8e9c-fc3291ba828b', N'6fdc4b80-8ae6-4b97-a068-a66a6c230623', N'c3408338-56f5-4d78-a6f0-6915d382bbdf')
INSERT [dbo].[EmployeeHoildays] ([EmployeeHoildayID], [EmpID], [HolidayID]) VALUES (N'320755e3-7ceb-4945-a3d8-fcd7360a4d39', N'62995f97-51be-4353-bd83-0745e5f24f07', N'a824885b-f59c-4559-a939-3dbf335fc4f9')
INSERT [dbo].[EmployeeHoildays] ([EmployeeHoildayID], [EmpID], [HolidayID]) VALUES (N'46295460-e9d4-4eec-af8a-ff37c490a53b', N'20250795-00e5-4355-b986-e2f3f6f9e07f', N'f7eb2c29-6f9e-464a-ab58-11df6ea55d7e')
/****** Object:  Table [dbo].[Holiday]    Script Date: 02/04/2014 12:06:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Holiday](
	[HolidayID] [uniqueidentifier] NOT NULL,
	[HolidayName] [nvarchar](100) NULL,
	[HolidayDate] [datetime] NOT NULL,
	[CountryID] [uniqueidentifier] NULL,
	[LocationID] [uniqueidentifier] NULL,
	[ApplyToStaff] [bit] NULL,
 CONSTRAINT [PK_Holiday] PRIMARY KEY CLUSTERED 
(
	[HolidayID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Holiday] ([HolidayID], [HolidayName], [HolidayDate], [CountryID], [LocationID], [ApplyToStaff]) VALUES (N'7432373c-9057-4994-b7e0-08d93c25d6f9', N'temp', CAST(0x0000A2A700000000 AS DateTime), N'bf91ed15-02f2-4899-b7ea-b4f666271159', N'5a20bf81-422b-41a6-b3ea-ccaa5c46b273', 1)
INSERT [dbo].[Holiday] ([HolidayID], [HolidayName], [HolidayDate], [CountryID], [LocationID], [ApplyToStaff]) VALUES (N'22b3d290-0801-4f45-bddf-0bcb114c615f', N'Holiday 1', CAST(0x0000A21A00000000 AS DateTime), N'09a9c46f-19a9-4207-a2e3-75ded54bcd40', NULL, NULL)
INSERT [dbo].[Holiday] ([HolidayID], [HolidayName], [HolidayDate], [CountryID], [LocationID], [ApplyToStaff]) VALUES (N'f7eb2c29-6f9e-464a-ab58-11df6ea55d7e', N'NewYear', CAST(0x0000A2C100000000 AS DateTime), N'bf91ed15-02f2-4899-b7ea-b4f666271159', N'dbc51c6d-7cc0-4695-9caa-ce965e113365', 1)
INSERT [dbo].[Holiday] ([HolidayID], [HolidayName], [HolidayDate], [CountryID], [LocationID], [ApplyToStaff]) VALUES (N'f126981e-8df5-4944-a5ee-15d6f9d6c5b2', N'temp10', CAST(0x0000A2AF00000000 AS DateTime), N'bf91ed15-02f2-4899-b7ea-b4f666271159', N'5a20bf81-422b-41a6-b3ea-ccaa5c46b273', 1)
INSERT [dbo].[Holiday] ([HolidayID], [HolidayName], [HolidayDate], [CountryID], [LocationID], [ApplyToStaff]) VALUES (N'd94e4fbd-34c5-47ce-9fa5-28563e32b64c', N'NewYear', CAST(0x0000A2A600000000 AS DateTime), N'bf91ed15-02f2-4899-b7ea-b4f666271159', N'dbc51c6d-7cc0-4695-9caa-ce965e113365', 1)
INSERT [dbo].[Holiday] ([HolidayID], [HolidayName], [HolidayDate], [CountryID], [LocationID], [ApplyToStaff]) VALUES (N'71b6653f-cf01-4475-b926-321e96d97e3a', N'Holiday 9', CAST(0x0000A1F600000000 AS DateTime), N'09a9c46f-19a9-4207-a2e3-75ded54bcd40', NULL, NULL)
INSERT [dbo].[Holiday] ([HolidayID], [HolidayName], [HolidayDate], [CountryID], [LocationID], [ApplyToStaff]) VALUES (N'60fa832d-1dff-4e60-bc29-3c610c9a3079', N'PAK National Holiday 2', CAST(0x0000A22100000000 AS DateTime), N'255fff74-c839-4c1d-9670-5e8baddb108c', NULL, NULL)
INSERT [dbo].[Holiday] ([HolidayID], [HolidayName], [HolidayDate], [CountryID], [LocationID], [ApplyToStaff]) VALUES (N'a824885b-f59c-4559-a939-3dbf335fc4f9', N'Holiday 1', CAST(0x0000A44A00000000 AS DateTime), N'bf91ed15-02f2-4899-b7ea-b4f666271159', N'dbc51c6d-7cc0-4695-9caa-ce965e113365', 1)
INSERT [dbo].[Holiday] ([HolidayID], [HolidayName], [HolidayDate], [CountryID], [LocationID], [ApplyToStaff]) VALUES (N'd61ceb92-2c6c-45c9-9d57-43365f165d86', N'Dipawali', CAST(0x0000A26B00000000 AS DateTime), N'bf91ed15-02f2-4899-b7ea-b4f666271159', NULL, NULL)
INSERT [dbo].[Holiday] ([HolidayID], [HolidayName], [HolidayDate], [CountryID], [LocationID], [ApplyToStaff]) VALUES (N'19424b0d-6b6d-4c1a-a7fd-45fa7e0dcbf0', N'Last Year Holiday', CAST(0x0000A0FD00000000 AS DateTime), N'09a9c46f-19a9-4207-a2e3-75ded54bcd40', NULL, NULL)
INSERT [dbo].[Holiday] ([HolidayID], [HolidayName], [HolidayDate], [CountryID], [LocationID], [ApplyToStaff]) VALUES (N'efbb99b9-779f-4414-8d62-4ef718820f3d', N'September Holiday 3', CAST(0x0000A24300000000 AS DateTime), N'885a4067-6ed4-475e-8380-f33034f06791', NULL, NULL)
INSERT [dbo].[Holiday] ([HolidayID], [HolidayName], [HolidayDate], [CountryID], [LocationID], [ApplyToStaff]) VALUES (N'b9324131-6b19-4b19-aed5-52bb1ad34d4a', N'qw', CAST(0x0000A2A000000000 AS DateTime), N'bf91ed15-02f2-4899-b7ea-b4f666271159', N'dbc51c6d-7cc0-4695-9caa-ce965e113365', 0)
INSERT [dbo].[Holiday] ([HolidayID], [HolidayName], [HolidayDate], [CountryID], [LocationID], [ApplyToStaff]) VALUES (N'a49e4f64-1130-428c-8b58-551cdb5a30ca', N'qw', CAST(0x0000A2C800000000 AS DateTime), N'bf91ed15-02f2-4899-b7ea-b4f666271159', N'dbc51c6d-7cc0-4695-9caa-ce965e113365', 1)
INSERT [dbo].[Holiday] ([HolidayID], [HolidayName], [HolidayDate], [CountryID], [LocationID], [ApplyToStaff]) VALUES (N'e69fbb03-1c27-4aa8-a79b-55b459286bb5', N'Winter Vacation', CAST(0x0000A2A500000000 AS DateTime), N'bf91ed15-02f2-4899-b7ea-b4f666271159', N'dbc51c6d-7cc0-4695-9caa-ce965e113365', 1)
INSERT [dbo].[Holiday] ([HolidayID], [HolidayName], [HolidayDate], [CountryID], [LocationID], [ApplyToStaff]) VALUES (N'482d881c-3af6-40bd-bfca-5d6b80a7267d', N'temp', CAST(0x0000A2A800000000 AS DateTime), N'bf91ed15-02f2-4899-b7ea-b4f666271159', N'dbc51c6d-7cc0-4695-9caa-ce965e113365', 1)
INSERT [dbo].[Holiday] ([HolidayID], [HolidayName], [HolidayDate], [CountryID], [LocationID], [ApplyToStaff]) VALUES (N'327a471c-1c43-4842-8fbe-5ee2045e80b0', N'NewYear', CAST(0x0000A2C500000000 AS DateTime), N'bf91ed15-02f2-4899-b7ea-b4f666271159', N'5a20bf81-422b-41a6-b3ea-ccaa5c46b273', 1)
INSERT [dbo].[Holiday] ([HolidayID], [HolidayName], [HolidayDate], [CountryID], [LocationID], [ApplyToStaff]) VALUES (N'd2344487-242d-4e6e-b7f7-6528de5aecae', N'Holiday 4', CAST(0x0000A21A00000000 AS DateTime), N'09a9c46f-19a9-4207-a2e3-75ded54bcd40', NULL, NULL)
INSERT [dbo].[Holiday] ([HolidayID], [HolidayName], [HolidayDate], [CountryID], [LocationID], [ApplyToStaff]) VALUES (N'94221f40-340f-4510-9162-685d4709d472', N'qw1', CAST(0x0000A2E000000000 AS DateTime), N'bf91ed15-02f2-4899-b7ea-b4f666271159', N'5a20bf81-422b-41a6-b3ea-ccaa5c46b273', 1)
INSERT [dbo].[Holiday] ([HolidayID], [HolidayName], [HolidayDate], [CountryID], [LocationID], [ApplyToStaff]) VALUES (N'c3408338-56f5-4d78-a6f0-6915d382bbdf', N'MyBirthday', CAST(0x0000A30300000000 AS DateTime), N'bf91ed15-02f2-4899-b7ea-b4f666271159', N'dbc51c6d-7cc0-4695-9caa-ce965e113365', 0)
INSERT [dbo].[Holiday] ([HolidayID], [HolidayName], [HolidayDate], [CountryID], [LocationID], [ApplyToStaff]) VALUES (N'08afffaa-559f-4531-9cfc-846b6e1398d4', N'fgsgsdg', CAST(0x0000A2C700000000 AS DateTime), N'bf91ed15-02f2-4899-b7ea-b4f666271159', N'dbc51c6d-7cc0-4695-9caa-ce965e113365', 1)
INSERT [dbo].[Holiday] ([HolidayID], [HolidayName], [HolidayDate], [CountryID], [LocationID], [ApplyToStaff]) VALUES (N'0be19a15-f13d-46f4-aa40-8d37471f322e', N'Holiday 6', CAST(0x0000A22100000000 AS DateTime), N'09a9c46f-19a9-4207-a2e3-75ded54bcd40', NULL, NULL)
INSERT [dbo].[Holiday] ([HolidayID], [HolidayName], [HolidayDate], [CountryID], [LocationID], [ApplyToStaff]) VALUES (N'3e34a88a-c249-45e5-b0f6-939806945be2', N'temp', CAST(0x0000A2AF00000000 AS DateTime), N'bf91ed15-02f2-4899-b7ea-b4f666271159', N'dbc51c6d-7cc0-4695-9caa-ce965e113365', 1)
INSERT [dbo].[Holiday] ([HolidayID], [HolidayName], [HolidayDate], [CountryID], [LocationID], [ApplyToStaff]) VALUES (N'1abbb23e-8d3d-435d-9eec-96bb818a270e', N'qw', CAST(0x0000A2E000000000 AS DateTime), N'bf91ed15-02f2-4899-b7ea-b4f666271159', N'dbc51c6d-7cc0-4695-9caa-ce965e113365', 1)
INSERT [dbo].[Holiday] ([HolidayID], [HolidayName], [HolidayDate], [CountryID], [LocationID], [ApplyToStaff]) VALUES (N'ca6358a2-904c-43bc-a616-974e170a9a3e', N'Holiday 7', CAST(0x0000A13F00000000 AS DateTime), N'09a9c46f-19a9-4207-a2e3-75ded54bcd40', NULL, NULL)
INSERT [dbo].[Holiday] ([HolidayID], [HolidayName], [HolidayDate], [CountryID], [LocationID], [ApplyToStaff]) VALUES (N'9fb5bfc6-861b-48e9-a114-999ade049ee2', N'temp', CAST(0x0000A2B500000000 AS DateTime), N'bf91ed15-02f2-4899-b7ea-b4f666271159', N'5a20bf81-422b-41a6-b3ea-ccaa5c46b273', 1)
INSERT [dbo].[Holiday] ([HolidayID], [HolidayName], [HolidayDate], [CountryID], [LocationID], [ApplyToStaff]) VALUES (N'b61cc77f-37aa-4eb8-9d44-9a1bd38f66ff', N'Christmas', CAST(0x0000A29F00000000 AS DateTime), N'bf91ed15-02f2-4899-b7ea-b4f666271159', N'dbc51c6d-7cc0-4695-9caa-ce965e113365', 1)
INSERT [dbo].[Holiday] ([HolidayID], [HolidayName], [HolidayDate], [CountryID], [LocationID], [ApplyToStaff]) VALUES (N'25a08ddd-7bb9-450f-90f7-ba726efeafd8', N'qw', CAST(0x0000A2C800000000 AS DateTime), N'bf91ed15-02f2-4899-b7ea-b4f666271159', N'5a20bf81-422b-41a6-b3ea-ccaa5c46b273', 1)
INSERT [dbo].[Holiday] ([HolidayID], [HolidayName], [HolidayDate], [CountryID], [LocationID], [ApplyToStaff]) VALUES (N'2f53d736-09bf-4057-9890-bd09bb87b538', N'ree', CAST(0x0000A2A400000000 AS DateTime), N'bf91ed15-02f2-4899-b7ea-b4f666271159', N'dbc51c6d-7cc0-4695-9caa-ce965e113365', 0)
INSERT [dbo].[Holiday] ([HolidayID], [HolidayName], [HolidayDate], [CountryID], [LocationID], [ApplyToStaff]) VALUES (N'a883668d-0e80-401c-a38a-bf0b0bbfc31b', N'Holiday 2', CAST(0x0000A23F00000000 AS DateTime), N'09a9c46f-19a9-4207-a2e3-75ded54bcd40', NULL, NULL)
INSERT [dbo].[Holiday] ([HolidayID], [HolidayName], [HolidayDate], [CountryID], [LocationID], [ApplyToStaff]) VALUES (N'52dd7dbc-a9bf-491d-8bff-c52271dd2046', N'September Holiday 2', CAST(0x0000A23D00000000 AS DateTime), N'885a4067-6ed4-475e-8380-f33034f06791', NULL, NULL)
INSERT [dbo].[Holiday] ([HolidayID], [HolidayName], [HolidayDate], [CountryID], [LocationID], [ApplyToStaff]) VALUES (N'30eeed6e-b005-44e4-9777-cd4e14894a23', N'Christmas eve', CAST(0x0000A29E00000000 AS DateTime), N'bf91ed15-02f2-4899-b7ea-b4f666271159', N'dbc51c6d-7cc0-4695-9caa-ce965e113365', 0)
INSERT [dbo].[Holiday] ([HolidayID], [HolidayName], [HolidayDate], [CountryID], [LocationID], [ApplyToStaff]) VALUES (N'3cda0250-4f5f-4e08-8d94-e0b96628f3ff', N'September Holiday 1', CAST(0x0000A22300000000 AS DateTime), N'885a4067-6ed4-475e-8380-f33034f06791', NULL, NULL)
INSERT [dbo].[Holiday] ([HolidayID], [HolidayName], [HolidayDate], [CountryID], [LocationID], [ApplyToStaff]) VALUES (N'6613517f-6ce4-42df-9b66-e79a12863c06', N'newHoliday2', CAST(0x0000A23600000000 AS DateTime), N'09a9c46f-19a9-4207-a2e3-75ded54bcd40', NULL, NULL)
INSERT [dbo].[Holiday] ([HolidayID], [HolidayName], [HolidayDate], [CountryID], [LocationID], [ApplyToStaff]) VALUES (N'7381f7f6-a7c6-4836-be07-ec480bc0ab6f', N'PAK National Holiday', CAST(0x0000A21400000000 AS DateTime), N'255fff74-c839-4c1d-9670-5e8baddb108c', NULL, NULL)
INSERT [dbo].[Holiday] ([HolidayID], [HolidayName], [HolidayDate], [CountryID], [LocationID], [ApplyToStaff]) VALUES (N'362e8162-ec9e-4eae-9470-eea8e7f5f27e', N'hgsafdjg', CAST(0x0000A2C700000000 AS DateTime), N'bf91ed15-02f2-4899-b7ea-b4f666271159', N'5a20bf81-422b-41a6-b3ea-ccaa5c46b273', 1)
/****** Object:  Table [dbo].[TimeSheet]    Script Date: 02/04/2014 12:06:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TimeSheet](
	[TimeSheetID] [uniqueidentifier] NOT NULL,
	[TimeSheetMasterID] [uniqueidentifier] NULL,
	[ProjectID] [uniqueidentifier] NULL,
	[Date] [datetime] NULL,
	[Hours] [decimal](18, 0) NULL,
	[CreatedDate] [datetime] NULL,
	[IsWeekend] [bit] NULL,
	[isOff] [int] NULL,
 CONSTRAINT [PK_TimeSheet] PRIMARY KEY CLUSTERED 
(
	[TimeSheetID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'4e38f671-b92b-4cd1-ad68-00a37cf77190', N'32381411-25ca-4c48-a5a6-e5c2568b6618', NULL, CAST(0x0000A41E00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B01315FCE AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'5040fb45-67c1-48e8-ab85-00c634b88e87', N'2b94c0d3-1e90-4d37-ad1f-4b737cdb8968', N'b5ad254d-bab8-4af9-b24d-7e982c01287c', CAST(0x0000A2CD00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A2C50130AE20 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'45187e1d-8ad1-4da0-8468-0137cedce494', N'fae0ade0-f078-45f2-aa4d-ae50c74d6605', NULL, CAST(0x0000A29400000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900F532E8 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'c4a16b4e-f7ff-403d-81c0-01b16862c2f9', N'212825aa-1bb4-4255-bd78-81229debe566', N'2946664a-12a0-4827-a41b-272b500a770a', CAST(0x0000A28700000000 AS DateTime), CAST(2 AS Decimal(18, 0)), CAST(0x0000A29D011F5946 AS DateTime), NULL, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'4cd81bd2-51c1-4b8f-8f08-02253c5dbe94', N'32381411-25ca-4c48-a5a6-e5c2568b6618', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A41800000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B01316303 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'ee32d812-9fdf-4e21-b5f2-028ec03c6643', N'c5cb6272-8c77-4682-bf7c-c2ccd3491980', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A22900000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B01303E07 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'a0089a21-9e15-497a-a391-029b7a5c493f', N'dcbeda40-9cc2-4144-a32c-e0a625f174db', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A43200000000 AS DateTime), CAST(7 AS Decimal(18, 0)), CAST(0x0000A29D010F63C3 AS DateTime), NULL, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'05c1bcde-56e3-44cc-a412-02be27eb0a2b', N'212825aa-1bb4-4255-bd78-81229debe566', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A29300000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29D011F6865 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'51d18130-5172-466d-a696-0315db805975', N'7f54179d-42c2-4844-838f-49f3b90029aa', NULL, CAST(0x0000A2F700000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A2C50135F2A7 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'5a7daae1-2841-418e-82cd-0351857483c1', N'eecc0206-511d-4966-a056-b52f90592a6a', NULL, CAST(0x0000A2FF00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29A012C1688 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'62e17217-91b2-472b-a85e-03b89010126e', N'dcbeda40-9cc2-4144-a32c-e0a625f174db', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A44C00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29D01128000 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'491cadbd-8444-4b8c-bb3b-0427a5acc970', N'298de147-f4f6-492a-90eb-0c14ca5c8c70', NULL, CAST(0x0000A31F00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B012622A9 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'a71a1c26-a93e-4130-8a47-0582183584b5', N'fae0ade0-f078-45f2-aa4d-ae50c74d6605', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A2A100000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900F558A9 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'f054db69-12dd-4d66-91cb-0597d7fdd0c9', N'fae0ade0-f078-45f2-aa4d-ae50c74d6605', NULL, CAST(0x0000A29900000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900F532ED AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'f7086197-240e-4071-9bd8-05b9a4be5d06', N'41a4c6c4-9288-4c60-aec2-d76cd8910c8e', NULL, CAST(0x0000A17E00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B01311952 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'f322d035-b6f4-4125-896b-05f44d41264b', N'2b94c0d3-1e90-4d37-ad1f-4b737cdb8968', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A2CC00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A2C50136926E AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'6018d932-a483-419b-a187-060d10a21004', N'eecc0206-511d-4966-a056-b52f90592a6a', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A2F500000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29A012C63AA AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'2a0bbe72-b3d8-4111-8fed-063878e67a25', N'166857d3-c4b3-415f-9fd4-eaaf7c1aab75', NULL, CAST(0x0000A14700000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900F5243C AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'947d5b34-2c87-4456-ac9d-06cdd1daa665', N'32381411-25ca-4c48-a5a6-e5c2568b6618', NULL, CAST(0x0000A42500000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B01315FD3 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'47d79878-cb3b-4306-a7dd-07a79b9ad449', N'fae0ade0-f078-45f2-aa4d-ae50c74d6605', NULL, CAST(0x0000A29700000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900F532EB AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'e61e5741-44fd-4bec-ba1e-07f40649f77a', N'fae0ade0-f078-45f2-aa4d-ae50c74d6605', N'b5ad254d-bab8-4af9-b24d-7e982c01287c', CAST(0x0000A29000000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900F5585E AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'd68a644d-62c2-4792-843b-07f53ff17c31', N'7f54179d-42c2-4844-838f-49f3b90029aa', NULL, CAST(0x0000A2FD00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A2C50135F2AB AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'31fa1d01-babe-4144-96e9-07f6cf32aa9b', N'2b94c0d3-1e90-4d37-ad1f-4b737cdb8968', N'2946664a-12a0-4827-a41b-272b500a770a', CAST(0x0000A2D300000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A2C5012FFD23 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'd0be7738-48c4-4280-97c8-083c2382cb57', N'eecc0206-511d-4966-a056-b52f90592a6a', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A2F400000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29A012C63A7 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'24d33b0a-7df7-4934-b772-085b6181cc77', N'fae0ade0-f078-45f2-aa4d-ae50c74d6605', NULL, CAST(0x0000A29000000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900F532DF AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'3a9f9752-babe-47e9-9927-086a9b93852d', N'421f636a-d553-4b50-8347-0a4d9a9db06b', NULL, CAST(0x0000A28700000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29700C3C4FE AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'cc529ab9-6e13-4fa4-87f2-0891b098c000', N'c5cb6272-8c77-4682-bf7c-c2ccd3491980', NULL, CAST(0x0000A22600000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B0130270A AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'27ebbbbc-cff4-41b2-adaf-08946012582d', N'fae0ade0-f078-45f2-aa4d-ae50c74d6605', N'7c5595da-c05a-416c-b2b3-713c9b9853f5', CAST(0x0000A29500000000 AS DateTime), CAST(5 AS Decimal(18, 0)), CAST(0x0000A29900F54CBC AS DateTime), NULL, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'd559019d-e4f0-4229-b19b-08d52730410d', N'fae0ade0-f078-45f2-aa4d-ae50c74d6605', N'2946664a-12a0-4827-a41b-272b500a770a', CAST(0x0000A28B00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900F5584F AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'73dac428-9303-4b29-a1d9-08d5526e4bed', N'81530680-dd37-4681-aaa4-679745a7fb89', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A31100000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29A0138A34D AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'fd6da839-de7f-4bc2-a49f-096d032b55a0', N'2d101463-213a-45e9-99d1-16e626507541', N'b5ad254d-bab8-4af9-b24d-7e982c01287c', CAST(0x0000A2A900000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A2C501010B4F AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'24434b46-e1b1-4bae-aed7-097cb9db3c4e', N'fae0ade0-f078-45f2-aa4d-ae50c74d6605', N'b5ad254d-bab8-4af9-b24d-7e982c01287c', CAST(0x0000A29700000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900F5587C AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'30a961b6-87d0-4b71-aaa5-0a2668deed4f', N'fae0ade0-f078-45f2-aa4d-ae50c74d6605', N'2946664a-12a0-4827-a41b-272b500a770a', CAST(0x0000A29B00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900F5588E AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'27c6b7fe-9912-456b-b2fb-0a2a723ee5ca', N'5a5d8679-f4f4-4e3b-a21f-2b2dd836acfd', NULL, CAST(0x0000A2CE00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B012A1C05 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'7d738540-2c3d-4d38-a851-0a33050f0a82', N'fae0ade0-f078-45f2-aa4d-ae50c74d6605', N'2946664a-12a0-4827-a41b-272b500a770a', CAST(0x0000A29200000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900F55868 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'e3f50706-a039-4e5e-9c15-0a4759a4008d', N'212825aa-1bb4-4255-bd78-81229debe566', N'2946664a-12a0-4827-a41b-272b500a770a', CAST(0x0000A29900000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29D0130598C AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'81fb5dff-60cf-43e0-902a-0ac6fc52c1b4', N'f66bcc6b-19a7-420c-be11-8f952a9d344b', NULL, CAST(0x0000A28800000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B00BBCC84 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'777d0e3a-7ca6-44c1-9f69-0b3a3ce1eeae', N'889c1d0a-4263-4fb1-a3eb-7d3e6212e247', NULL, CAST(0x0000A16A00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B00D4B174 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'800d1dd4-b05a-45ff-8c83-0b416f4af8eb', N'eecc0206-511d-4966-a056-b52f90592a6a', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A2F300000000 AS DateTime), CAST(5 AS Decimal(18, 0)), CAST(0x0000A29A012C61E7 AS DateTime), NULL, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'ead911f3-28e7-4e73-9646-0b4eb0ef64e1', N'889c1d0a-4263-4fb1-a3eb-7d3e6212e247', NULL, CAST(0x0000A16900000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B00D4B173 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'f4fb976b-3b39-4bdc-874e-0c35e0772635', N'fae0ade0-f078-45f2-aa4d-ae50c74d6605', NULL, CAST(0x0000A29200000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900F532E6 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'6e72dec0-bdff-4a05-bab5-0d0b2dc44828', N'dcbeda40-9cc2-4144-a32c-e0a625f174db', NULL, CAST(0x0000A43E00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29D01134866 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'58873a63-c9ee-4f3a-9735-0d135cc6a6e3', N'fae0ade0-f078-45f2-aa4d-ae50c74d6605', N'b5ad254d-bab8-4af9-b24d-7e982c01287c', CAST(0x0000A28C00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900F55852 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'6bf1cb84-744b-48c5-a447-0d2c046c8692', N'fae0ade0-f078-45f2-aa4d-ae50c74d6605', N'7c5595da-c05a-416c-b2b3-713c9b9853f5', CAST(0x0000A29100000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900F55864 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'd4269635-9124-467e-b03e-0d718e0c534d', N'478cb821-f1df-4d4b-bd3c-ca81554fe7b0', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A15A00000000 AS DateTime), CAST(5 AS Decimal(18, 0)), CAST(0x0000A29B011DFD29 AS DateTime), NULL, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'3ca90610-2330-4782-9dcd-0d9b509527ce', N'5a5d8679-f4f4-4e3b-a21f-2b2dd836acfd', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A2D600000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B012A322A AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'56452d9d-808d-467d-b66c-0df78a81f457', N'2b94c0d3-1e90-4d37-ad1f-4b737cdb8968', N'b5ad254d-bab8-4af9-b24d-7e982c01287c', CAST(0x0000A2CD00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A2C5012C8B36 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'a4944e19-db2e-40f5-ae59-0dfee510014b', N'fae0ade0-f078-45f2-aa4d-ae50c74d6605', N'b5ad254d-bab8-4af9-b24d-7e982c01287c', CAST(0x0000A2A100000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900F558A5 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'f4caf17f-fdf7-49bb-b349-0e3003d53754', N'2b94c0d3-1e90-4d37-ad1f-4b737cdb8968', NULL, CAST(0x0000A2DB00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A2C5012C5905 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'383f06c6-cd82-4d25-9a14-0e5268e5cca4', N'9d1419ba-926e-41f0-b644-508cc939a076', N'20cd934f-ba3f-4595-b2f1-ab1e3eb04b7b', CAST(0x0000A25400000000 AS DateTime), CAST(3 AS Decimal(18, 0)), CAST(0x0000A25201284FE3 AS DateTime), NULL, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'54357216-1814-496f-b88b-0e89a7b56736', N'166857d3-c4b3-415f-9fd4-eaaf7c1aab75', NULL, CAST(0x0000A14D00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900F52441 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'7bb505cb-7e3c-4626-828b-0f169fe16c2a', N'e9adf832-0ad0-4022-b0f7-3884882f2ba9', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A2BE00000000 AS DateTime), CAST(4 AS Decimal(18, 0)), CAST(0x0000A29B013079E8 AS DateTime), NULL, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'ff2ca044-139d-44bc-ba6c-0f1e0ebb8bf2', N'c5cb6272-8c77-4682-bf7c-c2ccd3491980', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A21200000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B01303DF8 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'2ef99716-d612-4e66-b006-0f2af6d9a54d', N'478cb821-f1df-4d4b-bd3c-ca81554fe7b0', NULL, CAST(0x0000A15E00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B011DF147 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'1674b2d1-2412-48fb-a598-0f8c4da60e20', N'fae0ade0-f078-45f2-aa4d-ae50c74d6605', NULL, CAST(0x0000A29100000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900F532E4 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'21419bfc-ec97-4683-bc96-0fa812aea108', N'298de147-f4f6-492a-90eb-0c14ca5c8c70', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A32900000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B00CB0038 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'550785f0-cb7b-4afc-b505-0fae0b7209a5', N'212825aa-1bb4-4255-bd78-81229debe566', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A2A100000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29D011F6874 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'385ba51e-59a2-4e39-8030-0fb5b8394ed8', N'41a4c6c4-9288-4c60-aec2-d76cd8910c8e', NULL, CAST(0x0000A17700000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B0131194D AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'5ad5b912-b6ce-47e9-9614-0fe893dde7cf', N'478cb821-f1df-4d4b-bd3c-ca81554fe7b0', NULL, CAST(0x0000A16D00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B011DF15F AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'18a2a514-c638-4aaf-88de-0ffe46731fa8', N'fae0ade0-f078-45f2-aa4d-ae50c74d6605', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A29C00000000 AS DateTime), CAST(5 AS Decimal(18, 0)), CAST(0x0000A29900F54752 AS DateTime), NULL, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'e84cbe71-29ac-46f0-984b-1079604737f4', N'2b94c0d3-1e90-4d37-ad1f-4b737cdb8968', N'2946664a-12a0-4827-a41b-272b500a770a', CAST(0x0000A2D500000000 AS DateTime), NULL, CAST(0x0000A2C500000000 AS DateTime), NULL, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'4ef754b6-0f2a-44f0-9a23-109d33f48b3e', N'298de147-f4f6-492a-90eb-0c14ca5c8c70', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A32C00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B01263B92 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'a62dbaae-2f02-4b9e-8b27-11397363d563', N'2b94c0d3-1e90-4d37-ad1f-4b737cdb8968', N'2946664a-12a0-4827-a41b-272b500a770a', CAST(0x0000A2DA00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A2C50130AE33 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'49a4541e-1b3c-4dc1-b8ee-118fa197abff', N'e9adf832-0ad0-4022-b0f7-3884882f2ba9', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A2AA00000000 AS DateTime), CAST(4 AS Decimal(18, 0)), CAST(0x0000A29B01307170 AS DateTime), NULL, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'18fdabb6-652e-434f-ba62-11d30d9f22a0', N'd2aa9f43-73ef-4a46-bdab-22504f7200fd', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A28900000000 AS DateTime), CAST(3 AS Decimal(18, 0)), CAST(0x0000A29B00DD9489 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'fa00786a-b547-47c9-80b1-12f6fae16b1c', N'478cb821-f1df-4d4b-bd3c-ca81554fe7b0', NULL, CAST(0x0000A16900000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B011DF157 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'59c7d3dd-cd22-4c93-87ca-130020fdb7c3', N'e9adf832-0ad0-4022-b0f7-3884882f2ba9', NULL, CAST(0x0000A2B900000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B01306B56 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'0dfba620-1056-419d-a9cc-1325c98fe56a', N'2b94c0d3-1e90-4d37-ad1f-4b737cdb8968', N'b5ad254d-bab8-4af9-b24d-7e982c01287c', CAST(0x0000A2D300000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A2C50136928C AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'37fcdea6-b13d-4e94-8061-134079864d12', N'dcbeda40-9cc2-4144-a32c-e0a625f174db', N'2946664a-12a0-4827-a41b-272b500a770a', CAST(0x0000A44C00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29D01138C0C AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'2ea4b7f8-4acb-47a9-9359-1360c54e35b3', N'd2aa9f43-73ef-4a46-bdab-22504f7200fd', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A2A000000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29D01120265 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'a0a9795a-c7d4-4700-8e08-1453b17ed869', N'5a5d8679-f4f4-4e3b-a21f-2b2dd836acfd', NULL, CAST(0x0000A2C700000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B012A1BDD AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'8ab438b5-b6c7-48a8-ab37-14619596d2d6', N'81530680-dd37-4681-aaa4-679745a7fb89', NULL, CAST(0x0000A31100000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A2C50102BA2A AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'7839b09a-523b-49be-ac67-147e3417330e', N'2b94c0d3-1e90-4d37-ad1f-4b737cdb8968', NULL, CAST(0x0000A2C500000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A2C5012C58D8 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'b32cfe7c-f090-4606-977d-1493fad4680b', N'c5cb6272-8c77-4682-bf7c-c2ccd3491980', NULL, CAST(0x0000A22700000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B0130270B AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'96f02c14-242b-482b-94e4-14d3b91d4505', N'fae0ade0-f078-45f2-aa4d-ae50c74d6605', N'7c5595da-c05a-416c-b2b3-713c9b9853f5', CAST(0x0000A28C00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900F55854 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'a3ea4108-7e74-4608-9d2c-151df6c76ffc', N'd2aa9f43-73ef-4a46-bdab-22504f7200fd', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A28800000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B00DD9485 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'7e4c12f5-d290-4153-bbfc-152bab384a02', N'81530680-dd37-4681-aaa4-679745a7fb89', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A31500000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29A0138A350 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'd026154a-7736-4bba-99f3-1567ffc879da', N'2b94c0d3-1e90-4d37-ad1f-4b737cdb8968', N'b5ad254d-bab8-4af9-b24d-7e982c01287c', CAST(0x0000A2CD00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A2C5012FFD1C AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'40326218-4c73-44ef-a7bb-158a675c525c', N'e9adf832-0ad0-4022-b0f7-3884882f2ba9', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A2A600000000 AS DateTime), CAST(4 AS Decimal(18, 0)), CAST(0x0000A29B01306FAF AS DateTime), NULL, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'6ce28d30-812e-4371-84dc-15da05376bb5', N'eecc0206-511d-4966-a056-b52f90592a6a', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A2EE00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29A012C639B AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'12a84362-5fe9-478c-8444-15f677f9d286', N'212825aa-1bb4-4255-bd78-81229debe566', N'2946664a-12a0-4827-a41b-272b500a770a', CAST(0x0000A2A100000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29D0135F401 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'c58c703c-ca52-4b35-9976-1604ff0f6ae6', N'421f636a-d553-4b50-8347-0a4d9a9db06b', NULL, CAST(0x0000A29200000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29700C3C51C AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'cd11d697-e83a-4020-9316-1613ebf87140', N'c5cb6272-8c77-4682-bf7c-c2ccd3491980', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A22700000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B01303E05 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'3497dd61-24bb-4658-bc20-162b499e8dc9', N'298de147-f4f6-492a-90eb-0c14ca5c8c70', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A32900000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B01263B8E AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'64fd78e3-8342-4ee5-832c-162da3292162', N'298de147-f4f6-492a-90eb-0c14ca5c8c70', NULL, CAST(0x0000A32500000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B012622AF AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'9bfe3ebe-57a9-42b5-a6a9-1696770615d6', N'298de147-f4f6-492a-90eb-0c14ca5c8c70', NULL, CAST(0x0000A32A00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B012622B4 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'30ba3c67-7680-4542-9925-16c7e3334004', N'4066af84-094c-4e5b-9dd3-20927e4e39d0', NULL, CAST(0x0000A2D500000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900DA0309 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'dbd4bcb3-91d3-4f00-a807-17188ad85ec9', N'298de147-f4f6-492a-90eb-0c14ca5c8c70', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A33A00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B00CB004F AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'aa816259-e971-428f-98a1-174c3b9462bc', N'2b94c0d3-1e90-4d37-ad1f-4b737cdb8968', N'b5ad254d-bab8-4af9-b24d-7e982c01287c', CAST(0x0000A2D400000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A2C5012C8B3B AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'5ae04a87-2d68-4b2c-b6c5-176e0cbfa1cc', N'298de147-f4f6-492a-90eb-0c14ca5c8c70', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A32A00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B00DDAE9F AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'9091d8b2-c2a9-4364-8352-179063e55c10', N'62212af0-bbbb-4984-81be-ed97d14425a0', NULL, CAST(0x0000A3E300000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A2C3011A74F6 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'27289bf0-586e-4bfc-afe3-17c1f7a21e8a', N'f66bcc6b-19a7-420c-be11-8f952a9d344b', NULL, CAST(0x0000A2A400000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B00BBCCAA AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'6a0e774e-17fd-40ce-b90d-180b0b552a70', N'd2aa9f43-73ef-4a46-bdab-22504f7200fd', N'2946664a-12a0-4827-a41b-272b500a770a', CAST(0x0000A28700000000 AS DateTime), CAST(7 AS Decimal(18, 0)), CAST(0x0000A29D010E5A64 AS DateTime), NULL, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'6ed8f688-fc04-4b61-b5ac-184ccdea089d', N'fae0ade0-f078-45f2-aa4d-ae50c74d6605', N'7c5595da-c05a-416c-b2b3-713c9b9853f5', CAST(0x0000A2A100000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900F558A8 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'e5a9200a-b0b9-4476-8988-18b821bd41ea', N'81530680-dd37-4681-aaa4-679745a7fb89', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A31800000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29A0138A353 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'b91a2752-6d13-49e0-be0e-18e7c41ac613', N'166857d3-c4b3-415f-9fd4-eaaf7c1aab75', NULL, CAST(0x0000A14200000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900F52438 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'18e166d5-7d59-4afc-baa1-192dd04051e4', N'212825aa-1bb4-4255-bd78-81229debe566', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A2A000000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29D0135F3FF AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'03b45e4d-a4ee-4d1b-bdd4-19382a3725d5', N'fae0ade0-f078-45f2-aa4d-ae50c74d6605', NULL, CAST(0x0000A2A100000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900F532FF AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'2361c547-4cd7-4c29-ba47-197caa674744', N'd2aa9f43-73ef-4a46-bdab-22504f7200fd', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A29C00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29D010EB85E AS DateTime), NULL, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'd39e5008-bb66-4fee-bfbf-19886d730bb0', N'dcbeda40-9cc2-4144-a32c-e0a625f174db', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A43700000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29D01138C06 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'c67fefce-d295-4104-95b3-19b288a4168c', N'32381411-25ca-4c48-a5a6-e5c2568b6618', NULL, CAST(0x0000A42D00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B01315FDB AS DateTime), 0, 1)
GO
print 'Processed 100 total records'
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'9c258431-d07b-462d-9c1c-19ce48c85917', N'dcbeda40-9cc2-4144-a32c-e0a625f174db', N'2946664a-12a0-4827-a41b-272b500a770a', CAST(0x0000A43700000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29D01127FFB AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'6f07fe78-793a-441c-8014-19ebf66c6400', N'fae0ade0-f078-45f2-aa4d-ae50c74d6605', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A29800000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900F55883 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'3f891ecd-9ffd-4d51-8bf2-19ed906fbb7a', N'd2aa9f43-73ef-4a46-bdab-22504f7200fd', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A29200000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B00DD948B AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'fc49bdec-55dc-4154-a173-1a05cccb5ed5', N'eecc0206-511d-4966-a056-b52f90592a6a', NULL, CAST(0x0000A2E300000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29A012C166A AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'7f52156e-f262-460e-8b5b-1a6b0dced4f3', N'e90e53e1-5605-44b2-aed7-df1f195c53c1', NULL, CAST(0x0000A45700000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900DC9602 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'1b718114-9469-4b2c-bdb8-1a769d3f3f07', N'f66bcc6b-19a7-420c-be11-8f952a9d344b', NULL, CAST(0x0000A29E00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B00BBCCA8 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'82f6790f-5a19-4691-a5a5-1a9bca4f3288', N'212825aa-1bb4-4255-bd78-81229debe566', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A2A100000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29D0135F400 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'66c46fa7-42b4-44b1-af27-1a9f86cf7cd9', N'dcbeda40-9cc2-4144-a32c-e0a625f174db', N'2946664a-12a0-4827-a41b-272b500a770a', CAST(0x0000A43400000000 AS DateTime), CAST(3 AS Decimal(18, 0)), CAST(0x0000A29D010F5FAD AS DateTime), NULL, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'eab733b7-00a1-47cc-b32f-1aa54d97a13f', N'fae0ade0-f078-45f2-aa4d-ae50c74d6605', NULL, CAST(0x0000A28F00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900F532DE AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'c0314817-08e1-4e9f-a7c5-1adb642cbe3d', N'298de147-f4f6-492a-90eb-0c14ca5c8c70', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A33400000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B01263B9C AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'488f9606-a106-4ed0-ab20-1b92b59827a8', N'166857d3-c4b3-415f-9fd4-eaaf7c1aab75', NULL, CAST(0x0000A15600000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900F52448 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'bbda22ad-7494-4cb5-b1ad-1ba1ba48ad98', N'eecc0206-511d-4966-a056-b52f90592a6a', NULL, CAST(0x0000A2FB00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29A012C1685 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'6ccec744-3b1e-4f48-9162-1bd223f8c857', N'c5cb6272-8c77-4682-bf7c-c2ccd3491980', NULL, CAST(0x0000A20E00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B013026F1 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'23b0a654-e557-4894-98fe-1bf18c8c657a', N'c5cb6272-8c77-4682-bf7c-c2ccd3491980', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A21D00000000 AS DateTime), CAST(5 AS Decimal(18, 0)), CAST(0x0000A29B0130330D AS DateTime), NULL, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'2518520f-b510-417d-b183-1c1136568689', N'5a5d8679-f4f4-4e3b-a21f-2b2dd836acfd', NULL, CAST(0x0000A2D800000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B012A1C0E AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'50fbf0dc-9101-4856-9b13-1c947df28db4', N'2d101463-213a-45e9-99d1-16e626507541', NULL, CAST(0x0000A2A900000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A2C10131883B AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'12cceeb5-8dd6-45fc-b7cb-1cf83c689693', N'298de147-f4f6-492a-90eb-0c14ca5c8c70', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A32300000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B01263B89 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'f1021db3-e0cd-4345-83b2-1d16676584b8', N'81530680-dd37-4681-aaa4-679745a7fb89', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A31C00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29A0138A357 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'1c9b00f7-f4a1-4e2f-9a59-1dc3d0a9ce56', N'fae0ade0-f078-45f2-aa4d-ae50c74d6605', N'2946664a-12a0-4827-a41b-272b500a770a', CAST(0x0000A29600000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900F55879 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'962ea61c-c0ef-459d-a1ef-1dc93a364fe4', N'212825aa-1bb4-4255-bd78-81229debe566', N'2946664a-12a0-4827-a41b-272b500a770a', CAST(0x0000A28B00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29D01305988 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'3964baf9-30e2-455b-b6ac-1e1b42faedf4', N'298de147-f4f6-492a-90eb-0c14ca5c8c70', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A33300000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B01263B9A AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'1dcaa333-728b-4a22-9c8f-1e3e6a48f6b8', N'eecc0206-511d-4966-a056-b52f90592a6a', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A2F200000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29A012C639E AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'76ada9a9-2a1d-41c1-beec-1f59c16c8029', N'fae0ade0-f078-45f2-aa4d-ae50c74d6605', NULL, CAST(0x0000A29300000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900F532E7 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'5e7a8070-621f-4cf0-9810-1f5d49c2e56b', N'298de147-f4f6-492a-90eb-0c14ca5c8c70', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A32500000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B01263B8B AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'a573b96e-a84a-4a86-8f0d-1fedcdaa7520', N'2d101463-213a-45e9-99d1-16e626507541', N'b5ad254d-bab8-4af9-b24d-7e982c01287c', CAST(0x0000A2BE00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A2C10131C337 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'f875ffdf-d65d-4672-af8d-1ff8544511fc', N'2b94c0d3-1e90-4d37-ad1f-4b737cdb8968', N'b5ad254d-bab8-4af9-b24d-7e982c01287c', CAST(0x0000A2D300000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A2C5012C8B38 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'1dc01b0a-82b3-4504-82e0-202772238b14', N'2b94c0d3-1e90-4d37-ad1f-4b737cdb8968', N'2946664a-12a0-4827-a41b-272b500a770a', CAST(0x0000A2DB00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A2C5012FFD31 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'cf47eb2f-3945-46b7-bee0-20287d0e1582', N'fae0ade0-f078-45f2-aa4d-ae50c74d6605', N'b5ad254d-bab8-4af9-b24d-7e982c01287c', CAST(0x0000A2A200000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900F558AA AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'21d10a4d-2a3c-446b-9658-206f5425944c', N'fae0ade0-f078-45f2-aa4d-ae50c74d6605', N'7c5595da-c05a-416c-b2b3-713c9b9853f5', CAST(0x0000A29D00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900F55893 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'ea580f51-438a-4be6-9356-20a0caf5d101', N'd2aa9f43-73ef-4a46-bdab-22504f7200fd', N'2946664a-12a0-4827-a41b-272b500a770a', CAST(0x0000A2A000000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29D01120265 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'97d0f072-89b0-4fec-a140-20a68b883ef1', N'212825aa-1bb4-4255-bd78-81229debe566', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A28B00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29D01269674 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'd7b56257-eb56-4698-9888-20efeaef0bfb', N'81530680-dd37-4681-aaa4-679745a7fb89', NULL, CAST(0x0000A30200000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A2C50102BA1E AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'f08b717a-40c0-4569-b71a-2123811f7f52', N'c5cb6272-8c77-4682-bf7c-c2ccd3491980', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A21500000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B01303DFA AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'e903f517-d761-40fe-b94c-2126137f0f63', N'2b94c0d3-1e90-4d37-ad1f-4b737cdb8968', N'b5ad254d-bab8-4af9-b24d-7e982c01287c', CAST(0x0000A2C600000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A2C5012FFD13 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'aad2d141-0518-4670-a9e7-216396737f9b', N'c5cb6272-8c77-4682-bf7c-c2ccd3491980', NULL, CAST(0x0000A22000000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B01302704 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'ab16c483-d794-4c4e-9a39-2180d9b4ef22', N'9d1419ba-926e-41f0-b644-508cc939a076', N'c6166f35-9877-4686-8932-aad265ee668a', CAST(0x0000A24E00000000 AS DateTime), CAST(2 AS Decimal(18, 0)), CAST(0x0000A25201282BFD AS DateTime), NULL, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'9fa471f6-6d56-4627-b8d1-219142f9d787', N'fae0ade0-f078-45f2-aa4d-ae50c74d6605', N'2946664a-12a0-4827-a41b-272b500a770a', CAST(0x0000A29100000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900F55863 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'2df4873e-913d-4a68-b342-21a790caa6ea', N'41a4c6c4-9288-4c60-aec2-d76cd8910c8e', NULL, CAST(0x0000A17800000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B01311950 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'70c1d560-6adf-4350-a210-21a7ac1dbb1b', N'212825aa-1bb4-4255-bd78-81229debe566', N'2946664a-12a0-4827-a41b-272b500a770a', CAST(0x0000A2A000000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29D0135F400 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'5e2264b5-a8f4-460b-8978-21f72a987a63', N'9d1419ba-926e-41f0-b644-508cc939a076', N'c6166f35-9877-4686-8932-aad265ee668a', CAST(0x0000A24B00000000 AS DateTime), CAST(1 AS Decimal(18, 0)), CAST(0x0000A252012829E6 AS DateTime), NULL, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'36d6c84d-a4ee-4179-8c45-22235fc86138', N'dcbeda40-9cc2-4144-a32c-e0a625f174db', NULL, CAST(0x0000A44A00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29D01134869 AS DateTime), 0, 2)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'a517ceff-5f67-4a90-a63f-2294687fad75', N'212825aa-1bb4-4255-bd78-81229debe566', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A28800000000 AS DateTime), CAST(8 AS Decimal(18, 0)), CAST(0x0000A29D011F4D48 AS DateTime), NULL, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'9d56240b-a323-4e43-aeb3-22ab351e24be', N'dcbeda40-9cc2-4144-a32c-e0a625f174db', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A43700000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29D01127FFC AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'ef81a2ec-bdec-4786-af27-22aded223f41', N'e9adf832-0ad0-4022-b0f7-3884882f2ba9', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A2BA00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B01307EBF AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'd9bb5110-2c6a-4faa-b006-230e9a9738cb', N'166857d3-c4b3-415f-9fd4-eaaf7c1aab75', NULL, CAST(0x0000A14600000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900F5243B AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'49b95106-c952-493c-a314-236c66e54e27', N'478cb821-f1df-4d4b-bd3c-ca81554fe7b0', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A16500000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B011E16A8 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'61a51138-0ffe-44eb-9167-238cc547e662', N'166857d3-c4b3-415f-9fd4-eaaf7c1aab75', NULL, CAST(0x0000A14300000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900F52439 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'2fc3e7d8-3c4f-4184-8e72-246c74f00ecf', N'fae0ade0-f078-45f2-aa4d-ae50c74d6605', N'b5ad254d-bab8-4af9-b24d-7e982c01287c', CAST(0x0000A2A400000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900F558AF AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'912a5f7b-3ec0-4869-bffb-247419d88e0c', N'212825aa-1bb4-4255-bd78-81229debe566', NULL, CAST(0x0000A29900000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29D0135E27E AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'd685ce30-6acd-41ea-8d05-2487c4cf9203', N'2b94c0d3-1e90-4d37-ad1f-4b737cdb8968', N'b5ad254d-bab8-4af9-b24d-7e982c01287c', CAST(0x0000A2C600000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A2C5012C8B31 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'a5f15e53-4d9e-42b9-a35d-24a8c233eafd', N'474dd670-399c-425c-b3c6-3e73132144d3', NULL, CAST(0x0000A13900000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B01324C79 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'3bb65698-daa4-4266-9d7d-24fd61060197', N'eecc0206-511d-4966-a056-b52f90592a6a', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A2EB00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29A012C6398 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'cea93d97-7bc2-4997-9d67-252032a7a265', N'2d101463-213a-45e9-99d1-16e626507541', N'b5ad254d-bab8-4af9-b24d-7e982c01287c', CAST(0x0000A2BD00000000 AS DateTime), CAST(8 AS Decimal(18, 0)), CAST(0x0000A2C10131BBFA AS DateTime), NULL, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'fd58785e-e8f6-4f96-a9ad-252a0bbecdb8', N'2b94c0d3-1e90-4d37-ad1f-4b737cdb8968', N'b5ad254d-bab8-4af9-b24d-7e982c01287c', CAST(0x0000A2D500000000 AS DateTime), CAST(8 AS Decimal(18, 0)), CAST(0x0000A2C5012C6ABF AS DateTime), NULL, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'b4371dca-2873-4125-85ef-255f09969a5b', N'dcbeda40-9cc2-4144-a32c-e0a625f174db', N'2946664a-12a0-4827-a41b-272b500a770a', CAST(0x0000A44B00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29D01138C0B AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'154f5be0-7481-4b5f-86ff-2590f7929acf', N'fae0ade0-f078-45f2-aa4d-ae50c74d6605', N'2946664a-12a0-4827-a41b-272b500a770a', CAST(0x0000A2A300000000 AS DateTime), CAST(5 AS Decimal(18, 0)), CAST(0x0000A29900F54498 AS DateTime), NULL, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'b932fae4-ad05-4f49-b303-25b0307daa0e', N'7f54179d-42c2-4844-838f-49f3b90029aa', NULL, CAST(0x0000A2E200000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A2C50135F28C AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'72c0dfd6-4bfe-465a-abba-25b5bd8ab5c4', N'e9adf832-0ad0-4022-b0f7-3884882f2ba9', NULL, CAST(0x0000A2C100000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B01306B5B AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'f8eeee50-c64b-419f-a853-263bf54de7b1', N'2b94c0d3-1e90-4d37-ad1f-4b737cdb8968', N'b5ad254d-bab8-4af9-b24d-7e982c01287c', CAST(0x0000A2D400000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A2C50130AE2D AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'97dd84ee-4329-4e92-abd6-267275851191', N'eecc0206-511d-4966-a056-b52f90592a6a', NULL, CAST(0x0000A2E700000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29A012C166F AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'f9a476c2-26d1-48cb-a446-268e715e0d41', N'5a5d8679-f4f4-4e3b-a21f-2b2dd836acfd', NULL, CAST(0x0000A2D900000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B012A1C10 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'82e899e3-fe83-40c2-b371-2690fb037323', N'212825aa-1bb4-4255-bd78-81229debe566', NULL, CAST(0x0000A29300000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29D0135E27E AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'c5c154af-e8ec-4b29-b59a-269a252eb98a', N'212825aa-1bb4-4255-bd78-81229debe566', N'2946664a-12a0-4827-a41b-272b500a770a', CAST(0x0000A28C00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29D011F685F AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'50b6a2dd-d22d-400f-a01c-26e8a36697e4', N'fae0ade0-f078-45f2-aa4d-ae50c74d6605', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A2A200000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900F558AE AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'08942653-51ab-4373-b92f-2705e2aaeb70', N'fae0ade0-f078-45f2-aa4d-ae50c74d6605', N'2946664a-12a0-4827-a41b-272b500a770a', CAST(0x0000A29800000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900F55881 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'a3120842-0acb-4300-8704-275a77228d07', N'4066af84-094c-4e5b-9dd3-20927e4e39d0', NULL, CAST(0x0000A2CE00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900DA0306 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'59697ff5-70ac-45e0-b909-278370355ab9', N'e9adf832-0ad0-4022-b0f7-3884882f2ba9', NULL, CAST(0x0000A2BC00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B01306B58 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'c5f43322-e24e-4a3e-afdc-28b86631d177', N'dcbeda40-9cc2-4144-a32c-e0a625f174db', N'2946664a-12a0-4827-a41b-272b500a770a', CAST(0x0000A43D00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29D01138C06 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'a7c56626-e9aa-4566-8235-28de52b23bac', N'c5cb6272-8c77-4682-bf7c-c2ccd3491980', NULL, CAST(0x0000A22200000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B01302708 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'304f930b-735e-4f0b-9e50-28ec6eee225c', N'd2aa9f43-73ef-4a46-bdab-22504f7200fd', NULL, CAST(0x0000A2A000000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29D0111D73A AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'd8c13459-e6c3-478b-989d-29134a45b2ca', N'212825aa-1bb4-4255-bd78-81229debe566', N'2946664a-12a0-4827-a41b-272b500a770a', CAST(0x0000A29300000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29D0135F3FB AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'23fad216-3588-4a94-b8d8-292be8a3e451', N'5a5d8679-f4f4-4e3b-a21f-2b2dd836acfd', NULL, CAST(0x0000A2DD00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B012A1C14 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'67f0f29c-5ed8-4899-b88f-29ad9e961aee', N'81530680-dd37-4681-aaa4-679745a7fb89', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A30200000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29A0138A33D AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'808829c6-92d5-464b-9493-2a42feba133c', N'fae0ade0-f078-45f2-aa4d-ae50c74d6605', N'7c5595da-c05a-416c-b2b3-713c9b9853f5', CAST(0x0000A2A200000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900F558AD AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'aa44a7ac-b1be-499d-b659-2a5353e28c8b', N'212825aa-1bb4-4255-bd78-81229debe566', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A2A100000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29D01305993 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'2c963598-1f66-439e-9fe4-2a83d29df994', N'c5cb6272-8c77-4682-bf7c-c2ccd3491980', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A22800000000 AS DateTime), CAST(5 AS Decimal(18, 0)), CAST(0x0000A29B013039D7 AS DateTime), NULL, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'cd08c338-768a-4df8-bf9b-2b510e9fc9f6', N'298de147-f4f6-492a-90eb-0c14ca5c8c70', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A33300000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B00CB0048 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'f21abced-b5a4-47e6-b2d0-2b77765df27a', N'dcbeda40-9cc2-4144-a32c-e0a625f174db', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A44500000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29D01127FFF AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'9a8ff121-380d-4aa9-a0f6-2bd9d91825db', N'fae0ade0-f078-45f2-aa4d-ae50c74d6605', N'b5ad254d-bab8-4af9-b24d-7e982c01287c', CAST(0x0000A29A00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900F55889 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'755c2104-3b5c-4c00-9b3d-2bdd20a5985d', N'9d1419ba-926e-41f0-b644-508cc939a076', N'8a45396c-c249-486d-a7cd-acf67299d00b', CAST(0x0000A24E00000000 AS DateTime), CAST(1 AS Decimal(18, 0)), CAST(0x0000A25201282AE6 AS DateTime), NULL, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'6223f756-ef14-45ed-aea8-2be173655e82', N'9d1419ba-926e-41f0-b644-508cc939a076', N'8a45396c-c249-486d-a7cd-acf67299d00b', CAST(0x0000A24D00000000 AS DateTime), CAST(3 AS Decimal(18, 0)), CAST(0x0000A252012827E3 AS DateTime), NULL, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'f6147654-e47d-4f4a-b5f0-2c3ed3fc5f81', N'fae0ade0-f078-45f2-aa4d-ae50c74d6605', NULL, CAST(0x0000A2A500000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900F53303 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'97e28c2c-d03b-4dbb-bed1-2c448ea44220', N'212825aa-1bb4-4255-bd78-81229debe566', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A2A000000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29D011F6870 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'de7eabb8-1a20-4ec7-8a1c-2c624479810b', N'd2aa9f43-73ef-4a46-bdab-22504f7200fd', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A29600000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B00DD948C AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'44bc0ba0-d25c-4721-988b-2c6277c803f5', N'298de147-f4f6-492a-90eb-0c14ca5c8c70', NULL, CAST(0x0000A33A00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B012622C9 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'4d70f409-5595-407f-85be-2cf126dce282', N'32381411-25ca-4c48-a5a6-e5c2568b6618', NULL, CAST(0x0000A42C00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B01315FD9 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'07e13f65-a0d4-49aa-9035-2cf616803b68', N'2d101463-213a-45e9-99d1-16e626507541', NULL, CAST(0x0000A2BE00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A2C10131884B AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'0ce36eed-4b41-4120-a8e9-2d570c1e2cba', N'2b94c0d3-1e90-4d37-ad1f-4b737cdb8968', N'b5ad254d-bab8-4af9-b24d-7e982c01287c', CAST(0x0000A2D300000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A2C50130AE25 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'194f9876-8f46-4dd0-80a9-2d8ced127e2e', N'212825aa-1bb4-4255-bd78-81229debe566', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A28C00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29D01305989 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'0cdafc15-82a3-4824-8b1f-2db4e8162db8', N'298de147-f4f6-492a-90eb-0c14ca5c8c70', NULL, CAST(0x0000A31E00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B012622A7 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'4ce8f969-f2fb-48fd-91e9-2de882567db6', N'32381411-25ca-4c48-a5a6-e5c2568b6618', NULL, CAST(0x0000A41B00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B01315FCC AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'be0e9230-b592-4def-9f21-2e00011679e2', N'32381411-25ca-4c48-a5a6-e5c2568b6618', NULL, CAST(0x0000A41400000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B01315FC6 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'8621b97b-bd96-48fe-ae58-2e220ee92183', N'fae0ade0-f078-45f2-aa4d-ae50c74d6605', N'7c5595da-c05a-416c-b2b3-713c9b9853f5', CAST(0x0000A2A500000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900F558B8 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'692d85a4-ed6a-4ef8-b87a-2e3000a4949c', N'fae0ade0-f078-45f2-aa4d-ae50c74d6605', NULL, CAST(0x0000A2A000000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900F532FE AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'af995f4a-50e5-40c6-98be-2e3f9c7ff07e', N'9d1419ba-926e-41f0-b644-508cc939a076', N'c6166f35-9877-4686-8932-aad265ee668a', CAST(0x0000A25500000000 AS DateTime), CAST(8 AS Decimal(18, 0)), CAST(0x0000A25201284B3D AS DateTime), NULL, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'084f6849-76ff-4bce-a508-2e539f368375', N'd2aa9f43-73ef-4a46-bdab-22504f7200fd', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A28C00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B00DD948A AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'95f61c83-b67a-4bd7-8165-2e60cc7c10ec', N'478cb821-f1df-4d4b-bd3c-ca81554fe7b0', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A17200000000 AS DateTime), CAST(8 AS Decimal(18, 0)), CAST(0x0000A29B011E121F AS DateTime), NULL, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'3315ae4c-45ea-4af7-b021-2f30ffbd409e', N'c5cb6272-8c77-4682-bf7c-c2ccd3491980', NULL, CAST(0x0000A21800000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B013026FF AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'5f9a7061-29ad-4060-996e-2f706ccdd596', N'7f54179d-42c2-4844-838f-49f3b90029aa', NULL, CAST(0x0000A2F600000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A2C50135F2A2 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'cf82c012-8274-49c4-abb8-2fabedf125f6', N'298de147-f4f6-492a-90eb-0c14ca5c8c70', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A33000000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B00DDAEA1 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'63f076a9-decd-4128-a32a-3098351c0583', N'c5cb6272-8c77-4682-bf7c-c2ccd3491980', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A21900000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B01303DFC AS DateTime), 1, NULL)
GO
print 'Processed 200 total records'
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'786bbedf-15c6-47d8-bdea-30b5eee325b3', N'd2aa9f43-73ef-4a46-bdab-22504f7200fd', NULL, CAST(0x0000A2A100000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29D0111D73B AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'7f5b377f-83e6-4b64-9bb6-3177532230b2', N'd2aa9f43-73ef-4a46-bdab-22504f7200fd', NULL, CAST(0x0000A29E00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29D0111D73C AS DateTime), 0, 2)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'b071c7d9-839f-4140-a4c7-32d031a4414c', N'7f54179d-42c2-4844-838f-49f3b90029aa', NULL, CAST(0x0000A2F000000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A2C50135F29E AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'0bd08237-741f-4093-9817-32e53e8cbc48', N'41a4c6c4-9288-4c60-aec2-d76cd8910c8e', NULL, CAST(0x0000A18600000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B01311956 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'95ae9ce3-4a5b-4b15-8b0a-32ffa561b703', N'212825aa-1bb4-4255-bd78-81229debe566', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A2A000000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29D01269695 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'675514a2-67e6-4ca6-887f-330363b88e5e', N'f66bcc6b-19a7-420c-be11-8f952a9d344b', NULL, CAST(0x0000A28900000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B00BBCC98 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'6d95c60c-92f6-41bf-a594-330a3b137da7', N'298de147-f4f6-492a-90eb-0c14ca5c8c70', NULL, CAST(0x0000A32900000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B012622B2 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'b86792b6-9c22-4031-ad9e-339da5725354', N'298de147-f4f6-492a-90eb-0c14ca5c8c70', NULL, CAST(0x0000A32300000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B012622AD AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'56f09352-c260-4ed8-ad9a-33c764c71fd2', N'e9adf832-0ad0-4022-b0f7-3884882f2ba9', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A2AC00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B01307EB6 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'4430f33d-730f-4048-bca9-33d4bbf45538', N'd2aa9f43-73ef-4a46-bdab-22504f7200fd', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A28F00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B00DD948A AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'0a018cd1-3b1f-4676-940f-33d57ae8ce93', N'5a5d8679-f4f4-4e3b-a21f-2b2dd836acfd', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A2CA00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B012A3219 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'6ac754ee-ff8e-45cd-a54d-33fefc763ddd', N'fae0ade0-f078-45f2-aa4d-ae50c74d6605', NULL, CAST(0x0000A28A00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900F532DA AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'82f12778-889a-4471-97ae-3455e1ad153f', N'2b94c0d3-1e90-4d37-ad1f-4b737cdb8968', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A2CD00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A2C50136927B AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'48484af8-62d5-461c-9de8-3458bac54008', N'212825aa-1bb4-4255-bd78-81229debe566', N'2946664a-12a0-4827-a41b-272b500a770a', CAST(0x0000A28C00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29D01305989 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'3b4df868-d37c-47bd-9aac-347bb1c918c4', N'dcbeda40-9cc2-4144-a32c-e0a625f174db', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A44400000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29D01138C08 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'6ba12b22-ded2-42b8-bc89-34e840309170', N'eecc0206-511d-4966-a056-b52f90592a6a', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A2F900000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29A012C63AD AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'bc0265f0-8f69-45fb-93ac-34ee743e89c7', N'212825aa-1bb4-4255-bd78-81229debe566', NULL, CAST(0x0000A2A000000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29D0135E27F AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'dbf8001f-6e82-463e-9331-35605ade0cf3', N'166857d3-c4b3-415f-9fd4-eaaf7c1aab75', NULL, CAST(0x0000A13F00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900F52435 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'fb2d8849-f220-46de-a1dc-35b07e6f50ff', N'478cb821-f1df-4d4b-bd3c-ca81554fe7b0', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A15D00000000 AS DateTime), CAST(6 AS Decimal(18, 0)), CAST(0x0000A29B011DFEE0 AS DateTime), NULL, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'ac9ceba6-4cf4-4e1b-9825-35b3529408be', N'c5cb6272-8c77-4682-bf7c-c2ccd3491980', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A22000000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B01303E01 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'76a057cf-1b2f-42d2-a9e6-361284fa0a59', N'e90e53e1-5605-44b2-aed7-df1f195c53c1', NULL, CAST(0x0000A44F00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900DC95F2 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'00f19b9a-84f1-4562-bfe0-3627d1294b37', N'd2aa9f43-73ef-4a46-bdab-22504f7200fd', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A28700000000 AS DateTime), CAST(2 AS Decimal(18, 0)), CAST(0x0000A29D010E73C9 AS DateTime), NULL, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'6c213871-e885-47dc-b806-362805bd1a06', N'fae0ade0-f078-45f2-aa4d-ae50c74d6605', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A29D00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900F55895 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'9aa6da88-cd1e-4d56-a73d-364dc9bfcd60', N'2b94c0d3-1e90-4d37-ad1f-4b737cdb8968', N'b5ad254d-bab8-4af9-b24d-7e982c01287c', CAST(0x0000A2D900000000 AS DateTime), CAST(8 AS Decimal(18, 0)), CAST(0x0000A2C5012C6D20 AS DateTime), NULL, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'76e7b9ff-d915-437d-932d-3653a57c478e', N'fae0ade0-f078-45f2-aa4d-ae50c74d6605', NULL, CAST(0x0000A28800000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900F532D8 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'c40ac38a-5c94-413c-9abf-36adc1989e20', N'fae0ade0-f078-45f2-aa4d-ae50c74d6605', N'7c5595da-c05a-416c-b2b3-713c9b9853f5', CAST(0x0000A2A300000000 AS DateTime), CAST(5 AS Decimal(18, 0)), CAST(0x0000A29900F54804 AS DateTime), NULL, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'c3fc5757-94b4-4a91-ac6a-36d0b3cf4d13', N'212825aa-1bb4-4255-bd78-81229debe566', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A29A00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29D01269691 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'514b1b34-2c95-4ee5-8ea0-373c51a8b882', N'2b94c0d3-1e90-4d37-ad1f-4b737cdb8968', N'b5ad254d-bab8-4af9-b24d-7e982c01287c', CAST(0x0000A2CC00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A2C5012C8B34 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'cdcc35cd-8b99-4571-bd65-3780e880c43c', N'd2aa9f43-73ef-4a46-bdab-22504f7200fd', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A2A100000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B00DD9491 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'786723e9-3d2a-44f7-b4ba-378825918196', N'478cb821-f1df-4d4b-bd3c-ca81554fe7b0', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A16900000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B011E16AD AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'c59f5273-aeac-42db-ac3b-37ef8e6c4955', N'c5cb6272-8c77-4682-bf7c-c2ccd3491980', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A22300000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B01303E03 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'28a4fa74-ccad-4949-a53c-385d0c455fd0', N'9d1419ba-926e-41f0-b644-508cc939a076', N'8a45396c-c249-486d-a7cd-acf67299d00b', CAST(0x0000A24F00000000 AS DateTime), CAST(3 AS Decimal(18, 0)), CAST(0x0000A25201282F5A AS DateTime), NULL, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'1161e8ee-56b3-4f83-bbfc-388eb1b9d54f', N'298de147-f4f6-492a-90eb-0c14ca5c8c70', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A32A00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B00CB003A AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'341a042f-39aa-4ea5-b8e1-38a90909e1b3', N'32381411-25ca-4c48-a5a6-e5c2568b6618', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A42600000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B0131630F AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'8d9980fe-95a1-447f-a5b1-38e505dda515', N'41a4c6c4-9288-4c60-aec2-d76cd8910c8e', NULL, CAST(0x0000A17F00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B01311953 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'a152dc19-c9e5-4d4c-9208-39039a0d2d14', N'fae0ade0-f078-45f2-aa4d-ae50c74d6605', N'b5ad254d-bab8-4af9-b24d-7e982c01287c', CAST(0x0000A29B00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900F5588D AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'23bb16c6-53be-4001-a26e-392e6d32692a', N'7f54179d-42c2-4844-838f-49f3b90029aa', NULL, CAST(0x0000A2E800000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A2C50135F290 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'afff54c9-7b97-4666-a6a2-39ff713ea82b', N'd2aa9f43-73ef-4a46-bdab-22504f7200fd', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A28A00000000 AS DateTime), CAST(1 AS Decimal(18, 0)), CAST(0x0000A29D010E8538 AS DateTime), NULL, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'bf4e1e12-3cb5-4b72-b528-3a5d4aeee9ab', N'212825aa-1bb4-4255-bd78-81229debe566', N'2946664a-12a0-4827-a41b-272b500a770a', CAST(0x0000A29A00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29D01269693 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'79155abb-dac6-45ee-b2ad-3a5fa6f19786', N'dcbeda40-9cc2-4144-a32c-e0a625f174db', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A44400000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29D01127FFE AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'd3a2cde8-0730-44ea-bc94-3a944cae5f89', N'c5cb6272-8c77-4682-bf7c-c2ccd3491980', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A21F00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B01303E00 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'df7958fe-e627-47ab-a589-3b3d8cba9ec0', N'9e7c8d21-2e45-4c34-912d-036d9e9147cf', NULL, CAST(0x0000A2D800000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A2BE013CCB01 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'155b4313-2299-4e43-a133-3b4bb15cd43f', N'dcbeda40-9cc2-4144-a32c-e0a625f174db', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A43E00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29D01138C07 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'001aa9f3-1fbd-4d1f-9839-3b666c390131', N'298de147-f4f6-492a-90eb-0c14ca5c8c70', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A32600000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B00CB0036 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'8ba21348-0a1b-4d5a-91ec-3bb2152082ee', N'9a2d99e8-1c2a-4bac-a840-c4f6692041b9', NULL, CAST(0x0000A2C100000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A2AC00AE410B AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'7688caae-eaac-4be1-ac61-3c158f1a0aea', N'2d101463-213a-45e9-99d1-16e626507541', N'b5ad254d-bab8-4af9-b24d-7e982c01287c', CAST(0x0000A2BB00000000 AS DateTime), CAST(8 AS Decimal(18, 0)), CAST(0x0000A2C10131B377 AS DateTime), NULL, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'7cefad9d-8856-4916-b626-3c39c91cb1f8', N'298de147-f4f6-492a-90eb-0c14ca5c8c70', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A33100000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B00CB0045 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'1c1ef03b-868f-4b78-8942-3cba8e1700b2', N'fae0ade0-f078-45f2-aa4d-ae50c74d6605', N'2946664a-12a0-4827-a41b-272b500a770a', CAST(0x0000A28E00000000 AS DateTime), CAST(5 AS Decimal(18, 0)), CAST(0x0000A29900F54F17 AS DateTime), NULL, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'9e1a550c-26b7-48b7-86d5-3cdc4e44f4dd', N'2b94c0d3-1e90-4d37-ad1f-4b737cdb8968', N'b5ad254d-bab8-4af9-b24d-7e982c01287c', CAST(0x0000A2DB00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A2C5012FFD2F AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'109fdd4d-f706-47d5-89af-3cddf0968534', N'c5cb6272-8c77-4682-bf7c-c2ccd3491980', NULL, CAST(0x0000A21900000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B01302700 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'dd365b2f-2c58-4f2e-ad80-3d19473ee00e', N'fae0ade0-f078-45f2-aa4d-ae50c74d6605', N'2946664a-12a0-4827-a41b-272b500a770a', CAST(0x0000A29900000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900F55886 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'e62d02f9-9485-48d4-9c16-3d38a824086d', N'e90e53e1-5605-44b2-aed7-df1f195c53c1', NULL, CAST(0x0000A46B00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900DC9617 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'ea1f092f-e9ff-4617-bdb8-3d3c9e0fab3b', N'212825aa-1bb4-4255-bd78-81229debe566', N'2946664a-12a0-4827-a41b-272b500a770a', CAST(0x0000A29E00000000 AS DateTime), CAST(3 AS Decimal(18, 0)), CAST(0x0000A29D0135F250 AS DateTime), NULL, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'd0f8dd3d-99b0-4738-9481-3d4c80f84282', N'fae0ade0-f078-45f2-aa4d-ae50c74d6605', N'2946664a-12a0-4827-a41b-272b500a770a', CAST(0x0000A29000000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900F5585F AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'2c075aba-a997-412e-be2f-3d8c4ef1a1a6', N'5a5d8679-f4f4-4e3b-a21f-2b2dd836acfd', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A2DF00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B012A3233 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'983253d6-1957-4828-aae1-3dc48ca1c025', N'fae0ade0-f078-45f2-aa4d-ae50c74d6605', N'2946664a-12a0-4827-a41b-272b500a770a', CAST(0x0000A29D00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900F55892 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'547449e8-aeb1-493d-bbf8-3e0a08818811', N'2b94c0d3-1e90-4d37-ad1f-4b737cdb8968', N'b5ad254d-bab8-4af9-b24d-7e982c01287c', CAST(0x0000A2D600000000 AS DateTime), CAST(8 AS Decimal(18, 0)), CAST(0x0000A2C5012C6B39 AS DateTime), NULL, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'02010c97-3c95-4fd4-976d-3e1e61bc4c60', N'd2aa9f43-73ef-4a46-bdab-22504f7200fd', NULL, CAST(0x0000A29F00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29D0111D73C AS DateTime), 0, 2)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'e5c9f5bd-363f-4c0f-a3b1-3e859684e6b9', N'fae0ade0-f078-45f2-aa4d-ae50c74d6605', N'7c5595da-c05a-416c-b2b3-713c9b9853f5', CAST(0x0000A28B00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900F55850 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'90bd55fd-72ef-43c4-b1d6-3e91c3a20d6f', N'9d1419ba-926e-41f0-b644-508cc939a076', N'20cd934f-ba3f-4595-b2f1-ab1e3eb04b7b', CAST(0x0000A25900000000 AS DateTime), CAST(6 AS Decimal(18, 0)), CAST(0x0000A25201285BED AS DateTime), NULL, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'c78075e0-6231-49f8-8bc8-3ea78d82fd3a', N'81530680-dd37-4681-aaa4-679745a7fb89', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A30900000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29A0138A344 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'c8782cfa-bd5b-42a8-a066-3ead292f1143', N'2d101463-213a-45e9-99d1-16e626507541', N'b5ad254d-bab8-4af9-b24d-7e982c01287c', CAST(0x0000A2C000000000 AS DateTime), CAST(8 AS Decimal(18, 0)), CAST(0x0000A2C10131BFE5 AS DateTime), NULL, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'869e0667-0fa4-408c-a3c8-3eadc2578357', N'dcbeda40-9cc2-4144-a32c-e0a625f174db', N'2946664a-12a0-4827-a41b-272b500a770a', CAST(0x0000A43700000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29D01138C06 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'1945ddd2-6295-45d1-b929-3ecb1703d962', N'212825aa-1bb4-4255-bd78-81229debe566', NULL, CAST(0x0000A29F00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29D0135E282 AS DateTime), 0, 2)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'5625e82b-c1c7-43df-9469-3f4f0423064a', N'298de147-f4f6-492a-90eb-0c14ca5c8c70', NULL, CAST(0x0000A33000000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B012622BD AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'3802221b-782a-4a17-ae8e-3f58eb6b0c77', N'81530680-dd37-4681-aaa4-679745a7fb89', NULL, CAST(0x0000A31000000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A2C50102BA28 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'a5d271b7-4edc-4e52-9bcf-3ff434e6647f', N'212825aa-1bb4-4255-bd78-81229debe566', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A29900000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29D0126968D AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'f8928b12-98be-4365-bc77-3ff80bb71f46', N'2d101463-213a-45e9-99d1-16e626507541', N'b5ad254d-bab8-4af9-b24d-7e982c01287c', CAST(0x0000A2B200000000 AS DateTime), CAST(4 AS Decimal(18, 0)), CAST(0x0000A2C10131A107 AS DateTime), NULL, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'1c9e9592-4988-43da-b7f6-41525ebcfd9e', N'478cb821-f1df-4d4b-bd3c-ca81554fe7b0', NULL, CAST(0x0000A16200000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B011DF14C AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'729e986d-c31d-4428-ad7b-41b809fc3555', N'fae0ade0-f078-45f2-aa4d-ae50c74d6605', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A29300000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900F55872 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'fc9b7eda-a17c-4db6-a8e6-422159c456bd', N'fae0ade0-f078-45f2-aa4d-ae50c74d6605', N'b5ad254d-bab8-4af9-b24d-7e982c01287c', CAST(0x0000A29C00000000 AS DateTime), CAST(55 AS Decimal(18, 0)), CAST(0x0000A29900F54279 AS DateTime), NULL, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'e2148f1f-b30a-4c46-8902-426eb1c96cee', N'32381411-25ca-4c48-a5a6-e5c2568b6618', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A43000000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B01316320 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'61a62cb5-c33d-4b19-9e16-42797f87cffa', N'fae0ade0-f078-45f2-aa4d-ae50c74d6605', N'7c5595da-c05a-416c-b2b3-713c9b9853f5', CAST(0x0000A29B00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900F5588F AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'39da5800-54aa-4ed5-9f3a-428188edd940', N'298de147-f4f6-492a-90eb-0c14ca5c8c70', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A33000000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B00CB0040 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'f044de74-7ce4-4def-a4bc-429408badab7', N'fae0ade0-f078-45f2-aa4d-ae50c74d6605', N'2946664a-12a0-4827-a41b-272b500a770a', CAST(0x0000A2A400000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900F558B0 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'33d9ae36-e6db-43eb-a1c4-42d17ab29838', N'474dd670-399c-425c-b3c6-3e73132144d3', NULL, CAST(0x0000A15500000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B01324C86 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'42f1439d-4999-46a3-b926-42db024cfaca', N'32381411-25ca-4c48-a5a6-e5c2568b6618', NULL, CAST(0x0000A42600000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B01315FD5 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'a1b1b4ec-2124-4eed-851d-4313e7d2e44e', N'2d101463-213a-45e9-99d1-16e626507541', NULL, CAST(0x0000A2BF00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A2C10131884D AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'b42da81f-6411-42f4-bc0b-432260ad6f3d', N'212825aa-1bb4-4255-bd78-81229debe566', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A2A100000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29D0126969A AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'27fccdaf-0d80-4a0a-8e6c-432816447c60', N'd2aa9f43-73ef-4a46-bdab-22504f7200fd', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A29200000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29D01120262 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'8ebd340f-14d7-4d4c-ae8f-432a2b810730', N'22250e0f-8265-43e8-9fcb-a697f59744a7', NULL, CAST(0x0000A53700000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B01319FAB AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'3d25f113-f9b6-44f3-89a9-433f5877031c', N'2b94c0d3-1e90-4d37-ad1f-4b737cdb8968', N'b5ad254d-bab8-4af9-b24d-7e982c01287c', CAST(0x0000A2C500000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A2C501369254 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'15a8d456-7844-4e60-bfd8-438b9f8f3ea0', N'298de147-f4f6-492a-90eb-0c14ca5c8c70', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A33700000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B00CB004B AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'508cb749-1fa7-42c3-a3ad-439657972a56', N'c5cb6272-8c77-4682-bf7c-c2ccd3491980', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A22A00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B01303E08 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'eea7e108-61af-419a-852c-43c8dbf545b0', N'fae0ade0-f078-45f2-aa4d-ae50c74d6605', N'b5ad254d-bab8-4af9-b24d-7e982c01287c', CAST(0x0000A29500000000 AS DateTime), CAST(5 AS Decimal(18, 0)), CAST(0x0000A29900F54B3D AS DateTime), NULL, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'b73a2a6e-8d3c-4550-8f75-445810db7fea', N'5a5d8679-f4f4-4e3b-a21f-2b2dd836acfd', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A2C800000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B012A3217 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'a1546005-f1e9-4cd9-95e3-447910f5bf34', N'478cb821-f1df-4d4b-bd3c-ca81554fe7b0', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A16B00000000 AS DateTime), CAST(8 AS Decimal(18, 0)), CAST(0x0000A29B011E08CC AS DateTime), NULL, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'8e73c7db-7634-4b22-8c50-4499c7964840', N'd2aa9f43-73ef-4a46-bdab-22504f7200fd', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A29300000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B00DD948C AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'7d5d249f-78c6-4360-9e45-453071fd2bc3', N'2b94c0d3-1e90-4d37-ad1f-4b737cdb8968', N'b5ad254d-bab8-4af9-b24d-7e982c01287c', CAST(0x0000A2DA00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A2C5012FFD2A AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'c8ec0757-0fc1-4208-b001-45bc9a6c081f', N'fae0ade0-f078-45f2-aa4d-ae50c74d6605', NULL, CAST(0x0000A29E00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900F532FC AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'7b3b24c3-e1c2-4cc2-905f-4687866b8369', N'd2aa9f43-73ef-4a46-bdab-22504f7200fd', N'2946664a-12a0-4827-a41b-272b500a770a', CAST(0x0000A28C00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29D01120261 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'728e1fb2-960a-4392-a939-470bb71d8ab1', N'fae0ade0-f078-45f2-aa4d-ae50c74d6605', N'2946664a-12a0-4827-a41b-272b500a770a', CAST(0x0000A29A00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900F55889 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'53758da5-bc31-408d-95a1-4711097ae274', N'c5cb6272-8c77-4682-bf7c-c2ccd3491980', NULL, CAST(0x0000A21400000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B013026FD AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'3588d2bf-00b7-486a-8259-4794047c6932', N'fae0ade0-f078-45f2-aa4d-ae50c74d6605', N'2946664a-12a0-4827-a41b-272b500a770a', CAST(0x0000A2A000000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900F558A1 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'fbd3cb92-f7cd-45ac-bd89-4846ba07513f', N'22250e0f-8265-43e8-9fcb-a697f59744a7', NULL, CAST(0x0000A53000000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B01319FA8 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'7ad1b023-09dc-4222-99c0-485470b0ffbd', N'298de147-f4f6-492a-90eb-0c14ca5c8c70', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A33100000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B01263B98 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'1621ef49-1a70-4153-9512-48675be5d81d', N'212825aa-1bb4-4255-bd78-81229debe566', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A28900000000 AS DateTime), CAST(5 AS Decimal(18, 0)), CAST(0x0000A29D011F4F58 AS DateTime), NULL, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'5f73e111-d45c-4c30-9bbd-48a7a21c4a40', N'9d1419ba-926e-41f0-b644-508cc939a076', N'c6166f35-9877-4686-8932-aad265ee668a', CAST(0x0000A25900000000 AS DateTime), CAST(4 AS Decimal(18, 0)), CAST(0x0000A252012864D0 AS DateTime), NULL, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'3538c693-0100-4ca6-9786-48e155335fe0', N'421f636a-d553-4b50-8347-0a4d9a9db06b', NULL, CAST(0x0000A29900000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29700C3C525 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'e68e4bea-c5eb-4a17-a810-4921fa335ba3', N'212825aa-1bb4-4255-bd78-81229debe566', N'2946664a-12a0-4827-a41b-272b500a770a', CAST(0x0000A28C00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29D01269682 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'dcff4e10-bbed-4037-a38e-495bea6c8905', N'7f54179d-42c2-4844-838f-49f3b90029aa', NULL, CAST(0x0000A2E100000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A2C50135F284 AS DateTime), 0, 1)
GO
print 'Processed 300 total records'
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'a6cd6bb5-662b-41fd-9a41-497ff81ef554', N'166857d3-c4b3-415f-9fd4-eaaf7c1aab75', NULL, CAST(0x0000A14F00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900F52442 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'a6030040-17cf-45f5-9136-49e274696a5c', N'298de147-f4f6-492a-90eb-0c14ca5c8c70', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A32900000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B00DDAE9F AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'02597f27-ced5-4464-8bf6-4aeb156201ef', N'2b94c0d3-1e90-4d37-ad1f-4b737cdb8968', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A2D300000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A2C501369288 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'8da258c7-25e3-4607-8116-4b0b7b49ab25', N'fae0ade0-f078-45f2-aa4d-ae50c74d6605', NULL, CAST(0x0000A29D00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900F532FB AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'67e4279f-daa1-4bc2-9317-4b0d5687058e', N'eecc0206-511d-4966-a056-b52f90592a6a', NULL, CAST(0x0000A2EE00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29A012C1676 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'4f2b60c6-43f0-4223-a57c-4b8814c11cb8', N'eecc0206-511d-4966-a056-b52f90592a6a', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A2F000000000 AS DateTime), CAST(5 AS Decimal(18, 0)), CAST(0x0000A29A012C5EB8 AS DateTime), NULL, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'208d4484-39fc-4638-8817-4bc716ec3065', N'2b94c0d3-1e90-4d37-ad1f-4b737cdb8968', N'b5ad254d-bab8-4af9-b24d-7e982c01287c', CAST(0x0000A2CA00000000 AS DateTime), CAST(4 AS Decimal(18, 0)), CAST(0x0000A2C5012C6683 AS DateTime), NULL, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'd5f3af3c-9a82-43da-9280-4becec955b1e', N'fae0ade0-f078-45f2-aa4d-ae50c74d6605', N'7c5595da-c05a-416c-b2b3-713c9b9853f5', CAST(0x0000A2A400000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900F558B2 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'eb3adce3-f2ae-4f23-b5f9-4c745096ab50', N'212825aa-1bb4-4255-bd78-81229debe566', N'2946664a-12a0-4827-a41b-272b500a770a', CAST(0x0000A29300000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29D011F6867 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'39c6019b-79da-4d9f-9b9f-4c9dbb9bc684', N'298de147-f4f6-492a-90eb-0c14ca5c8c70', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A32C00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B00DDAE9F AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'e0a0016d-29ed-4ddc-a96e-4d3889a3ee58', N'fae0ade0-f078-45f2-aa4d-ae50c74d6605', N'b5ad254d-bab8-4af9-b24d-7e982c01287c', CAST(0x0000A29F00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900F5589B AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'b51ffd51-f5b7-47e7-a11b-4d45b45a3781', N'fae0ade0-f078-45f2-aa4d-ae50c74d6605', N'2946664a-12a0-4827-a41b-272b500a770a', CAST(0x0000A29300000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900F5586B AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'15b9b78d-c139-4084-848c-4d91b47fa178', N'212825aa-1bb4-4255-bd78-81229debe566', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A29A00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29D0135F3FE AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'e942ce64-ed55-4ab2-8c76-4e14288cf5e2', N'212825aa-1bb4-4255-bd78-81229debe566', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A28C00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29D01269680 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'4584935b-ac8f-499d-99a0-4e3dd51f7736', N'fae0ade0-f078-45f2-aa4d-ae50c74d6605', N'2946664a-12a0-4827-a41b-272b500a770a', CAST(0x0000A28C00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900F55853 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'7fce16ad-89d1-48fb-95db-4e75ed983aad', N'212825aa-1bb4-4255-bd78-81229debe566', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A28B00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29D0135F3F6 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'ddce4a61-36f7-4405-a96f-4e9d5622c6f0', N'dcbeda40-9cc2-4144-a32c-e0a625f174db', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A44B00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29D01138C0B AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'374e6a0c-0eed-4fa8-b999-4eaefb1eaf63', N'2d101463-213a-45e9-99d1-16e626507541', N'b5ad254d-bab8-4af9-b24d-7e982c01287c', CAST(0x0000A2BF00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A2C10131C339 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'740d4890-c89f-4a32-b9d0-4ef005f4d1b7', N'd2aa9f43-73ef-4a46-bdab-22504f7200fd', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A28B00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B00DD9489 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'63fdf747-3967-43b4-9c6b-4f0e2f7ffbe3', N'd2aa9f43-73ef-4a46-bdab-22504f7200fd', NULL, CAST(0x0000A29A00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29D0111D73A AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'6add5a4a-6d72-4c2b-9c02-4f8f004d0a1a', N'478cb821-f1df-4d4b-bd3c-ca81554fe7b0', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A17100000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B011E16BE AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'c13fdf5a-973e-4ce8-a9bb-4fbf2b1b8734', N'2b94c0d3-1e90-4d37-ad1f-4b737cdb8968', N'b5ad254d-bab8-4af9-b24d-7e982c01287c', CAST(0x0000A2C900000000 AS DateTime), CAST(4 AS Decimal(18, 0)), CAST(0x0000A2C5012C65B0 AS DateTime), NULL, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'48adc3f1-5afe-4ad6-91fb-4fee5e1e2b45', N'9a2d99e8-1c2a-4bac-a840-c4f6692041b9', NULL, CAST(0x0000A2B200000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A2AC00AE4102 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'c36d1916-bf9f-4bb3-a0ac-504761310c6f', N'298de147-f4f6-492a-90eb-0c14ca5c8c70', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A32700000000 AS DateTime), CAST(4 AS Decimal(18, 0)), CAST(0x0000A29B00C951F9 AS DateTime), NULL, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'14788752-d70c-4d93-96d8-505c49f3a3b9', N'212825aa-1bb4-4255-bd78-81229debe566', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A28B00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29D01305986 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'c7282747-9d6d-4c04-926b-505ce8b458ae', N'2d101463-213a-45e9-99d1-16e626507541', N'b5ad254d-bab8-4af9-b24d-7e982c01287c', CAST(0x0000A2B000000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A2C10131C32D AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'5d9cbba6-2d93-42d0-b189-505ed1a530a5', N'2b94c0d3-1e90-4d37-ad1f-4b737cdb8968', N'2946664a-12a0-4827-a41b-272b500a770a', CAST(0x0000A2C500000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A2C50136923E AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'c55086ac-3307-4faa-99f1-51043a01113a', N'dcbeda40-9cc2-4144-a32c-e0a625f174db', N'2946664a-12a0-4827-a41b-272b500a770a', CAST(0x0000A44300000000 AS DateTime), CAST(4 AS Decimal(18, 0)), CAST(0x0000A29D01138021 AS DateTime), NULL, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'58a9af7f-536a-4f28-8bcd-513184271778', N'478cb821-f1df-4d4b-bd3c-ca81554fe7b0', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A16A00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B011E16B3 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'd663ce4f-75ba-488e-87ba-5136dacabd50', N'9a2d99e8-1c2a-4bac-a840-c4f6692041b9', NULL, CAST(0x0000A2C000000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A2AC00AE410A AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'dd04edf9-fec7-4026-b811-5279c5528e4a', N'478cb821-f1df-4d4b-bd3c-ca81554fe7b0', NULL, CAST(0x0000A17100000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B011DF167 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'2d6994cd-2669-4bfb-9bb0-52d1df5632bd', N'81530680-dd37-4681-aaa4-679745a7fb89', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A30A00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29A0138A346 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'62c08045-084f-447a-a921-5314833b0c13', N'298de147-f4f6-492a-90eb-0c14ca5c8c70', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A33800000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B00CB004D AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'81d9a51b-0d65-4dd2-a3a2-53152f8df280', N'c5cb6272-8c77-4682-bf7c-c2ccd3491980', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A21A00000000 AS DateTime), CAST(5 AS Decimal(18, 0)), CAST(0x0000A29B01303209 AS DateTime), NULL, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'b9d804b7-7d19-42c8-b811-53588610d91e', N'478cb821-f1df-4d4b-bd3c-ca81554fe7b0', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A16200000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B011E16A2 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'ee1044be-5a7d-48fa-b635-539fa8b9b1fe', N'298de147-f4f6-492a-90eb-0c14ca5c8c70', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A33B00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B00DDAEA3 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'bfd25a53-f299-4f5c-9208-5402ccf05ed0', N'212825aa-1bb4-4255-bd78-81229debe566', N'2946664a-12a0-4827-a41b-272b500a770a', CAST(0x0000A29200000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29D01269686 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'fc0e0f95-55f5-4cbc-b618-541142fc52c3', N'd2aa9f43-73ef-4a46-bdab-22504f7200fd', N'2946664a-12a0-4827-a41b-272b500a770a', CAST(0x0000A28800000000 AS DateTime), CAST(8 AS Decimal(18, 0)), CAST(0x0000A29D010E6399 AS DateTime), NULL, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'ba0bfe9c-42b1-4057-9cda-547ed8d6fd01', N'9d1419ba-926e-41f0-b644-508cc939a076', N'c6166f35-9877-4686-8932-aad265ee668a', CAST(0x0000A24C00000000 AS DateTime), CAST(1 AS Decimal(18, 0)), CAST(0x0000A25201282454 AS DateTime), NULL, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'3ab1dd1e-c147-407e-a0e9-553b05957d88', N'eecc0206-511d-4966-a056-b52f90592a6a', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A2EA00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29A012C6397 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'0fd93804-caf2-4a95-9be2-555359ae33bc', N'd2aa9f43-73ef-4a46-bdab-22504f7200fd', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A29800000000 AS DateTime), CAST(4 AS Decimal(18, 0)), CAST(0x0000A29D010EB259 AS DateTime), NULL, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'e7551846-ce82-48d6-ae39-557959930aa2', N'd2aa9f43-73ef-4a46-bdab-22504f7200fd', N'2946664a-12a0-4827-a41b-272b500a770a', CAST(0x0000A29300000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29D01120262 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'3fb207c2-9062-470f-ba11-55936d66c177', N'212825aa-1bb4-4255-bd78-81229debe566', N'2946664a-12a0-4827-a41b-272b500a770a', CAST(0x0000A28C00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29D0135F3F9 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'2e205273-842e-4fcb-9db4-55ce2dc1e916', N'32381411-25ca-4c48-a5a6-e5c2568b6618', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A41E00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B01316307 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'e5b89f01-ee21-4b04-956d-55ef55c99833', N'eecc0206-511d-4966-a056-b52f90592a6a', NULL, CAST(0x0000A2F500000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29A012C167C AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'a8477b98-9f5b-4219-ad6c-56225063ae2a', N'212825aa-1bb4-4255-bd78-81229debe566', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A29900000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29D011F6868 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'94639ff4-93a3-4e36-8eec-567301431680', N'5a5d8679-f4f4-4e3b-a21f-2b2dd836acfd', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A2DC00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B012A322F AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'3bce41be-905c-4f45-b267-5677be8eb4a7', N'dcbeda40-9cc2-4144-a32c-e0a625f174db', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A43E00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29D01127FFD AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'd61f8a1e-be68-46f5-9a8e-56aff23fe06c', N'fae0ade0-f078-45f2-aa4d-ae50c74d6605', N'2946664a-12a0-4827-a41b-272b500a770a', CAST(0x0000A29E00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900F55897 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'aaf66341-b0d3-40eb-a815-56c1b8c1579b', N'c5cb6272-8c77-4682-bf7c-c2ccd3491980', NULL, CAST(0x0000A22A00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B0130270D AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'317feaef-1572-46c8-ae80-56e2900c6160', N'fae0ade0-f078-45f2-aa4d-ae50c74d6605', N'7c5595da-c05a-416c-b2b3-713c9b9853f5', CAST(0x0000A28E00000000 AS DateTime), CAST(5 AS Decimal(18, 0)), CAST(0x0000A29900F54FE8 AS DateTime), NULL, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'633311fb-3b45-4ae5-b1e3-573f4aec0635', N'421f636a-d553-4b50-8347-0a4d9a9db06b', NULL, CAST(0x0000A2A000000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29700C3C52D AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'0939311d-8da2-49bf-a49b-577cfe8d5c20', N'fae0ade0-f078-45f2-aa4d-ae50c74d6605', N'2946664a-12a0-4827-a41b-272b500a770a', CAST(0x0000A29C00000000 AS DateTime), CAST(5 AS Decimal(18, 0)), CAST(0x0000A29900F54535 AS DateTime), NULL, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'06572d46-5324-4763-ba7d-57a65295c5dd', N'fae0ade0-f078-45f2-aa4d-ae50c74d6605', N'b5ad254d-bab8-4af9-b24d-7e982c01287c', CAST(0x0000A29E00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900F55896 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'76515933-5f31-4fb1-8135-5872b671efba', N'32381411-25ca-4c48-a5a6-e5c2568b6618', NULL, CAST(0x0000A42F00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B01315FDC AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'bf2c0463-a33e-4e80-820d-58ad2417e125', N'fae0ade0-f078-45f2-aa4d-ae50c74d6605', N'7c5595da-c05a-416c-b2b3-713c9b9853f5', CAST(0x0000A28700000000 AS DateTime), CAST(5 AS Decimal(18, 0)), CAST(0x0000A29900F55432 AS DateTime), NULL, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'3c3dc072-8817-4dfb-aa98-590649347c7f', N'eecc0206-511d-4966-a056-b52f90592a6a', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A2E800000000 AS DateTime), CAST(5 AS Decimal(18, 0)), CAST(0x0000A29A012C5A94 AS DateTime), NULL, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'8575a202-8284-4c1b-a2ab-5912772d5cbb', N'c5cb6272-8c77-4682-bf7c-c2ccd3491980', NULL, CAST(0x0000A21100000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B013026FB AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'159cfc87-4964-469d-880f-59355ee1908f', N'2d101463-213a-45e9-99d1-16e626507541', N'b5ad254d-bab8-4af9-b24d-7e982c01287c', CAST(0x0000A2AB00000000 AS DateTime), CAST(4 AS Decimal(18, 0)), CAST(0x0000A2C101318FAC AS DateTime), NULL, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'9641fb5c-2e9b-45af-9975-5949f68d6097', N'2b94c0d3-1e90-4d37-ad1f-4b737cdb8968', N'2946664a-12a0-4827-a41b-272b500a770a', CAST(0x0000A2D400000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A2C5012FFD28 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'b4d593b1-f68f-40bf-ad6c-5995ff456232', N'e9adf832-0ad0-4022-b0f7-3884882f2ba9', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A2C100000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B01307EC5 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'77ed4af6-4936-46e5-9302-5a0cd5bda234', N'd2aa9f43-73ef-4a46-bdab-22504f7200fd', NULL, CAST(0x0000A29900000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29D0111D739 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'd2a68f6e-8fd8-4531-bee2-5ab7f5bdccf2', N'478cb821-f1df-4d4b-bd3c-ca81554fe7b0', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A17000000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B011E16BB AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'e77b0e15-7efb-40e1-a4c8-5b0212f5c2d1', N'41a4c6c4-9288-4c60-aec2-d76cd8910c8e', NULL, CAST(0x0000A18D00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B01311958 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'cc80d782-08d2-4848-acaa-5bd2f568e965', N'c5cb6272-8c77-4682-bf7c-c2ccd3491980', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A20E00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B01303DF6 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'a7cc342f-3f16-4f0e-9522-5c02bae9e1c6', N'32381411-25ca-4c48-a5a6-e5c2568b6618', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A41A00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B01316304 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'52ab56fb-a5ba-454f-aae4-5c57bf68c706', N'e9adf832-0ad0-4022-b0f7-3884882f2ba9', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A2BF00000000 AS DateTime), CAST(4 AS Decimal(18, 0)), CAST(0x0000A29B01307B39 AS DateTime), NULL, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'b06964e6-56ec-4722-ab6a-5c6a841322fa', N'5a5d8679-f4f4-4e3b-a21f-2b2dd836acfd', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A2DD00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B012A3231 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'dff0d983-d041-4ff1-b034-5c70c724582a', N'd2aa9f43-73ef-4a46-bdab-22504f7200fd', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A29A00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29D01120265 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'f0cd3197-278a-4c71-844d-5cad0b258bd4', N'd2aa9f43-73ef-4a46-bdab-22504f7200fd', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A2A100000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29D01120266 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'74a97e23-7986-4769-8aec-5cb4ddc88d24', N'e9adf832-0ad0-4022-b0f7-3884882f2ba9', NULL, CAST(0x0000A2A700000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B01306B47 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'89bda86b-8ff0-49ee-8d4c-5cba7bb9c9f8', N'166857d3-c4b3-415f-9fd4-eaaf7c1aab75', NULL, CAST(0x0000A15100000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900F52445 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'1ac6eddc-3613-4cc7-b8b0-5d227311b2f7', N'298de147-f4f6-492a-90eb-0c14ca5c8c70', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A33A00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B00DDAEA3 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'657f73a1-d463-406e-9a35-5dc063414c7b', N'212825aa-1bb4-4255-bd78-81229debe566', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A29900000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29D0130598C AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'7b092ab3-493d-4efb-974e-5dddcf57e7df', N'd2aa9f43-73ef-4a46-bdab-22504f7200fd', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A28B00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29D01120260 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'30fd313b-8bd8-40d9-9be3-5ddfe11daa21', N'81530680-dd37-4681-aaa4-679745a7fb89', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A31B00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29A0138A355 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'f0b1592d-3adf-41f2-a22c-5df72715826c', N'fae0ade0-f078-45f2-aa4d-ae50c74d6605', N'7c5595da-c05a-416c-b2b3-713c9b9853f5', CAST(0x0000A28800000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900F55842 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'59a3e3c8-be1e-4b1a-b192-5e1917894d52', N'd2aa9f43-73ef-4a46-bdab-22504f7200fd', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A2A000000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B00DD9491 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'1774c123-fb51-4f9c-89fc-5e2c49ff7820', N'478cb821-f1df-4d4b-bd3c-ca81554fe7b0', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A16F00000000 AS DateTime), CAST(8 AS Decimal(18, 0)), CAST(0x0000A29B011E0B81 AS DateTime), NULL, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'2e815b90-e323-443f-b517-5e8dcb9f23d3', N'32381411-25ca-4c48-a5a6-e5c2568b6618', NULL, CAST(0x0000A42900000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B01315FD8 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'1675a126-d8ac-46da-9309-5e8e09fae1c4', N'e9adf832-0ad0-4022-b0f7-3884882f2ba9', NULL, CAST(0x0000A2BD00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B01306B59 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'6f37da9e-ae35-4fb0-a031-5e9cde787a5a', N'478cb821-f1df-4d4b-bd3c-ca81554fe7b0', NULL, CAST(0x0000A15C00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B011DF143 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'47eebc18-23d8-411c-802f-5ec29d122617', N'e9adf832-0ad0-4022-b0f7-3884882f2ba9', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A2BC00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B01307EC0 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'e06a859a-4fa5-438a-948f-5f2b2c3f2e95', N'32381411-25ca-4c48-a5a6-e5c2568b6618', NULL, CAST(0x0000A41300000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B01315FC4 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'c15dd0a7-e489-4516-afb0-5fbb5bd33cb5', N'f66bcc6b-19a7-420c-be11-8f952a9d344b', NULL, CAST(0x0000A29600000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B00BBCCA2 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'505e67bc-808c-4d18-88c1-6015dc87d05a', N'298de147-f4f6-492a-90eb-0c14ca5c8c70', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A33B00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B01263BA4 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'7bd38ac7-e63a-4b38-a284-603a4e7694aa', N'298de147-f4f6-492a-90eb-0c14ca5c8c70', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A32800000000 AS DateTime), CAST(8 AS Decimal(18, 0)), CAST(0x0000A29B0125103F AS DateTime), NULL, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'5f26833d-341b-460c-8796-60f46be89b24', N'474dd670-399c-425c-b3c6-3e73132144d3', NULL, CAST(0x0000A13F00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B01324C7B AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'c9b693b0-9e9d-4f6e-8aa2-611c8466c286', N'e90e53e1-5605-44b2-aed7-df1f195c53c1', NULL, CAST(0x0000A45D00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900DC9606 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'28101b03-034b-416d-becb-613fd449a686', N'fae0ade0-f078-45f2-aa4d-ae50c74d6605', NULL, CAST(0x0000A2A400000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900F53301 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'd2be5cb6-39b7-47c6-a2a8-6144d8d6d2e4', N'eecc0206-511d-4966-a056-b52f90592a6a', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A2E900000000 AS DateTime), CAST(5 AS Decimal(18, 0)), CAST(0x0000A29A012C5C63 AS DateTime), NULL, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'919a801d-872a-4cb5-8bec-61c7aea4674e', N'298de147-f4f6-492a-90eb-0c14ca5c8c70', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A31F00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B01263B85 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'b30a36a5-850c-45a9-8461-630c950384c4', N'eecc0206-511d-4966-a056-b52f90592a6a', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A2FB00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29A012C63AE AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'ddf02dc2-24a9-4cd5-b22f-636709e59f17', N'166857d3-c4b3-415f-9fd4-eaaf7c1aab75', NULL, CAST(0x0000A13A00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900F52431 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'd00cec24-5d1e-432e-b293-6368bcf00649', N'dcbeda40-9cc2-4144-a32c-e0a625f174db', NULL, CAST(0x0000A44500000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29D01134867 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'337005e5-d492-4f65-a1b0-639ad38b8222', N'fae0ade0-f078-45f2-aa4d-ae50c74d6605', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A28B00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900F55851 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'0c0d7f4e-46ee-4a6c-a20b-63b4c238539f', N'fae0ade0-f078-45f2-aa4d-ae50c74d6605', N'b5ad254d-bab8-4af9-b24d-7e982c01287c', CAST(0x0000A2A500000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900F558B6 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'4fb948d8-44ea-4988-8437-63e024380116', N'478cb821-f1df-4d4b-bd3c-ca81554fe7b0', NULL, CAST(0x0000A17300000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B011DF16A AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'd217a32e-9d6b-4a9a-805c-64028210f222', N'212825aa-1bb4-4255-bd78-81229debe566', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A2A000000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29D01305992 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'ce17db7b-5b0e-47b7-b67b-6457f790919d', N'212825aa-1bb4-4255-bd78-81229debe566', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A28C00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29D011F685D AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'e12450e1-3f1d-4868-bebd-64de208f37ee', N'c5cb6272-8c77-4682-bf7c-c2ccd3491980', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A21E00000000 AS DateTime), CAST(5 AS Decimal(18, 0)), CAST(0x0000A29B0130351A AS DateTime), NULL, NULL)
GO
print 'Processed 400 total records'
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'423c4bc1-6bce-451a-be29-652944741309', N'4066af84-094c-4e5b-9dd3-20927e4e39d0', NULL, CAST(0x0000A2C800000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900DA0304 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'bb1590b5-7a6d-48c1-9f74-655e78b56dfc', N'166857d3-c4b3-415f-9fd4-eaaf7c1aab75', NULL, CAST(0x0000A15500000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900F52448 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'f8093220-e0ed-45e9-ac76-659701a6f56e', N'166857d3-c4b3-415f-9fd4-eaaf7c1aab75', NULL, CAST(0x0000A14000000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900F52436 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'17d8c942-ecc7-43f2-aa55-65f859a19784', N'fae0ade0-f078-45f2-aa4d-ae50c74d6605', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A29400000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900F55877 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'62e0f3b0-a004-427a-b0a0-66177e8c1686', N'212825aa-1bb4-4255-bd78-81229debe566', N'2946664a-12a0-4827-a41b-272b500a770a', CAST(0x0000A2A000000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29D011F6872 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'cdee45ce-79cb-4aca-a5a3-66b621f0f545', N'fae0ade0-f078-45f2-aa4d-ae50c74d6605', NULL, CAST(0x0000A29800000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900F532EC AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'1a971c53-9bbe-47a2-8806-66cdf439b77b', N'fae0ade0-f078-45f2-aa4d-ae50c74d6605', NULL, CAST(0x0000A29600000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900F532E9 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'61a533ca-66a6-441f-8a05-66d3e702b0f9', N'298de147-f4f6-492a-90eb-0c14ca5c8c70', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A31F00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B00DDAE9D AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'8e5a02d0-4e9c-484b-b414-66db4fa54d83', N'166857d3-c4b3-415f-9fd4-eaaf7c1aab75', NULL, CAST(0x0000A15700000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900F5244A AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'51c5c8cb-33d4-4d93-a348-67065101c7f0', N'212825aa-1bb4-4255-bd78-81229debe566', N'2946664a-12a0-4827-a41b-272b500a770a', CAST(0x0000A2A000000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29D01305992 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'9246c40b-bffc-4d14-a7b6-672f82431205', N'2d101463-213a-45e9-99d1-16e626507541', NULL, CAST(0x0000A2B100000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A2C101318843 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'ddf034ac-120e-4c5d-ab18-6766a40a7146', N'fae0ade0-f078-45f2-aa4d-ae50c74d6605', NULL, CAST(0x0000A28D00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900F532DD AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'214ce9d0-783a-47e8-bcab-68087b0963b8', N'fae0ade0-f078-45f2-aa4d-ae50c74d6605', N'2946664a-12a0-4827-a41b-272b500a770a', CAST(0x0000A2A100000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900F558A6 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'fab3f74b-70e8-4236-8568-684b5e846878', N'e9adf832-0ad0-4022-b0f7-3884882f2ba9', NULL, CAST(0x0000A2B500000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B01306B54 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'7687dd85-ea2b-4c9b-a8d8-68572a1fd306', N'2d101463-213a-45e9-99d1-16e626507541', N'b5ad254d-bab8-4af9-b24d-7e982c01287c', CAST(0x0000A2AA00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A2C10131C32A AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'83535f35-83ed-4ed5-b5ba-688f2864e43a', N'fae0ade0-f078-45f2-aa4d-ae50c74d6605', N'b5ad254d-bab8-4af9-b24d-7e982c01287c', CAST(0x0000A29800000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900F55880 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'284937b7-5cc4-455b-9885-68d5dc814eb0', N'fae0ade0-f078-45f2-aa4d-ae50c74d6605', N'7c5595da-c05a-416c-b2b3-713c9b9853f5', CAST(0x0000A29200000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900F55868 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'1b7a881d-7870-4992-91c6-690558e5e699', N'81530680-dd37-4681-aaa4-679745a7fb89', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A31400000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29A0138A34E AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'dab0fc5a-580f-4759-9629-69b2d42a3b5c', N'eecc0206-511d-4966-a056-b52f90592a6a', NULL, CAST(0x0000A2F800000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29A012C167D AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'c9cb7e69-fc38-4e39-9fdb-69c0259bd55d', N'32381411-25ca-4c48-a5a6-e5c2568b6618', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A42800000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B01316311 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'e8b2a551-124b-4b86-8b36-6a23b1ce6be9', N'dcbeda40-9cc2-4144-a32c-e0a625f174db', NULL, CAST(0x0000A43D00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29D01134866 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'684d79cd-9fae-4387-8342-6ad370034592', N'2b94c0d3-1e90-4d37-ad1f-4b737cdb8968', N'2946664a-12a0-4827-a41b-272b500a770a', CAST(0x0000A2D300000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A2C501369283 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'920c0287-7ed7-4d1f-8075-6ad3f59e8e8b', N'298de147-f4f6-492a-90eb-0c14ca5c8c70', NULL, CAST(0x0000A33100000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B012622BF AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'fb9aec6c-ee73-4fe8-b9e9-6b00d6d39411', N'2b94c0d3-1e90-4d37-ad1f-4b737cdb8968', N'b5ad254d-bab8-4af9-b24d-7e982c01287c', CAST(0x0000A2CD00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A2C50136927F AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'2ca7282e-bc19-419a-ae51-6b3e9e5204af', N'478cb821-f1df-4d4b-bd3c-ca81554fe7b0', NULL, CAST(0x0000A15F00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B011DF14A AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'8fbe9fdf-cb57-43c2-9d24-6b4cbd949700', N'81530680-dd37-4681-aaa4-679745a7fb89', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A31000000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29A0138A34B AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'6c118e89-6452-4f1c-808b-6b57abf4ec6f', N'9a2d99e8-1c2a-4bac-a840-c4f6692041b9', NULL, CAST(0x0000A2AB00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A2AC00AE40C1 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'4b1c9af7-fc4a-42ef-9ea3-6b6c7a6fc457', N'298de147-f4f6-492a-90eb-0c14ca5c8c70', NULL, CAST(0x0000A33300000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B012622C1 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'a9fcdb88-bfcb-4537-b779-6b8e380f8265', N'fae0ade0-f078-45f2-aa4d-ae50c74d6605', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A29900000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900F55888 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'd28b661d-c4ca-47c4-98aa-6baaee7f586b', N'2b94c0d3-1e90-4d37-ad1f-4b737cdb8968', N'2946664a-12a0-4827-a41b-272b500a770a', CAST(0x0000A2C900000000 AS DateTime), CAST(8 AS Decimal(18, 0)), CAST(0x0000A2C5013081CA AS DateTime), NULL, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'cf0f101a-39b6-4be3-9ae3-6c538a25946c', N'fae0ade0-f078-45f2-aa4d-ae50c74d6605', N'2946664a-12a0-4827-a41b-272b500a770a', CAST(0x0000A28D00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900F55857 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'734158cb-6533-4a01-bac0-6cbef112822d', N'fae0ade0-f078-45f2-aa4d-ae50c74d6605', N'b5ad254d-bab8-4af9-b24d-7e982c01287c', CAST(0x0000A28D00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900F55856 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'0ea2b400-e4e2-4e27-b0ff-6e3b75040931', N'478cb821-f1df-4d4b-bd3c-ca81554fe7b0', NULL, CAST(0x0000A16C00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B011DF15D AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'5421331f-ca7e-4031-bc1f-6e591384d3e8', N'9d1419ba-926e-41f0-b644-508cc939a076', N'20cd934f-ba3f-4595-b2f1-ab1e3eb04b7b', CAST(0x0000A25200000000 AS DateTime), CAST(1 AS Decimal(18, 0)), CAST(0x0000A25201284DD9 AS DateTime), NULL, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'9498e22b-7bc0-4521-b28f-6e70c6e82009', N'fae0ade0-f078-45f2-aa4d-ae50c74d6605', N'7c5595da-c05a-416c-b2b3-713c9b9853f5', CAST(0x0000A29800000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900F55882 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'a4704954-5fd7-408e-b1ae-6e881752c9b6', N'fae0ade0-f078-45f2-aa4d-ae50c74d6605', NULL, CAST(0x0000A29B00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900F532FA AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'2bcaa74b-d88f-4701-9a62-6edacf1b0220', N'32381411-25ca-4c48-a5a6-e5c2568b6618', NULL, CAST(0x0000A42100000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B01315FD1 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'cf9ca0ed-c81b-4363-9902-6f74fccd8557', N'2b94c0d3-1e90-4d37-ad1f-4b737cdb8968', N'b5ad254d-bab8-4af9-b24d-7e982c01287c', CAST(0x0000A2DB00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A2C5012C8B40 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'3002fe22-84ba-4f19-b9c6-6fc3e5f78fa7', N'eecc0206-511d-4966-a056-b52f90592a6a', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A2E400000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29A012C638F AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'd217904e-489e-4d85-bf6e-6feebcea33bc', N'2b94c0d3-1e90-4d37-ad1f-4b737cdb8968', N'b5ad254d-bab8-4af9-b24d-7e982c01287c', CAST(0x0000A2C600000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A2C501369265 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'f653a474-9e60-440a-a8cd-70479603056f', N'eecc0206-511d-4966-a056-b52f90592a6a', NULL, CAST(0x0000A2FC00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29A012C1686 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'919a4fc0-c24a-4878-9e3a-7061eb4d2928', N'9e7c8d21-2e45-4c34-912d-036d9e9147cf', NULL, CAST(0x0000A2CB00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A2BE013CCAF9 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'cba9f28c-c144-49fa-87c2-70893c349395', N'4066af84-094c-4e5b-9dd3-20927e4e39d0', NULL, CAST(0x0000A2DC00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900DA030C AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'3dcddcf2-c931-4a2b-b4e9-70fb9eb98eb7', N'2b94c0d3-1e90-4d37-ad1f-4b737cdb8968', NULL, CAST(0x0000A2DA00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A2C5012C5903 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'79b87d45-4599-46a9-8a66-715996fc3d17', N'298de147-f4f6-492a-90eb-0c14ca5c8c70', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A33800000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B00DDAEA2 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'e26b9192-c1d6-48f2-883a-716d0e45d102', N'298de147-f4f6-492a-90eb-0c14ca5c8c70', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A33700000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B00DDAEA2 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'0a326807-bb0e-4dc2-9f2f-7215ca84d1d9', N'212825aa-1bb4-4255-bd78-81229debe566', NULL, CAST(0x0000A2A100000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29D0135E27F AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'ae4e92fb-c2e1-4ac1-902c-727ee378f755', N'2b94c0d3-1e90-4d37-ad1f-4b737cdb8968', N'b5ad254d-bab8-4af9-b24d-7e982c01287c', CAST(0x0000A2D000000000 AS DateTime), CAST(8 AS Decimal(18, 0)), CAST(0x0000A2C5012C68D8 AS DateTime), NULL, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'd91f9e7c-2753-48a0-9088-72b9eeb71234', N'81530680-dd37-4681-aaa4-679745a7fb89', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A31700000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29A0138A352 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'41e74f51-de6f-4bd8-90aa-72c6260eaf1b', N'e9adf832-0ad0-4022-b0f7-3884882f2ba9', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A2C000000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B01307EC4 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'b617e63d-337e-4ff0-a4d2-72f78c0167ad', N'e9adf832-0ad0-4022-b0f7-3884882f2ba9', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A2A700000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B01307EB1 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'5da70c11-88e8-4ca1-b94e-730a1058bdd2', N'298de147-f4f6-492a-90eb-0c14ca5c8c70', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A33400000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B00CB0049 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'19530353-dded-4389-a8b5-732b9483b9fa', N'212825aa-1bb4-4255-bd78-81229debe566', N'2946664a-12a0-4827-a41b-272b500a770a', CAST(0x0000A2A100000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29D0126969C AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'53db140a-0f54-4b74-b1a2-7380ae0f5294', N'c5cb6272-8c77-4682-bf7c-c2ccd3491980', NULL, CAST(0x0000A20D00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B013026E6 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'2d4e16c9-3c2e-47a6-9e30-73d0f779c8d1', N'212825aa-1bb4-4255-bd78-81229debe566', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A29200000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29D0130598A AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'a730f5bf-ec32-4898-8817-73ddd06f36ba', N'298de147-f4f6-492a-90eb-0c14ca5c8c70', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A33B00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B00CB0051 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'18e03014-f215-4a4b-a2bf-7409f59d2111', N'fae0ade0-f078-45f2-aa4d-ae50c74d6605', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A2A400000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900F558B4 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'41fd9b0e-a1c5-409a-99a3-7434826883e7', N'e9adf832-0ad0-4022-b0f7-3884882f2ba9', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A2AD00000000 AS DateTime), CAST(4 AS Decimal(18, 0)), CAST(0x0000A29B013072BC AS DateTime), NULL, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'714d6faa-a526-4203-86f4-74381db70eb1', N'2b94c0d3-1e90-4d37-ad1f-4b737cdb8968', NULL, CAST(0x0000A2CD00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A2C5012C58FB AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'6fb2e723-671e-4e8d-a2ba-7456d4068f1e', N'2b94c0d3-1e90-4d37-ad1f-4b737cdb8968', N'b5ad254d-bab8-4af9-b24d-7e982c01287c', CAST(0x0000A2C600000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A2C50130AE16 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'03e74fc9-8d52-4cbe-88cf-74609c6e65d8', N'298de147-f4f6-492a-90eb-0c14ca5c8c70', NULL, CAST(0x0000A32600000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B012622B1 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'ccafb59b-c5ff-4825-83a5-74aad4445758', N'166857d3-c4b3-415f-9fd4-eaaf7c1aab75', NULL, CAST(0x0000A13B00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900F52432 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'7ffc03c3-508f-4dd6-8c54-75a73a475512', N'212825aa-1bb4-4255-bd78-81229debe566', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A29300000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29D0135F3FA AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'e32a7562-bd79-4320-a3da-760a4d029898', N'fae0ade0-f078-45f2-aa4d-ae50c74d6605', NULL, CAST(0x0000A28900000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900F532D9 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'4b2c74f2-a389-40c7-9a36-769e2d6ad3a2', N'e9adf832-0ad0-4022-b0f7-3884882f2ba9', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A2B600000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B01307EBC AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'4f3c6f3f-3dd2-4490-a444-76c343be30f1', N'2d101463-213a-45e9-99d1-16e626507541', N'b5ad254d-bab8-4af9-b24d-7e982c01287c', CAST(0x0000A2B100000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A2C10131C32F AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'a316502e-7d7b-4a46-8a91-76cb7b70bab5', N'f66bcc6b-19a7-420c-be11-8f952a9d344b', NULL, CAST(0x0000A29700000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B00BBCCA3 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'e5d93535-374a-42f5-89ec-77889a1be4b4', N'5a5d8679-f4f4-4e3b-a21f-2b2dd836acfd', NULL, CAST(0x0000A2D100000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B012A1C09 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'115a76e8-8e53-4da9-9f0e-7792cf23858e', N'fae0ade0-f078-45f2-aa4d-ae50c74d6605', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A29200000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900F55869 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'4a2d8402-b0ad-4fbc-8c63-7793a633f0c4', N'32381411-25ca-4c48-a5a6-e5c2568b6618', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A41700000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B01316302 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'93231c99-4a80-4b0f-a74a-7796f042160b', N'c5cb6272-8c77-4682-bf7c-c2ccd3491980', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A21B00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B01303DFE AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'18e8eac9-edd0-40ef-b48b-77f90e289dc2', N'212825aa-1bb4-4255-bd78-81229debe566', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A29A00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29D011F686C AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'4c25086c-32d8-4a5a-92fb-78301b1eff3a', N'fae0ade0-f078-45f2-aa4d-ae50c74d6605', N'b5ad254d-bab8-4af9-b24d-7e982c01287c', CAST(0x0000A29200000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900F55866 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'76ceca0a-5a0a-4c00-9041-78705907cafc', N'dcbeda40-9cc2-4144-a32c-e0a625f174db', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A43D00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29D01138C07 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'a5e20a6c-16c8-4aea-8709-79456ba7c877', N'e9adf832-0ad0-4022-b0f7-3884882f2ba9', NULL, CAST(0x0000A2BA00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B01306B56 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'ce760667-c948-466f-b230-79651e277001', N'298de147-f4f6-492a-90eb-0c14ca5c8c70', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A32300000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B00DDAE9D AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'e9314354-1e41-4cc8-8bbd-79f4ebaae399', N'fae0ade0-f078-45f2-aa4d-ae50c74d6605', N'7c5595da-c05a-416c-b2b3-713c9b9853f5', CAST(0x0000A29C00000000 AS DateTime), CAST(5 AS Decimal(18, 0)), CAST(0x0000A29900F5461A AS DateTime), NULL, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'6983076d-a6f7-4722-ad44-7a4906cc5181', N'212825aa-1bb4-4255-bd78-81229debe566', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A29300000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29D0130598B AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'e79c1db7-8a8d-4530-9ecc-7a59bd39002f', N'298de147-f4f6-492a-90eb-0c14ca5c8c70', NULL, CAST(0x0000A33700000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B012622C5 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'212e68f9-23af-4a99-92a5-7ab83f9e804a', N'298de147-f4f6-492a-90eb-0c14ca5c8c70', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A32200000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B00DDAE9D AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'374da563-4f04-42e6-b160-7b75743c7313', N'41a4c6c4-9288-4c60-aec2-d76cd8910c8e', NULL, CAST(0x0000A18500000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B01311954 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'9792fc16-e89a-4064-b540-7bfc5cfb858b', N'fae0ade0-f078-45f2-aa4d-ae50c74d6605', N'2946664a-12a0-4827-a41b-272b500a770a', CAST(0x0000A28800000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900F55840 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'fbe12d28-3d15-47a6-8a41-7c8157153025', N'fae0ade0-f078-45f2-aa4d-ae50c74d6605', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A29A00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900F5588C AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'1b234eb8-bec0-493d-bcf1-7c85500305ff', N'c5cb6272-8c77-4682-bf7c-c2ccd3491980', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A21C00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B01303DFF AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'e57c189e-e8a0-41bd-b1ce-7cea9243e4ea', N'478cb821-f1df-4d4b-bd3c-ca81554fe7b0', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A16C00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B011E16B6 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'729a3f94-3525-4159-a457-7d0500a8daca', N'e9adf832-0ad0-4022-b0f7-3884882f2ba9', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A2B800000000 AS DateTime), CAST(4 AS Decimal(18, 0)), CAST(0x0000A29B0130779D AS DateTime), NULL, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'315cde36-c4b5-44e7-b3d4-7d173b1cf1f3', N'fae0ade0-f078-45f2-aa4d-ae50c74d6605', N'2946664a-12a0-4827-a41b-272b500a770a', CAST(0x0000A2A200000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900F558AC AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'55a7f80d-4610-4901-9a96-7d1c7021b7c4', N'dcbeda40-9cc2-4144-a32c-e0a625f174db', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A43400000000 AS DateTime), CAST(5 AS Decimal(18, 0)), CAST(0x0000A29D010F6631 AS DateTime), NULL, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'e044d646-f327-4780-a65e-7e42617daf60', N'dcbeda40-9cc2-4144-a32c-e0a625f174db', N'2946664a-12a0-4827-a41b-272b500a770a', CAST(0x0000A43600000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29D01138C04 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'dfb66e29-cf7f-41aa-878d-7e463d382e6b', N'5a5d8679-f4f4-4e3b-a21f-2b2dd836acfd', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A2CB00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B012A321A AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'5eaf15cb-535e-48d3-bb06-7ea50ce5f8d7', N'e9adf832-0ad0-4022-b0f7-3884882f2ba9', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A2AE00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B01307EB7 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'785607b7-6cbc-43f3-8a60-7ee6cc991400', N'474dd670-399c-425c-b3c6-3e73132144d3', NULL, CAST(0x0000A15400000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B01324C84 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'35816ef2-df7c-4310-a770-7f1f938b47d3', N'fae0ade0-f078-45f2-aa4d-ae50c74d6605', N'2946664a-12a0-4827-a41b-272b500a770a', CAST(0x0000A28900000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900F55846 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'7068d4d1-06bc-4e7a-bf4c-7f661dfd130a', N'2a6beec4-e8ab-43a8-aaf6-28b58f42ae9f', NULL, CAST(0x0000A41C00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A2C500DB3F62 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'cb007ed4-7b53-4006-8a72-7f847d60c634', N'2a6beec4-e8ab-43a8-aaf6-28b58f42ae9f', NULL, CAST(0x0000A42300000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A2C500DB3F67 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'7495ce09-c745-426d-9939-7fac1bc8b4f1', N'fae0ade0-f078-45f2-aa4d-ae50c74d6605', N'2946664a-12a0-4827-a41b-272b500a770a', CAST(0x0000A29400000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900F55874 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'0331f7df-6470-4c66-b30f-7fc0d737bd07', N'5a5d8679-f4f4-4e3b-a21f-2b2dd836acfd', NULL, CAST(0x0000A2DF00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B012A1C15 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'67624461-521b-4608-99da-7fe3e6d4ba82', N'2a6beec4-e8ab-43a8-aaf6-28b58f42ae9f', NULL, CAST(0x0000A42400000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A2C500DB3F69 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'1ef0bdad-6191-4117-92f7-809b664dc812', N'fae0ade0-f078-45f2-aa4d-ae50c74d6605', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A29B00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900F55890 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'7c9a76b6-e74f-4c87-8abb-80a103d17f3a', N'32381411-25ca-4c48-a5a6-e5c2568b6618', NULL, CAST(0x0000A41A00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B01315FCA AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'4cdbd27a-893d-4460-88a8-81386b0eaa76', N'd2aa9f43-73ef-4a46-bdab-22504f7200fd', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A2A500000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B00DD9492 AS DateTime), 1, NULL)
GO
print 'Processed 500 total records'
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'3454e0d0-38a1-432a-90ca-81f14d1719d6', N'298de147-f4f6-492a-90eb-0c14ca5c8c70', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A33300000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B00DDAEA1 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'e994dd91-223a-4dd2-9689-8247c8d4a407', N'fae0ade0-f078-45f2-aa4d-ae50c74d6605', NULL, CAST(0x0000A29F00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900F532FD AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'dbaed96b-d06f-47ce-b160-82ebd7953007', N'fae0ade0-f078-45f2-aa4d-ae50c74d6605', N'b5ad254d-bab8-4af9-b24d-7e982c01287c', CAST(0x0000A28B00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900F5584E AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'237a18a7-67dd-4772-9734-82ecaa17e4af', N'478cb821-f1df-4d4b-bd3c-ca81554fe7b0', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A15F00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B011E169F AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'796f0461-9597-4c3d-b13c-83a259600d22', N'7f54179d-42c2-4844-838f-49f3b90029aa', NULL, CAST(0x0000A2EF00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A2C50135F299 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'727adcff-3a6a-43ed-9bed-83bf472feadd', N'eecc0206-511d-4966-a056-b52f90592a6a', NULL, CAST(0x0000A2ED00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29A012C1673 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'9e759933-27d1-4242-9618-83cb7c15a58a', N'7f54179d-42c2-4844-838f-49f3b90029aa', NULL, CAST(0x0000A2E900000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A2C50135F295 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'6b97ca85-4144-4042-be40-83fbe77121f9', N'c5cb6272-8c77-4682-bf7c-c2ccd3491980', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A21600000000 AS DateTime), CAST(5 AS Decimal(18, 0)), CAST(0x0000A29B01302F9A AS DateTime), NULL, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'2a263372-27a1-4921-9abb-848a680ed0b6', N'5a5d8679-f4f4-4e3b-a21f-2b2dd836acfd', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A2D200000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B012A3226 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'a96a1e61-17f7-4304-b0ed-8490db39313b', N'32381411-25ca-4c48-a5a6-e5c2568b6618', NULL, CAST(0x0000A42800000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B01315FD6 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'cc65e5a4-7292-4d30-a199-84a0120f788c', N'298de147-f4f6-492a-90eb-0c14ca5c8c70', NULL, CAST(0x0000A33400000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B012622C3 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'39ed0353-fd68-4a6e-a95a-84cfb3ff7ef5', N'474dd670-399c-425c-b3c6-3e73132144d3', NULL, CAST(0x0000A14600000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B01324C7E AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'c6403a09-434c-4fed-9317-850ed7eb1ba4', N'fae0ade0-f078-45f2-aa4d-ae50c74d6605', NULL, CAST(0x0000A29A00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900F532EE AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'a0e971ef-95c3-4770-9d66-8564b9c7f9f8', N'5a5d8679-f4f4-4e3b-a21f-2b2dd836acfd', NULL, CAST(0x0000A2CF00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B012A1C07 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'efce705b-1319-4a21-bcfd-857ac8dc6bc4', N'fae0ade0-f078-45f2-aa4d-ae50c74d6605', N'b5ad254d-bab8-4af9-b24d-7e982c01287c', CAST(0x0000A2A000000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900F5589F AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'a3203ab0-7944-4136-9763-858c04575306', N'f66bcc6b-19a7-420c-be11-8f952a9d344b', NULL, CAST(0x0000A29000000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B00BBCC9E AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'43e5c0d3-f287-4295-bb3e-859c58c6c6f9', N'298de147-f4f6-492a-90eb-0c14ca5c8c70', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A32D00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B01263B94 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'123b1c61-47a3-4a01-bbc8-8602e286e35d', N'dcbeda40-9cc2-4144-a32c-e0a625f174db', NULL, CAST(0x0000A44400000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29D01134866 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'9ff6a59f-4155-4a05-b39e-8649c6a59ed9', N'22250e0f-8265-43e8-9fcb-a697f59744a7', NULL, CAST(0x0000A52800000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B01319F9F AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'6ee38afa-f615-468e-94ca-86723ae647ee', N'212825aa-1bb4-4255-bd78-81229debe566', N'2946664a-12a0-4827-a41b-272b500a770a', CAST(0x0000A28A00000000 AS DateTime), CAST(1 AS Decimal(18, 0)), CAST(0x0000A29D011F5FA8 AS DateTime), NULL, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'7a69433a-8da1-491d-a903-87c683d48abd', N'9d1419ba-926e-41f0-b644-508cc939a076', N'c6166f35-9877-4686-8932-aad265ee668a', CAST(0x0000A25600000000 AS DateTime), CAST(6 AS Decimal(18, 0)), CAST(0x0000A252012860F5 AS DateTime), NULL, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'9465be1f-3af0-4bf4-9da3-87e81548952a', N'2d101463-213a-45e9-99d1-16e626507541', N'b5ad254d-bab8-4af9-b24d-7e982c01287c', CAST(0x0000A2BC00000000 AS DateTime), CAST(8 AS Decimal(18, 0)), CAST(0x0000A2C10131B609 AS DateTime), NULL, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'a7ec4ef8-0a8e-41b5-891c-884a831e0bc5', N'212825aa-1bb4-4255-bd78-81229debe566', N'2946664a-12a0-4827-a41b-272b500a770a', CAST(0x0000A28B00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29D0126967B AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'7ed5471b-d0ce-4b5e-9bc6-888cf54665a1', N'212825aa-1bb4-4255-bd78-81229debe566', NULL, CAST(0x0000A29200000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29D0135E27D AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'8a431437-4b3f-42b0-8bc0-88a9bde5a489', N'eecc0206-511d-4966-a056-b52f90592a6a', NULL, CAST(0x0000A2F900000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29A012C167F AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'aec50fc4-b62e-49a0-a871-88c2be996dcb', N'fae0ade0-f078-45f2-aa4d-ae50c74d6605', N'b5ad254d-bab8-4af9-b24d-7e982c01287c', CAST(0x0000A29600000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900F55878 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'e690a64a-d95c-44b3-bcc2-88d3461e6776', N'5a5d8679-f4f4-4e3b-a21f-2b2dd836acfd', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A2D500000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B012A3228 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'e7a7be75-e7d3-4b0c-81c9-890527c836d0', N'2d101463-213a-45e9-99d1-16e626507541', N'b5ad254d-bab8-4af9-b24d-7e982c01287c', CAST(0x0000A2B800000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A2C10131C334 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'55a10fed-5fd4-4172-a4e2-897f3a752bc1', N'212825aa-1bb4-4255-bd78-81229debe566', N'2946664a-12a0-4827-a41b-272b500a770a', CAST(0x0000A28B00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29D0135F3F8 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'215a9493-2b47-4d05-ab03-8a6de1d3ed7d', N'62212af0-bbbb-4984-81be-ed97d14425a0', NULL, CAST(0x0000A3EA00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A2C3011A74FB AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'8c77d8b9-5a1f-41ae-bd4b-8a819aea61a8', N'2d101463-213a-45e9-99d1-16e626507541', NULL, CAST(0x0000A2AA00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A2C10131883E AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'a0efffd2-435e-4d91-9b43-8a9f3aea4bdc', N'298de147-f4f6-492a-90eb-0c14ca5c8c70', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A32200000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B00CB0030 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'd815d7fc-4c62-47de-97d4-8b1bae0b5a5a', N'e9adf832-0ad0-4022-b0f7-3884882f2ba9', NULL, CAST(0x0000A2C300000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B01306B5C AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'21c9ebbc-71ab-45aa-b743-8b35d32743d4', N'2a6beec4-e8ab-43a8-aaf6-28b58f42ae9f', NULL, CAST(0x0000A43100000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A2C500DB3F6F AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'44e9b31b-5375-4cc8-b625-8c5aa5a204c9', N'9d1419ba-926e-41f0-b644-508cc939a076', N'c6166f35-9877-4686-8932-aad265ee668a', CAST(0x0000A24F00000000 AS DateTime), CAST(9 AS Decimal(18, 0)), CAST(0x0000A252012844D1 AS DateTime), NULL, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'be300fa4-cdf4-4eb8-9105-8c762d928e5c', N'd2aa9f43-73ef-4a46-bdab-22504f7200fd', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A29000000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B00DD948B AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'0e9538e1-1add-4fd9-8a2d-8d0e2d94afcb', N'9a2d99e8-1c2a-4bac-a840-c4f6692041b9', NULL, CAST(0x0000A2B900000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A2AC00AE4106 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'a0205f50-7360-4a7f-a598-8d767b1fbe8d', N'5a5d8679-f4f4-4e3b-a21f-2b2dd836acfd', NULL, CAST(0x0000A2E000000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B012A1C17 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'550e4f7b-590e-4836-8748-8d9ba8b24562', N'212825aa-1bb4-4255-bd78-81229debe566', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A29200000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29D011F6861 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'742988d6-d160-4e6d-97f5-8def24facda3', N'd2aa9f43-73ef-4a46-bdab-22504f7200fd', N'2946664a-12a0-4827-a41b-272b500a770a', CAST(0x0000A28B00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29D0112025E AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'6cfcf908-da73-4141-9b9e-8e79729b5810', N'298de147-f4f6-492a-90eb-0c14ca5c8c70', NULL, CAST(0x0000A32D00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B012622B8 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'04b2bae2-5aca-4b8d-8d3a-8e7df178a3be', N'478cb821-f1df-4d4b-bd3c-ca81554fe7b0', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A15C00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B011E1699 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'c1e2d53e-dcc3-410b-ad72-8ec37b45c463', N'd2aa9f43-73ef-4a46-bdab-22504f7200fd', N'2946664a-12a0-4827-a41b-272b500a770a', CAST(0x0000A29200000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29D01120262 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'80b2f539-4aaf-4f0c-858d-8eca57a2b9b5', N'fae0ade0-f078-45f2-aa4d-ae50c74d6605', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A28700000000 AS DateTime), CAST(5 AS Decimal(18, 0)), CAST(0x0000A29900F55609 AS DateTime), NULL, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'b7aaa7e6-095a-4783-add7-8f351a08446e', N'2b94c0d3-1e90-4d37-ad1f-4b737cdb8968', NULL, CAST(0x0000A2D400000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A2C5012C5900 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'0e6e0300-2772-4a1c-b7b0-8f393213c6f1', N'4066af84-094c-4e5b-9dd3-20927e4e39d0', NULL, CAST(0x0000A2CF00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900DA0307 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'd8541375-5891-4ff5-a2aa-8fb685abfbe9', N'41a4c6c4-9288-4c60-aec2-d76cd8910c8e', NULL, CAST(0x0000A18C00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B01311957 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'bfce6f11-e112-4985-80d9-8fd1da65ddd4', N'2b94c0d3-1e90-4d37-ad1f-4b737cdb8968', N'2946664a-12a0-4827-a41b-272b500a770a', CAST(0x0000A2C600000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A2C50136925C AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'ffe49dbf-5548-4550-bef3-8fe907e441a0', N'fae0ade0-f078-45f2-aa4d-ae50c74d6605', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A29600000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900F5587B AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'c36725db-fd8d-4b4b-aa58-8fea4fe62c74', N'e9adf832-0ad0-4022-b0f7-3884882f2ba9', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A2C200000000 AS DateTime), CAST(4 AS Decimal(18, 0)), CAST(0x0000A29B01307D06 AS DateTime), NULL, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'2d8a932e-0af6-4582-9b73-8ff82aacaef8', N'c5cb6272-8c77-4682-bf7c-c2ccd3491980', NULL, CAST(0x0000A21B00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B01302701 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'66194f6a-465c-43f0-aada-9025ad998890', N'dcbeda40-9cc2-4144-a32c-e0a625f174db', N'2946664a-12a0-4827-a41b-272b500a770a', CAST(0x0000A44500000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29D01127FFE AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'b7ab4f3e-e6b3-48bd-a65a-90a11b321798', N'e9adf832-0ad0-4022-b0f7-3884882f2ba9', NULL, CAST(0x0000A2AC00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B01306B4B AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'3211892a-ddda-4a73-97bf-90e8264891e4', N'2d101463-213a-45e9-99d1-16e626507541', N'b5ad254d-bab8-4af9-b24d-7e982c01287c', CAST(0x0000A2B900000000 AS DateTime), CAST(8 AS Decimal(18, 0)), CAST(0x0000A2C10131AEBE AS DateTime), NULL, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'ed7228f8-49fb-4306-ac4c-90f5cf23d15c', N'2b94c0d3-1e90-4d37-ad1f-4b737cdb8968', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A2DB00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A2C5013692B1 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'5ee1be03-997a-4264-8d8c-91252ec0bedc', N'd2aa9f43-73ef-4a46-bdab-22504f7200fd', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A29700000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B00DD948D AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'9e730fe7-01cd-4819-ae99-919753d9d76c', N'81530680-dd37-4681-aaa4-679745a7fb89', NULL, CAST(0x0000A30300000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A2C50102BA21 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'93c27683-79bd-487f-a3b4-91c50a40ceb7', N'212825aa-1bb4-4255-bd78-81229debe566', N'2946664a-12a0-4827-a41b-272b500a770a', CAST(0x0000A2A100000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29D01305993 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'676f0082-52e2-491d-9f7a-9204e931a313', N'298de147-f4f6-492a-90eb-0c14ca5c8c70', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A32A00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B01263B90 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'96ee6e2d-5ad0-41a4-ae1b-926d4b33eef0', N'298de147-f4f6-492a-90eb-0c14ca5c8c70', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A32500000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B00DDAE9E AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'f4b3a265-7825-48ff-9d0d-927456e69055', N'9e7c8d21-2e45-4c34-912d-036d9e9147cf', NULL, CAST(0x0000A2D200000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A2BE013CCAFF AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'49641ce4-e9c5-4674-9c6d-92d9a4037d4c', N'212825aa-1bb4-4255-bd78-81229debe566', N'2946664a-12a0-4827-a41b-272b500a770a', CAST(0x0000A29300000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29D0130598B AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'eab0db13-c6dc-4227-a14d-92f9f3894da1', N'2b94c0d3-1e90-4d37-ad1f-4b737cdb8968', N'2946664a-12a0-4827-a41b-272b500a770a', CAST(0x0000A2DA00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A2C50136929F AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'8b29e723-e51f-4d67-a3a7-9366cb424183', N'eecc0206-511d-4966-a056-b52f90592a6a', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A2FF00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29A012C63B2 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'0359edd2-8ff9-4348-bcec-939f451dc4f7', N'9e7c8d21-2e45-4c34-912d-036d9e9147cf', NULL, CAST(0x0000A2D100000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A2BE013CCAFC AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'9ecbe9ed-c0c2-4ff8-8a6e-93bc7147c87b', N'62212af0-bbbb-4984-81be-ed97d14425a0', NULL, CAST(0x0000A3F000000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A2C3011A74FD AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'acdc189d-fa9f-4cd7-87e8-93daae79d4c2', N'212825aa-1bb4-4255-bd78-81229debe566', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A29300000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29D01269688 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'c79547bd-7a30-4113-995e-93dced256afd', N'2b94c0d3-1e90-4d37-ad1f-4b737cdb8968', N'2946664a-12a0-4827-a41b-272b500a770a', CAST(0x0000A2CC00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A2C50130AE1E AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'f1d2d387-8dee-4da1-b200-93e9b5d893b6', N'2d101463-213a-45e9-99d1-16e626507541', N'b5ad254d-bab8-4af9-b24d-7e982c01287c', CAST(0x0000A2A900000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A2C10131C323 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'861d0a13-3d4c-49bd-b842-93fee8609d19', N'e9adf832-0ad0-4022-b0f7-3884882f2ba9', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A2AB00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B01307EB5 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'ca342967-e115-429a-8ae8-940b69033b99', N'212825aa-1bb4-4255-bd78-81229debe566', N'2946664a-12a0-4827-a41b-272b500a770a', CAST(0x0000A29300000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29D0126968A AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'5459137b-5733-4c66-ba9a-944ca800bfcd', N'c5cb6272-8c77-4682-bf7c-c2ccd3491980', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A22100000000 AS DateTime), CAST(5 AS Decimal(18, 0)), CAST(0x0000A29B0130365C AS DateTime), NULL, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'e2c71de0-9ab6-4f69-a130-9464a2a987d6', N'81530680-dd37-4681-aaa4-679745a7fb89', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A30700000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29A0138A342 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'e54cba14-47c3-49a5-aebd-94862b6b79ca', N'dcbeda40-9cc2-4144-a32c-e0a625f174db', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A44500000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29D01138C0B AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'7a92fd05-f280-498b-8df3-94a5bf89523a', N'eecc0206-511d-4966-a056-b52f90592a6a', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A2E600000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29A012C6391 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'c8eb1ff8-e2a3-4952-b7f5-9536d369f0cc', N'f66bcc6b-19a7-420c-be11-8f952a9d344b', NULL, CAST(0x0000A2A500000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B00BBCCAC AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'3700415a-dee9-4ea1-b5e5-9543d308bef2', N'dcbeda40-9cc2-4144-a32c-e0a625f174db', N'2946664a-12a0-4827-a41b-272b500a770a', CAST(0x0000A44400000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29D01127FFD AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'2cb3412b-865e-4c50-96a7-957943860e0a', N'dcbeda40-9cc2-4144-a32c-e0a625f174db', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A44B00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29D01127FFF AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'000ccff5-b28f-4e2c-97d2-962e09656245', N'2b94c0d3-1e90-4d37-ad1f-4b737cdb8968', N'2946664a-12a0-4827-a41b-272b500a770a', CAST(0x0000A2CD00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A2C50130AE23 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'eb3a2e37-c96b-47b9-8516-96481da0c852', N'c5cb6272-8c77-4682-bf7c-c2ccd3491980', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A22400000000 AS DateTime), CAST(5 AS Decimal(18, 0)), CAST(0x0000A29B01303733 AS DateTime), NULL, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'6af01d52-a075-4b89-979f-967e821b898b', N'f66bcc6b-19a7-420c-be11-8f952a9d344b', NULL, CAST(0x0000A28F00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B00BBCC9B AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'50e94467-4dfa-4bd9-8247-96e84a5c2ead', N'889c1d0a-4263-4fb1-a3eb-7d3e6212e247', NULL, CAST(0x0000A15C00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B00D4B16C AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'a53beef0-2837-4019-9265-9783566dc77a', N'fae0ade0-f078-45f2-aa4d-ae50c74d6605', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A28A00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900F5584D AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'9e8cd9c6-9863-4244-a8c3-97d1fb3ed43a', N'c5cb6272-8c77-4682-bf7c-c2ccd3491980', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A21000000000 AS DateTime), CAST(5 AS Decimal(18, 0)), CAST(0x0000A29B01302D36 AS DateTime), NULL, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'2eca1923-5b34-411b-8072-97de7cd3257b', N'32381411-25ca-4c48-a5a6-e5c2568b6618', NULL, CAST(0x0000A41700000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B01315FC7 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'bc845393-f51f-47a5-b15c-98513d0e1a33', N'2b94c0d3-1e90-4d37-ad1f-4b737cdb8968', N'b5ad254d-bab8-4af9-b24d-7e982c01287c', CAST(0x0000A2DA00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A2C50130AE31 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'11b0424e-3d87-4c5d-8763-987ed98bf485', N'd2aa9f43-73ef-4a46-bdab-22504f7200fd', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A29D00000000 AS DateTime), CAST(4 AS Decimal(18, 0)), CAST(0x0000A29B00DD9490 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'b2d8cc61-2cd8-4402-9cde-988680bec1f5', N'dcbeda40-9cc2-4144-a32c-e0a625f174db', NULL, CAST(0x0000A44B00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29D01134867 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'496f8cb4-5f35-415f-8842-9968aaca5dae', N'9d1419ba-926e-41f0-b644-508cc939a076', N'8a45396c-c249-486d-a7cd-acf67299d00b', CAST(0x0000A25200000000 AS DateTime), CAST(2 AS Decimal(18, 0)), CAST(0x0000A25201284ED7 AS DateTime), NULL, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'a611a8f6-39c6-4232-ba5f-998ac867e8a6', N'e90e53e1-5605-44b2-aed7-df1f195c53c1', NULL, CAST(0x0000A46400000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900DC960D AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'd048f610-5036-44dc-a510-99c59695b0e0', N'fae0ade0-f078-45f2-aa4d-ae50c74d6605', N'7c5595da-c05a-416c-b2b3-713c9b9853f5', CAST(0x0000A28A00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900F5584C AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'feafbdcf-9ac9-4425-aaeb-99c90b205a49', N'4066af84-094c-4e5b-9dd3-20927e4e39d0', NULL, CAST(0x0000A2D600000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900DA030A AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'e484d35d-1efb-441e-bef1-99ca085579dc', N'fae0ade0-f078-45f2-aa4d-ae50c74d6605', N'b5ad254d-bab8-4af9-b24d-7e982c01287c', CAST(0x0000A28A00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900F5584A AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'92c54968-1e66-4130-b533-9a59b5975d8f', N'9d1419ba-926e-41f0-b644-508cc939a076', N'20cd934f-ba3f-4595-b2f1-ab1e3eb04b7b', CAST(0x0000A24F00000000 AS DateTime), CAST(6 AS Decimal(18, 0)), CAST(0x0000A25201281D54 AS DateTime), NULL, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'a980d45b-cb5c-470b-bbb1-9a98f1432c26', N'478cb821-f1df-4d4b-bd3c-ca81554fe7b0', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A16800000000 AS DateTime), CAST(8 AS Decimal(18, 0)), CAST(0x0000A29B011E0784 AS DateTime), NULL, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'4c82fa16-512f-454f-afde-9ab955310523', N'166857d3-c4b3-415f-9fd4-eaaf7c1aab75', NULL, CAST(0x0000A15400000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900F52447 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'78e2b06c-de3a-4fbe-86af-9b649e5b1d5a', N'166857d3-c4b3-415f-9fd4-eaaf7c1aab75', NULL, CAST(0x0000A14B00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900F5243F AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'c675b5a7-aa99-4897-a1af-9b835fd16fc2', N'166857d3-c4b3-415f-9fd4-eaaf7c1aab75', NULL, CAST(0x0000A13900000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900F5242C AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'247f1d57-ba61-449b-b800-9c69f6a654b1', N'474dd670-399c-425c-b3c6-3e73132144d3', NULL, CAST(0x0000A14E00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B01324C83 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'd8412d48-9a1d-430e-b93e-9c989f699f78', N'2d101463-213a-45e9-99d1-16e626507541', N'b5ad254d-bab8-4af9-b24d-7e982c01287c', CAST(0x0000A2C200000000 AS DateTime), CAST(8 AS Decimal(18, 0)), CAST(0x0000A2C50100F20C AS DateTime), NULL, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'3138d685-21e0-4552-8904-9caef50f4c26', N'c5cb6272-8c77-4682-bf7c-c2ccd3491980', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A22600000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B01303E05 AS DateTime), 1, NULL)
GO
print 'Processed 600 total records'
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'1d66f68f-8af0-4661-91cb-9d3742cef48e', N'd2aa9f43-73ef-4a46-bdab-22504f7200fd', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A28C00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29D01120261 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'559c1efd-eb2c-434a-978a-9d56816384d4', N'fae0ade0-f078-45f2-aa4d-ae50c74d6605', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A29500000000 AS DateTime), CAST(5 AS Decimal(18, 0)), CAST(0x0000A29900F54DC7 AS DateTime), NULL, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'35ca888e-f4e5-4ce2-a167-9d68b81bdec5', N'2d101463-213a-45e9-99d1-16e626507541', N'b5ad254d-bab8-4af9-b24d-7e982c01287c', CAST(0x0000A2AA00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A2C501010B72 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'a3414ab8-4a1b-42c5-8d29-9dae00a3e2bf', N'fae0ade0-f078-45f2-aa4d-ae50c74d6605', N'2946664a-12a0-4827-a41b-272b500a770a', CAST(0x0000A2A500000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900F558B7 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'ae36111f-9ed8-45f5-b1e0-9e289a45509c', N'fae0ade0-f078-45f2-aa4d-ae50c74d6605', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A28D00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900F55859 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'fa213ef7-2a7b-42a4-b299-9e5903676853', N'478cb821-f1df-4d4b-bd3c-ca81554fe7b0', NULL, CAST(0x0000A16500000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B011DF152 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'a0dd0bbc-d7e2-4291-a63c-9f1b76539564', N'5a5d8679-f4f4-4e3b-a21f-2b2dd836acfd', NULL, CAST(0x0000A2D200000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B012A1C0A AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'd45bf3a7-7431-4629-83a0-9f6cc6d916e7', N'fae0ade0-f078-45f2-aa4d-ae50c74d6605', N'b5ad254d-bab8-4af9-b24d-7e982c01287c', CAST(0x0000A29300000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900F5586B AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'8e86c7f9-16d4-419f-b07c-9fbf687bbee6', N'298de147-f4f6-492a-90eb-0c14ca5c8c70', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A32D00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B00DDAEA0 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'9b07595c-2f38-4752-951b-9ff1a0d9450f', N'2b94c0d3-1e90-4d37-ad1f-4b737cdb8968', N'2946664a-12a0-4827-a41b-272b500a770a', CAST(0x0000A2C600000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A2C5012FFD16 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'974fde2c-0718-414d-8f77-a03cc72db86c', N'478cb821-f1df-4d4b-bd3c-ca81554fe7b0', NULL, CAST(0x0000A16600000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B011DF155 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'340afc89-34df-4d4a-83b5-a0b1047c8867', N'166857d3-c4b3-415f-9fd4-eaaf7c1aab75', NULL, CAST(0x0000A14A00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900F5243F AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'65f084e0-9ed2-4366-9879-a0f93e9a919f', N'fae0ade0-f078-45f2-aa4d-ae50c74d6605', N'2946664a-12a0-4827-a41b-272b500a770a', CAST(0x0000A29500000000 AS DateTime), CAST(5 AS Decimal(18, 0)), CAST(0x0000A29900F54C04 AS DateTime), NULL, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'cea27177-2900-44b6-bbfd-a1affd9d9823', N'9e7c8d21-2e45-4c34-912d-036d9e9147cf', NULL, CAST(0x0000A2DF00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A2BE013CCB05 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'53431148-8967-44e6-9285-a1dc1c9395ab', N'2b94c0d3-1e90-4d37-ad1f-4b737cdb8968', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A2DA00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A2C5013692A4 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'202e78d7-b96d-45b0-8efc-a1f8866f389c', N'fae0ade0-f078-45f2-aa4d-ae50c74d6605', N'2946664a-12a0-4827-a41b-272b500a770a', CAST(0x0000A29700000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900F5587D AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'a4409e46-b60f-41d0-aca1-a1ff4dbf1e1c', N'fae0ade0-f078-45f2-aa4d-ae50c74d6605', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A2A000000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900F558A4 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'26bc318d-ae22-4425-b578-a211fed985e1', N'298de147-f4f6-492a-90eb-0c14ca5c8c70', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A33100000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B00DDAEA1 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'6357089f-f6c7-4799-951a-a29f94f77ae0', N'478cb821-f1df-4d4b-bd3c-ca81554fe7b0', NULL, CAST(0x0000A15B00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B011DF13F AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'f8695dcd-7587-4d34-a07a-a2cc84a7db4b', N'e9adf832-0ad0-4022-b0f7-3884882f2ba9', NULL, CAST(0x0000A2B600000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B01306B55 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'98b4dab6-7cdb-4b6e-a757-a2e00a239823', N'478cb821-f1df-4d4b-bd3c-ca81554fe7b0', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A16E00000000 AS DateTime), CAST(8 AS Decimal(18, 0)), CAST(0x0000A29B011E0A3A AS DateTime), NULL, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'a5ba452f-44fe-4f98-b668-a35ba4373022', N'478cb821-f1df-4d4b-bd3c-ca81554fe7b0', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A16300000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B011E16A5 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'5dae6593-f337-4b00-b388-a38ebb9fa75b', N'32381411-25ca-4c48-a5a6-e5c2568b6618', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A41400000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B01316300 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'5f3a0603-109f-41b7-b02f-a41258c60a60', N'166857d3-c4b3-415f-9fd4-eaaf7c1aab75', NULL, CAST(0x0000A14400000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900F5243A AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'7614515a-2a6e-41c7-b260-a440ee818384', N'32381411-25ca-4c48-a5a6-e5c2568b6618', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A41F00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B01316309 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'7f6c3435-e990-4203-916e-a47752768a67', N'22250e0f-8265-43e8-9fcb-a697f59744a7', NULL, CAST(0x0000A53D00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B01319FAD AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'ffbdfe12-3fff-4de7-a506-a491bbf1d99a', N'c5cb6272-8c77-4682-bf7c-c2ccd3491980', NULL, CAST(0x0000A22900000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B0130270C AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'a09fef88-b51f-46db-8b9a-a496ecc2fe5c', N'2d101463-213a-45e9-99d1-16e626507541', N'b5ad254d-bab8-4af9-b24d-7e982c01287c', CAST(0x0000A2B600000000 AS DateTime), CAST(8 AS Decimal(18, 0)), CAST(0x0000A2C10131AC5D AS DateTime), NULL, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'dc888927-4f23-4700-9ae6-a4cbadde391f', N'22250e0f-8265-43e8-9fcb-a697f59744a7', NULL, CAST(0x0000A52F00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B01319FA6 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'bc4ccf72-7057-4a30-810f-a4faed9e80d5', N'212825aa-1bb4-4255-bd78-81229debe566', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A28700000000 AS DateTime), CAST(7 AS Decimal(18, 0)), CAST(0x0000A29D011F345C AS DateTime), NULL, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'dbbb664c-a186-4702-ab44-a5104301468c', N'dcbeda40-9cc2-4144-a32c-e0a625f174db', NULL, CAST(0x0000A43700000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29D01134865 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'da4b68f4-4d4b-402f-a4ad-a60b6d729464', N'fae0ade0-f078-45f2-aa4d-ae50c74d6605', N'7c5595da-c05a-416c-b2b3-713c9b9853f5', CAST(0x0000A29F00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900F5589D AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'91de526c-8fd6-4800-8a35-a6e334fcc6ba', N'32381411-25ca-4c48-a5a6-e5c2568b6618', NULL, CAST(0x0000A41F00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B01315FCF AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'cb69a644-8625-442d-bc24-a6e99f9069e3', N'166857d3-c4b3-415f-9fd4-eaaf7c1aab75', NULL, CAST(0x0000A14100000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900F52436 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'0122ad11-5468-4231-8863-a8496d092e33', N'166857d3-c4b3-415f-9fd4-eaaf7c1aab75', NULL, CAST(0x0000A14800000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900F5243C AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'a1fca101-b095-422b-8ff5-a8549b66ef22', N'd2aa9f43-73ef-4a46-bdab-22504f7200fd', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A29900000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B00DD948F AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'8cebca80-05b8-4cea-a3ca-a88a650d6696', N'dcbeda40-9cc2-4144-a32c-e0a625f174db', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A43300000000 AS DateTime), CAST(8 AS Decimal(18, 0)), CAST(0x0000A29D01135645 AS DateTime), NULL, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'60bbd076-cfd5-4032-b9a1-a89e8b4012c1', N'eecc0206-511d-4966-a056-b52f90592a6a', NULL, CAST(0x0000A2F200000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29A012C1679 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'd2274c47-6b6d-4a0b-b16f-a8a13ec986f9', N'2b94c0d3-1e90-4d37-ad1f-4b737cdb8968', N'b5ad254d-bab8-4af9-b24d-7e982c01287c', CAST(0x0000A2DA00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A2C5012C8B3D AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'ada04539-1e52-44f7-a6e9-a8bbe5d15d02', N'dcbeda40-9cc2-4144-a32c-e0a625f174db', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A43600000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29D01138C05 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'542e77b2-5c6f-4f3e-afbc-a8bf20b1b7b5', N'fae0ade0-f078-45f2-aa4d-ae50c74d6605', N'7c5595da-c05a-416c-b2b3-713c9b9853f5', CAST(0x0000A29000000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900F55860 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'c85eeb71-f55f-48a5-9b7a-a8eba09bff07', N'e9adf832-0ad0-4022-b0f7-3884882f2ba9', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A2BB00000000 AS DateTime), CAST(4 AS Decimal(18, 0)), CAST(0x0000A29B013078DD AS DateTime), NULL, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'aecba046-255a-4aac-9638-a8f7e102552e', N'2b94c0d3-1e90-4d37-ad1f-4b737cdb8968', N'b5ad254d-bab8-4af9-b24d-7e982c01287c', CAST(0x0000A2D300000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A2C5012FFD21 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'52e6d580-2e7c-4ec7-b9ec-a94dcb7771a4', N'478cb821-f1df-4d4b-bd3c-ca81554fe7b0', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A16400000000 AS DateTime), CAST(8 AS Decimal(18, 0)), CAST(0x0000A29B011E03CC AS DateTime), NULL, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'1c2ce2df-3f4d-45f9-b731-a979765dc712', N'fae0ade0-f078-45f2-aa4d-ae50c74d6605', N'7c5595da-c05a-416c-b2b3-713c9b9853f5', CAST(0x0000A29300000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900F5586C AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'b8287a0d-9f35-4e56-be10-a97ae5184584', N'fae0ade0-f078-45f2-aa4d-ae50c74d6605', N'2946664a-12a0-4827-a41b-272b500a770a', CAST(0x0000A28700000000 AS DateTime), CAST(5 AS Decimal(18, 0)), CAST(0x0000A29900F5535F AS DateTime), NULL, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'69f442b4-439d-4e5c-9e6f-a9fbaa58d709', N'9d1419ba-926e-41f0-b644-508cc939a076', N'20cd934f-ba3f-4595-b2f1-ab1e3eb04b7b', CAST(0x0000A24D00000000 AS DateTime), CAST(8 AS Decimal(18, 0)), CAST(0x0000A25201281925 AS DateTime), NULL, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'e92fe1a5-c5c1-4489-8bd7-aa1eb1b3321b', N'212825aa-1bb4-4255-bd78-81229debe566', N'2946664a-12a0-4827-a41b-272b500a770a', CAST(0x0000A29D00000000 AS DateTime), CAST(2 AS Decimal(18, 0)), CAST(0x0000A29D01269202 AS DateTime), NULL, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'f19e390f-c220-4678-9f28-aa700afd2aba', N'c5cb6272-8c77-4682-bf7c-c2ccd3491980', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A22200000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B01303E02 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'ce9097cb-7760-4b16-8386-aa9f0c5cae5b', N'9d1419ba-926e-41f0-b644-508cc939a076', N'20cd934f-ba3f-4595-b2f1-ab1e3eb04b7b', CAST(0x0000A25600000000 AS DateTime), CAST(9 AS Decimal(18, 0)), CAST(0x0000A25201285940 AS DateTime), NULL, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'7da48f6c-92b4-401e-978a-ab39c6ab6b11', N'5a5d8679-f4f4-4e3b-a21f-2b2dd836acfd', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A2CF00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B012A3220 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'869b7761-2450-4096-9903-ab6bc77a6949', N'32381411-25ca-4c48-a5a6-e5c2568b6618', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A42D00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B01316315 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'06ebc013-199f-4ade-91d2-ab6c532c9068', N'2d101463-213a-45e9-99d1-16e626507541', N'b5ad254d-bab8-4af9-b24d-7e982c01287c', CAST(0x0000A2B800000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A2C501010B87 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'6f51e87c-8ba7-49cc-904c-ab95fabd0f30', N'2d101463-213a-45e9-99d1-16e626507541', NULL, CAST(0x0000A2B700000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A2C101318845 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'310db2de-e28c-4221-9635-abb1769bb4d0', N'fae0ade0-f078-45f2-aa4d-ae50c74d6605', N'b5ad254d-bab8-4af9-b24d-7e982c01287c', CAST(0x0000A29100000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900F55862 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'a2221802-a9e8-48cf-a33f-ac2b70ca9741', N'2b94c0d3-1e90-4d37-ad1f-4b737cdb8968', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A2C500000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A2C50136924C AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'2ce38b34-57d0-4131-a0e0-acb86dd4775e', N'fae0ade0-f078-45f2-aa4d-ae50c74d6605', N'b5ad254d-bab8-4af9-b24d-7e982c01287c', CAST(0x0000A28700000000 AS DateTime), CAST(5 AS Decimal(18, 0)), CAST(0x0000A29900F5529C AS DateTime), NULL, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'897708eb-02e5-47f1-8112-acf550125419', N'2d101463-213a-45e9-99d1-16e626507541', N'b5ad254d-bab8-4af9-b24d-7e982c01287c', CAST(0x0000A2AD00000000 AS DateTime), CAST(8 AS Decimal(18, 0)), CAST(0x0000A2C101319779 AS DateTime), NULL, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'c90677f2-3cca-4070-80e4-ad191f2cfc65', N'dcbeda40-9cc2-4144-a32c-e0a625f174db', N'2946664a-12a0-4827-a41b-272b500a770a', CAST(0x0000A44C00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29D01128000 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'c160482f-25e3-4896-9ca3-add3856519c4', N'2d101463-213a-45e9-99d1-16e626507541', N'b5ad254d-bab8-4af9-b24d-7e982c01287c', CAST(0x0000A2B700000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A2C501010B82 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'a67a779e-175b-4466-a97b-adf54510963a', N'e9adf832-0ad0-4022-b0f7-3884882f2ba9', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A2B900000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B01307EBD AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'432feb80-aa68-4e33-b684-adf9e613ba42', N'2d101463-213a-45e9-99d1-16e626507541', NULL, CAST(0x0000A2B000000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A2C101318841 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'5d74b4af-a7de-4dfd-bccc-ae739c405450', N'e9adf832-0ad0-4022-b0f7-3884882f2ba9', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A2C400000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B01307EC7 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'c7b9481d-9da3-49d2-884f-aeffa70eebdb', N'81530680-dd37-4681-aaa4-679745a7fb89', NULL, CAST(0x0000A30900000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A2C50102BA23 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'daa7034a-d2a6-45d7-90c1-aff0f875d53a', N'9d1419ba-926e-41f0-b644-508cc939a076', N'8a45396c-c249-486d-a7cd-acf67299d00b', CAST(0x0000A25900000000 AS DateTime), CAST(4 AS Decimal(18, 0)), CAST(0x0000A252012862A6 AS DateTime), NULL, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'784fea3f-4a6a-440f-871c-b0156322ef8b', N'166857d3-c4b3-415f-9fd4-eaaf7c1aab75', NULL, CAST(0x0000A13D00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900F52434 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'5dc511d8-4238-4b0d-95b3-b07622068a45', N'e9adf832-0ad0-4022-b0f7-3884882f2ba9', NULL, CAST(0x0000A2C000000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B01306B59 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'ee46e610-5afb-4d1e-ae5b-b0b67d86b27c', N'2a6beec4-e8ab-43a8-aaf6-28b58f42ae9f', NULL, CAST(0x0000A42B00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A2C500DB3F6D AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'62c34317-44ad-4d61-82be-b142211166d5', N'fae0ade0-f078-45f2-aa4d-ae50c74d6605', N'b5ad254d-bab8-4af9-b24d-7e982c01287c', CAST(0x0000A28E00000000 AS DateTime), CAST(5 AS Decimal(18, 0)), CAST(0x0000A29900F54E69 AS DateTime), NULL, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'238fd5c6-1b9a-45b8-8a83-b1f62bd7f75c', N'd2aa9f43-73ef-4a46-bdab-22504f7200fd', N'2946664a-12a0-4827-a41b-272b500a770a', CAST(0x0000A2A100000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29D01120266 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'3bf41aee-510c-4cf6-a878-b1f9a3964cd6', N'c5cb6272-8c77-4682-bf7c-c2ccd3491980', NULL, CAST(0x0000A21200000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B013026FC AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'8e961bde-71d7-44c2-af0e-b212e515b35f', N'eecc0206-511d-4966-a056-b52f90592a6a', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A2EC00000000 AS DateTime), CAST(5 AS Decimal(18, 0)), CAST(0x0000A29A012C5D3B AS DateTime), NULL, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'07671a2a-cc44-49ed-b70e-b2a7f308bab1', N'2b94c0d3-1e90-4d37-ad1f-4b737cdb8968', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A2D500000000 AS DateTime), NULL, CAST(0x0000A2C500000000 AS DateTime), NULL, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'5381bb19-9da7-44ed-a050-b2d6114f81bb', N'c5cb6272-8c77-4682-bf7c-c2ccd3491980', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A21800000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B01303DFC AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'e6737407-37b7-4d78-bd22-b3110446e392', N'298de147-f4f6-492a-90eb-0c14ca5c8c70', NULL, CAST(0x0000A32C00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B012622B6 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'733e47be-5890-45e9-a383-b3e86910a718', N'478cb821-f1df-4d4b-bd3c-ca81554fe7b0', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A16D00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B011E16B9 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'eff290c9-60d9-4670-a650-b448ceafe2b1', N'e90e53e1-5605-44b2-aed7-df1f195c53c1', NULL, CAST(0x0000A46500000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900DC9612 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'c61fbb6b-7d77-4230-a5d8-b47b20526136', N'212825aa-1bb4-4255-bd78-81229debe566', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A29200000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29D0135F3F9 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'69f29931-0aab-4e91-8a4a-b4cfed77e366', N'32381411-25ca-4c48-a5a6-e5c2568b6618', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A41B00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B01316306 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'14f7253b-4aed-45fa-a034-b52a63882d29', N'421f636a-d553-4b50-8347-0a4d9a9db06b', NULL, CAST(0x0000A28E00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29700C3C518 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'ed5532bd-a875-49cb-9676-b58b315b3862', N'eecc0206-511d-4966-a056-b52f90592a6a', NULL, CAST(0x0000A2EA00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29A012C1670 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'1559ba53-b351-4ab6-8db3-b5b09e8c1e66', N'c5cb6272-8c77-4682-bf7c-c2ccd3491980', NULL, CAST(0x0000A22300000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B01302709 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'0d676983-273f-4091-9b71-b5e7018ec244', N'2b94c0d3-1e90-4d37-ad1f-4b737cdb8968', N'2946664a-12a0-4827-a41b-272b500a770a', CAST(0x0000A2CC00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A2C5012FFD1A AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'308a2984-9f36-4e90-954f-b5efce82c0be', N'eecc0206-511d-4966-a056-b52f90592a6a', NULL, CAST(0x0000A2EB00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29A012C1672 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'259a1567-eb0d-4000-9640-b65d042b8652', N'dcbeda40-9cc2-4144-a32c-e0a625f174db', NULL, CAST(0x0000A44C00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29D01134867 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'8a95cae6-8e60-4613-a2a3-b67999a21e06', N'2b94c0d3-1e90-4d37-ad1f-4b737cdb8968', N'b5ad254d-bab8-4af9-b24d-7e982c01287c', CAST(0x0000A2D700000000 AS DateTime), CAST(8 AS Decimal(18, 0)), CAST(0x0000A2C5012C6BB9 AS DateTime), NULL, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'1dc09c6d-b0fe-4fed-bcf5-b6d2413428bd', N'81530680-dd37-4681-aaa4-679745a7fb89', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A30600000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29A0138A341 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'9e716b5d-f983-486f-a36f-b7087002a10d', N'2d101463-213a-45e9-99d1-16e626507541', N'b5ad254d-bab8-4af9-b24d-7e982c01287c', CAST(0x0000A2BF00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A2C501010B90 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'd4391c69-a8b1-47aa-8f46-b73a956c6607', N'e90e53e1-5605-44b2-aed7-df1f195c53c1', NULL, CAST(0x0000A45600000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900DC95FF AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'45461391-e2f1-4f02-b3fd-b73af6932ac8', N'9a2d99e8-1c2a-4bac-a840-c4f6692041b9', NULL, CAST(0x0000A2AC00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A2AC00AE40FE AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'05074055-656f-443f-8f27-b762bb66483d', N'f66bcc6b-19a7-420c-be11-8f952a9d344b', NULL, CAST(0x0000A29D00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B00BBCCA6 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'd4e81f9e-f8a8-4a42-9a8d-b7683c740511', N'212825aa-1bb4-4255-bd78-81229debe566', NULL, CAST(0x0000A28B00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29D0135E27C AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'385ab684-4e73-4855-8df1-b7edebfbc1cb', N'9e7c8d21-2e45-4c34-912d-036d9e9147cf', NULL, CAST(0x0000A2CA00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A2BE013CCAEC AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'ef386cb7-ba9d-46fc-b6ca-b8c2dc77d556', N'298de147-f4f6-492a-90eb-0c14ca5c8c70', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A32300000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B00CB0033 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'b7a21d8c-16b9-41f5-acca-b93a2d2cbaff', N'dcbeda40-9cc2-4144-a32c-e0a625f174db', N'2946664a-12a0-4827-a41b-272b500a770a', CAST(0x0000A43D00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29D01127FFC AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'388a2f48-f9cb-4259-8dcd-b9786ac3e9e1', N'2b94c0d3-1e90-4d37-ad1f-4b737cdb8968', NULL, CAST(0x0000A2D300000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A2C5012C58FD AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'55098936-beb3-4604-a8f1-b9c25a425afb', N'2b94c0d3-1e90-4d37-ad1f-4b737cdb8968', N'2946664a-12a0-4827-a41b-272b500a770a', CAST(0x0000A2D400000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A2C50130AE2E AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'a7dffb8f-ab43-48f5-9971-b9c6d3f45d55', N'dcbeda40-9cc2-4144-a32c-e0a625f174db', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A44C00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29D01138C0C AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'1247dc58-f72a-468c-96c1-ba30fa2cd7c9', N'9e7c8d21-2e45-4c34-912d-036d9e9147cf', NULL, CAST(0x0000A2E000000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A2BE013CCB07 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'd3ef5281-eb02-4706-9c8e-ba513d8edac1', N'eecc0206-511d-4966-a056-b52f90592a6a', NULL, CAST(0x0000A2F400000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29A012C167A AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'df5a661b-0dff-4fdc-af2b-bae9ca93485d', N'c5cb6272-8c77-4682-bf7c-c2ccd3491980', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A20F00000000 AS DateTime), CAST(5 AS Decimal(18, 0)), CAST(0x0000A29B01302C41 AS DateTime), NULL, NULL)
GO
print 'Processed 700 total records'
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'3a5713ee-1d4c-435b-9182-bb1526dc7e91', N'889c1d0a-4263-4fb1-a3eb-7d3e6212e247', NULL, CAST(0x0000A16200000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B00D4B16C AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'd7eed06f-3ee5-402e-9942-bb3cc6cd106f', N'32381411-25ca-4c48-a5a6-e5c2568b6618', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A42500000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B0131630E AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'21191fe4-1fdb-4f3a-bd1b-bb541b6c7bb5', N'2d101463-213a-45e9-99d1-16e626507541', N'b5ad254d-bab8-4af9-b24d-7e982c01287c', CAST(0x0000A2B500000000 AS DateTime), CAST(8 AS Decimal(18, 0)), CAST(0x0000A2C10131A917 AS DateTime), NULL, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'bc942dd8-da1e-4ef7-96d1-bb72e53fe77f', N'2a6beec4-e8ab-43a8-aaf6-28b58f42ae9f', NULL, CAST(0x0000A41500000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A2C500DB3F5E AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'd7542302-c5a2-49da-b335-bbb2ea29fd6c', N'9d1419ba-926e-41f0-b644-508cc939a076', N'8a45396c-c249-486d-a7cd-acf67299d00b', CAST(0x0000A25400000000 AS DateTime), CAST(4 AS Decimal(18, 0)), CAST(0x0000A252012850EE AS DateTime), NULL, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'2c60d86e-1474-4f4f-bb59-bbbc26bccfa1', N'298de147-f4f6-492a-90eb-0c14ca5c8c70', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A31F00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B00CB002F AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'e7483b5b-7563-4648-ab39-bc11fef96fd4', N'e90e53e1-5605-44b2-aed7-df1f195c53c1', NULL, CAST(0x0000A46C00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900DC961C AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'6a5de6db-39af-4d21-ad78-bc2efa3cdbce', N'e90e53e1-5605-44b2-aed7-df1f195c53c1', NULL, CAST(0x0000A45E00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900DC960A AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'834b3599-bdb5-404c-910c-bc7473535b8d', N'fae0ade0-f078-45f2-aa4d-ae50c74d6605', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A28C00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900F55855 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'd963eabb-6c04-49ce-b957-bd90ff8593a8', N'2a6beec4-e8ab-43a8-aaf6-28b58f42ae9f', NULL, CAST(0x0000A41600000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A2C500DB3F60 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'5d56e334-0878-4f59-9039-bdb37b4c8326', N'32381411-25ca-4c48-a5a6-e5c2568b6618', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A42100000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B0131630A AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'e58640fe-9c96-484b-a6db-bdcf921ba562', N'2b94c0d3-1e90-4d37-ad1f-4b737cdb8968', N'b5ad254d-bab8-4af9-b24d-7e982c01287c', CAST(0x0000A2D800000000 AS DateTime), CAST(8 AS Decimal(18, 0)), CAST(0x0000A2C5012C6C43 AS DateTime), NULL, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'dacbc6c7-6062-4822-b622-be7f941df428', N'fae0ade0-f078-45f2-aa4d-ae50c74d6605', N'7c5595da-c05a-416c-b2b3-713c9b9853f5', CAST(0x0000A29E00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900F55898 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'ae1d07e3-f2fc-490c-893d-bf3a2f08e469', N'9d1419ba-926e-41f0-b644-508cc939a076', N'20cd934f-ba3f-4595-b2f1-ab1e3eb04b7b', CAST(0x0000A25500000000 AS DateTime), CAST(6 AS Decimal(18, 0)), CAST(0x0000A252012852C8 AS DateTime), NULL, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'3112611e-b85e-4a1f-883c-bf50cdf92e31', N'fae0ade0-f078-45f2-aa4d-ae50c74d6605', NULL, CAST(0x0000A28C00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900F532DC AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'5af702d3-91ce-49ba-b62d-bf602b39190b', N'fae0ade0-f078-45f2-aa4d-ae50c74d6605', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A2A300000000 AS DateTime), CAST(5 AS Decimal(18, 0)), CAST(0x0000A29900F5494E AS DateTime), NULL, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'c160184a-df22-4ede-9bce-bf71c5a6464a', N'889c1d0a-4263-4fb1-a3eb-7d3e6212e247', NULL, CAST(0x0000A17100000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B00D4B176 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'1aa6ae95-a23d-44e6-a7db-c080b50bbfbb', N'9d1419ba-926e-41f0-b644-508cc939a076', N'8a45396c-c249-486d-a7cd-acf67299d00b', CAST(0x0000A25600000000 AS DateTime), CAST(6 AS Decimal(18, 0)), CAST(0x0000A25201285F74 AS DateTime), NULL, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'a59b819c-492b-464c-b4be-c0e5d67a6a5c', N'298de147-f4f6-492a-90eb-0c14ca5c8c70', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A32500000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B00CB0034 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'26b2402e-ec44-4b51-9749-c0f4b76a2215', N'2b94c0d3-1e90-4d37-ad1f-4b737cdb8968', N'2946664a-12a0-4827-a41b-272b500a770a', CAST(0x0000A2DB00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A2C5013692AD AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'967daba5-1456-482e-9d2c-c17d7ea377c1', N'2b94c0d3-1e90-4d37-ad1f-4b737cdb8968', N'b5ad254d-bab8-4af9-b24d-7e982c01287c', CAST(0x0000A2D400000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A2C5012FFD25 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'39cc57e6-54b6-4d6b-86ca-c189900c36a1', N'7f54179d-42c2-4844-838f-49f3b90029aa', NULL, CAST(0x0000A2FE00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A2C50135F2B0 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'eac45798-2652-43e6-b350-c1bfcaf64cc2', N'2b94c0d3-1e90-4d37-ad1f-4b737cdb8968', N'b5ad254d-bab8-4af9-b24d-7e982c01287c', CAST(0x0000A2CF00000000 AS DateTime), CAST(8 AS Decimal(18, 0)), CAST(0x0000A2C5012C685F AS DateTime), NULL, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'ba5d6741-e6a6-4041-9a3e-c1de91a74dd6', N'2b94c0d3-1e90-4d37-ad1f-4b737cdb8968', N'2946664a-12a0-4827-a41b-272b500a770a', CAST(0x0000A2CD00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A2C501369276 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'0ee7db19-b9f5-475b-bffb-c1fd3ddaac2d', N'fae0ade0-f078-45f2-aa4d-ae50c74d6605', N'7c5595da-c05a-416c-b2b3-713c9b9853f5', CAST(0x0000A29600000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900F5587A AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'0b6cddaf-d8d3-4b9d-ad9f-c257257561cd', N'fae0ade0-f078-45f2-aa4d-ae50c74d6605', N'7c5595da-c05a-416c-b2b3-713c9b9853f5', CAST(0x0000A2A000000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900F558A1 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'3bcea363-b778-4445-8518-c2c2619e7b14', N'5a5d8679-f4f4-4e3b-a21f-2b2dd836acfd', NULL, CAST(0x0000A2D600000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B012A1C0D AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'9f633fd1-d930-4464-a7e9-c2d3322f64b6', N'd2aa9f43-73ef-4a46-bdab-22504f7200fd', NULL, CAST(0x0000A29200000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29D0111D739 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'4495eb84-5d6c-4e9d-a762-c30dfab6cda8', N'c5cb6272-8c77-4682-bf7c-c2ccd3491980', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A21400000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B01303DF9 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'8b8bce78-420b-4210-abe5-c3efc1396789', N'dcbeda40-9cc2-4144-a32c-e0a625f174db', N'2946664a-12a0-4827-a41b-272b500a770a', CAST(0x0000A43200000000 AS DateTime), CAST(2 AS Decimal(18, 0)), CAST(0x0000A29D010F59F8 AS DateTime), NULL, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'eee3e1be-27a2-4a9a-a4ea-c450d6ca2301', N'e9adf832-0ad0-4022-b0f7-3884882f2ba9', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A2BD00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B01307EC3 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'840036ab-76d9-497b-bbb9-c50b040f9603', N'fae0ade0-f078-45f2-aa4d-ae50c74d6605', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A29100000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900F55865 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'719acdb1-5a6e-40e2-a7ba-c5183c827a86', N'2b94c0d3-1e90-4d37-ad1f-4b737cdb8968', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A2D400000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A2C501369296 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'6f48b63d-da9d-406a-8987-c569d79ea01b', N'fae0ade0-f078-45f2-aa4d-ae50c74d6605', N'b5ad254d-bab8-4af9-b24d-7e982c01287c', CAST(0x0000A28F00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900F5585A AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'ff824889-d2b5-4fd3-bf49-c63671520b8a', N'2b94c0d3-1e90-4d37-ad1f-4b737cdb8968', N'b5ad254d-bab8-4af9-b24d-7e982c01287c', CAST(0x0000A2CE00000000 AS DateTime), CAST(8 AS Decimal(18, 0)), CAST(0x0000A2C5012C67E2 AS DateTime), NULL, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'52dcd929-67d6-4873-9635-c636e1d83f75', N'5a5d8679-f4f4-4e3b-a21f-2b2dd836acfd', NULL, CAST(0x0000A2D500000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B012A1C0B AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'976750ab-3a61-465c-a1b4-c675711399cf', N'478cb821-f1df-4d4b-bd3c-ca81554fe7b0', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A16700000000 AS DateTime), CAST(9 AS Decimal(18, 0)), CAST(0x0000A29B011E0562 AS DateTime), NULL, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'10367f60-7d00-4027-a0a2-c67978f59679', N'212825aa-1bb4-4255-bd78-81229debe566', N'2946664a-12a0-4827-a41b-272b500a770a', CAST(0x0000A2A100000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29D011F6876 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'd4a5c874-8ae8-4280-bb7c-c69f6b702e94', N'fae0ade0-f078-45f2-aa4d-ae50c74d6605', N'7c5595da-c05a-416c-b2b3-713c9b9853f5', CAST(0x0000A28D00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900F55858 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'c9dc5e88-7e9a-4fee-b30a-c6a78a65f884', N'298de147-f4f6-492a-90eb-0c14ca5c8c70', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A33700000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B01263B9E AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'c54a873b-df4d-4186-aecb-c6c97d028afb', N'2b94c0d3-1e90-4d37-ad1f-4b737cdb8968', N'2946664a-12a0-4827-a41b-272b500a770a', CAST(0x0000A2CC00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A2C501369269 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'7ae47034-421d-477a-bf07-c73846aaf11f', N'81530680-dd37-4681-aaa4-679745a7fb89', NULL, CAST(0x0000A31800000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A2C50102BA30 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'aa48a53a-d219-4202-a7d4-c760707c2e80', N'298de147-f4f6-492a-90eb-0c14ca5c8c70', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A32600000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B01263B8D AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'2c89a210-428e-4459-9a3c-c7eab96317c2', N'c5cb6272-8c77-4682-bf7c-c2ccd3491980', NULL, CAST(0x0000A21F00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B01302703 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'3a2c95b1-ee73-4110-8357-c8597ffb4bf6', N'eecc0206-511d-4966-a056-b52f90592a6a', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A2ED00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29A012C639A AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'2407f773-82f2-4a94-af02-c8c6417a7d90', N'212825aa-1bb4-4255-bd78-81229debe566', N'2946664a-12a0-4827-a41b-272b500a770a', CAST(0x0000A2A000000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29D01269698 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'08ec8996-923a-4f1f-a80a-c8fa4219c5fc', N'eecc0206-511d-4966-a056-b52f90592a6a', NULL, CAST(0x0000A2E600000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29A012C166D AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'7e324837-6c6d-46d5-bc33-c9414edbba75', N'd2aa9f43-73ef-4a46-bdab-22504f7200fd', N'2946664a-12a0-4827-a41b-272b500a770a', CAST(0x0000A29900000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29D01120263 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'1e94f703-13f3-4445-a7e2-c947540d267b', N'212825aa-1bb4-4255-bd78-81229debe566', N'2946664a-12a0-4827-a41b-272b500a770a', CAST(0x0000A28B00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29D011F6859 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'40aa4549-f8e3-4ef8-885f-c9a9354c2927', N'474dd670-399c-425c-b3c6-3e73132144d3', NULL, CAST(0x0000A14D00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B01324C81 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'e50c912e-7de2-41ad-94d3-ca10770d0ec1', N'62212af0-bbbb-4984-81be-ed97d14425a0', NULL, CAST(0x0000A3F100000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A2C3011A74FF AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'46942b10-2138-4e10-8561-ca3cc74a531b', N'2b94c0d3-1e90-4d37-ad1f-4b737cdb8968', N'2946664a-12a0-4827-a41b-272b500a770a', CAST(0x0000A2C600000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A2C50130AE19 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'b1670169-ada9-4829-a389-ca7fb169449f', N'e9adf832-0ad0-4022-b0f7-3884882f2ba9', NULL, CAST(0x0000A2C400000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B01306B5D AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'1cb83051-0340-4e68-9ebd-cad07051c04e', N'212825aa-1bb4-4255-bd78-81229debe566', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A28C00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29D0135F3F8 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'e4ee4456-c92d-4cb2-a5b6-cafadc424a8b', N'fae0ade0-f078-45f2-aa4d-ae50c74d6605', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A29E00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900F5589A AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'37e09e7f-ad95-4de5-ac6d-cb45bf1d1df4', N'fae0ade0-f078-45f2-aa4d-ae50c74d6605', N'2946664a-12a0-4827-a41b-272b500a770a', CAST(0x0000A29F00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900F5589C AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'78883ca2-dfc2-4f8f-84d5-cba950c6212f', N'212825aa-1bb4-4255-bd78-81229debe566', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A28B00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29D011F6852 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'f611d03b-b800-4253-b39b-cbb9163b05d5', N'32381411-25ca-4c48-a5a6-e5c2568b6618', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A42200000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B0131630C AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'36d740a3-0d2e-4ad8-8e59-cbc0325257a9', N'9e7c8d21-2e45-4c34-912d-036d9e9147cf', NULL, CAST(0x0000A2D900000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A2BE013CCB03 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'91edde68-4d98-43cb-a66b-cbd6eebe850d', N'c5cb6272-8c77-4682-bf7c-c2ccd3491980', NULL, CAST(0x0000A21500000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B013026FE AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'c8900732-8000-4a07-a692-cbdc3b3a8359', N'2b94c0d3-1e90-4d37-ad1f-4b737cdb8968', N'b5ad254d-bab8-4af9-b24d-7e982c01287c', CAST(0x0000A2DB00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A2C50130AE36 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'8af8a106-599a-453d-9258-cc55d4d53fb5', N'298de147-f4f6-492a-90eb-0c14ca5c8c70', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A32C00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B00CB003C AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'04a71ae1-c514-4e7e-80fa-cd821768271f', N'eecc0206-511d-4966-a056-b52f90592a6a', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A2F100000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29A012C639D AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'afec81d8-d709-4469-b933-cd94872ece3b', N'2b94c0d3-1e90-4d37-ad1f-4b737cdb8968', N'2946664a-12a0-4827-a41b-272b500a770a', CAST(0x0000A2D400000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A2C501369291 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'64b5954a-e877-4a4a-85d3-cdced95d6d16', N'eecc0206-511d-4966-a056-b52f90592a6a', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A2FC00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29A012C63B0 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'b6f3fac9-e843-412a-8de6-cdcf4b6c2ca5', N'2b94c0d3-1e90-4d37-ad1f-4b737cdb8968', N'b5ad254d-bab8-4af9-b24d-7e982c01287c', CAST(0x0000A2CC00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A2C50130AE1C AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'b51e84e5-2e7f-411e-8a3e-ce70eb6052de', N'22250e0f-8265-43e8-9fcb-a697f59744a7', NULL, CAST(0x0000A53E00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B01319FAE AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'9e995c40-d123-4c92-a46f-ce820350a0aa', N'212825aa-1bb4-4255-bd78-81229debe566', N'2946664a-12a0-4827-a41b-272b500a770a', CAST(0x0000A28900000000 AS DateTime), CAST(3 AS Decimal(18, 0)), CAST(0x0000A29D011F5C8D AS DateTime), NULL, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'aff808b0-2e9e-4b03-90eb-ce83aed7d1b8', N'dcbeda40-9cc2-4144-a32c-e0a625f174db', N'2946664a-12a0-4827-a41b-272b500a770a', CAST(0x0000A44400000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29D01138C08 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'4a76288c-4976-45ed-8cad-cebceda9c285', N'212825aa-1bb4-4255-bd78-81229debe566', N'2946664a-12a0-4827-a41b-272b500a770a', CAST(0x0000A29A00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29D01305991 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'157a4e65-7538-4b1d-81a4-cebdd57bbbf5', N'32381411-25ca-4c48-a5a6-e5c2568b6618', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A42F00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B0131631C AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'38bdd162-3c50-459c-a0b3-cec1213542f1', N'4066af84-094c-4e5b-9dd3-20927e4e39d0', NULL, CAST(0x0000A2DD00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900DA030E AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'113de9b7-d6ef-4486-8089-cee3f5a0dfc9', N'478cb821-f1df-4d4b-bd3c-ca81554fe7b0', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A16000000000 AS DateTime), CAST(7 AS Decimal(18, 0)), CAST(0x0000A29B011E0087 AS DateTime), NULL, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'155dadfc-cea0-467b-bf91-cee8fc7fba4d', N'fae0ade0-f078-45f2-aa4d-ae50c74d6605', N'b5ad254d-bab8-4af9-b24d-7e982c01287c', CAST(0x0000A29D00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900F55891 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'6fba43ba-7b62-4c06-bf7b-cf01788d755b', N'fae0ade0-f078-45f2-aa4d-ae50c74d6605', N'b5ad254d-bab8-4af9-b24d-7e982c01287c', CAST(0x0000A28800000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900F5583A AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'c49488fa-d233-494a-ab92-cf32de878911', N'fae0ade0-f078-45f2-aa4d-ae50c74d6605', N'b5ad254d-bab8-4af9-b24d-7e982c01287c', CAST(0x0000A28900000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900F55845 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'a3626355-7334-4824-a700-cfd6a08a0931', N'd2aa9f43-73ef-4a46-bdab-22504f7200fd', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A29E00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B00DD9490 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'3ba4560d-ac22-491f-a2b3-d030fa295042', N'212825aa-1bb4-4255-bd78-81229debe566', N'2946664a-12a0-4827-a41b-272b500a770a', CAST(0x0000A29900000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29D0126968F AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'1bfe901f-bf10-4a0e-a913-d05678c32871', N'9d1419ba-926e-41f0-b644-508cc939a076', N'20cd934f-ba3f-4595-b2f1-ab1e3eb04b7b', CAST(0x0000A24B00000000 AS DateTime), CAST(6 AS Decimal(18, 0)), CAST(0x0000A2520128176E AS DateTime), NULL, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'f33443f6-0041-4ff9-b949-d0ca0199a3f2', N'2a6beec4-e8ab-43a8-aaf6-28b58f42ae9f', NULL, CAST(0x0000A42A00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A2C500DB3F6B AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'b0e3e1c2-8fad-4bd5-9c59-d0d8a40f9f0f', N'eecc0206-511d-4966-a056-b52f90592a6a', NULL, CAST(0x0000A2E400000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29A012C166C AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'331ec474-3a02-493a-bf1f-d114240a65e1', N'eecc0206-511d-4966-a056-b52f90592a6a', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A2F800000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29A012C63AB AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'8747b174-8979-4e3b-bf88-d14944497eb4', N'fae0ade0-f078-45f2-aa4d-ae50c74d6605', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A29F00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900F5589E AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'5e97b217-79e6-437c-9c1f-d17166b34cc2', N'5a5d8679-f4f4-4e3b-a21f-2b2dd836acfd', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A2D100000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B012A3223 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'96627cd0-1525-45c7-9e90-d17d574bfd4a', N'fae0ade0-f078-45f2-aa4d-ae50c74d6605', N'2946664a-12a0-4827-a41b-272b500a770a', CAST(0x0000A28F00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900F5585B AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'9cec7d6d-ab79-4364-9020-d18c65880532', N'eecc0206-511d-4966-a056-b52f90592a6a', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A2EF00000000 AS DateTime), CAST(5 AS Decimal(18, 0)), CAST(0x0000A29A012C5DED AS DateTime), NULL, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'ab6c7ba0-3283-48da-928a-d1b38a8de1db', N'fae0ade0-f078-45f2-aa4d-ae50c74d6605', N'7c5595da-c05a-416c-b2b3-713c9b9853f5', CAST(0x0000A29700000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900F5587E AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'f181b79a-d966-42d4-a26d-d1b6c773f450', N'889c1d0a-4263-4fb1-a3eb-7d3e6212e247', NULL, CAST(0x0000A15B00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B00D4B16A AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'fd3e593c-33c3-41b0-9dbf-d1ec87021c0c', N'd2aa9f43-73ef-4a46-bdab-22504f7200fd', NULL, CAST(0x0000A29300000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29D0111D739 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'7194cc06-cd67-4982-ba58-d20b104925c6', N'fae0ade0-f078-45f2-aa4d-ae50c74d6605', N'b5ad254d-bab8-4af9-b24d-7e982c01287c', CAST(0x0000A2A300000000 AS DateTime), CAST(5 AS Decimal(18, 0)), CAST(0x0000A29900F5431A AS DateTime), NULL, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'370ba981-2659-43a2-9485-d2bed5ef65e1', N'2d101463-213a-45e9-99d1-16e626507541', N'b5ad254d-bab8-4af9-b24d-7e982c01287c', CAST(0x0000A2B700000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A2C10131C332 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'1cf00594-00a9-4bf8-8858-d2cf4d33571c', N'2d101463-213a-45e9-99d1-16e626507541', N'b5ad254d-bab8-4af9-b24d-7e982c01287c', CAST(0x0000A2AE00000000 AS DateTime), CAST(8 AS Decimal(18, 0)), CAST(0x0000A2C101319ADD AS DateTime), NULL, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'b058634b-3984-49ac-ac2b-d356ef183649', N'62212af0-bbbb-4984-81be-ed97d14425a0', NULL, CAST(0x0000A3DB00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A2C3011A74BA AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'584fbbb4-c1a0-4881-8f5c-d3a7b05b9aac', N'5a5d8679-f4f4-4e3b-a21f-2b2dd836acfd', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A2D900000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B012A322E AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'7e216881-8f0f-405d-a5a1-d434f1ff26ed', N'5a5d8679-f4f4-4e3b-a21f-2b2dd836acfd', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A2CE00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B012A321C AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'6b7d81fc-7517-4983-af18-d4f9f188de39', N'2d101463-213a-45e9-99d1-16e626507541', N'b5ad254d-bab8-4af9-b24d-7e982c01287c', CAST(0x0000A2AC00000000 AS DateTime), CAST(8 AS Decimal(18, 0)), CAST(0x0000A2C101319387 AS DateTime), NULL, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'4331ee86-b589-472a-898d-d4fddd63655d', N'fae0ade0-f078-45f2-aa4d-ae50c74d6605', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A29000000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900F55861 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'a2218299-ff80-48a5-89a5-d503dfdc6e5a', N'474dd670-399c-425c-b3c6-3e73132144d3', NULL, CAST(0x0000A14700000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B01324C80 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'fb3d5ffb-2839-40dc-8f53-d529c365828e', N'62212af0-bbbb-4984-81be-ed97d14425a0', NULL, CAST(0x0000A3E900000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A2C3011A74F9 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'd397858c-cfe9-40c1-893b-d5504a8601e6', N'fae0ade0-f078-45f2-aa4d-ae50c74d6605', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A28F00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900F5585D AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'81079264-5797-4322-863d-d69069f7e0b8', N'5a5d8679-f4f4-4e3b-a21f-2b2dd836acfd', NULL, CAST(0x0000A2CA00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B012A1C00 AS DateTime), 0, 1)
GO
print 'Processed 800 total records'
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'8051ba12-eb6f-40b6-b696-d6b21525f665', N'2d101463-213a-45e9-99d1-16e626507541', N'b5ad254d-bab8-4af9-b24d-7e982c01287c', CAST(0x0000A2BE00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A2C501010B8C AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'453a0b2b-7d2e-4ae3-a7fe-d6c3224496e7', N'fae0ade0-f078-45f2-aa4d-ae50c74d6605', N'2946664a-12a0-4827-a41b-272b500a770a', CAST(0x0000A28A00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900F5584B AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'6516d07c-5f4e-4822-96df-d6d30e72bf94', N'2d101463-213a-45e9-99d1-16e626507541', N'b5ad254d-bab8-4af9-b24d-7e982c01287c', CAST(0x0000A2B000000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A2C501010B78 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'b15d5bfa-408f-4578-9dc7-d6d990caa526', N'889c1d0a-4263-4fb1-a3eb-7d3e6212e247', NULL, CAST(0x0000A17000000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B00D4B175 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'ffb389b1-b60f-4016-bd95-d78612a1687a', N'212825aa-1bb4-4255-bd78-81229debe566', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A29A00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29D01305991 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'549404c6-cf39-454a-b028-d78c265e3941', N'5a5d8679-f4f4-4e3b-a21f-2b2dd836acfd', NULL, CAST(0x0000A2DC00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B012A1C12 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'55f751f7-b20e-4219-a00e-d86a747d1481', N'5a5d8679-f4f4-4e3b-a21f-2b2dd836acfd', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A2E000000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B012A3239 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'38046e04-a935-4de7-baa6-d8ba114ec183', N'eecc0206-511d-4966-a056-b52f90592a6a', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A2E200000000 AS DateTime), CAST(5 AS Decimal(18, 0)), CAST(0x0000A29A012C59D6 AS DateTime), NULL, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'6c4a1511-9eb4-4478-97ad-d8da28cdc0d0', N'fae0ade0-f078-45f2-aa4d-ae50c74d6605', NULL, CAST(0x0000A2A200000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900F53300 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'd2396e9d-73c6-4409-9008-d978e42e95c5', N'dcbeda40-9cc2-4144-a32c-e0a625f174db', N'2946664a-12a0-4827-a41b-272b500a770a', CAST(0x0000A43500000000 AS DateTime), CAST(1 AS Decimal(18, 0)), CAST(0x0000A29D01136699 AS DateTime), NULL, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'cbabb5b0-cea0-4563-b5f9-d994fa675561', N'2b94c0d3-1e90-4d37-ad1f-4b737cdb8968', N'2946664a-12a0-4827-a41b-272b500a770a', CAST(0x0000A2DB00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A2C50130AE38 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'd4873d42-12d9-4080-b02a-d9a4e00ee116', N'dcbeda40-9cc2-4144-a32c-e0a625f174db', N'2946664a-12a0-4827-a41b-272b500a770a', CAST(0x0000A44500000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29D01138C0A AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'1b62606f-0d0b-41d0-a6e0-d9b29ce289cf', N'2b94c0d3-1e90-4d37-ad1f-4b737cdb8968', N'b5ad254d-bab8-4af9-b24d-7e982c01287c', CAST(0x0000A2CC00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A2C501369272 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'fc3d7fa7-6c1f-40e4-95bd-d9c009bfd5f0', N'fae0ade0-f078-45f2-aa4d-ae50c74d6605', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A2A500000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900F558B9 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'196913be-645c-4f72-be82-da8780b6e4ae', N'2b94c0d3-1e90-4d37-ad1f-4b737cdb8968', N'b5ad254d-bab8-4af9-b24d-7e982c01287c', CAST(0x0000A2DB00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A2C5013692B5 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'18c883a5-6870-43d8-8b65-daf016115bac', N'5a5d8679-f4f4-4e3b-a21f-2b2dd836acfd', NULL, CAST(0x0000A2C800000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B012A1BFD AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'802cd69a-c372-433e-bdbd-db41f71f1e64', N'dcbeda40-9cc2-4144-a32c-e0a625f174db', NULL, CAST(0x0000A43600000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29D01134864 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'ccf3988b-c794-43f4-a426-db4cf6fd87d8', N'fae0ade0-f078-45f2-aa4d-ae50c74d6605', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A28900000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900F55848 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'be83360f-f2e5-4a08-8e63-db62fe7d458a', N'5a5d8679-f4f4-4e3b-a21f-2b2dd836acfd', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A2C700000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B012A320B AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'0752488b-e659-4974-8691-db7fdb7f976a', N'dcbeda40-9cc2-4144-a32c-e0a625f174db', N'2946664a-12a0-4827-a41b-272b500a770a', CAST(0x0000A43E00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29D01127FFD AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'68d71cf2-95f4-4cfd-94ba-db83b5de3046', N'2b94c0d3-1e90-4d37-ad1f-4b737cdb8968', N'b5ad254d-bab8-4af9-b24d-7e982c01287c', CAST(0x0000A2DA00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A2C5013692A8 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'14cc2e40-0217-4c9e-b339-dcc729bca108', N'9a2d99e8-1c2a-4bac-a840-c4f6692041b9', NULL, CAST(0x0000A2BA00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A2AC00AE4108 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'5c6583f4-9946-4311-b28f-dd5a1fd4c584', N'298de147-f4f6-492a-90eb-0c14ca5c8c70', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A33A00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B01263BA2 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'851b6bc9-6f3b-4137-a5dd-ddf51a271acc', N'dcbeda40-9cc2-4144-a32c-e0a625f174db', N'2946664a-12a0-4827-a41b-272b500a770a', CAST(0x0000A43600000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29D01127FF9 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'b8b3c78b-0458-470b-a50e-de0f8954dbb3', N'212825aa-1bb4-4255-bd78-81229debe566', N'2946664a-12a0-4827-a41b-272b500a770a', CAST(0x0000A29200000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29D0135F3FA AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'060f85f6-3419-425c-a8ce-de60ed68d978', N'32381411-25ca-4c48-a5a6-e5c2568b6618', NULL, CAST(0x0000A43000000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B01315FDE AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'36562357-07b8-4682-a807-de69ea00d86e', N'2b94c0d3-1e90-4d37-ad1f-4b737cdb8968', N'2946664a-12a0-4827-a41b-272b500a770a', CAST(0x0000A2D300000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A2C50130AE28 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'0208cec8-3de4-440e-92dc-dec450111fc7', N'2b94c0d3-1e90-4d37-ad1f-4b737cdb8968', N'2946664a-12a0-4827-a41b-272b500a770a', CAST(0x0000A2DA00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A2C5012FFD2D AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'4ad59241-a053-4e9d-b43e-dedde9512042', N'32381411-25ca-4c48-a5a6-e5c2568b6618', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A42C00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B01316314 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'8301f314-12b5-4fa8-9029-deed4200c33f', N'2d101463-213a-45e9-99d1-16e626507541', N'b5ad254d-bab8-4af9-b24d-7e982c01287c', CAST(0x0000A2B400000000 AS DateTime), CAST(8 AS Decimal(18, 0)), CAST(0x0000A2C10131A68F AS DateTime), NULL, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'595025a8-cc69-4e89-8764-df149d2bc1b3', N'478cb821-f1df-4d4b-bd3c-ca81554fe7b0', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A17300000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B011E16C1 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'3220de4a-057e-4a02-8f84-df2f9690c328', N'2d101463-213a-45e9-99d1-16e626507541', N'b5ad254d-bab8-4af9-b24d-7e982c01287c', CAST(0x0000A2B300000000 AS DateTime), CAST(4 AS Decimal(18, 0)), CAST(0x0000A2C10131A413 AS DateTime), NULL, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'2e59506e-014e-49ff-97c1-dfd2fd406aec', N'298de147-f4f6-492a-90eb-0c14ca5c8c70', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A33000000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B01263B96 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'20a7b332-7fb8-4577-8466-e01fd54eec62', N'dcbeda40-9cc2-4144-a32c-e0a625f174db', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A43D00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29D01127FFC AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'1c398b22-26ba-4396-af20-e06503f959f3', N'5a5d8679-f4f4-4e3b-a21f-2b2dd836acfd', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A2D800000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B012A322C AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'0f6c249d-e873-4c60-9ad0-e082b809286d', N'9d1419ba-926e-41f0-b644-508cc939a076', N'8a45396c-c249-486d-a7cd-acf67299d00b', CAST(0x0000A24C00000000 AS DateTime), CAST(2 AS Decimal(18, 0)), CAST(0x0000A252012822AD AS DateTime), NULL, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'fe7c1e85-3c9e-47ac-82f3-e1f835b32889', N'c5cb6272-8c77-4682-bf7c-c2ccd3491980', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A21700000000 AS DateTime), CAST(5 AS Decimal(18, 0)), CAST(0x0000A29B013030B6 AS DateTime), NULL, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'6052342f-e6e9-42ed-a6ac-e25ccec9d899', N'c5cb6272-8c77-4682-bf7c-c2ccd3491980', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A21100000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B01303DF7 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'046a57c0-f917-4584-b5f6-e271d9358fdb', N'2a6beec4-e8ab-43a8-aaf6-28b58f42ae9f', NULL, CAST(0x0000A41D00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A2C500DB3F65 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'539494a6-a77b-4bca-9e01-e324f197a889', N'298de147-f4f6-492a-90eb-0c14ca5c8c70', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A32600000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B00DDAE9E AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'05ae4b5b-b42b-4de2-934f-e32b8479c653', N'fae0ade0-f078-45f2-aa4d-ae50c74d6605', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A28800000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900F55844 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'5b5ccd79-91e8-4908-bbe0-e3be40bfe5f6', N'eecc0206-511d-4966-a056-b52f90592a6a', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A2E700000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29A012C6395 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'930208f9-4fd7-43b8-afa8-e420f817b786', N'e9adf832-0ad0-4022-b0f7-3884882f2ba9', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A2B400000000 AS DateTime), CAST(4 AS Decimal(18, 0)), CAST(0x0000A29B01307555 AS DateTime), NULL, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'18d7834b-d07e-4577-aa2b-e4714c015a74', N'212825aa-1bb4-4255-bd78-81229debe566', NULL, CAST(0x0000A29A00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29D0135E27F AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'e12d6533-2c45-41fd-81d6-e4c0a6ccf151', N'474dd670-399c-425c-b3c6-3e73132144d3', NULL, CAST(0x0000A14000000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B01324C7C AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'480202bd-de6a-41b8-a2b7-e4c927e0ea6a', N'd2aa9f43-73ef-4a46-bdab-22504f7200fd', N'2946664a-12a0-4827-a41b-272b500a770a', CAST(0x0000A29A00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29D01120264 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'a2167368-6526-405d-bcfa-e4f7e4a0aa89', N'e9adf832-0ad0-4022-b0f7-3884882f2ba9', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A2C300000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B01307EC6 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'8a561c5d-e624-4ddc-b309-e5105dc5cf72', N'e9adf832-0ad0-4022-b0f7-3884882f2ba9', NULL, CAST(0x0000A2AB00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B01306B4A AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'f62b5b4b-60c4-4528-8e77-e520519d6160', N'212825aa-1bb4-4255-bd78-81229debe566', N'2946664a-12a0-4827-a41b-272b500a770a', CAST(0x0000A29900000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29D0135F3FC AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'cff48ae3-3203-4e9a-a817-e5d49fc6f42c', N'62212af0-bbbb-4984-81be-ed97d14425a0', NULL, CAST(0x0000A3DC00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A2C3011A74F2 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'dc5f4bcb-617b-4de2-ba9a-e5de76cc9951', N'212825aa-1bb4-4255-bd78-81229debe566', N'2946664a-12a0-4827-a41b-272b500a770a', CAST(0x0000A29900000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29D011F686A AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'a9dc2eb5-6de6-477a-92a4-e5fb0649f21c', N'fae0ade0-f078-45f2-aa4d-ae50c74d6605', N'b5ad254d-bab8-4af9-b24d-7e982c01287c', CAST(0x0000A29900000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900F55884 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'c45fa6ee-12c7-49d6-ab22-e6115d4f9f66', N'dcbeda40-9cc2-4144-a32c-e0a625f174db', N'2946664a-12a0-4827-a41b-272b500a770a', CAST(0x0000A43E00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29D01138C07 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'b96060db-d88c-4e4a-9de5-e623636a73e6', N'166857d3-c4b3-415f-9fd4-eaaf7c1aab75', NULL, CAST(0x0000A15000000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900F52444 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'212af7cd-193d-46ae-8d0f-e639e5e8c02f', N'212825aa-1bb4-4255-bd78-81229debe566', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A29900000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29D0135F3FB AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'fb646ff9-aa28-45ce-bb8b-e6beb453e141', N'212825aa-1bb4-4255-bd78-81229debe566', N'2946664a-12a0-4827-a41b-272b500a770a', CAST(0x0000A29200000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29D011F6863 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'109f7240-aba8-4108-b3db-e70a925bd5c5', N'81530680-dd37-4681-aaa4-679745a7fb89', NULL, CAST(0x0000A30A00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A2C50102BA26 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'99768c61-4b7f-48ae-8c8f-e74b54e3a2f0', N'd2aa9f43-73ef-4a46-bdab-22504f7200fd', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A29900000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29D01120264 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'84e782dd-c754-48bb-8457-e777ba9f498f', N'9d1419ba-926e-41f0-b644-508cc939a076', N'8a45396c-c249-486d-a7cd-acf67299d00b', CAST(0x0000A24B00000000 AS DateTime), CAST(1 AS Decimal(18, 0)), CAST(0x0000A252012821AC AS DateTime), NULL, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'f1e4a3bb-383b-421f-b102-e7a4c9f5e6cd', N'e9adf832-0ad0-4022-b0f7-3884882f2ba9', NULL, CAST(0x0000A2AE00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B01306B4C AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'151d4bb3-dab0-4a34-8c1a-e811478095fa', N'2d101463-213a-45e9-99d1-16e626507541', N'b5ad254d-bab8-4af9-b24d-7e982c01287c', CAST(0x0000A2BA00000000 AS DateTime), CAST(8 AS Decimal(18, 0)), CAST(0x0000A2C10131B103 AS DateTime), NULL, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'c49533b3-ee76-47b1-816e-e837366a0232', N'4066af84-094c-4e5b-9dd3-20927e4e39d0', NULL, CAST(0x0000A2C700000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900DA0303 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'e2ee83d0-378e-4bf9-bc9f-e8384bf52f70', N'd2aa9f43-73ef-4a46-bdab-22504f7200fd', N'2946664a-12a0-4827-a41b-272b500a770a', CAST(0x0000A28900000000 AS DateTime), CAST(5 AS Decimal(18, 0)), CAST(0x0000A29D010E65A1 AS DateTime), NULL, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'4e72b108-bea6-4fd5-92ca-e8c77e6c517b', N'298de147-f4f6-492a-90eb-0c14ca5c8c70', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A33800000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B01263BA0 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'9d9f34a5-cc1d-44c4-9ea9-e8de4648e615', N'2b94c0d3-1e90-4d37-ad1f-4b737cdb8968', N'2946664a-12a0-4827-a41b-272b500a770a', CAST(0x0000A2CD00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A2C5012FFD1E AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'6d735c95-a626-437b-89ee-e8e1807ed5ca', N'298de147-f4f6-492a-90eb-0c14ca5c8c70', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A32200000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B01263B87 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'e9db18f4-e344-4a22-9df3-e8f0c3d7a141', N'212825aa-1bb4-4255-bd78-81229debe566', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A29200000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29D01269684 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'44765b03-784b-4ff3-a144-e9417562d7bd', N'22250e0f-8265-43e8-9fcb-a697f59744a7', NULL, CAST(0x0000A53600000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B01319FA9 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'0c679f86-0e04-4013-8e9e-e9ab4f4d1891', N'e9adf832-0ad0-4022-b0f7-3884882f2ba9', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A2B500000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B01307EBB AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'507ae403-c20d-4f1b-b7d4-ea19a3380292', N'478cb821-f1df-4d4b-bd3c-ca81554fe7b0', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A16100000000 AS DateTime), CAST(8 AS Decimal(18, 0)), CAST(0x0000A29B011E0209 AS DateTime), NULL, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'a356660e-8aa2-4a69-8d57-eac066005919', N'212825aa-1bb4-4255-bd78-81229debe566', N'2946664a-12a0-4827-a41b-272b500a770a', CAST(0x0000A29A00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29D0135F3FF AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'48aa305c-61d8-4dce-a32b-eada5fc3afef', N'2b94c0d3-1e90-4d37-ad1f-4b737cdb8968', NULL, CAST(0x0000A2CC00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A2C5012C58F8 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'cd7ffd73-1017-4043-a84b-eb4518a70243', N'81530680-dd37-4681-aaa4-679745a7fb89', NULL, CAST(0x0000A31700000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A2C50102BA2D AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'accc4124-8a29-482b-8fdb-ebcd037a68df', N'e90e53e1-5605-44b2-aed7-df1f195c53c1', NULL, CAST(0x0000A45000000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900DC95FC AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'bee7a189-455b-4599-a940-ec134d9a287f', N'298de147-f4f6-492a-90eb-0c14ca5c8c70', NULL, CAST(0x0000A33800000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B012622C7 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'0b58e70b-a98a-4fb6-9ad9-ec28c2033425', N'2b94c0d3-1e90-4d37-ad1f-4b737cdb8968', NULL, CAST(0x0000A2C600000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A2C5012C58F5 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'25c8e87b-3164-4ffe-98e6-ecb870921a28', N'166857d3-c4b3-415f-9fd4-eaaf7c1aab75', NULL, CAST(0x0000A15200000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900F52446 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'55feac8e-8a54-4d03-9601-ecde0f2b8610', N'd2aa9f43-73ef-4a46-bdab-22504f7200fd', NULL, CAST(0x0000A28C00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29D0111D738 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'9f6c1176-d072-4f8d-bb3b-ed4e64a06bc4', N'c5cb6272-8c77-4682-bf7c-c2ccd3491980', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A21300000000 AS DateTime), CAST(5 AS Decimal(18, 0)), CAST(0x0000A29B01302EC6 AS DateTime), NULL, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'b92fe964-78ee-41c5-af96-eda9884cfbb3', N'fae0ade0-f078-45f2-aa4d-ae50c74d6605', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A28E00000000 AS DateTime), CAST(5 AS Decimal(18, 0)), CAST(0x0000A29900F551C6 AS DateTime), NULL, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'a9fc90bf-34ab-48fb-90f5-ee7157d433e8', N'298de147-f4f6-492a-90eb-0c14ca5c8c70', NULL, CAST(0x0000A32200000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B012622AB AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'2fcf38ae-95c4-48f4-9020-eeb735e1d878', N'c5cb6272-8c77-4682-bf7c-c2ccd3491980', NULL, CAST(0x0000A21C00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B01302702 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'ba472e7e-f57c-4558-80bd-eeb8563d0e2b', N'e9adf832-0ad0-4022-b0f7-3884882f2ba9', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A2B700000000 AS DateTime), CAST(4 AS Decimal(18, 0)), CAST(0x0000A29B01307623 AS DateTime), NULL, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'87794686-c544-4a1e-bf8b-eebc7b12e468', N'dcbeda40-9cc2-4144-a32c-e0a625f174db', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A43600000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29D01127FFB AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'9a25a45d-8cd9-4285-94b5-eedb59cba539', N'81530680-dd37-4681-aaa4-679745a7fb89', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A30D00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29A0138A348 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'a6392ee4-3c59-4444-92d3-eeed2b812326', N'22250e0f-8265-43e8-9fcb-a697f59744a7', NULL, CAST(0x0000A52900000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B01319FA4 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'5cd58508-97f9-4d6f-b041-eeee3967b476', N'fae0ade0-f078-45f2-aa4d-ae50c74d6605', N'7c5595da-c05a-416c-b2b3-713c9b9853f5', CAST(0x0000A29400000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900F55876 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'2461e673-84bd-4308-b20e-eefb87638845', N'166857d3-c4b3-415f-9fd4-eaaf7c1aab75', NULL, CAST(0x0000A14900000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900F5243D AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'6adc3712-86a7-49a3-bfa6-ef0f5237463f', N'9d1419ba-926e-41f0-b644-508cc939a076', N'c6166f35-9877-4686-8932-aad265ee668a', CAST(0x0000A24D00000000 AS DateTime), CAST(3 AS Decimal(18, 0)), CAST(0x0000A2520128268A AS DateTime), NULL, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'2eaa229e-a697-4755-aba1-efadf44b8323', N'eecc0206-511d-4966-a056-b52f90592a6a', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A2E300000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29A012C6389 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'1759724e-df83-4938-a79a-efb55e22bf73', N'9a2d99e8-1c2a-4bac-a840-c4f6692041b9', NULL, CAST(0x0000A2B300000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A2AC00AE4105 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'f466cb55-f589-45f1-b1ef-efcb9e15b454', N'421f636a-d553-4b50-8347-0a4d9a9db06b', NULL, CAST(0x0000A28B00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29700C3C513 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'c792e008-379f-4423-91bc-f017810e079d', N'2b94c0d3-1e90-4d37-ad1f-4b737cdb8968', N'b5ad254d-bab8-4af9-b24d-7e982c01287c', CAST(0x0000A2DC00000000 AS DateTime), CAST(8 AS Decimal(18, 0)), CAST(0x0000A2C5012C86F7 AS DateTime), NULL, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'17ee1325-738a-4821-9429-f023e5823a62', N'298de147-f4f6-492a-90eb-0c14ca5c8c70', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A33400000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B00DDAEA2 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'e7f7cf7d-dcee-4c9f-9522-f0ad5b91d891', N'81530680-dd37-4681-aaa4-679745a7fb89', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A30E00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29A0138A349 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'cc5391a1-c0af-469f-a8d5-f0bfe4d785b6', N'478cb821-f1df-4d4b-bd3c-ca81554fe7b0', NULL, CAST(0x0000A16A00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B011DF15A AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'b742db72-4fdb-43dc-8e39-f12ba3913d5e', N'62212af0-bbbb-4984-81be-ed97d14425a0', NULL, CAST(0x0000A3E200000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A2C3011A74F4 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'd01fe85c-5c16-4374-8789-f1807509138d', N'5a5d8679-f4f4-4e3b-a21f-2b2dd836acfd', NULL, CAST(0x0000A2CB00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B012A1C03 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'21bc68eb-b165-42ee-80fe-f1a0a0b17851', N'2b94c0d3-1e90-4d37-ad1f-4b737cdb8968', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A2C600000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A2C501369261 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'8968e7c6-41b6-4c10-8b2d-f1ace87a25bc', N'2b94c0d3-1e90-4d37-ad1f-4b737cdb8968', N'b5ad254d-bab8-4af9-b24d-7e982c01287c', CAST(0x0000A2D100000000 AS DateTime), CAST(8 AS Decimal(18, 0)), CAST(0x0000A2C5012C6941 AS DateTime), NULL, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'163aa331-d4c0-4f28-918f-f241a1177399', N'd2aa9f43-73ef-4a46-bdab-22504f7200fd', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A29A00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B00DD948F AS DateTime), 1, NULL)
GO
print 'Processed 900 total records'
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'f06c6ee7-f7ec-4e3f-ba33-f273126ccc49', N'478cb821-f1df-4d4b-bd3c-ca81554fe7b0', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A15900000000 AS DateTime), CAST(4 AS Decimal(18, 0)), CAST(0x0000A29B011DFAF3 AS DateTime), NULL, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'11f89f32-effe-4fff-bf8d-f2bd4d03510e', N'478cb821-f1df-4d4b-bd3c-ca81554fe7b0', NULL, CAST(0x0000A15800000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B011DF0FA AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'4740433d-84e9-4c06-a41d-f35044ef3403', N'fae0ade0-f078-45f2-aa4d-ae50c74d6605', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A29700000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900F5587F AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'31e173a3-822c-4a9d-8970-f35fe3e675df', N'd2aa9f43-73ef-4a46-bdab-22504f7200fd', NULL, CAST(0x0000A28B00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29D0111D731 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'966e57aa-713a-420b-9a33-f393f6a602b6', N'2d101463-213a-45e9-99d1-16e626507541', NULL, CAST(0x0000A2B800000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A2C101318847 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'4ddba652-6f2d-4f97-bef6-f492bee49ad3', N'c5cb6272-8c77-4682-bf7c-c2ccd3491980', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A22B00000000 AS DateTime), CAST(5 AS Decimal(18, 0)), CAST(0x0000A29B01303B2D AS DateTime), NULL, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'dc916ae7-1a3e-4326-b586-f4eb7c10f480', N'2b94c0d3-1e90-4d37-ad1f-4b737cdb8968', N'b5ad254d-bab8-4af9-b24d-7e982c01287c', CAST(0x0000A2D200000000 AS DateTime), CAST(8 AS Decimal(18, 0)), CAST(0x0000A2C5012C69D9 AS DateTime), NULL, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'd131cd27-5135-41c8-bcdb-f54822ea3957', N'fae0ade0-f078-45f2-aa4d-ae50c74d6605', NULL, CAST(0x0000A28B00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900F532DB AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'3985e1d5-3857-4edc-9e74-f666acedc87d', N'166857d3-c4b3-415f-9fd4-eaaf7c1aab75', NULL, CAST(0x0000A14E00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900F52442 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'05ae5e23-0b93-4db8-85db-f66ee0610629', N'81530680-dd37-4681-aaa4-679745a7fb89', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A30300000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29A0138A33F AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'98638b53-f327-4111-accc-f674f8cc98bd', N'32381411-25ca-4c48-a5a6-e5c2568b6618', NULL, CAST(0x0000A42200000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B01315FD2 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'a1a400c7-52ce-4b99-a655-f6c7b788f7f1', N'421f636a-d553-4b50-8347-0a4d9a9db06b', NULL, CAST(0x0000A29C00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29700C3C529 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'3dbcb578-3a6f-4cf9-b063-f6d7a08bcb82', N'd2aa9f43-73ef-4a46-bdab-22504f7200fd', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A29300000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29D01120263 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'b394b440-8fb3-4755-bdae-f7af8a38f5fd', N'2b94c0d3-1e90-4d37-ad1f-4b737cdb8968', N'b5ad254d-bab8-4af9-b24d-7e982c01287c', CAST(0x0000A2CC00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A2C5012FFD18 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'944d4a2f-8b6b-4d42-9d91-f7e0b764b13b', N'298de147-f4f6-492a-90eb-0c14ca5c8c70', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A32D00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B00CB003E AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'62dd1c99-5e92-4452-8988-f855694e680b', N'889c1d0a-4263-4fb1-a3eb-7d3e6212e247', NULL, CAST(0x0000A16300000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B00D4B171 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'2aae38ed-da3a-466a-881e-f8e632fa9f2b', N'478cb821-f1df-4d4b-bd3c-ca81554fe7b0', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A16600000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B011E16AB AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'e522c736-119a-468b-9acc-f8ec0f98c46e', N'eecc0206-511d-4966-a056-b52f90592a6a', NULL, CAST(0x0000A2F100000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29A012C1677 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'53626e8c-cf82-430f-85f4-f8faf8ec1823', N'166857d3-c4b3-415f-9fd4-eaaf7c1aab75', NULL, CAST(0x0000A13C00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900F52433 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'0c9460f8-5f9b-428e-a47c-f94453d7a75d', N'fae0ade0-f078-45f2-aa4d-ae50c74d6605', N'7c5595da-c05a-416c-b2b3-713c9b9853f5', CAST(0x0000A28F00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900F5585C AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'49469e5b-50ee-4be6-a8d9-f95fac6c2ebf', N'421f636a-d553-4b50-8347-0a4d9a9db06b', NULL, CAST(0x0000A2A300000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29700C3C532 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'22b13955-64da-41ed-9aab-f9850b84be7b', N'9d1419ba-926e-41f0-b644-508cc939a076', N'c6166f35-9877-4686-8932-aad265ee668a', CAST(0x0000A25200000000 AS DateTime), CAST(7 AS Decimal(18, 0)), CAST(0x0000A25201284731 AS DateTime), NULL, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'f50a31f1-78bd-44d9-bcf0-f998e0f90123', N'478cb821-f1df-4d4b-bd3c-ca81554fe7b0', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A15E00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B011E169C AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'972d240b-9df3-41da-aff5-fa22aed4ca25', N'421f636a-d553-4b50-8347-0a4d9a9db06b', NULL, CAST(0x0000A29500000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29700C3C520 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'5b2e5490-e97a-413b-8d4c-fa792d33871d', N'9d1419ba-926e-41f0-b644-508cc939a076', N'20cd934f-ba3f-4595-b2f1-ab1e3eb04b7b', CAST(0x0000A24C00000000 AS DateTime), CAST(6 AS Decimal(18, 0)), CAST(0x0000A25201281823 AS DateTime), NULL, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'0fd57bbc-f6ef-46de-bfb9-fa7f0860d8bb', N'2d101463-213a-45e9-99d1-16e626507541', N'b5ad254d-bab8-4af9-b24d-7e982c01287c', CAST(0x0000A2B100000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A2C501010B7E AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'77bda184-7009-4546-b645-fac012e75eab', N'478cb821-f1df-4d4b-bd3c-ca81554fe7b0', NULL, CAST(0x0000A17000000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B011DF162 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'837bc852-c157-4687-9ff0-fb6d9a642607', N'dcbeda40-9cc2-4144-a32c-e0a625f174db', N'2946664a-12a0-4827-a41b-272b500a770a', CAST(0x0000A44B00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29D01127FFF AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'23df20c0-573e-4f9c-b7ff-fbcc46337ae2', N'212825aa-1bb4-4255-bd78-81229debe566', NULL, CAST(0x0000A28C00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29D0135E27D AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'10608f4a-4120-4503-87c5-fc4975841828', N'2b94c0d3-1e90-4d37-ad1f-4b737cdb8968', N'b5ad254d-bab8-4af9-b24d-7e982c01287c', CAST(0x0000A2D400000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A2C50136929B AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'2f38dbcc-a202-459e-ba85-fc6fbd6fc3c4', N'478cb821-f1df-4d4b-bd3c-ca81554fe7b0', NULL, CAST(0x0000A16300000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B011DF14F AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'11f64312-3ea4-4076-a0b2-fc72b3558c88', N'478cb821-f1df-4d4b-bd3c-ca81554fe7b0', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A15B00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B011E1697 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'43928d82-18fc-446a-8ec5-fc80502e2781', N'fae0ade0-f078-45f2-aa4d-ae50c74d6605', N'7c5595da-c05a-416c-b2b3-713c9b9853f5', CAST(0x0000A28900000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900F55847 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'e8ff1df6-38f0-465d-a8f5-fcec07861343', N'32381411-25ca-4c48-a5a6-e5c2568b6618', NULL, CAST(0x0000A41800000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B01315FC9 AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'09f7aac8-c97b-4fe1-9204-fd22363f5178', N'298de147-f4f6-492a-90eb-0c14ca5c8c70', NULL, CAST(0x0000A33B00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B012622CB AS DateTime), 0, 1)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'3e3ed47a-1886-4fa4-a01b-fd319876463f', N'9d1419ba-926e-41f0-b644-508cc939a076', N'c6166f35-9877-4686-8932-aad265ee668a', CAST(0x0000A25400000000 AS DateTime), CAST(8 AS Decimal(18, 0)), CAST(0x0000A25201284897 AS DateTime), NULL, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'0b453c81-3dd8-4ccc-8c77-fd6c9c788b92', N'9d1419ba-926e-41f0-b644-508cc939a076', N'8a45396c-c249-486d-a7cd-acf67299d00b', CAST(0x0000A25500000000 AS DateTime), CAST(8 AS Decimal(18, 0)), CAST(0x0000A25201285799 AS DateTime), NULL, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'74bb564f-fa65-4427-a602-fdf34cbb7a99', N'fae0ade0-f078-45f2-aa4d-ae50c74d6605', N'7c5595da-c05a-416c-b2b3-713c9b9853f5', CAST(0x0000A29A00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900F5588B AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'30b4fabf-fd71-499c-b2cd-fe1c6a931f7e', N'fae0ade0-f078-45f2-aa4d-ae50c74d6605', N'7c5595da-c05a-416c-b2b3-713c9b9853f5', CAST(0x0000A29900000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900F55886 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'a0713f03-07e2-4572-b97e-fe482edb5d62', N'32381411-25ca-4c48-a5a6-e5c2568b6618', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A42900000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29B01316312 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'e5d48286-ae8e-40fe-81c1-fea67064bb52', N'212825aa-1bb4-4255-bd78-81229debe566', N'2946664a-12a0-4827-a41b-272b500a770a', CAST(0x0000A29200000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29D0130598A AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'8a000bda-e91e-4d33-be12-ff184eec39d5', N'c5cb6272-8c77-4682-bf7c-c2ccd3491980', N'49010d13-4567-4c15-b9d9-586e1ec55049', CAST(0x0000A22500000000 AS DateTime), CAST(5 AS Decimal(18, 0)), CAST(0x0000A29B013038AA AS DateTime), NULL, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'd78cc762-615c-40d0-9c4f-ff1f3c8c5415', N'fae0ade0-f078-45f2-aa4d-ae50c74d6605', N'b5ad254d-bab8-4af9-b24d-7e982c01287c', CAST(0x0000A29400000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29900F55873 AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'6057452e-cc53-430b-b2f4-ff8829f390f0', N'212825aa-1bb4-4255-bd78-81229debe566', N'2946664a-12a0-4827-a41b-272b500a770a', CAST(0x0000A29A00000000 AS DateTime), CAST(0 AS Decimal(18, 0)), CAST(0x0000A29D011F686E AS DateTime), 1, NULL)
INSERT [dbo].[TimeSheet] ([TimeSheetID], [TimeSheetMasterID], [ProjectID], [Date], [Hours], [CreatedDate], [IsWeekend], [isOff]) VALUES (N'bf63ab8b-3adc-4db4-ad46-ffd47dbc9039', N'9d1419ba-926e-41f0-b644-508cc939a076', N'20cd934f-ba3f-4595-b2f1-ab1e3eb04b7b', CAST(0x0000A24E00000000 AS DateTime), CAST(8 AS Decimal(18, 0)), CAST(0x0000A25201281A32 AS DateTime), NULL, NULL)
/****** Object:  Trigger [trgAfterUpdate]    Script Date: 02/04/2014 12:06:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[trgAfterUpdate] ON [dbo].[Holiday] 
FOR update
AS
    declare @HolidayID UNIQUEIDENTIFIER = NULL
	declare @LoctionID UNIQUEIDENTIFIER = NULL
	declare @ApplyToStaff BIT = NULL
    select @LoctionID=i.LocationID from inserted i;	
	select @HolidayID=i.HolidayID from inserted i;	
	select @ApplyToStaff=i.ApplyToStaff from inserted i;	
	
IF @ApplyToStaff = 1
BEGIN
		DELETE FROM EmployeeHoildays WHERE HolidayID=@HolidayID

		IF @LoctionID IS NOT NULL
		BEGIN
		
		DECLARE @tempTable table
		(
		EmployeeHolidayID UNIQUEIDENTIFIER DEFAULT NEWID(),
		EmpID UNIQUEIDENTIFIER NULL,
		HolidayID UNIQUEIDENTIFIER  NULL
		)
		
		INSERT INTO @tempTable (EmpID,HolidayID)
		select EmployeeID,NULL from Employee WHERE OfficeLocationID=@LoctionID

		
		UPDATE @tempTable SET  HolidayID=@HolidayID
		
		INSERT INTO EmployeeHoildays ( EmployeeHoildayID ,EmpID,HolidayID)
		SELECT EmployeeHolidayID,EmpID,HolidayID FROM @tempTable
        END 
END
GO
/****** Object:  Trigger [trgAfterInsert]    Script Date: 02/04/2014 12:06:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[trgAfterInsert] ON [dbo].[Holiday] 
FOR INSERT
AS
    declare @HolidayID UNIQUEIDENTIFIER = NULL
	declare @LoctionID UNIQUEIDENTIFIER = NULL
	declare @ApplyToStaff BIT = NULL
    select @LoctionID=i.LocationID from inserted i;	
	select @HolidayID=i.HolidayID from inserted i;	
	select @ApplyToStaff=i.ApplyToStaff from inserted i;	
	--DELETE FROM EmployeeHoildays WHERE HolidayID=@HolidayID
  
IF @ApplyToStaff = 1
BEGIN	
	IF @LoctionID IS NOT NULL
	BEGIN
	
	DECLARE @tempTable table
	(
	EmployeeHolidayID UNIQUEIDENTIFIER DEFAULT NEWID(),
	EmpID UNIQUEIDENTIFIER NULL,
	HolidayID UNIQUEIDENTIFIER  NULL
	)
	
	INSERT INTO @tempTable (EmpID,HolidayID)
    select EmployeeID,NULL from Employee WHERE OfficeLocationID=@LoctionID

	
	UPDATE @tempTable SET  HolidayID=@HolidayID
	
    INSERT INTO EmployeeHoildays ( EmployeeHoildayID ,EmpID,HolidayID)
    SELECT EmployeeHolidayID,EmpID,HolidayID FROM @tempTable

	END
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Report]    Script Date: 02/04/2014 12:06:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_Report]
(
@action int = null
)
AS
BEGIN

if @action = 1
 BEGIN
;WITH CTE (TimeSheetMasterID,ProjectID,TotalHours) AS
(select t.TimeSheetMasterID,t.ProjectID , SUM(t.Hours) as TotalHours from TimeSheet as t
where t.ProjectID IS NOT NULL group by t.TimeSheetMasterID,t.ProjectID )

 SELECT C.TimeSheetMasterID,TM.Month,TM.Year, P.ProjectName,E.DepartmentID,E.OfficeLocationID, E.FirstNameEn+' '+E.LastNameEn AS EmployeeName,
 E.EmployeeID,E.SupervisorID,E.AlternativeSupervisorID,E.AltFromDate,E.AltEndDate,E.CountryID,
 C.TotalHours,TM.Status,TM.IsSubmit,P.ProjectNumber
  FROM CTE C JOIN TimeSheetMaster TM ON TM.TimeSheetMasterID=C.TimeSheetMasterID
 JOIN Employee E ON E.EmployeeID =TM.EmpID JOIN Project P ON P.ProjectId =C.ProjectID
 END
 
 END
GO
/****** Object:  StoredProcedure [dbo].[DeleteWeekendAndHolidays]    Script Date: 02/04/2014 12:06:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[DeleteWeekendAndHolidays]
(
@TimeSheetMasterID uniqueidentifier,
@employeeID uniqueidentifier
)
as
(
select t.TimeSheetID, t.Date, datename (dw, t.Date) as dayOfTimesheet , w.WeekEndName  from TimeSheetMaster as tm 
join TimeSheet as t on tm.TimeSheetMasterID = t.TimeSheetMasterID
join Weekend as w on w.WeekEndName=datename (dw, t.Date) 
where tm.EmpID='B1CA1847-3F52-4F9A-9169-C307EEA1F118' and tm.TimeSheetMasterID='5EE69F4F-0617-4368-91CF-F57391234A40'
)
GO
/****** Object:  Default [DF__aspnet_Ap__Appli__08EA5793]    Script Date: 02/04/2014 12:06:26 ******/
ALTER TABLE [dbo].[aspnet_Applications] ADD  DEFAULT (newid()) FOR [ApplicationId]
GO
/****** Object:  Default [DF_Department_ActiveFromDate]    Script Date: 02/04/2014 12:06:26 ******/
ALTER TABLE [dbo].[Department] ADD  CONSTRAINT [DF_Department_ActiveFromDate]  DEFAULT (getdate()) FOR [ActiveFromDate]
GO
/****** Object:  Default [DF__aspnet_Us__UserI__0EA330E9]    Script Date: 02/04/2014 12:06:41 ******/
ALTER TABLE [dbo].[aspnet_Users] ADD  DEFAULT (newid()) FOR [UserId]
GO
/****** Object:  Default [DF__aspnet_Us__Mobil__0F975522]    Script Date: 02/04/2014 12:06:41 ******/
ALTER TABLE [dbo].[aspnet_Users] ADD  DEFAULT (NULL) FOR [MobileAlias]
GO
/****** Object:  Default [DF__aspnet_Us__IsAno__108B795B]    Script Date: 02/04/2014 12:06:41 ******/
ALTER TABLE [dbo].[aspnet_Users] ADD  DEFAULT ((0)) FOR [IsAnonymous]
GO
/****** Object:  Default [DF_City_CityID]    Script Date: 02/04/2014 12:06:41 ******/
ALTER TABLE [dbo].[City] ADD  CONSTRAINT [DF_City_CityID]  DEFAULT (newid()) FOR [CityID]
GO
/****** Object:  Default [DF__aspnet_Pa__PathI__5BE2A6F2]    Script Date: 02/04/2014 12:06:41 ******/
ALTER TABLE [dbo].[aspnet_Paths] ADD  DEFAULT (newid()) FOR [PathId]
GO
/****** Object:  Default [DF__aspnet_Ro__RoleI__44FF419A]    Script Date: 02/04/2014 12:06:41 ******/
ALTER TABLE [dbo].[aspnet_Roles] ADD  DEFAULT (newid()) FOR [RoleId]
GO
/****** Object:  Default [DF__aspnet_Perso__Id__6754599E]    Script Date: 02/04/2014 12:06:41 ******/
ALTER TABLE [dbo].[aspnet_PersonalizationPerUser] ADD  DEFAULT (newid()) FOR [Id]
GO
/****** Object:  Default [DF__aspnet_Me__Passw__239E4DCF]    Script Date: 02/04/2014 12:06:41 ******/
ALTER TABLE [dbo].[aspnet_Membership] ADD  DEFAULT ((0)) FOR [PasswordFormat]
GO
/****** Object:  Default [DF_EmployeeLocation_LocationID]    Script Date: 02/04/2014 12:06:41 ******/
ALTER TABLE [dbo].[EmployeeLocation] ADD  CONSTRAINT [DF_EmployeeLocation_LocationID]  DEFAULT (newid()) FOR [LocationID]
GO
/****** Object:  Default [DF_EmployeeLeaves_CreatedDate]    Script Date: 02/04/2014 12:06:42 ******/
ALTER TABLE [dbo].[EmployeeLeaves] ADD  CONSTRAINT [DF_EmployeeLeaves_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
/****** Object:  Default [DF_EmployeeLeaveRequest_CreateDate]    Script Date: 02/04/2014 12:06:42 ******/
ALTER TABLE [dbo].[EmployeeLeaveRequest] ADD  CONSTRAINT [DF_EmployeeLeaveRequest_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
/****** Object:  ForeignKey [FK__aspnet_Us__Appli__0DAF0CB0]    Script Date: 02/04/2014 12:06:41 ******/
ALTER TABLE [dbo].[aspnet_Users]  WITH CHECK ADD FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[aspnet_Applications] ([ApplicationId])
GO
/****** Object:  ForeignKey [FK_City_CountryOffice]    Script Date: 02/04/2014 12:06:41 ******/
ALTER TABLE [dbo].[City]  WITH CHECK ADD  CONSTRAINT [FK_City_CountryOffice] FOREIGN KEY([CountryOfficeID])
REFERENCES [dbo].[CountryOffice] ([CountryOfficeID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[City] CHECK CONSTRAINT [FK_City_CountryOffice]
GO
/****** Object:  ForeignKey [FK_Project_CountryOffice]    Script Date: 02/04/2014 12:06:41 ******/
ALTER TABLE [dbo].[Project]  WITH CHECK ADD  CONSTRAINT [FK_Project_CountryOffice] FOREIGN KEY([CountryID])
REFERENCES [dbo].[CountryOffice] ([CountryOfficeID])
GO
ALTER TABLE [dbo].[Project] CHECK CONSTRAINT [FK_Project_CountryOffice]
GO
/****** Object:  ForeignKey [FK__aspnet_Pa__Appli__5AEE82B9]    Script Date: 02/04/2014 12:06:41 ******/
ALTER TABLE [dbo].[aspnet_Paths]  WITH CHECK ADD FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[aspnet_Applications] ([ApplicationId])
GO
/****** Object:  ForeignKey [FK__aspnet_Ro__Appli__440B1D61]    Script Date: 02/04/2014 12:06:41 ******/
ALTER TABLE [dbo].[aspnet_Roles]  WITH CHECK ADD FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[aspnet_Applications] ([ApplicationId])
GO
/****** Object:  ForeignKey [FK__aspnet_Pe__PathI__68487DD7]    Script Date: 02/04/2014 12:06:41 ******/
ALTER TABLE [dbo].[aspnet_PersonalizationPerUser]  WITH CHECK ADD FOREIGN KEY([PathId])
REFERENCES [dbo].[aspnet_Paths] ([PathId])
GO
/****** Object:  ForeignKey [FK__aspnet_Pe__UserI__693CA210]    Script Date: 02/04/2014 12:06:41 ******/
ALTER TABLE [dbo].[aspnet_PersonalizationPerUser]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
/****** Object:  ForeignKey [FK__aspnet_Pr__UserI__38996AB5]    Script Date: 02/04/2014 12:06:41 ******/
ALTER TABLE [dbo].[aspnet_Profile]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
/****** Object:  ForeignKey [FK__aspnet_Me__Appli__21B6055D]    Script Date: 02/04/2014 12:06:41 ******/
ALTER TABLE [dbo].[aspnet_Membership]  WITH CHECK ADD FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[aspnet_Applications] ([ApplicationId])
GO
/****** Object:  ForeignKey [FK__aspnet_Me__UserI__22AA2996]    Script Date: 02/04/2014 12:06:41 ******/
ALTER TABLE [dbo].[aspnet_Membership]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
/****** Object:  ForeignKey [FK__aspnet_Pe__PathI__628FA481]    Script Date: 02/04/2014 12:06:41 ******/
ALTER TABLE [dbo].[aspnet_PersonalizationAllUsers]  WITH CHECK ADD FOREIGN KEY([PathId])
REFERENCES [dbo].[aspnet_Paths] ([PathId])
GO
/****** Object:  ForeignKey [FK_EmployeeLocation_City]    Script Date: 02/04/2014 12:06:41 ******/
ALTER TABLE [dbo].[EmployeeLocation]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeLocation_City] FOREIGN KEY([CityID])
REFERENCES [dbo].[City] ([CityID])
GO
ALTER TABLE [dbo].[EmployeeLocation] CHECK CONSTRAINT [FK_EmployeeLocation_City]
GO
/****** Object:  ForeignKey [FK_EmployeeLocation_CountryOffice]    Script Date: 02/04/2014 12:06:41 ******/
ALTER TABLE [dbo].[EmployeeLocation]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeLocation_CountryOffice] FOREIGN KEY([CountryID])
REFERENCES [dbo].[CountryOffice] ([CountryOfficeID])
GO
ALTER TABLE [dbo].[EmployeeLocation] CHECK CONSTRAINT [FK_EmployeeLocation_CountryOffice]
GO
/****** Object:  ForeignKey [FK__aspnet_Us__RoleI__4AB81AF0]    Script Date: 02/04/2014 12:06:41 ******/
ALTER TABLE [dbo].[aspnet_UsersInRoles]  WITH CHECK ADD FOREIGN KEY([RoleId])
REFERENCES [dbo].[aspnet_Roles] ([RoleId])
GO
/****** Object:  ForeignKey [FK__aspnet_Us__UserI__49C3F6B7]    Script Date: 02/04/2014 12:06:41 ******/
ALTER TABLE [dbo].[aspnet_UsersInRoles]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
/****** Object:  ForeignKey [FK_Employee_aspnet_Users]    Script Date: 02/04/2014 12:06:41 ******/
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_aspnet_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_aspnet_Users]
GO
/****** Object:  ForeignKey [FK_Employee_CountryOffice]    Script Date: 02/04/2014 12:06:41 ******/
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_CountryOffice] FOREIGN KEY([CountryID])
REFERENCES [dbo].[CountryOffice] ([CountryOfficeID])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_CountryOffice]
GO
/****** Object:  ForeignKey [FK_Employee_Department]    Script Date: 02/04/2014 12:06:41 ******/
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Department] FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[Department] ([DepartmentID])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Department]
GO
/****** Object:  ForeignKey [FK_Employee_EmployeeLocation]    Script Date: 02/04/2014 12:06:41 ******/
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_EmployeeLocation] FOREIGN KEY([OfficeLocationID])
REFERENCES [dbo].[EmployeeLocation] ([LocationID])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_EmployeeLocation]
GO
/****** Object:  ForeignKey [FK_Employee_JobType]    Script Date: 02/04/2014 12:06:41 ******/
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_JobType] FOREIGN KEY([JobID])
REFERENCES [dbo].[JobType] ([JobTypeID])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_JobType]
GO
/****** Object:  ForeignKey [FK_EmployeeProjects_EmployeeProjects1]    Script Date: 02/04/2014 12:06:42 ******/
ALTER TABLE [dbo].[EmployeeProjects]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeProjects_EmployeeProjects1] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employee] ([EmployeeID])
GO
ALTER TABLE [dbo].[EmployeeProjects] CHECK CONSTRAINT [FK_EmployeeProjects_EmployeeProjects1]
GO
/****** Object:  ForeignKey [FK_Weekend_Employee]    Script Date: 02/04/2014 12:06:42 ******/
ALTER TABLE [dbo].[Weekend]  WITH CHECK ADD  CONSTRAINT [FK_Weekend_Employee] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employee] ([EmployeeID])
GO
ALTER TABLE [dbo].[Weekend] CHECK CONSTRAINT [FK_Weekend_Employee]
GO
/****** Object:  ForeignKey [FK_TimeSheetMaster_Employee]    Script Date: 02/04/2014 12:06:42 ******/
ALTER TABLE [dbo].[TimeSheetMaster]  WITH CHECK ADD  CONSTRAINT [FK_TimeSheetMaster_Employee] FOREIGN KEY([EmpID])
REFERENCES [dbo].[Employee] ([EmployeeID])
GO
ALTER TABLE [dbo].[TimeSheetMaster] CHECK CONSTRAINT [FK_TimeSheetMaster_Employee]
GO
/****** Object:  ForeignKey [FK_EmployeeLeaves_Employee]    Script Date: 02/04/2014 12:06:42 ******/
ALTER TABLE [dbo].[EmployeeLeaves]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeLeaves_Employee] FOREIGN KEY([EmpId])
REFERENCES [dbo].[Employee] ([EmployeeID])
GO
ALTER TABLE [dbo].[EmployeeLeaves] CHECK CONSTRAINT [FK_EmployeeLeaves_Employee]
GO
/****** Object:  ForeignKey [FK_EmployeeLeaves_LeaveType]    Script Date: 02/04/2014 12:06:42 ******/
ALTER TABLE [dbo].[EmployeeLeaves]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeLeaves_LeaveType] FOREIGN KEY([LeaveTypeID])
REFERENCES [dbo].[LeaveType] ([LeaveTypeID])
GO
ALTER TABLE [dbo].[EmployeeLeaves] CHECK CONSTRAINT [FK_EmployeeLeaves_LeaveType]
GO
/****** Object:  ForeignKey [FK_EmployeeLeaveRequest_EmployeeLeaveRequest]    Script Date: 02/04/2014 12:06:42 ******/
ALTER TABLE [dbo].[EmployeeLeaveRequest]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeLeaveRequest_EmployeeLeaveRequest] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employee] ([EmployeeID])
GO
ALTER TABLE [dbo].[EmployeeLeaveRequest] CHECK CONSTRAINT [FK_EmployeeLeaveRequest_EmployeeLeaveRequest]
GO
/****** Object:  ForeignKey [FK_EmployeeLeaveRequest_LeaveType]    Script Date: 02/04/2014 12:06:42 ******/
ALTER TABLE [dbo].[EmployeeLeaveRequest]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeLeaveRequest_LeaveType] FOREIGN KEY([LeaveTypeID])
REFERENCES [dbo].[LeaveType] ([LeaveTypeID])
GO
ALTER TABLE [dbo].[EmployeeLeaveRequest] CHECK CONSTRAINT [FK_EmployeeLeaveRequest_LeaveType]
GO
/****** Object:  ForeignKey [FK_EmployeeHoildays_Employee]    Script Date: 02/04/2014 12:06:42 ******/
ALTER TABLE [dbo].[EmployeeHoildays]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeHoildays_Employee] FOREIGN KEY([EmpID])
REFERENCES [dbo].[Employee] ([EmployeeID])
GO
ALTER TABLE [dbo].[EmployeeHoildays] CHECK CONSTRAINT [FK_EmployeeHoildays_Employee]
GO
/****** Object:  ForeignKey [FK_LogTable_Employee]    Script Date: 02/04/2014 12:06:42 ******/
ALTER TABLE [dbo].[LogTable]  WITH CHECK ADD  CONSTRAINT [FK_LogTable_Employee] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employee] ([EmployeeID])
GO
ALTER TABLE [dbo].[LogTable] CHECK CONSTRAINT [FK_LogTable_Employee]
GO
/****** Object:  ForeignKey [FK_Holiday_CountryOffice]    Script Date: 02/04/2014 12:06:42 ******/
ALTER TABLE [dbo].[Holiday]  WITH CHECK ADD  CONSTRAINT [FK_Holiday_CountryOffice] FOREIGN KEY([CountryID])
REFERENCES [dbo].[CountryOffice] ([CountryOfficeID])
GO
ALTER TABLE [dbo].[Holiday] CHECK CONSTRAINT [FK_Holiday_CountryOffice]
GO
/****** Object:  ForeignKey [FK_Holiday_EmployeeLocation]    Script Date: 02/04/2014 12:06:42 ******/
ALTER TABLE [dbo].[Holiday]  WITH CHECK ADD  CONSTRAINT [FK_Holiday_EmployeeLocation] FOREIGN KEY([LocationID])
REFERENCES [dbo].[EmployeeLocation] ([LocationID])
GO
ALTER TABLE [dbo].[Holiday] CHECK CONSTRAINT [FK_Holiday_EmployeeLocation]
GO
/****** Object:  ForeignKey [FK_TimeSheet_TimeSheetMaster]    Script Date: 02/04/2014 12:06:42 ******/
ALTER TABLE [dbo].[TimeSheet]  WITH CHECK ADD  CONSTRAINT [FK_TimeSheet_TimeSheetMaster] FOREIGN KEY([TimeSheetMasterID])
REFERENCES [dbo].[TimeSheetMaster] ([TimeSheetMasterID])
GO
ALTER TABLE [dbo].[TimeSheet] CHECK CONSTRAINT [FK_TimeSheet_TimeSheetMaster]
GO
