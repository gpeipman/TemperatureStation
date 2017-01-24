/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 24.01.2017 2:07:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF)
)

GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 24.01.2017 2:07:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF)
)

GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 24.01.2017 2:07:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF)
)

GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 24.01.2017 2:07:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](450) NOT NULL,
	[ProviderKey] [nvarchar](450) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF)
)

GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 24.01.2017 2:07:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF)
)

GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 24.01.2017 2:07:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[UserName] [nvarchar](256) NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF)
)

GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 24.01.2017 2:07:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF)
)

GO
INSERT [dbo].[AspNetRoles] ([Id], [ConcurrencyStamp], [Name], [NormalizedName]) VALUES (N'Administrator', NULL, N'Administrator', N'Administrator')
GO
INSERT [dbo].[AspNetRoles] ([Id], [ConcurrencyStamp], [Name], [NormalizedName]) VALUES (N'PowerUser', NULL, N'PowerUser', N'PowerUser')
GO

/****** Object:  Table [dbo].[Calculators]    Script Date: 24.01.2017 2:07:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Calculators](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MeasurementId] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Parameters] [nvarchar](max) NULL,
 CONSTRAINT [PK_Calculator] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF)
)

GO
/****** Object:  Table [dbo].[CalculatorSensorInput]    Script Date: 24.01.2017 2:07:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CalculatorSensorInput](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CalculatorId] [int] NOT NULL,
	[SensorRoleId] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_CalculatorSensorInput] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF)
)

GO
/****** Object:  Table [dbo].[Measurements]    Script Date: 24.01.2017 2:07:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Measurements](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[FreezingPoint] [float] NULL,
	[CoolingRate] [float] NULL,
	[OriginalGravity] [float] NULL,
	[FinalGravity] [float] NULL,
	[AlcoholByVolume] [float] NULL,
	[AlcoholByWeight] [float] NULL,
 CONSTRAINT [PK_Measurements] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF)
)

GO
/****** Object:  Table [dbo].[Readings]    Script Date: 24.01.2017 2:07:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Readings](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ReadingType] [nvarchar](50) NOT NULL,
	[ReadingTime] [datetime] NOT NULL,
	[Value] [float] NOT NULL,
	[MeasurementId] [int] NOT NULL,
	[SensorRoleId] [int] NULL,
	[CalculatorId] [int] NULL,
 CONSTRAINT [PK_Readings] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF)
)

GO
/****** Object:  Table [dbo].[SensorRoles]    Script Date: 24.01.2017 2:07:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SensorRoles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MeasurementId] [int] NOT NULL,
	[RoleName] [nvarchar](max) NOT NULL,
	[SensorId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_SensorRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF)
)

GO
/****** Object:  Table [dbo].[Sensors]    Script Date: 24.01.2017 2:07:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sensors](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Sensors] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF)
)

GO
SET IDENTITY_INSERT [dbo].[Calculators] ON 

GO
INSERT [dbo].[Calculators] ([Id], [MeasurementId], [Name], [Parameters]) VALUES (1, 1, N'Alcohol volume calculator', NULL)
GO
INSERT [dbo].[Calculators] ([Id], [MeasurementId], [Name], [Parameters]) VALUES (2, 1, N'Freezing estimate calculator', N'Ambient;Beer')
GO
INSERT [dbo].[Calculators] ([Id], [MeasurementId], [Name], [Parameters]) VALUES (3, 1, N'Heat Exchange Rate', N'Ambient;Beer')
GO
SET IDENTITY_INSERT [dbo].[Calculators] OFF
GO
SET IDENTITY_INSERT [dbo].[Measurements] ON 

GO
INSERT [dbo].[Measurements] ([Id], [IsActive], [Name], [FreezingPoint], [CoolingRate], [OriginalGravity], [FinalGravity], [AlcoholByVolume], [AlcoholByWeight]) VALUES (1, 0, N'Christmas ale #9 freezing', -1, 0.00176982232369483, 1.078, 1.024, 7, 5.5)
GO
INSERT [dbo].[Measurements] ([Id], [IsActive], [Name], [FreezingPoint], [CoolingRate], [OriginalGravity], [FinalGravity], [AlcoholByVolume], [AlcoholByWeight]) VALUES (2, 0, N'Weizenbock #3 mashing', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Measurements] ([Id], [IsActive], [Name], [FreezingPoint], [CoolingRate], [OriginalGravity], [FinalGravity], [AlcoholByVolume], [AlcoholByWeight]) VALUES (3, 0, N'Baltic Porter #3 mashing', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Measurements] ([Id], [IsActive], [Name], [FreezingPoint], [CoolingRate], [OriginalGravity], [FinalGravity], [AlcoholByVolume], [AlcoholByWeight]) VALUES (4, 0, N'Test #1', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Measurements] ([Id], [IsActive], [Name], [FreezingPoint], [CoolingRate], [OriginalGravity], [FinalGravity], [AlcoholByVolume], [AlcoholByWeight]) VALUES (5, 0, N'Test #2', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Measurements] ([Id], [IsActive], [Name], [FreezingPoint], [CoolingRate], [OriginalGravity], [FinalGravity], [AlcoholByVolume], [AlcoholByWeight]) VALUES (6, 0, N'Test #3', NULL, NULL, NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Measurements] OFF
GO
SET IDENTITY_INSERT [dbo].[Readings] ON 

GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (67, N'SE', CAST(N'2017-01-05T07:44:30.577' AS DateTime), -8.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (68, N'SE', CAST(N'2017-01-05T07:44:30.577' AS DateTime), 19.875, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (69, N'CA', CAST(N'2017-01-05T07:44:30.577' AS DateTime), -1, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (70, N'SE', CAST(N'2017-01-05T07:49:30.593' AS DateTime), -9, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (71, N'SE', CAST(N'2017-01-05T07:49:30.593' AS DateTime), 19.625, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (72, N'CA', CAST(N'2017-01-05T07:49:30.593' AS DateTime), -1, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (73, N'SE', CAST(N'2017-01-05T07:54:30.607' AS DateTime), -9, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (74, N'SE', CAST(N'2017-01-05T07:54:30.607' AS DateTime), 19.3125, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (75, N'CA', CAST(N'2017-01-05T07:54:30.607' AS DateTime), 715, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (76, N'SE', CAST(N'2017-01-05T07:59:30.613' AS DateTime), -9, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (77, N'SE', CAST(N'2017-01-05T07:59:30.613' AS DateTime), 19.0625, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (78, N'CA', CAST(N'2017-01-05T07:59:30.613' AS DateTime), 710, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (79, N'SE', CAST(N'2017-01-05T08:04:30.630' AS DateTime), -9, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (80, N'SE', CAST(N'2017-01-05T08:04:30.630' AS DateTime), 18.8125, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (81, N'CA', CAST(N'2017-01-05T08:04:30.630' AS DateTime), 705, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (82, N'SE', CAST(N'2017-01-05T08:09:30.633' AS DateTime), -9, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (83, N'SE', CAST(N'2017-01-05T08:09:30.633' AS DateTime), 18.5, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (84, N'CA', CAST(N'2017-01-05T08:09:30.633' AS DateTime), 698, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (85, N'SE', CAST(N'2017-01-05T08:14:30.647' AS DateTime), -9, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (86, N'SE', CAST(N'2017-01-05T08:14:30.647' AS DateTime), 18.1875, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (87, N'CA', CAST(N'2017-01-05T08:14:30.647' AS DateTime), 692, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (88, N'SE', CAST(N'2017-01-05T08:19:30.667' AS DateTime), -9, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (89, N'SE', CAST(N'2017-01-05T08:19:30.667' AS DateTime), 17.875, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (90, N'CA', CAST(N'2017-01-05T08:19:30.667' AS DateTime), 685, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (91, N'SE', CAST(N'2017-01-05T08:24:30.683' AS DateTime), -9, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (92, N'SE', CAST(N'2017-01-05T08:24:30.683' AS DateTime), 17.625, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (93, N'CA', CAST(N'2017-01-05T08:24:30.683' AS DateTime), 680, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (94, N'SE', CAST(N'2017-01-05T08:29:30.700' AS DateTime), -9.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (95, N'SE', CAST(N'2017-01-05T08:29:30.700' AS DateTime), 17.3125, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (96, N'CA', CAST(N'2017-01-05T08:29:30.700' AS DateTime), 650, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (97, N'SE', CAST(N'2017-01-05T08:34:30.717' AS DateTime), -9, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (98, N'SE', CAST(N'2017-01-05T08:34:30.717' AS DateTime), 17.0625, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (99, N'CA', CAST(N'2017-01-05T08:34:30.717' AS DateTime), 668, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (100, N'SE', CAST(N'2017-01-05T08:39:30.717' AS DateTime), -9, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (101, N'SE', CAST(N'2017-01-05T08:39:30.717' AS DateTime), 16.8125, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (102, N'CA', CAST(N'2017-01-05T08:39:30.717' AS DateTime), 662, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (103, N'SE', CAST(N'2017-01-05T08:44:30.717' AS DateTime), -9.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (104, N'SE', CAST(N'2017-01-05T08:44:30.717' AS DateTime), 16.5625, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (105, N'CA', CAST(N'2017-01-05T08:44:30.717' AS DateTime), 634, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (106, N'SE', CAST(N'2017-01-05T08:49:30.733' AS DateTime), -9, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (107, N'SE', CAST(N'2017-01-05T08:49:30.733' AS DateTime), 16.25, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (108, N'CA', CAST(N'2017-01-05T08:49:30.733' AS DateTime), 650, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (109, N'SE', CAST(N'2017-01-05T09:20:57.300' AS DateTime), -9.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (110, N'SE', CAST(N'2017-01-05T09:20:57.300' AS DateTime), 16, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (111, N'CA', CAST(N'2017-01-05T09:20:57.300' AS DateTime), 621, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (112, N'SE', CAST(N'2017-01-05T09:25:57.317' AS DateTime), -9, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (113, N'SE', CAST(N'2017-01-05T09:25:57.317' AS DateTime), 15.75, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (114, N'CA', CAST(N'2017-01-05T09:25:57.317' AS DateTime), 639, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (115, N'SE', CAST(N'2017-01-05T09:30:57.333' AS DateTime), -9, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (116, N'SE', CAST(N'2017-01-05T09:30:57.333' AS DateTime), 15.5, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (117, N'CA', CAST(N'2017-01-05T09:30:57.333' AS DateTime), 633, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (118, N'SE', CAST(N'2017-01-05T09:36:43.167' AS DateTime), -9, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (119, N'SE', CAST(N'2017-01-05T09:36:43.167' AS DateTime), 15.25, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (120, N'CA', CAST(N'2017-01-05T09:36:43.167' AS DateTime), 627, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (121, N'SE', CAST(N'2017-01-05T09:41:43.167' AS DateTime), -9.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (122, N'SE', CAST(N'2017-01-05T09:41:43.167' AS DateTime), 15, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (123, N'CA', CAST(N'2017-01-05T09:41:43.167' AS DateTime), 599, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (124, N'SE', CAST(N'2017-01-05T09:46:43.167' AS DateTime), -9, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (125, N'SE', CAST(N'2017-01-05T09:46:43.167' AS DateTime), 14.75, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (126, N'CA', CAST(N'2017-01-05T09:46:43.167' AS DateTime), 615, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (127, N'SE', CAST(N'2017-01-05T09:51:43.177' AS DateTime), -9, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (128, N'SE', CAST(N'2017-01-05T09:51:43.177' AS DateTime), 14.5625, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (129, N'CA', CAST(N'2017-01-05T09:51:43.177' AS DateTime), 611, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (130, N'SE', CAST(N'2017-01-05T09:56:43.193' AS DateTime), -9, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (131, N'SE', CAST(N'2017-01-05T09:56:43.193' AS DateTime), 14.3125, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (132, N'CA', CAST(N'2017-01-05T09:56:43.193' AS DateTime), 605, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (133, N'SE', CAST(N'2017-01-05T10:01:43.197' AS DateTime), -9.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (134, N'SE', CAST(N'2017-01-05T10:01:43.197' AS DateTime), 14.0625, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (135, N'CA', CAST(N'2017-01-05T10:01:43.197' AS DateTime), 577, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (136, N'SE', CAST(N'2017-01-05T10:06:43.200' AS DateTime), -9.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (137, N'SE', CAST(N'2017-01-05T10:06:43.200' AS DateTime), 13.8125, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (138, N'CA', CAST(N'2017-01-05T10:06:43.200' AS DateTime), 571, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (139, N'SE', CAST(N'2017-01-05T10:11:43.200' AS DateTime), -9.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (140, N'SE', CAST(N'2017-01-05T10:11:43.200' AS DateTime), 13.5625, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (141, N'CA', CAST(N'2017-01-05T10:11:43.200' AS DateTime), 564, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (142, N'SE', CAST(N'2017-01-05T10:16:43.217' AS DateTime), -9, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (143, N'SE', CAST(N'2017-01-05T10:16:43.217' AS DateTime), 13.375, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (144, N'CA', CAST(N'2017-01-05T10:16:43.217' AS DateTime), 582, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (145, N'SE', CAST(N'2017-01-05T10:21:43.217' AS DateTime), -9, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (146, N'SE', CAST(N'2017-01-05T10:21:43.217' AS DateTime), 13.125, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (147, N'CA', CAST(N'2017-01-05T10:21:43.217' AS DateTime), 575, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (148, N'SE', CAST(N'2017-01-05T10:26:43.220' AS DateTime), -9, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (149, N'SE', CAST(N'2017-01-05T10:26:43.220' AS DateTime), 12.875, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (150, N'CA', CAST(N'2017-01-05T10:26:43.220' AS DateTime), 569, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (151, N'SE', CAST(N'2017-01-05T10:31:43.220' AS DateTime), -9, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (152, N'SE', CAST(N'2017-01-05T10:31:43.220' AS DateTime), 12.6875, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (153, N'CA', CAST(N'2017-01-05T10:31:43.220' AS DateTime), 564, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (154, N'SE', CAST(N'2017-01-05T10:36:43.223' AS DateTime), -9, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (155, N'SE', CAST(N'2017-01-05T10:36:43.223' AS DateTime), 12.5, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (156, N'CA', CAST(N'2017-01-05T10:36:43.223' AS DateTime), 559, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (157, N'SE', CAST(N'2017-01-05T10:41:43.240' AS DateTime), -9, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (158, N'SE', CAST(N'2017-01-05T10:41:43.240' AS DateTime), 12.25, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (159, N'CA', CAST(N'2017-01-05T10:41:43.240' AS DateTime), 552, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (160, N'SE', CAST(N'2017-01-05T10:46:43.257' AS DateTime), -9, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (161, N'SE', CAST(N'2017-01-05T10:46:43.257' AS DateTime), 12.0625, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (162, N'CA', CAST(N'2017-01-05T10:46:43.257' AS DateTime), 547, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (163, N'SE', CAST(N'2017-01-05T10:51:43.270' AS DateTime), -9, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (164, N'SE', CAST(N'2017-01-05T10:51:43.270' AS DateTime), 11.8125, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (165, N'CA', CAST(N'2017-01-05T10:51:43.270' AS DateTime), 541, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (166, N'SE', CAST(N'2017-01-05T10:56:43.287' AS DateTime), -9, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (167, N'SE', CAST(N'2017-01-05T10:56:43.287' AS DateTime), 11.625, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (168, N'CA', CAST(N'2017-01-05T10:56:43.287' AS DateTime), 536, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (169, N'SE', CAST(N'2017-01-05T11:01:43.297' AS DateTime), -9.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (170, N'SE', CAST(N'2017-01-05T11:01:43.297' AS DateTime), 11.4375, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (171, N'CA', CAST(N'2017-01-05T11:01:43.297' AS DateTime), 510, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (172, N'SE', CAST(N'2017-01-05T11:06:43.310' AS DateTime), -9, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (173, N'SE', CAST(N'2017-01-05T11:06:43.310' AS DateTime), 11.25, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (174, N'CA', CAST(N'2017-01-05T11:06:43.310' AS DateTime), 525, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (175, N'SE', CAST(N'2017-01-05T11:11:43.320' AS DateTime), -9, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (176, N'SE', CAST(N'2017-01-05T11:11:43.320' AS DateTime), 11.0625, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (177, N'CA', CAST(N'2017-01-05T11:11:43.320' AS DateTime), 520, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (178, N'SE', CAST(N'2017-01-05T11:16:43.320' AS DateTime), -9, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (179, N'SE', CAST(N'2017-01-05T11:16:43.320' AS DateTime), 10.875, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (180, N'CA', CAST(N'2017-01-05T11:16:43.320' AS DateTime), 515, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (181, N'SE', CAST(N'2017-01-05T11:21:43.323' AS DateTime), -9, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (182, N'SE', CAST(N'2017-01-05T11:21:43.323' AS DateTime), 10.6875, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (183, N'CA', CAST(N'2017-01-05T11:21:43.323' AS DateTime), 509, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (184, N'SE', CAST(N'2017-01-05T11:26:43.323' AS DateTime), -8.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (185, N'SE', CAST(N'2017-01-05T11:26:43.323' AS DateTime), 10.5, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (186, N'CA', CAST(N'2017-01-05T11:26:43.323' AS DateTime), 526, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (187, N'SE', CAST(N'2017-01-05T11:31:43.327' AS DateTime), -8.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (188, N'SE', CAST(N'2017-01-05T11:31:43.327' AS DateTime), 10.3125, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (189, N'CA', CAST(N'2017-01-05T11:31:43.327' AS DateTime), 520, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (190, N'SE', CAST(N'2017-01-05T11:36:43.327' AS DateTime), -8.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (191, N'SE', CAST(N'2017-01-05T11:36:43.327' AS DateTime), 10.125, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (192, N'CA', CAST(N'2017-01-05T11:36:43.327' AS DateTime), 514, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (193, N'SE', CAST(N'2017-01-05T11:41:43.340' AS DateTime), -9, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (194, N'SE', CAST(N'2017-01-05T11:41:43.340' AS DateTime), 9.9375, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (195, N'CA', CAST(N'2017-01-05T11:41:43.340' AS DateTime), 487, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (196, N'SE', CAST(N'2017-01-05T11:46:43.340' AS DateTime), -9, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (197, N'SE', CAST(N'2017-01-05T11:46:43.340' AS DateTime), 9.75, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (198, N'CA', CAST(N'2017-01-05T11:46:43.340' AS DateTime), 482, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (199, N'SE', CAST(N'2017-01-05T11:51:43.343' AS DateTime), -9, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (200, N'SE', CAST(N'2017-01-05T11:51:43.343' AS DateTime), 9.625, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (201, N'CA', CAST(N'2017-01-05T11:51:43.343' AS DateTime), 478, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (202, N'SE', CAST(N'2017-01-05T11:56:43.353' AS DateTime), -9, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (203, N'SE', CAST(N'2017-01-05T11:56:43.353' AS DateTime), 9.4375, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (204, N'CA', CAST(N'2017-01-05T11:56:43.353' AS DateTime), 472, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (205, N'SE', CAST(N'2017-01-05T12:01:43.370' AS DateTime), -9, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (206, N'SE', CAST(N'2017-01-05T12:01:43.370' AS DateTime), 9.25, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (207, N'CA', CAST(N'2017-01-05T12:01:43.370' AS DateTime), 466, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (208, N'SE', CAST(N'2017-01-05T12:06:43.370' AS DateTime), -9, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (209, N'SE', CAST(N'2017-01-05T12:06:43.370' AS DateTime), 9.0625, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (210, N'CA', CAST(N'2017-01-05T12:06:43.370' AS DateTime), 461, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (211, N'SE', CAST(N'2017-01-05T12:11:43.370' AS DateTime), -9, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (212, N'SE', CAST(N'2017-01-05T12:11:43.370' AS DateTime), 8.9375, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (213, N'CA', CAST(N'2017-01-05T12:11:43.370' AS DateTime), 457, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (214, N'SE', CAST(N'2017-01-05T12:16:43.373' AS DateTime), -9.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (215, N'SE', CAST(N'2017-01-05T12:16:43.373' AS DateTime), 8.75, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (216, N'CA', CAST(N'2017-01-05T12:16:43.373' AS DateTime), 432, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (217, N'SE', CAST(N'2017-01-05T12:21:43.383' AS DateTime), -9, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (218, N'SE', CAST(N'2017-01-05T12:21:43.383' AS DateTime), 8.5625, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (219, N'CA', CAST(N'2017-01-05T12:21:43.383' AS DateTime), 445, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (220, N'SE', CAST(N'2017-01-05T12:26:43.400' AS DateTime), -9, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (221, N'SE', CAST(N'2017-01-05T12:26:43.400' AS DateTime), 8.4375, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (222, N'CA', CAST(N'2017-01-05T12:26:43.400' AS DateTime), 441, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (223, N'SE', CAST(N'2017-01-05T12:31:43.417' AS DateTime), -9, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (224, N'SE', CAST(N'2017-01-05T12:31:43.417' AS DateTime), 8.25, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (225, N'CA', CAST(N'2017-01-05T12:31:43.417' AS DateTime), 435, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (226, N'SE', CAST(N'2017-01-05T12:36:43.417' AS DateTime), -9, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (227, N'SE', CAST(N'2017-01-05T12:36:43.417' AS DateTime), 8.125, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (228, N'CA', CAST(N'2017-01-05T12:36:43.417' AS DateTime), 431, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (229, N'SE', CAST(N'2017-01-05T12:41:43.417' AS DateTime), -9, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (230, N'SE', CAST(N'2017-01-05T12:41:43.417' AS DateTime), 7.9375, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (231, N'CA', CAST(N'2017-01-05T12:41:43.417' AS DateTime), 424, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (232, N'SE', CAST(N'2017-01-05T12:46:43.437' AS DateTime), -9, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (233, N'SE', CAST(N'2017-01-05T12:46:43.437' AS DateTime), 7.8125, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (234, N'CA', CAST(N'2017-01-05T12:46:43.437' AS DateTime), 420, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (235, N'SE', CAST(N'2017-01-05T12:51:43.437' AS DateTime), -9.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (236, N'SE', CAST(N'2017-01-05T12:51:43.437' AS DateTime), 7.625, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (237, N'CA', CAST(N'2017-01-05T12:51:43.437' AS DateTime), 396, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (238, N'SE', CAST(N'2017-01-05T12:56:43.443' AS DateTime), -9, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (239, N'SE', CAST(N'2017-01-05T12:56:43.443' AS DateTime), 7.5, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (240, N'CA', CAST(N'2017-01-05T12:56:43.443' AS DateTime), 410, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (241, N'SE', CAST(N'2017-01-05T13:01:43.447' AS DateTime), -9.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (242, N'SE', CAST(N'2017-01-05T13:01:43.447' AS DateTime), 7.375, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (243, N'CA', CAST(N'2017-01-05T13:01:43.447' AS DateTime), 388, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (244, N'SE', CAST(N'2017-01-05T13:06:43.450' AS DateTime), -9, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (245, N'SE', CAST(N'2017-01-05T13:06:43.450' AS DateTime), 7.1875, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (246, N'CA', CAST(N'2017-01-05T13:06:43.450' AS DateTime), 399, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (247, N'SE', CAST(N'2017-01-05T13:11:43.450' AS DateTime), -9.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (248, N'SE', CAST(N'2017-01-05T13:11:43.450' AS DateTime), 7.0625, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (249, N'CA', CAST(N'2017-01-05T13:11:43.450' AS DateTime), 377, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (250, N'SE', CAST(N'2017-01-05T13:16:43.453' AS DateTime), -9.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (251, N'SE', CAST(N'2017-01-05T13:16:43.453' AS DateTime), 6.9375, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (252, N'CA', CAST(N'2017-01-05T13:16:43.453' AS DateTime), 373, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (253, N'SE', CAST(N'2017-01-05T13:21:43.453' AS DateTime), -9, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (254, N'SE', CAST(N'2017-01-05T13:21:43.453' AS DateTime), 6.75, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (255, N'CA', CAST(N'2017-01-05T13:21:43.453' AS DateTime), 383, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (256, N'SE', CAST(N'2017-01-05T13:26:43.470' AS DateTime), -9.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (257, N'SE', CAST(N'2017-01-05T13:26:43.470' AS DateTime), 6.625, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (258, N'CA', CAST(N'2017-01-05T13:26:43.470' AS DateTime), 362, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (259, N'SE', CAST(N'2017-01-05T13:31:43.470' AS DateTime), -9.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (260, N'SE', CAST(N'2017-01-05T13:31:43.470' AS DateTime), 6.5, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (261, N'CA', CAST(N'2017-01-05T13:31:43.470' AS DateTime), 358, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (262, N'SE', CAST(N'2017-01-05T13:36:43.487' AS DateTime), -9.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (263, N'SE', CAST(N'2017-01-05T13:36:43.487' AS DateTime), 6.3125, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (264, N'CA', CAST(N'2017-01-05T13:36:43.487' AS DateTime), 351, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (265, N'SE', CAST(N'2017-01-05T13:41:43.493' AS DateTime), -9.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (266, N'SE', CAST(N'2017-01-05T13:41:43.493' AS DateTime), 6.1875, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (267, N'CA', CAST(N'2017-01-05T13:41:43.493' AS DateTime), 347, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (268, N'SE', CAST(N'2017-01-05T13:46:43.510' AS DateTime), -9.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (269, N'SE', CAST(N'2017-01-05T13:46:43.510' AS DateTime), 6.0625, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (270, N'CA', CAST(N'2017-01-05T13:46:43.510' AS DateTime), 342, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (271, N'SE', CAST(N'2017-01-05T13:51:43.507' AS DateTime), -9.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (272, N'SE', CAST(N'2017-01-05T13:51:43.507' AS DateTime), 5.9375, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (273, N'CA', CAST(N'2017-01-05T13:51:43.507' AS DateTime), 338, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (274, N'SE', CAST(N'2017-01-05T13:56:43.523' AS DateTime), -9.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (275, N'SE', CAST(N'2017-01-05T13:56:43.523' AS DateTime), 5.75, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (276, N'CA', CAST(N'2017-01-05T13:56:43.523' AS DateTime), 331, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (277, N'SE', CAST(N'2017-01-05T14:01:43.537' AS DateTime), -9.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (278, N'SE', CAST(N'2017-01-05T14:01:43.537' AS DateTime), 5.625, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (279, N'CA', CAST(N'2017-01-05T14:01:43.537' AS DateTime), 326, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (280, N'SE', CAST(N'2017-01-05T14:06:43.550' AS DateTime), -9.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (281, N'SE', CAST(N'2017-01-05T14:06:43.550' AS DateTime), 5.5, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (282, N'CA', CAST(N'2017-01-05T14:06:43.550' AS DateTime), 321, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (283, N'SE', CAST(N'2017-01-05T14:11:43.567' AS DateTime), -9.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (284, N'SE', CAST(N'2017-01-05T14:11:43.567' AS DateTime), 5.375, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (285, N'CA', CAST(N'2017-01-05T14:11:43.567' AS DateTime), 317, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (286, N'SE', CAST(N'2017-01-05T14:16:43.583' AS DateTime), -9.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (287, N'SE', CAST(N'2017-01-05T14:16:43.583' AS DateTime), 5.25, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (288, N'CA', CAST(N'2017-01-05T14:16:43.583' AS DateTime), 312, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (289, N'SE', CAST(N'2017-01-05T14:21:43.597' AS DateTime), -9.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (290, N'SE', CAST(N'2017-01-05T14:21:43.597' AS DateTime), 5.125, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (291, N'CA', CAST(N'2017-01-05T14:21:43.597' AS DateTime), 307, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (292, N'SE', CAST(N'2017-01-05T14:26:43.597' AS DateTime), -9.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (293, N'SE', CAST(N'2017-01-05T14:26:43.597' AS DateTime), 5, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (294, N'CA', CAST(N'2017-01-05T14:26:43.597' AS DateTime), 302, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (295, N'SE', CAST(N'2017-01-05T14:31:43.597' AS DateTime), -9.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (296, N'SE', CAST(N'2017-01-05T14:31:43.597' AS DateTime), 4.875, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (297, N'CA', CAST(N'2017-01-05T14:31:43.597' AS DateTime), 297, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (298, N'SE', CAST(N'2017-01-05T14:36:43.613' AS DateTime), -9, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (299, N'SE', CAST(N'2017-01-05T14:36:43.613' AS DateTime), 4.75, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (300, N'CA', CAST(N'2017-01-05T14:36:43.613' AS DateTime), 307, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (301, N'SE', CAST(N'2017-01-05T14:41:43.630' AS DateTime), -9.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (302, N'SE', CAST(N'2017-01-05T14:41:43.630' AS DateTime), 4.6875, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (303, N'CA', CAST(N'2017-01-05T14:41:43.630' AS DateTime), 290, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (304, N'SE', CAST(N'2017-01-05T14:46:43.640' AS DateTime), -9.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (305, N'SE', CAST(N'2017-01-05T14:46:43.640' AS DateTime), 4.5625, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (306, N'CA', CAST(N'2017-01-05T14:46:43.640' AS DateTime), 285, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (307, N'SE', CAST(N'2017-01-05T14:51:43.657' AS DateTime), -9.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (308, N'SE', CAST(N'2017-01-05T14:51:43.657' AS DateTime), 4.4375, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (309, N'CA', CAST(N'2017-01-05T14:51:43.657' AS DateTime), 280, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (310, N'SE', CAST(N'2017-01-05T14:56:43.670' AS DateTime), -9.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (311, N'SE', CAST(N'2017-01-05T14:56:43.670' AS DateTime), 4.3125, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (312, N'CA', CAST(N'2017-01-05T14:56:43.670' AS DateTime), 275, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (313, N'SE', CAST(N'2017-01-05T15:01:43.687' AS DateTime), -9.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (314, N'SE', CAST(N'2017-01-05T15:01:43.687' AS DateTime), 4.1875, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (315, N'CA', CAST(N'2017-01-05T15:01:43.687' AS DateTime), 270, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (316, N'SE', CAST(N'2017-01-05T15:06:43.690' AS DateTime), -9.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (317, N'SE', CAST(N'2017-01-05T15:06:43.690' AS DateTime), 4.125, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (318, N'CA', CAST(N'2017-01-05T15:06:43.690' AS DateTime), 267, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (319, N'SE', CAST(N'2017-01-05T15:11:43.707' AS DateTime), -9.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (320, N'SE', CAST(N'2017-01-05T15:11:43.707' AS DateTime), 4, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (321, N'CA', CAST(N'2017-01-05T15:11:43.707' AS DateTime), 262, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (322, N'SE', CAST(N'2017-01-05T15:16:43.707' AS DateTime), -9.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (323, N'SE', CAST(N'2017-01-05T15:16:43.707' AS DateTime), 3.875, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (324, N'CA', CAST(N'2017-01-05T15:16:43.707' AS DateTime), 257, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (325, N'SE', CAST(N'2017-01-05T15:21:43.717' AS DateTime), -9.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (326, N'SE', CAST(N'2017-01-05T15:21:43.717' AS DateTime), 3.8125, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (327, N'CA', CAST(N'2017-01-05T15:21:43.717' AS DateTime), 254, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (328, N'SE', CAST(N'2017-01-05T15:26:43.720' AS DateTime), -9.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (329, N'SE', CAST(N'2017-01-05T15:26:43.720' AS DateTime), 3.6875, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (330, N'CA', CAST(N'2017-01-05T15:26:43.720' AS DateTime), 249, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (331, N'SE', CAST(N'2017-01-05T15:31:43.723' AS DateTime), -9.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (332, N'SE', CAST(N'2017-01-05T15:31:43.723' AS DateTime), 3.5625, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (333, N'CA', CAST(N'2017-01-05T15:31:43.723' AS DateTime), 243, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (334, N'SE', CAST(N'2017-01-05T15:36:43.727' AS DateTime), -9.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (335, N'SE', CAST(N'2017-01-05T15:36:43.727' AS DateTime), 3.4375, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (336, N'CA', CAST(N'2017-01-05T15:36:43.727' AS DateTime), 238, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (337, N'SE', CAST(N'2017-01-05T15:41:43.730' AS DateTime), -9.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (338, N'SE', CAST(N'2017-01-05T15:41:43.730' AS DateTime), 3.375, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (339, N'CA', CAST(N'2017-01-05T15:41:43.730' AS DateTime), 235, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (340, N'SE', CAST(N'2017-01-05T15:46:43.730' AS DateTime), -9.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (341, N'SE', CAST(N'2017-01-05T15:46:43.730' AS DateTime), 3.25, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (342, N'CA', CAST(N'2017-01-05T15:46:43.730' AS DateTime), 230, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (343, N'SE', CAST(N'2017-01-05T15:51:43.737' AS DateTime), -9.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (344, N'SE', CAST(N'2017-01-05T15:51:43.737' AS DateTime), 3.125, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (345, N'CA', CAST(N'2017-01-05T15:51:43.737' AS DateTime), 224, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (346, N'SE', CAST(N'2017-01-05T15:56:43.760' AS DateTime), -9.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (347, N'SE', CAST(N'2017-01-05T15:56:43.760' AS DateTime), 3.0625, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (348, N'CA', CAST(N'2017-01-05T15:56:43.760' AS DateTime), 221, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (349, N'SE', CAST(N'2017-01-05T16:01:43.767' AS DateTime), -9.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (350, N'SE', CAST(N'2017-01-05T16:01:43.767' AS DateTime), 2.9375, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (351, N'CA', CAST(N'2017-01-05T16:01:43.767' AS DateTime), 216, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (352, N'SE', CAST(N'2017-01-05T16:06:43.767' AS DateTime), -9.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (353, N'SE', CAST(N'2017-01-05T16:06:43.767' AS DateTime), 2.8125, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (354, N'CA', CAST(N'2017-01-05T16:06:43.767' AS DateTime), 210, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (355, N'SE', CAST(N'2017-01-05T16:11:43.767' AS DateTime), -9.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (356, N'SE', CAST(N'2017-01-05T16:11:43.767' AS DateTime), 2.75, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (357, N'CA', CAST(N'2017-01-05T16:11:43.767' AS DateTime), 207, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (358, N'SE', CAST(N'2017-01-05T16:16:43.770' AS DateTime), -9.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (359, N'SE', CAST(N'2017-01-05T16:16:43.770' AS DateTime), 2.6875, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (360, N'CA', CAST(N'2017-01-05T16:16:43.770' AS DateTime), 204, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (361, N'SE', CAST(N'2017-01-05T16:21:43.790' AS DateTime), -9, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (362, N'SE', CAST(N'2017-01-05T16:21:43.790' AS DateTime), 2.5625, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (363, N'CA', CAST(N'2017-01-05T16:21:43.790' AS DateTime), 209, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (364, N'SE', CAST(N'2017-01-05T16:26:43.807' AS DateTime), -9.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (365, N'SE', CAST(N'2017-01-05T16:26:43.807' AS DateTime), 2.5, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (366, N'CA', CAST(N'2017-01-05T16:26:43.807' AS DateTime), 195, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (367, N'SE', CAST(N'2017-01-05T16:31:43.807' AS DateTime), -9, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (368, N'SE', CAST(N'2017-01-05T16:31:43.807' AS DateTime), 2.375, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (369, N'CA', CAST(N'2017-01-05T16:31:43.807' AS DateTime), 199, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (370, N'SE', CAST(N'2017-01-05T16:36:43.810' AS DateTime), -9.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (371, N'SE', CAST(N'2017-01-05T16:36:43.810' AS DateTime), 2.3125, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (372, N'CA', CAST(N'2017-01-05T16:36:43.810' AS DateTime), 186, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (373, N'SE', CAST(N'2017-01-05T16:41:43.817' AS DateTime), -9.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (374, N'SE', CAST(N'2017-01-05T16:41:43.817' AS DateTime), 2.1875, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (375, N'CA', CAST(N'2017-01-05T16:41:43.817' AS DateTime), 180, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (376, N'SE', CAST(N'2017-01-05T16:46:43.837' AS DateTime), -9.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (377, N'SE', CAST(N'2017-01-05T16:46:43.837' AS DateTime), 2.125, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (378, N'CA', CAST(N'2017-01-05T16:46:43.837' AS DateTime), 177, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (379, N'SE', CAST(N'2017-01-05T16:51:43.840' AS DateTime), -9, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (380, N'SE', CAST(N'2017-01-05T16:51:43.840' AS DateTime), 2.0625, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (381, N'CA', CAST(N'2017-01-05T16:51:43.840' AS DateTime), 184, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (382, N'SE', CAST(N'2017-01-05T16:56:43.857' AS DateTime), -9.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (383, N'SE', CAST(N'2017-01-05T16:56:43.857' AS DateTime), 2, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (384, N'CA', CAST(N'2017-01-05T16:56:43.857' AS DateTime), 171, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (385, N'SE', CAST(N'2017-01-05T17:01:43.857' AS DateTime), -9.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (386, N'SE', CAST(N'2017-01-05T17:01:43.857' AS DateTime), 1.875, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (387, N'CA', CAST(N'2017-01-05T17:01:43.857' AS DateTime), 165, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (388, N'SE', CAST(N'2017-01-05T17:06:43.860' AS DateTime), -9, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (389, N'SE', CAST(N'2017-01-05T17:06:43.860' AS DateTime), 1.8125, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (390, N'CA', CAST(N'2017-01-05T17:06:43.860' AS DateTime), 171, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (391, N'SE', CAST(N'2017-01-05T17:11:43.860' AS DateTime), -9.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (392, N'SE', CAST(N'2017-01-05T17:11:43.860' AS DateTime), 1.75, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (393, N'CA', CAST(N'2017-01-05T17:11:43.860' AS DateTime), 159, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (394, N'SE', CAST(N'2017-01-05T17:16:43.863' AS DateTime), -9.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (395, N'SE', CAST(N'2017-01-05T17:16:43.863' AS DateTime), 1.625, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (396, N'CA', CAST(N'2017-01-05T17:16:43.863' AS DateTime), 153, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (397, N'SE', CAST(N'2017-01-05T17:21:43.880' AS DateTime), -9.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (398, N'SE', CAST(N'2017-01-05T17:21:43.880' AS DateTime), 1.5625, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (399, N'CA', CAST(N'2017-01-05T17:21:43.880' AS DateTime), 149, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (400, N'SE', CAST(N'2017-01-05T17:26:43.897' AS DateTime), -9, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (401, N'SE', CAST(N'2017-01-05T17:26:43.897' AS DateTime), 1.5, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (402, N'CA', CAST(N'2017-01-05T17:26:43.897' AS DateTime), 154, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (403, N'SE', CAST(N'2017-01-05T17:31:43.913' AS DateTime), -9, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (404, N'SE', CAST(N'2017-01-05T17:31:43.913' AS DateTime), 1.375, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (405, N'CA', CAST(N'2017-01-05T17:31:43.913' AS DateTime), 147, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (406, N'SE', CAST(N'2017-01-05T17:36:43.927' AS DateTime), -9, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (407, N'SE', CAST(N'2017-01-05T17:36:43.927' AS DateTime), 1.3125, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (408, N'CA', CAST(N'2017-01-05T17:36:43.927' AS DateTime), 144, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (409, N'SE', CAST(N'2017-01-05T17:41:43.943' AS DateTime), -9.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (410, N'SE', CAST(N'2017-01-05T17:41:43.943' AS DateTime), 1.1875, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (411, N'CA', CAST(N'2017-01-05T17:41:43.943' AS DateTime), 130, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (412, N'SE', CAST(N'2017-01-05T17:46:43.963' AS DateTime), -9, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (413, N'SE', CAST(N'2017-01-05T17:46:43.963' AS DateTime), 1.125, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (414, N'CA', CAST(N'2017-01-05T17:46:43.963' AS DateTime), 134, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (415, N'SE', CAST(N'2017-01-05T17:51:43.973' AS DateTime), -9, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (416, N'SE', CAST(N'2017-01-05T17:51:43.973' AS DateTime), 1.0625, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (417, N'CA', CAST(N'2017-01-05T17:51:43.973' AS DateTime), 130, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (418, N'SE', CAST(N'2017-01-05T17:56:43.990' AS DateTime), -9.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (419, N'SE', CAST(N'2017-01-05T17:56:43.990' AS DateTime), 1, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (420, N'CA', CAST(N'2017-01-05T17:56:43.990' AS DateTime), 120, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (421, N'SE', CAST(N'2017-01-05T18:01:44.007' AS DateTime), -9.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (422, N'SE', CAST(N'2017-01-05T18:01:44.007' AS DateTime), 0.9375, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (423, N'CA', CAST(N'2017-01-05T18:01:44.007' AS DateTime), 117, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (424, N'SE', CAST(N'2017-01-05T18:06:44.013' AS DateTime), -9.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (425, N'SE', CAST(N'2017-01-05T18:06:44.013' AS DateTime), 0.8125, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (426, N'CA', CAST(N'2017-01-05T18:06:44.013' AS DateTime), 110, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (427, N'SE', CAST(N'2017-01-05T18:11:44.023' AS DateTime), -9, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (428, N'SE', CAST(N'2017-01-05T18:11:44.023' AS DateTime), 0.75, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (429, N'CA', CAST(N'2017-01-05T18:11:44.023' AS DateTime), 112, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (430, N'SE', CAST(N'2017-01-05T18:16:44.043' AS DateTime), -9, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (431, N'SE', CAST(N'2017-01-05T18:16:44.043' AS DateTime), 0.6875, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (432, N'CA', CAST(N'2017-01-05T18:16:44.043' AS DateTime), 109, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (433, N'SE', CAST(N'2017-01-05T18:21:44.047' AS DateTime), -9, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (434, N'SE', CAST(N'2017-01-05T18:21:44.047' AS DateTime), 0.6875, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (435, N'CA', CAST(N'2017-01-05T18:21:44.047' AS DateTime), 109, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (436, N'SE', CAST(N'2017-01-05T18:26:44.063' AS DateTime), -9.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (437, N'SE', CAST(N'2017-01-05T18:26:44.063' AS DateTime), 0.5625, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (438, N'CA', CAST(N'2017-01-05T18:26:44.063' AS DateTime), 96, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (439, N'SE', CAST(N'2017-01-05T18:31:44.070' AS DateTime), -9, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (440, N'SE', CAST(N'2017-01-05T18:31:44.070' AS DateTime), 0.5, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (441, N'CA', CAST(N'2017-01-05T18:31:44.070' AS DateTime), 98, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (442, N'SE', CAST(N'2017-01-05T18:36:44.070' AS DateTime), -9, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (443, N'SE', CAST(N'2017-01-05T18:36:44.070' AS DateTime), 0.4375, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (444, N'CA', CAST(N'2017-01-05T18:36:44.070' AS DateTime), 94, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (445, N'SE', CAST(N'2017-01-05T18:41:44.080' AS DateTime), -10, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (446, N'SE', CAST(N'2017-01-05T18:41:44.080' AS DateTime), 0.375, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (447, N'CA', CAST(N'2017-01-05T18:41:44.080' AS DateTime), 81, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (448, N'SE', CAST(N'2017-01-05T18:46:44.097' AS DateTime), -9.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (449, N'SE', CAST(N'2017-01-05T18:46:44.097' AS DateTime), 0.3125, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (450, N'CA', CAST(N'2017-01-05T18:46:44.097' AS DateTime), 82, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (451, N'SE', CAST(N'2017-01-05T18:51:44.097' AS DateTime), -9.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (452, N'SE', CAST(N'2017-01-05T18:51:44.097' AS DateTime), 0.25, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (453, N'CA', CAST(N'2017-01-05T18:51:44.097' AS DateTime), 78, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (454, N'SE', CAST(N'2017-01-05T18:56:44.097' AS DateTime), -9.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (455, N'SE', CAST(N'2017-01-05T18:56:44.097' AS DateTime), 0.1875, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (456, N'CA', CAST(N'2017-01-05T18:56:44.097' AS DateTime), 74, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (457, N'SE', CAST(N'2017-01-05T19:01:44.117' AS DateTime), -9.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (458, N'SE', CAST(N'2017-01-05T19:01:44.117' AS DateTime), 0.125, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (459, N'CA', CAST(N'2017-01-05T19:01:44.117' AS DateTime), 71, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (460, N'SE', CAST(N'2017-01-05T19:06:44.117' AS DateTime), -9.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (461, N'SE', CAST(N'2017-01-05T19:06:44.117' AS DateTime), 0.0625, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (462, N'CA', CAST(N'2017-01-05T19:06:44.117' AS DateTime), 67, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (463, N'SE', CAST(N'2017-01-05T19:11:44.133' AS DateTime), -9.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (464, N'SE', CAST(N'2017-01-05T19:11:44.133' AS DateTime), 0, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (465, N'CA', CAST(N'2017-01-05T19:11:44.133' AS DateTime), 63, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (466, N'SE', CAST(N'2017-01-05T19:16:44.150' AS DateTime), -9.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (467, N'SE', CAST(N'2017-01-05T19:16:44.150' AS DateTime), -0.0625, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (468, N'CA', CAST(N'2017-01-05T19:16:44.150' AS DateTime), 60, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (469, N'SE', CAST(N'2017-01-05T19:21:44.153' AS DateTime), -9, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (470, N'SE', CAST(N'2017-01-05T19:21:44.153' AS DateTime), -0.125, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (471, N'CA', CAST(N'2017-01-05T19:21:44.153' AS DateTime), 59, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (472, N'SE', CAST(N'2017-01-05T19:26:44.163' AS DateTime), -9.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (473, N'SE', CAST(N'2017-01-05T19:26:44.163' AS DateTime), -0.1875, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (474, N'CA', CAST(N'2017-01-05T19:26:44.163' AS DateTime), 52, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (475, N'SE', CAST(N'2017-01-05T19:31:44.177' AS DateTime), -9, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (476, N'SE', CAST(N'2017-01-05T19:31:44.177' AS DateTime), -0.25, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (477, N'CA', CAST(N'2017-01-05T19:31:44.177' AS DateTime), 51, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (478, N'SE', CAST(N'2017-01-05T19:36:44.190' AS DateTime), -9.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (479, N'SE', CAST(N'2017-01-05T19:36:44.190' AS DateTime), -0.3125, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (480, N'CA', CAST(N'2017-01-05T19:36:44.190' AS DateTime), 44, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (481, N'SE', CAST(N'2017-01-05T19:41:44.200' AS DateTime), -9, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (482, N'SE', CAST(N'2017-01-05T19:41:44.200' AS DateTime), -0.375, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (483, N'CA', CAST(N'2017-01-05T19:41:44.200' AS DateTime), 43, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (484, N'SE', CAST(N'2017-01-05T19:46:44.210' AS DateTime), -9.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (485, N'SE', CAST(N'2017-01-05T19:46:44.210' AS DateTime), -0.4375, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (486, N'CA', CAST(N'2017-01-05T19:46:44.210' AS DateTime), 37, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (487, N'SE', CAST(N'2017-01-05T19:51:44.227' AS DateTime), -9.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (488, N'SE', CAST(N'2017-01-05T19:51:44.227' AS DateTime), -0.5, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (489, N'CA', CAST(N'2017-01-05T19:51:44.227' AS DateTime), 33, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (490, N'SE', CAST(N'2017-01-05T19:56:44.243' AS DateTime), -9, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (491, N'SE', CAST(N'2017-01-05T19:56:44.243' AS DateTime), -0.5625, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (492, N'CA', CAST(N'2017-01-05T19:56:44.243' AS DateTime), 31, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (493, N'SE', CAST(N'2017-01-05T20:01:44.247' AS DateTime), -9, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (494, N'SE', CAST(N'2017-01-05T20:01:44.247' AS DateTime), -0.625, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (495, N'CA', CAST(N'2017-01-05T20:01:44.247' AS DateTime), 26, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (496, N'SE', CAST(N'2017-01-05T20:06:44.247' AS DateTime), -9, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (497, N'SE', CAST(N'2017-01-05T20:06:44.247' AS DateTime), -0.6875, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (498, N'CA', CAST(N'2017-01-05T20:06:44.247' AS DateTime), 22, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (499, N'SE', CAST(N'2017-01-05T20:11:44.250' AS DateTime), -9.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (500, N'SE', CAST(N'2017-01-05T20:11:44.250' AS DateTime), -0.75, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (501, N'CA', CAST(N'2017-01-05T20:11:44.250' AS DateTime), 17, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (502, N'SE', CAST(N'2017-01-05T20:16:44.253' AS DateTime), -9.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (503, N'SE', CAST(N'2017-01-05T20:16:44.253' AS DateTime), -0.8125, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (504, N'CA', CAST(N'2017-01-05T20:16:44.253' AS DateTime), 13, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (505, N'SE', CAST(N'2017-01-05T20:21:44.267' AS DateTime), -9.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (506, N'SE', CAST(N'2017-01-05T20:21:44.267' AS DateTime), -0.8125, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (507, N'CA', CAST(N'2017-01-05T20:21:44.267' AS DateTime), 13, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (508, N'SE', CAST(N'2017-01-05T20:26:44.283' AS DateTime), -9.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (509, N'SE', CAST(N'2017-01-05T20:26:44.283' AS DateTime), -0.875, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (510, N'CA', CAST(N'2017-01-05T20:26:44.283' AS DateTime), 9, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (511, N'SE', CAST(N'2017-01-05T20:31:44.287' AS DateTime), -9.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (512, N'SE', CAST(N'2017-01-05T20:31:44.287' AS DateTime), -0.9375, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (513, N'CA', CAST(N'2017-01-05T20:31:44.287' AS DateTime), 5, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (514, N'SE', CAST(N'2017-01-05T20:36:44.300' AS DateTime), -9.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (515, N'SE', CAST(N'2017-01-05T20:36:44.300' AS DateTime), -1, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (516, N'CA', CAST(N'2017-01-05T20:36:44.300' AS DateTime), 0, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (517, N'SE', CAST(N'2017-01-05T20:41:44.317' AS DateTime), -9.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (518, N'SE', CAST(N'2017-01-05T20:41:44.317' AS DateTime), -1.125, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (519, N'CA', CAST(N'2017-01-05T20:41:44.317' AS DateTime), -8, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (520, N'SE', CAST(N'2017-01-05T20:46:44.337' AS DateTime), -9.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (521, N'SE', CAST(N'2017-01-05T20:46:44.337' AS DateTime), -1.1875, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (522, N'CA', CAST(N'2017-01-05T20:46:44.337' AS DateTime), -12, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (523, N'SE', CAST(N'2017-01-05T20:51:44.340' AS DateTime), -9.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (524, N'SE', CAST(N'2017-01-05T20:51:44.340' AS DateTime), -1.25, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (525, N'CA', CAST(N'2017-01-05T20:51:44.340' AS DateTime), -16, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (526, N'SE', CAST(N'2017-01-05T20:56:44.343' AS DateTime), -9.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (527, N'SE', CAST(N'2017-01-05T20:56:44.343' AS DateTime), -1.3125, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (528, N'CA', CAST(N'2017-01-05T20:56:44.343' AS DateTime), -21, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (529, N'SE', CAST(N'2017-01-05T21:01:44.343' AS DateTime), -9, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (530, N'SE', CAST(N'2017-01-05T21:01:44.343' AS DateTime), -1.375, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (531, N'CA', CAST(N'2017-01-05T21:01:44.343' AS DateTime), -27, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (532, N'SE', CAST(N'2017-01-05T21:06:44.360' AS DateTime), -9, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (533, N'SE', CAST(N'2017-01-05T21:06:44.360' AS DateTime), -1.375, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (534, N'CA', CAST(N'2017-01-05T21:06:44.360' AS DateTime), -27, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (535, N'SE', CAST(N'2017-01-05T21:11:44.370' AS DateTime), -9.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (536, N'SE', CAST(N'2017-01-05T21:11:44.370' AS DateTime), -1.375, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (537, N'CA', CAST(N'2017-01-05T21:11:44.370' AS DateTime), -25, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (538, N'SE', CAST(N'2017-01-05T21:16:44.370' AS DateTime), -9, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (539, N'SE', CAST(N'2017-01-05T21:16:44.370' AS DateTime), -1.4375, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (540, N'CA', CAST(N'2017-01-05T21:16:44.370' AS DateTime), -31, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (541, N'SE', CAST(N'2017-01-05T21:21:44.387' AS DateTime), -9.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (542, N'SE', CAST(N'2017-01-05T21:21:44.387' AS DateTime), -1.4375, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (543, N'CA', CAST(N'2017-01-05T21:21:44.387' AS DateTime), -29, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (544, N'SE', CAST(N'2017-01-05T21:26:44.387' AS DateTime), -9.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (545, N'SE', CAST(N'2017-01-05T21:26:44.387' AS DateTime), -1.4375, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (546, N'CA', CAST(N'2017-01-05T21:26:44.387' AS DateTime), -29, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (547, N'SE', CAST(N'2017-01-05T21:31:44.390' AS DateTime), -9.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (548, N'SE', CAST(N'2017-01-05T21:31:44.390' AS DateTime), -1.5, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (549, N'CA', CAST(N'2017-01-05T21:31:44.390' AS DateTime), -34, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (550, N'SE', CAST(N'2017-01-05T21:36:44.410' AS DateTime), -9.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (551, N'SE', CAST(N'2017-01-05T21:36:44.410' AS DateTime), -1.5, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (552, N'CA', CAST(N'2017-01-05T21:36:44.410' AS DateTime), -34, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (553, N'SE', CAST(N'2017-01-05T21:41:44.410' AS DateTime), -9, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (554, N'SE', CAST(N'2017-01-05T21:41:44.410' AS DateTime), -1.6875, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (555, N'CA', CAST(N'2017-01-05T21:41:44.410' AS DateTime), -50, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (556, N'SE', CAST(N'2017-01-05T21:46:44.417' AS DateTime), -9, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (557, N'SE', CAST(N'2017-01-05T21:46:44.417' AS DateTime), -1.75, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (558, N'CA', CAST(N'2017-01-05T21:46:44.417' AS DateTime), -55, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (559, N'SE', CAST(N'2017-01-05T21:51:44.430' AS DateTime), -9, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (560, N'SE', CAST(N'2017-01-05T21:51:44.430' AS DateTime), -1.75, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (561, N'CA', CAST(N'2017-01-05T21:51:44.430' AS DateTime), -55, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (562, N'SE', CAST(N'2017-01-05T21:56:44.447' AS DateTime), -9.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (563, N'SE', CAST(N'2017-01-05T21:56:44.447' AS DateTime), -1.8125, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (564, N'CA', CAST(N'2017-01-05T21:56:44.447' AS DateTime), -56, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (565, N'SE', CAST(N'2017-01-05T22:01:44.460' AS DateTime), -9.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (566, N'SE', CAST(N'2017-01-05T22:01:44.460' AS DateTime), -1.8125, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (567, N'CA', CAST(N'2017-01-05T22:01:44.460' AS DateTime), -56, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (568, N'SE', CAST(N'2017-01-05T22:06:44.477' AS DateTime), -9.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (569, N'SE', CAST(N'2017-01-05T22:06:44.477' AS DateTime), -1.875, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (570, N'CA', CAST(N'2017-01-05T22:06:44.477' AS DateTime), -61, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (571, N'SE', CAST(N'2017-01-05T22:11:44.480' AS DateTime), -9, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (572, N'SE', CAST(N'2017-01-05T22:11:44.480' AS DateTime), -1.9375, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (573, N'CA', CAST(N'2017-01-05T22:11:44.480' AS DateTime), -70, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (574, N'SE', CAST(N'2017-01-05T22:16:44.483' AS DateTime), -9, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (575, N'SE', CAST(N'2017-01-05T22:16:44.483' AS DateTime), -1.9375, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (576, N'CA', CAST(N'2017-01-05T22:16:44.483' AS DateTime), -70, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (577, N'SE', CAST(N'2017-01-05T22:21:44.507' AS DateTime), -9, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (578, N'SE', CAST(N'2017-01-05T22:21:44.507' AS DateTime), -1.9375, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (579, N'CA', CAST(N'2017-01-05T22:21:44.507' AS DateTime), -70, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (580, N'SE', CAST(N'2017-01-05T22:26:44.527' AS DateTime), -8.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (581, N'SE', CAST(N'2017-01-05T22:26:44.527' AS DateTime), -2.9375, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (582, N'CA', CAST(N'2017-01-05T22:26:44.527' AS DateTime), -168, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (583, N'SE', CAST(N'2017-01-05T22:31:44.540' AS DateTime), -8, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (584, N'SE', CAST(N'2017-01-05T22:31:44.540' AS DateTime), -2.625, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (585, N'CA', CAST(N'2017-01-05T22:31:44.540' AS DateTime), -149, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (586, N'SE', CAST(N'2017-01-05T22:36:44.557' AS DateTime), -9, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (587, N'SE', CAST(N'2017-01-05T22:36:44.557' AS DateTime), -2.625, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (588, N'CA', CAST(N'2017-01-05T22:36:44.557' AS DateTime), -128, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (589, N'SE', CAST(N'2017-01-05T22:41:44.560' AS DateTime), -9, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (590, N'SE', CAST(N'2017-01-05T22:41:44.560' AS DateTime), -2.625, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (591, N'CA', CAST(N'2017-01-05T22:41:44.560' AS DateTime), -128, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (592, N'SE', CAST(N'2017-01-05T22:46:44.560' AS DateTime), -9, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (593, N'SE', CAST(N'2017-01-05T22:46:44.560' AS DateTime), -2.625, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (594, N'CA', CAST(N'2017-01-05T22:46:44.560' AS DateTime), -128, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (595, N'SE', CAST(N'2017-01-05T22:51:44.580' AS DateTime), -9, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (596, N'SE', CAST(N'2017-01-05T22:51:44.580' AS DateTime), -2.625, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (597, N'CA', CAST(N'2017-01-05T22:51:44.580' AS DateTime), -128, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (598, N'SE', CAST(N'2017-01-05T22:56:44.580' AS DateTime), -9, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (599, N'SE', CAST(N'2017-01-05T22:56:44.580' AS DateTime), -2.5625, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (600, N'CA', CAST(N'2017-01-05T22:56:44.580' AS DateTime), -122, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (601, N'SE', CAST(N'2017-01-05T23:01:44.580' AS DateTime), -9, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (602, N'SE', CAST(N'2017-01-05T23:01:44.580' AS DateTime), -2.5625, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (603, N'CA', CAST(N'2017-01-05T23:01:44.580' AS DateTime), -122, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (604, N'SE', CAST(N'2017-01-05T23:06:44.597' AS DateTime), -9, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (605, N'SE', CAST(N'2017-01-05T23:06:44.597' AS DateTime), -2.5, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (606, N'CA', CAST(N'2017-01-05T23:06:44.597' AS DateTime), -117, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (607, N'SE', CAST(N'2017-01-05T23:11:44.597' AS DateTime), -9, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (608, N'SE', CAST(N'2017-01-05T23:11:44.597' AS DateTime), -2.5, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (609, N'CA', CAST(N'2017-01-05T23:11:44.597' AS DateTime), -117, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (610, N'SE', CAST(N'2017-01-05T23:16:44.600' AS DateTime), -9, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (611, N'SE', CAST(N'2017-01-05T23:16:44.600' AS DateTime), -2.4375, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (612, N'CA', CAST(N'2017-01-05T23:16:44.600' AS DateTime), -111, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (613, N'SE', CAST(N'2017-01-05T23:21:44.630' AS DateTime), -9, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (614, N'SE', CAST(N'2017-01-05T23:21:44.630' AS DateTime), -2.4375, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (615, N'CA', CAST(N'2017-01-05T23:21:44.630' AS DateTime), -111, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (616, N'SE', CAST(N'2017-01-05T23:26:44.630' AS DateTime), -9.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (617, N'SE', CAST(N'2017-01-05T23:26:44.630' AS DateTime), -2.4375, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (618, N'CA', CAST(N'2017-01-05T23:26:44.630' AS DateTime), -104, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (619, N'SE', CAST(N'2017-01-05T23:31:44.647' AS DateTime), -9.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (620, N'SE', CAST(N'2017-01-05T23:31:44.647' AS DateTime), -2.4375, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (621, N'CA', CAST(N'2017-01-05T23:31:44.647' AS DateTime), -104, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (622, N'SE', CAST(N'2017-01-05T23:36:44.667' AS DateTime), -9, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (623, N'SE', CAST(N'2017-01-05T23:36:44.667' AS DateTime), -2.4375, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (624, N'CA', CAST(N'2017-01-05T23:36:44.667' AS DateTime), -111, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (625, N'SE', CAST(N'2017-01-05T23:41:44.667' AS DateTime), -9, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (626, N'SE', CAST(N'2017-01-05T23:41:44.667' AS DateTime), -2.4375, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (627, N'CA', CAST(N'2017-01-05T23:41:44.667' AS DateTime), -111, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (628, N'SE', CAST(N'2017-01-05T23:46:44.667' AS DateTime), -9, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (629, N'SE', CAST(N'2017-01-05T23:46:44.667' AS DateTime), -2.4375, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (630, N'CA', CAST(N'2017-01-05T23:46:44.667' AS DateTime), -111, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (631, N'SE', CAST(N'2017-01-05T23:51:44.667' AS DateTime), -9, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (632, N'SE', CAST(N'2017-01-05T23:51:44.667' AS DateTime), -2.375, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (633, N'CA', CAST(N'2017-01-05T23:51:44.667' AS DateTime), -106, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (634, N'SE', CAST(N'2017-01-05T23:56:44.687' AS DateTime), -9, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (635, N'SE', CAST(N'2017-01-05T23:56:44.687' AS DateTime), -2.375, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (636, N'CA', CAST(N'2017-01-05T23:56:44.687' AS DateTime), -106, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (637, N'SE', CAST(N'2017-01-06T00:01:44.687' AS DateTime), -9, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (638, N'SE', CAST(N'2017-01-06T00:01:44.687' AS DateTime), -2.375, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (639, N'CA', CAST(N'2017-01-06T00:01:44.687' AS DateTime), -106, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (640, N'SE', CAST(N'2017-01-06T00:06:44.697' AS DateTime), -9, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (641, N'SE', CAST(N'2017-01-06T00:06:44.697' AS DateTime), -2.4375, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (642, N'CA', CAST(N'2017-01-06T00:06:44.697' AS DateTime), -111, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (643, N'SE', CAST(N'2017-01-06T00:11:44.700' AS DateTime), -9, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (644, N'SE', CAST(N'2017-01-06T00:11:44.700' AS DateTime), -2.4375, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (645, N'CA', CAST(N'2017-01-06T00:11:44.700' AS DateTime), -111, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (646, N'SE', CAST(N'2017-01-06T00:16:44.700' AS DateTime), -9, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (647, N'SE', CAST(N'2017-01-06T00:16:44.700' AS DateTime), -2.4375, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (648, N'CA', CAST(N'2017-01-06T00:16:44.700' AS DateTime), -111, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (649, N'SE', CAST(N'2017-01-06T00:21:44.700' AS DateTime), -9.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (650, N'SE', CAST(N'2017-01-06T00:21:44.700' AS DateTime), -2.4375, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (651, N'CA', CAST(N'2017-01-06T00:21:44.700' AS DateTime), -104, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (652, N'SE', CAST(N'2017-01-06T00:26:44.703' AS DateTime), -9, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (653, N'SE', CAST(N'2017-01-06T00:26:44.703' AS DateTime), -2.4375, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (654, N'CA', CAST(N'2017-01-06T00:26:44.703' AS DateTime), -111, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (655, N'SE', CAST(N'2017-01-06T00:31:44.707' AS DateTime), -9.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (656, N'SE', CAST(N'2017-01-06T00:31:44.707' AS DateTime), -2.5, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (657, N'CA', CAST(N'2017-01-06T00:31:44.707' AS DateTime), -109, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (658, N'SE', CAST(N'2017-01-06T00:36:44.723' AS DateTime), -9.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (659, N'SE', CAST(N'2017-01-06T00:36:44.723' AS DateTime), -2.5, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (660, N'CA', CAST(N'2017-01-06T00:36:44.723' AS DateTime), -109, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (661, N'SE', CAST(N'2017-01-06T00:41:44.740' AS DateTime), -9.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (662, N'SE', CAST(N'2017-01-06T00:41:44.740' AS DateTime), -2.5625, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (663, N'CA', CAST(N'2017-01-06T00:41:44.740' AS DateTime), -114, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (664, N'SE', CAST(N'2017-01-06T00:46:44.750' AS DateTime), -9, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (665, N'SE', CAST(N'2017-01-06T00:46:44.750' AS DateTime), -2.5625, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (666, N'CA', CAST(N'2017-01-06T00:46:44.750' AS DateTime), -122, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (667, N'SE', CAST(N'2017-01-06T00:51:44.750' AS DateTime), -9.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (668, N'SE', CAST(N'2017-01-06T00:51:44.750' AS DateTime), -2.8125, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (669, N'CA', CAST(N'2017-01-06T00:51:44.750' AS DateTime), -135, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (670, N'SE', CAST(N'2017-01-06T00:56:44.770' AS DateTime), -9, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (671, N'SE', CAST(N'2017-01-06T00:56:44.770' AS DateTime), -2.625, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (672, N'CA', CAST(N'2017-01-06T00:56:44.770' AS DateTime), -128, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (673, N'SE', CAST(N'2017-01-06T01:01:44.787' AS DateTime), -9, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (674, N'SE', CAST(N'2017-01-06T01:01:44.787' AS DateTime), -2.625, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (675, N'CA', CAST(N'2017-01-06T01:01:44.787' AS DateTime), -128, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (676, N'SE', CAST(N'2017-01-06T01:06:44.807' AS DateTime), -9, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (677, N'SE', CAST(N'2017-01-06T01:06:44.807' AS DateTime), -2.625, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (678, N'CA', CAST(N'2017-01-06T01:06:44.807' AS DateTime), -128, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (679, N'SE', CAST(N'2017-01-06T01:11:44.823' AS DateTime), -9, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (680, N'SE', CAST(N'2017-01-06T01:11:44.823' AS DateTime), -3.6875, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (681, N'CA', CAST(N'2017-01-06T01:11:44.823' AS DateTime), -231, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (682, N'SE', CAST(N'2017-01-06T01:16:47.267' AS DateTime), -9.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (683, N'SE', CAST(N'2017-01-06T01:16:47.267' AS DateTime), -3.25, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (684, N'CA', CAST(N'2017-01-06T01:16:47.267' AS DateTime), -173, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (685, N'SE', CAST(N'2017-01-06T01:21:47.693' AS DateTime), -9.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (686, N'SE', CAST(N'2017-01-06T01:21:47.693' AS DateTime), -3.375, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (687, N'CA', CAST(N'2017-01-06T01:21:47.693' AS DateTime), -185, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (688, N'SE', CAST(N'2017-01-06T01:26:47.713' AS DateTime), -9.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (689, N'SE', CAST(N'2017-01-06T01:26:47.713' AS DateTime), -3.4375, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (690, N'CA', CAST(N'2017-01-06T01:26:47.713' AS DateTime), -190, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (691, N'SE', CAST(N'2017-01-06T01:31:47.730' AS DateTime), -9.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (692, N'SE', CAST(N'2017-01-06T01:31:47.730' AS DateTime), -3.5, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (693, N'CA', CAST(N'2017-01-06T01:31:47.730' AS DateTime), -196, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (694, N'SE', CAST(N'2017-01-06T01:36:47.743' AS DateTime), -9.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (695, N'SE', CAST(N'2017-01-06T01:36:47.743' AS DateTime), -3.625, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (696, N'CA', CAST(N'2017-01-06T01:36:47.743' AS DateTime), -208, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (697, N'SE', CAST(N'2017-01-06T01:41:47.760' AS DateTime), -9.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (698, N'SE', CAST(N'2017-01-06T01:41:47.760' AS DateTime), -3.6875, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (699, N'CA', CAST(N'2017-01-06T01:41:47.760' AS DateTime), -214, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (700, N'SE', CAST(N'2017-01-06T01:46:47.763' AS DateTime), -9.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (701, N'SE', CAST(N'2017-01-06T01:46:47.763' AS DateTime), -3.75, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (702, N'CA', CAST(N'2017-01-06T01:46:47.763' AS DateTime), -220, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (703, N'SE', CAST(N'2017-01-06T01:51:47.763' AS DateTime), -9.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (704, N'SE', CAST(N'2017-01-06T01:51:47.763' AS DateTime), -3.75, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (705, N'CA', CAST(N'2017-01-06T01:51:47.763' AS DateTime), -220, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (706, N'SE', CAST(N'2017-01-06T01:56:47.767' AS DateTime), -10, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (707, N'SE', CAST(N'2017-01-06T01:56:47.767' AS DateTime), -3.8125, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (708, N'CA', CAST(N'2017-01-06T01:56:47.767' AS DateTime), -211, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (709, N'SE', CAST(N'2017-01-06T02:01:47.773' AS DateTime), -9.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (710, N'SE', CAST(N'2017-01-06T02:01:47.773' AS DateTime), -3.875, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (711, N'CA', CAST(N'2017-01-06T02:01:47.773' AS DateTime), -233, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (712, N'SE', CAST(N'2017-01-06T02:06:47.773' AS DateTime), -9.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (713, N'SE', CAST(N'2017-01-06T02:06:47.773' AS DateTime), -3.8125, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (714, N'CA', CAST(N'2017-01-06T02:06:47.773' AS DateTime), -227, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (715, N'SE', CAST(N'2017-01-06T02:11:47.790' AS DateTime), -9, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (716, N'SE', CAST(N'2017-01-06T02:11:47.790' AS DateTime), -3.875, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (717, N'CA', CAST(N'2017-01-06T02:11:47.790' AS DateTime), -251, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (718, N'SE', CAST(N'2017-01-06T02:16:47.790' AS DateTime), -9, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (719, N'SE', CAST(N'2017-01-06T02:16:47.790' AS DateTime), -3.875, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (720, N'CA', CAST(N'2017-01-06T02:16:47.790' AS DateTime), -251, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (721, N'SE', CAST(N'2017-01-06T02:21:47.797' AS DateTime), -9.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (722, N'SE', CAST(N'2017-01-06T02:21:47.797' AS DateTime), -3.875, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (723, N'CA', CAST(N'2017-01-06T02:21:47.797' AS DateTime), -233, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (724, N'SE', CAST(N'2017-01-06T02:26:47.797' AS DateTime), -9, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (725, N'SE', CAST(N'2017-01-06T02:26:47.797' AS DateTime), -3.875, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (726, N'CA', CAST(N'2017-01-06T02:26:47.797' AS DateTime), -251, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (727, N'SE', CAST(N'2017-01-06T02:31:47.807' AS DateTime), -9.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (728, N'SE', CAST(N'2017-01-06T02:31:47.807' AS DateTime), -3.9375, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (729, N'CA', CAST(N'2017-01-06T02:31:47.807' AS DateTime), -239, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (730, N'SE', CAST(N'2017-01-06T02:36:47.830' AS DateTime), -9, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (731, N'SE', CAST(N'2017-01-06T02:36:47.830' AS DateTime), -3.9375, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (732, N'CA', CAST(N'2017-01-06T02:36:47.830' AS DateTime), -258, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (733, N'SE', CAST(N'2017-01-06T02:41:47.833' AS DateTime), -9.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (734, N'SE', CAST(N'2017-01-06T02:41:47.833' AS DateTime), -3.9375, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (735, N'CA', CAST(N'2017-01-06T02:41:47.833' AS DateTime), -239, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (736, N'SE', CAST(N'2017-01-06T02:46:47.850' AS DateTime), -9, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (737, N'SE', CAST(N'2017-01-06T02:46:47.850' AS DateTime), -4, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (738, N'CA', CAST(N'2017-01-06T02:46:47.850' AS DateTime), -265, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (739, N'SE', CAST(N'2017-01-06T02:51:47.857' AS DateTime), -9, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (740, N'SE', CAST(N'2017-01-06T02:51:47.857' AS DateTime), -4, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (741, N'CA', CAST(N'2017-01-06T02:51:47.857' AS DateTime), -265, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (742, N'SE', CAST(N'2017-01-06T02:56:47.857' AS DateTime), -9, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (743, N'SE', CAST(N'2017-01-06T02:56:47.857' AS DateTime), -4.0625, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (744, N'CA', CAST(N'2017-01-06T02:56:47.857' AS DateTime), -272, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (745, N'SE', CAST(N'2017-01-06T03:01:47.857' AS DateTime), -9, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (746, N'SE', CAST(N'2017-01-06T03:01:47.857' AS DateTime), -4.125, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (747, N'CA', CAST(N'2017-01-06T03:01:47.857' AS DateTime), -279, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (748, N'SE', CAST(N'2017-01-06T03:11:47.860' AS DateTime), -9, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (749, N'SE', CAST(N'2017-01-06T03:11:47.860' AS DateTime), -4.0625, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (750, N'CA', CAST(N'2017-01-06T03:11:47.860' AS DateTime), -272, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (751, N'SE', CAST(N'2017-01-06T03:16:47.860' AS DateTime), -9, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (752, N'SE', CAST(N'2017-01-06T03:16:47.860' AS DateTime), -4.0625, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (753, N'CA', CAST(N'2017-01-06T03:16:47.860' AS DateTime), -272, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (754, N'SE', CAST(N'2017-01-06T03:21:47.860' AS DateTime), -9, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (755, N'SE', CAST(N'2017-01-06T03:21:47.860' AS DateTime), -4.0625, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (756, N'CA', CAST(N'2017-01-06T03:21:47.860' AS DateTime), -272, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (757, N'SE', CAST(N'2017-01-06T03:26:47.863' AS DateTime), -9, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (758, N'SE', CAST(N'2017-01-06T03:26:47.863' AS DateTime), -4.0625, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (759, N'CA', CAST(N'2017-01-06T03:26:47.863' AS DateTime), -272, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (760, N'SE', CAST(N'2017-01-06T03:31:47.877' AS DateTime), -9, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (761, N'SE', CAST(N'2017-01-06T03:31:47.877' AS DateTime), -4.0625, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (762, N'CA', CAST(N'2017-01-06T03:31:47.877' AS DateTime), -272, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (763, N'SE', CAST(N'2017-01-06T03:36:47.877' AS DateTime), -9.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (764, N'SE', CAST(N'2017-01-06T03:36:47.877' AS DateTime), -4.0625, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (765, N'CA', CAST(N'2017-01-06T03:36:47.877' AS DateTime), -252, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (766, N'SE', CAST(N'2017-01-06T03:41:47.897' AS DateTime), -9, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (767, N'SE', CAST(N'2017-01-06T03:41:47.897' AS DateTime), -4.0625, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (768, N'CA', CAST(N'2017-01-06T03:41:47.897' AS DateTime), -272, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (769, N'SE', CAST(N'2017-01-06T03:46:47.897' AS DateTime), -9, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (770, N'SE', CAST(N'2017-01-06T03:46:47.897' AS DateTime), -4.0625, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (771, N'CA', CAST(N'2017-01-06T03:46:47.897' AS DateTime), -272, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (772, N'SE', CAST(N'2017-01-06T03:51:47.897' AS DateTime), -9, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (773, N'SE', CAST(N'2017-01-06T03:51:47.897' AS DateTime), -4.125, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (774, N'CA', CAST(N'2017-01-06T03:51:47.897' AS DateTime), -279, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (775, N'SE', CAST(N'2017-01-06T03:56:47.917' AS DateTime), -9, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (776, N'SE', CAST(N'2017-01-06T03:56:47.917' AS DateTime), -4.125, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (777, N'CA', CAST(N'2017-01-06T03:56:47.917' AS DateTime), -279, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (778, N'SE', CAST(N'2017-01-06T04:01:47.923' AS DateTime), -9, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (779, N'SE', CAST(N'2017-01-06T04:01:47.923' AS DateTime), -4.125, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (780, N'CA', CAST(N'2017-01-06T04:01:47.923' AS DateTime), -279, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (781, N'SE', CAST(N'2017-01-06T04:06:47.927' AS DateTime), -9, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (782, N'SE', CAST(N'2017-01-06T04:06:47.927' AS DateTime), -4.125, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (783, N'CA', CAST(N'2017-01-06T04:06:47.927' AS DateTime), -279, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (784, N'SE', CAST(N'2017-01-06T04:11:47.940' AS DateTime), -9, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (785, N'SE', CAST(N'2017-01-06T04:11:47.940' AS DateTime), -4.125, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (786, N'CA', CAST(N'2017-01-06T04:11:47.940' AS DateTime), -279, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (787, N'SE', CAST(N'2017-01-06T04:16:47.943' AS DateTime), -9, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (788, N'SE', CAST(N'2017-01-06T04:16:47.943' AS DateTime), -4.125, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (789, N'CA', CAST(N'2017-01-06T04:16:47.943' AS DateTime), -279, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (790, N'SE', CAST(N'2017-01-06T04:21:47.943' AS DateTime), -9, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (791, N'SE', CAST(N'2017-01-06T04:21:47.943' AS DateTime), -4.125, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (792, N'CA', CAST(N'2017-01-06T04:21:47.943' AS DateTime), -279, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (793, N'SE', CAST(N'2017-01-06T04:26:47.947' AS DateTime), -9, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (794, N'SE', CAST(N'2017-01-06T04:26:47.947' AS DateTime), -4.125, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (795, N'CA', CAST(N'2017-01-06T04:26:47.947' AS DateTime), -279, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (796, N'SE', CAST(N'2017-01-06T04:31:47.963' AS DateTime), -9, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (797, N'SE', CAST(N'2017-01-06T04:31:47.963' AS DateTime), -4.125, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (798, N'CA', CAST(N'2017-01-06T04:31:47.963' AS DateTime), -279, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (799, N'SE', CAST(N'2017-01-06T04:36:47.967' AS DateTime), -9, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (800, N'SE', CAST(N'2017-01-06T04:36:47.967' AS DateTime), -4.125, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (801, N'CA', CAST(N'2017-01-06T04:36:47.967' AS DateTime), -279, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (802, N'SE', CAST(N'2017-01-06T04:41:47.967' AS DateTime), -9, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (803, N'SE', CAST(N'2017-01-06T04:41:47.967' AS DateTime), -4.125, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (804, N'CA', CAST(N'2017-01-06T04:41:47.967' AS DateTime), -279, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (805, N'SE', CAST(N'2017-01-06T04:46:47.980' AS DateTime), -9, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (806, N'SE', CAST(N'2017-01-06T04:46:47.980' AS DateTime), -4.125, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (807, N'CA', CAST(N'2017-01-06T04:46:47.980' AS DateTime), -279, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (808, N'SE', CAST(N'2017-01-06T04:51:47.990' AS DateTime), -9, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (809, N'SE', CAST(N'2017-01-06T04:51:47.990' AS DateTime), -4.125, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (810, N'CA', CAST(N'2017-01-06T04:51:47.990' AS DateTime), -279, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (811, N'SE', CAST(N'2017-01-06T04:56:47.990' AS DateTime), -9, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (812, N'SE', CAST(N'2017-01-06T04:56:47.990' AS DateTime), -4.125, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (813, N'CA', CAST(N'2017-01-06T04:56:47.990' AS DateTime), -279, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (814, N'SE', CAST(N'2017-01-06T05:01:47.993' AS DateTime), -9, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (815, N'SE', CAST(N'2017-01-06T05:01:47.993' AS DateTime), -4.125, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (816, N'CA', CAST(N'2017-01-06T05:01:47.993' AS DateTime), -279, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (817, N'SE', CAST(N'2017-01-06T05:06:48.007' AS DateTime), -9, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (818, N'SE', CAST(N'2017-01-06T05:06:48.007' AS DateTime), -4.125, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (819, N'CA', CAST(N'2017-01-06T05:06:48.007' AS DateTime), -279, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (820, N'SE', CAST(N'2017-01-06T05:11:48.010' AS DateTime), -9, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (821, N'SE', CAST(N'2017-01-06T05:11:48.010' AS DateTime), -4.125, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (822, N'CA', CAST(N'2017-01-06T05:11:48.010' AS DateTime), -279, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (823, N'SE', CAST(N'2017-01-06T05:16:48.027' AS DateTime), -9, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (824, N'SE', CAST(N'2017-01-06T05:16:48.027' AS DateTime), -4.125, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (825, N'CA', CAST(N'2017-01-06T05:16:48.027' AS DateTime), -279, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (826, N'SE', CAST(N'2017-01-06T05:21:48.040' AS DateTime), -9, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (827, N'SE', CAST(N'2017-01-06T05:21:48.040' AS DateTime), -4.125, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (828, N'CA', CAST(N'2017-01-06T05:21:48.040' AS DateTime), -279, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (829, N'SE', CAST(N'2017-01-06T05:26:48.050' AS DateTime), -9, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (830, N'SE', CAST(N'2017-01-06T05:26:48.050' AS DateTime), -4.125, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (831, N'CA', CAST(N'2017-01-06T05:26:48.050' AS DateTime), -279, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (832, N'SE', CAST(N'2017-01-06T05:31:48.067' AS DateTime), -9, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (833, N'SE', CAST(N'2017-01-06T05:31:48.067' AS DateTime), -4.125, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (834, N'CA', CAST(N'2017-01-06T05:31:48.067' AS DateTime), -279, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (835, N'SE', CAST(N'2017-01-06T05:36:48.083' AS DateTime), -9, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (836, N'SE', CAST(N'2017-01-06T05:36:48.083' AS DateTime), -4.125, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (837, N'CA', CAST(N'2017-01-06T05:36:48.083' AS DateTime), -279, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (838, N'SE', CAST(N'2017-01-06T05:41:48.097' AS DateTime), -9, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (839, N'SE', CAST(N'2017-01-06T05:41:48.097' AS DateTime), -4.0625, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (840, N'CA', CAST(N'2017-01-06T05:41:48.097' AS DateTime), -272, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (841, N'SE', CAST(N'2017-01-06T05:46:48.113' AS DateTime), -8.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (842, N'SE', CAST(N'2017-01-06T05:46:48.113' AS DateTime), -4.0625, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (843, N'CA', CAST(N'2017-01-06T05:46:48.113' AS DateTime), -296, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (844, N'SE', CAST(N'2017-01-06T05:51:48.117' AS DateTime), -9, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (845, N'SE', CAST(N'2017-01-06T05:51:48.117' AS DateTime), -4, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (846, N'CA', CAST(N'2017-01-06T05:51:48.117' AS DateTime), -265, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (847, N'SE', CAST(N'2017-01-06T05:56:48.130' AS DateTime), -9, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (848, N'SE', CAST(N'2017-01-06T05:56:48.130' AS DateTime), -4, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (849, N'CA', CAST(N'2017-01-06T05:56:48.130' AS DateTime), -265, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (850, N'SE', CAST(N'2017-01-06T06:01:48.133' AS DateTime), -9, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (851, N'SE', CAST(N'2017-01-06T06:01:48.133' AS DateTime), -4, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (852, N'CA', CAST(N'2017-01-06T06:01:48.133' AS DateTime), -265, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (853, N'SE', CAST(N'2017-01-06T06:06:48.150' AS DateTime), -9, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (854, N'SE', CAST(N'2017-01-06T06:06:48.150' AS DateTime), -4, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (855, N'CA', CAST(N'2017-01-06T06:06:48.150' AS DateTime), -265, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (856, N'SE', CAST(N'2017-01-06T06:11:48.167' AS DateTime), -9, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (857, N'SE', CAST(N'2017-01-06T06:11:48.167' AS DateTime), -4, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (858, N'CA', CAST(N'2017-01-06T06:11:48.167' AS DateTime), -265, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (859, N'SE', CAST(N'2017-01-06T06:16:48.187' AS DateTime), -9, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (860, N'SE', CAST(N'2017-01-06T06:16:48.187' AS DateTime), -4, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (861, N'CA', CAST(N'2017-01-06T06:16:48.187' AS DateTime), -265, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (862, N'SE', CAST(N'2017-01-06T06:21:48.200' AS DateTime), -8.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (863, N'SE', CAST(N'2017-01-06T06:21:48.200' AS DateTime), -4, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (864, N'CA', CAST(N'2017-01-06T06:21:48.200' AS DateTime), -288, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (865, N'SE', CAST(N'2017-01-06T06:26:48.200' AS DateTime), -9, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (866, N'SE', CAST(N'2017-01-06T06:26:48.200' AS DateTime), -4, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (867, N'CA', CAST(N'2017-01-06T06:26:48.200' AS DateTime), -265, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (868, N'SE', CAST(N'2017-01-06T06:31:48.203' AS DateTime), -8.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (869, N'SE', CAST(N'2017-01-06T06:31:48.203' AS DateTime), -3.9375, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (870, N'CA', CAST(N'2017-01-06T06:31:48.203' AS DateTime), -280, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (871, N'SE', CAST(N'2017-01-06T06:36:48.203' AS DateTime), -8.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (872, N'SE', CAST(N'2017-01-06T06:36:48.203' AS DateTime), -3.9375, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (873, N'CA', CAST(N'2017-01-06T06:36:48.203' AS DateTime), -280, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (874, N'SE', CAST(N'2017-01-06T06:41:48.217' AS DateTime), -8.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (875, N'SE', CAST(N'2017-01-06T06:41:48.217' AS DateTime), -3.9375, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (876, N'CA', CAST(N'2017-01-06T06:41:48.217' AS DateTime), -280, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (877, N'SE', CAST(N'2017-01-06T06:46:48.217' AS DateTime), -8.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (878, N'SE', CAST(N'2017-01-06T06:46:48.217' AS DateTime), -3.9375, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (879, N'CA', CAST(N'2017-01-06T06:46:48.217' AS DateTime), -280, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (880, N'SE', CAST(N'2017-01-06T06:51:48.217' AS DateTime), -8.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (881, N'SE', CAST(N'2017-01-06T06:51:48.217' AS DateTime), -3.9375, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (882, N'CA', CAST(N'2017-01-06T06:51:48.217' AS DateTime), -280, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (883, N'SE', CAST(N'2017-01-06T06:56:48.217' AS DateTime), -8.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (884, N'SE', CAST(N'2017-01-06T06:56:48.217' AS DateTime), -3.9375, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (885, N'CA', CAST(N'2017-01-06T06:56:48.217' AS DateTime), -280, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (886, N'SE', CAST(N'2017-01-06T07:01:48.220' AS DateTime), -8.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (887, N'SE', CAST(N'2017-01-06T07:01:48.220' AS DateTime), -3.9375, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (888, N'CA', CAST(N'2017-01-06T07:01:48.220' AS DateTime), -280, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (889, N'SE', CAST(N'2017-01-06T07:06:48.230' AS DateTime), -8.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (890, N'SE', CAST(N'2017-01-06T07:06:48.230' AS DateTime), -3.9375, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (891, N'CA', CAST(N'2017-01-06T07:06:48.230' AS DateTime), -280, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (892, N'SE', CAST(N'2017-01-06T07:11:48.230' AS DateTime), -8.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (893, N'SE', CAST(N'2017-01-06T07:11:48.230' AS DateTime), -3.9375, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (894, N'CA', CAST(N'2017-01-06T07:11:48.230' AS DateTime), -280, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (895, N'SE', CAST(N'2017-01-06T07:16:48.233' AS DateTime), -8.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (896, N'SE', CAST(N'2017-01-06T07:16:48.233' AS DateTime), -3.9375, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (897, N'CA', CAST(N'2017-01-06T07:16:48.233' AS DateTime), -280, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (898, N'SE', CAST(N'2017-01-06T07:21:48.233' AS DateTime), -8.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (899, N'SE', CAST(N'2017-01-06T07:21:48.233' AS DateTime), -3.9375, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (900, N'CA', CAST(N'2017-01-06T07:21:48.233' AS DateTime), -280, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (901, N'SE', CAST(N'2017-01-06T07:26:48.237' AS DateTime), -8.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (902, N'SE', CAST(N'2017-01-06T07:26:48.237' AS DateTime), -3.9375, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (903, N'CA', CAST(N'2017-01-06T07:26:48.237' AS DateTime), -280, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (904, N'SE', CAST(N'2017-01-06T07:31:48.237' AS DateTime), -8.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (905, N'SE', CAST(N'2017-01-06T07:31:48.237' AS DateTime), -3.9375, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (906, N'CA', CAST(N'2017-01-06T07:31:48.237' AS DateTime), -280, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (907, N'SE', CAST(N'2017-01-06T07:36:48.253' AS DateTime), -8.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (908, N'SE', CAST(N'2017-01-06T07:36:48.253' AS DateTime), -3.9375, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (909, N'CA', CAST(N'2017-01-06T07:36:48.253' AS DateTime), -280, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (910, N'SE', CAST(N'2017-01-06T07:41:48.263' AS DateTime), -8.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (911, N'SE', CAST(N'2017-01-06T07:41:48.263' AS DateTime), -3.9375, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (912, N'CA', CAST(N'2017-01-06T07:41:48.263' AS DateTime), -280, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (913, N'SE', CAST(N'2017-01-06T07:46:48.267' AS DateTime), -8.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (914, N'SE', CAST(N'2017-01-06T07:46:48.267' AS DateTime), -3.9375, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (915, N'CA', CAST(N'2017-01-06T07:46:48.267' AS DateTime), -280, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (916, N'SE', CAST(N'2017-01-06T07:51:48.267' AS DateTime), -8.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (917, N'SE', CAST(N'2017-01-06T07:51:48.267' AS DateTime), -3.9375, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (918, N'CA', CAST(N'2017-01-06T07:51:48.267' AS DateTime), -280, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (919, N'SE', CAST(N'2017-01-06T07:56:48.267' AS DateTime), -8.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (920, N'SE', CAST(N'2017-01-06T07:56:48.267' AS DateTime), -3.9375, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (921, N'CA', CAST(N'2017-01-06T07:56:48.267' AS DateTime), -280, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (922, N'SE', CAST(N'2017-01-06T08:01:48.280' AS DateTime), -8.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (923, N'SE', CAST(N'2017-01-06T08:01:48.280' AS DateTime), -3.9375, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (924, N'CA', CAST(N'2017-01-06T08:01:48.280' AS DateTime), -280, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (925, N'SE', CAST(N'2017-01-06T08:06:48.293' AS DateTime), -8.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (926, N'SE', CAST(N'2017-01-06T08:06:48.293' AS DateTime), -3.9375, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (927, N'CA', CAST(N'2017-01-06T08:06:48.293' AS DateTime), -280, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (928, N'SE', CAST(N'2017-01-06T08:11:48.303' AS DateTime), -8.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (929, N'SE', CAST(N'2017-01-06T08:11:48.303' AS DateTime), -3.9375, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (930, N'CA', CAST(N'2017-01-06T08:11:48.303' AS DateTime), -280, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (931, N'SE', CAST(N'2017-01-06T08:16:48.303' AS DateTime), -8.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (932, N'SE', CAST(N'2017-01-06T08:16:48.303' AS DateTime), -3.9375, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (933, N'CA', CAST(N'2017-01-06T08:16:48.303' AS DateTime), -280, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (934, N'SE', CAST(N'2017-01-06T08:21:48.307' AS DateTime), -8.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (935, N'SE', CAST(N'2017-01-06T08:21:48.307' AS DateTime), -3.9375, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (936, N'CA', CAST(N'2017-01-06T08:21:48.307' AS DateTime), -280, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (937, N'SE', CAST(N'2017-01-06T08:26:48.323' AS DateTime), -8.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (938, N'SE', CAST(N'2017-01-06T08:26:48.323' AS DateTime), -3.9375, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (939, N'CA', CAST(N'2017-01-06T08:26:48.323' AS DateTime), -280, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (940, N'SE', CAST(N'2017-01-06T08:31:48.340' AS DateTime), -9, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (941, N'SE', CAST(N'2017-01-06T08:31:48.340' AS DateTime), -3.9375, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (942, N'CA', CAST(N'2017-01-06T08:31:48.340' AS DateTime), -258, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (943, N'SE', CAST(N'2017-01-06T08:36:48.353' AS DateTime), -8.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (944, N'SE', CAST(N'2017-01-06T08:36:48.353' AS DateTime), -3.9375, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (945, N'CA', CAST(N'2017-01-06T08:36:48.353' AS DateTime), -280, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (946, N'SE', CAST(N'2017-01-06T08:41:48.367' AS DateTime), -8.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (947, N'SE', CAST(N'2017-01-06T08:41:48.367' AS DateTime), -3.9375, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (948, N'CA', CAST(N'2017-01-06T08:41:48.367' AS DateTime), -280, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (949, N'SE', CAST(N'2017-01-06T08:46:48.387' AS DateTime), -8.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (950, N'SE', CAST(N'2017-01-06T08:46:48.387' AS DateTime), -3.9375, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (951, N'CA', CAST(N'2017-01-06T08:46:48.387' AS DateTime), -280, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (952, N'SE', CAST(N'2017-01-06T08:51:48.387' AS DateTime), -8.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (953, N'SE', CAST(N'2017-01-06T08:51:48.387' AS DateTime), -3.9375, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (954, N'CA', CAST(N'2017-01-06T08:51:48.387' AS DateTime), -280, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (955, N'SE', CAST(N'2017-01-06T08:56:48.397' AS DateTime), -8.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (956, N'SE', CAST(N'2017-01-06T08:56:48.397' AS DateTime), -4, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (957, N'CA', CAST(N'2017-01-06T08:56:48.397' AS DateTime), -288, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (958, N'SE', CAST(N'2017-01-06T09:01:48.417' AS DateTime), -8.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (959, N'SE', CAST(N'2017-01-06T09:01:48.417' AS DateTime), -3.9375, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (960, N'CA', CAST(N'2017-01-06T09:01:48.417' AS DateTime), -280, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (961, N'SE', CAST(N'2017-01-06T09:06:48.417' AS DateTime), -8.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (962, N'SE', CAST(N'2017-01-06T09:06:48.417' AS DateTime), -3.9375, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (963, N'CA', CAST(N'2017-01-06T09:06:48.417' AS DateTime), -280, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (964, N'SE', CAST(N'2017-01-06T09:11:48.433' AS DateTime), -8.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (965, N'SE', CAST(N'2017-01-06T09:11:48.433' AS DateTime), -3.9375, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (966, N'CA', CAST(N'2017-01-06T09:11:48.433' AS DateTime), -280, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (967, N'SE', CAST(N'2017-01-06T09:16:48.437' AS DateTime), -8.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (968, N'SE', CAST(N'2017-01-06T09:16:48.437' AS DateTime), -3.9375, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (969, N'CA', CAST(N'2017-01-06T09:16:48.437' AS DateTime), -280, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (970, N'SE', CAST(N'2017-01-06T09:21:48.437' AS DateTime), -8.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (971, N'SE', CAST(N'2017-01-06T09:21:48.437' AS DateTime), -4, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (972, N'CA', CAST(N'2017-01-06T09:21:48.437' AS DateTime), -288, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (973, N'SE', CAST(N'2017-01-06T09:26:48.440' AS DateTime), -8.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (974, N'SE', CAST(N'2017-01-06T09:26:48.440' AS DateTime), -3.9375, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (975, N'CA', CAST(N'2017-01-06T09:26:48.440' AS DateTime), -280, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (976, N'SE', CAST(N'2017-01-06T09:31:48.440' AS DateTime), -8.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (977, N'SE', CAST(N'2017-01-06T09:31:48.440' AS DateTime), -3.9375, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (978, N'CA', CAST(N'2017-01-06T09:31:48.440' AS DateTime), -280, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (979, N'SE', CAST(N'2017-01-06T09:36:48.457' AS DateTime), -8.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (980, N'SE', CAST(N'2017-01-06T09:36:48.457' AS DateTime), -3.9375, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (981, N'CA', CAST(N'2017-01-06T09:36:48.457' AS DateTime), -280, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (982, N'SE', CAST(N'2017-01-06T09:41:48.473' AS DateTime), -8, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (983, N'SE', CAST(N'2017-01-06T09:41:48.473' AS DateTime), -3.9375, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (984, N'CA', CAST(N'2017-01-06T09:41:48.473' AS DateTime), -307, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (985, N'SE', CAST(N'2017-01-06T09:46:48.480' AS DateTime), -8.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (986, N'SE', CAST(N'2017-01-06T09:46:48.480' AS DateTime), -3.9375, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (987, N'CA', CAST(N'2017-01-06T09:46:48.480' AS DateTime), -280, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (988, N'SE', CAST(N'2017-01-06T09:51:48.490' AS DateTime), -8.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (989, N'SE', CAST(N'2017-01-06T09:51:48.490' AS DateTime), -3.9375, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (990, N'CA', CAST(N'2017-01-06T09:51:48.490' AS DateTime), -280, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (991, N'SE', CAST(N'2017-01-06T09:56:48.507' AS DateTime), -8.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (992, N'SE', CAST(N'2017-01-06T09:56:48.507' AS DateTime), -3.9375, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (993, N'CA', CAST(N'2017-01-06T09:56:48.507' AS DateTime), -280, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (994, N'SE', CAST(N'2017-01-06T10:01:48.523' AS DateTime), -9, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (995, N'SE', CAST(N'2017-01-06T10:01:48.523' AS DateTime), -4, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (996, N'CA', CAST(N'2017-01-06T10:01:48.523' AS DateTime), -265, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (997, N'SE', CAST(N'2017-01-06T10:06:48.540' AS DateTime), -8.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (998, N'SE', CAST(N'2017-01-06T10:06:48.540' AS DateTime), -4, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (999, N'CA', CAST(N'2017-01-06T10:06:48.540' AS DateTime), -288, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1000, N'SE', CAST(N'2017-01-06T10:11:48.557' AS DateTime), -8.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1001, N'SE', CAST(N'2017-01-06T10:11:48.557' AS DateTime), -4, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1002, N'CA', CAST(N'2017-01-06T10:11:48.557' AS DateTime), -288, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1003, N'SE', CAST(N'2017-01-06T10:16:48.567' AS DateTime), -8.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1004, N'SE', CAST(N'2017-01-06T10:16:48.567' AS DateTime), -4, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1005, N'CA', CAST(N'2017-01-06T10:16:48.567' AS DateTime), -288, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1006, N'SE', CAST(N'2017-01-06T10:21:48.583' AS DateTime), -8, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1007, N'SE', CAST(N'2017-01-06T10:21:48.583' AS DateTime), -4, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1008, N'CA', CAST(N'2017-01-06T10:21:48.583' AS DateTime), -316, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1009, N'SE', CAST(N'2017-01-06T10:26:48.600' AS DateTime), -8, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1010, N'SE', CAST(N'2017-01-06T10:26:48.600' AS DateTime), -4, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1011, N'CA', CAST(N'2017-01-06T10:26:48.600' AS DateTime), -316, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1012, N'SE', CAST(N'2017-01-06T10:31:48.613' AS DateTime), -8, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1013, N'SE', CAST(N'2017-01-06T10:31:48.613' AS DateTime), -4, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1014, N'CA', CAST(N'2017-01-06T10:31:48.613' AS DateTime), -316, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1015, N'SE', CAST(N'2017-01-06T10:36:48.627' AS DateTime), -8, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1016, N'SE', CAST(N'2017-01-06T10:36:48.627' AS DateTime), -4, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1017, N'CA', CAST(N'2017-01-06T10:36:48.627' AS DateTime), -316, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1018, N'SE', CAST(N'2017-01-06T10:41:48.627' AS DateTime), -8, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1019, N'SE', CAST(N'2017-01-06T10:41:48.627' AS DateTime), -4, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1020, N'CA', CAST(N'2017-01-06T10:41:48.627' AS DateTime), -316, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1021, N'SE', CAST(N'2017-01-06T10:46:48.630' AS DateTime), -8, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1022, N'SE', CAST(N'2017-01-06T10:46:48.630' AS DateTime), -4, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1023, N'CA', CAST(N'2017-01-06T10:46:48.630' AS DateTime), -316, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1024, N'SE', CAST(N'2017-01-06T10:51:48.643' AS DateTime), -8.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1025, N'SE', CAST(N'2017-01-06T10:51:48.643' AS DateTime), -4, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1026, N'CA', CAST(N'2017-01-06T10:51:48.643' AS DateTime), -288, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1027, N'SE', CAST(N'2017-01-06T10:56:48.647' AS DateTime), -8.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1028, N'SE', CAST(N'2017-01-06T10:56:48.647' AS DateTime), -4, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1029, N'CA', CAST(N'2017-01-06T10:56:48.647' AS DateTime), -288, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1030, N'SE', CAST(N'2017-01-06T11:01:48.663' AS DateTime), -8.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1031, N'SE', CAST(N'2017-01-06T11:01:48.663' AS DateTime), -4, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1032, N'CA', CAST(N'2017-01-06T11:01:48.663' AS DateTime), -288, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1033, N'SE', CAST(N'2017-01-06T11:06:48.680' AS DateTime), -8.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1034, N'SE', CAST(N'2017-01-06T11:06:48.680' AS DateTime), -4, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1035, N'CA', CAST(N'2017-01-06T11:06:48.680' AS DateTime), -288, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1036, N'SE', CAST(N'2017-01-06T11:11:48.693' AS DateTime), -8.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1037, N'SE', CAST(N'2017-01-06T11:11:48.693' AS DateTime), -4, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1038, N'CA', CAST(N'2017-01-06T11:11:48.693' AS DateTime), -288, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1039, N'SE', CAST(N'2017-01-06T11:16:48.693' AS DateTime), -8.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1040, N'SE', CAST(N'2017-01-06T11:16:48.693' AS DateTime), -4, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1041, N'CA', CAST(N'2017-01-06T11:16:48.693' AS DateTime), -288, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1042, N'SE', CAST(N'2017-01-06T11:21:48.707' AS DateTime), -8.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1043, N'SE', CAST(N'2017-01-06T11:21:48.707' AS DateTime), -4, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1044, N'CA', CAST(N'2017-01-06T11:21:48.707' AS DateTime), -288, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1045, N'SE', CAST(N'2017-01-06T11:26:48.727' AS DateTime), -8, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1046, N'SE', CAST(N'2017-01-06T11:26:48.727' AS DateTime), -4, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1047, N'CA', CAST(N'2017-01-06T11:26:48.727' AS DateTime), -316, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1048, N'SE', CAST(N'2017-01-06T11:31:48.727' AS DateTime), -8, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1049, N'SE', CAST(N'2017-01-06T11:31:48.727' AS DateTime), -4, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1050, N'CA', CAST(N'2017-01-06T11:31:48.727' AS DateTime), -316, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1051, N'SE', CAST(N'2017-01-06T11:36:48.743' AS DateTime), -8, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1052, N'SE', CAST(N'2017-01-06T11:36:48.743' AS DateTime), -4, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1053, N'CA', CAST(N'2017-01-06T11:36:48.743' AS DateTime), -316, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1054, N'SE', CAST(N'2017-01-06T11:41:48.760' AS DateTime), -7.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1055, N'SE', CAST(N'2017-01-06T11:41:48.760' AS DateTime), -4, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1056, N'CA', CAST(N'2017-01-06T11:41:48.760' AS DateTime), -349, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1057, N'SE', CAST(N'2017-01-06T11:46:48.777' AS DateTime), -7.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1058, N'SE', CAST(N'2017-01-06T11:46:48.777' AS DateTime), -4, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1059, N'CA', CAST(N'2017-01-06T11:46:48.777' AS DateTime), -349, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1060, N'SE', CAST(N'2017-01-06T11:51:48.793' AS DateTime), -7.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1061, N'SE', CAST(N'2017-01-06T11:51:48.793' AS DateTime), -4, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1062, N'CA', CAST(N'2017-01-06T11:51:48.793' AS DateTime), -349, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1063, N'SE', CAST(N'2017-01-06T11:56:48.807' AS DateTime), -7.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1064, N'SE', CAST(N'2017-01-06T11:56:48.807' AS DateTime), -4, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1065, N'CA', CAST(N'2017-01-06T11:56:48.807' AS DateTime), -349, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1066, N'SE', CAST(N'2017-01-06T12:01:48.823' AS DateTime), -7.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1067, N'SE', CAST(N'2017-01-06T12:01:48.823' AS DateTime), -4, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1068, N'CA', CAST(N'2017-01-06T12:01:48.823' AS DateTime), -349, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1069, N'SE', CAST(N'2017-01-06T12:06:48.827' AS DateTime), -7.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1070, N'SE', CAST(N'2017-01-06T12:06:48.827' AS DateTime), -4, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1071, N'CA', CAST(N'2017-01-06T12:06:48.827' AS DateTime), -349, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1072, N'SE', CAST(N'2017-01-06T12:11:48.827' AS DateTime), -7, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1073, N'SE', CAST(N'2017-01-06T12:11:48.827' AS DateTime), -4, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1074, N'CA', CAST(N'2017-01-06T12:11:48.827' AS DateTime), -391, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1075, N'SE', CAST(N'2017-01-06T12:16:48.827' AS DateTime), -7.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1076, N'SE', CAST(N'2017-01-06T12:16:48.827' AS DateTime), -4, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1077, N'CA', CAST(N'2017-01-06T12:16:48.827' AS DateTime), -349, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1078, N'SE', CAST(N'2017-01-06T12:21:48.827' AS DateTime), -7.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1079, N'SE', CAST(N'2017-01-06T12:21:48.827' AS DateTime), -4, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1080, N'CA', CAST(N'2017-01-06T12:21:48.827' AS DateTime), -349, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1081, N'SE', CAST(N'2017-01-06T12:26:48.830' AS DateTime), -7.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1082, N'SE', CAST(N'2017-01-06T12:26:48.830' AS DateTime), -4, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1083, N'CA', CAST(N'2017-01-06T12:26:48.830' AS DateTime), -349, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1084, N'SE', CAST(N'2017-01-06T12:31:48.840' AS DateTime), -7.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1085, N'SE', CAST(N'2017-01-06T12:31:48.840' AS DateTime), -4, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1086, N'CA', CAST(N'2017-01-06T12:31:48.840' AS DateTime), -349, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1087, N'SE', CAST(N'2017-01-06T12:36:48.857' AS DateTime), -7.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1088, N'SE', CAST(N'2017-01-06T12:36:48.857' AS DateTime), -4, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1089, N'CA', CAST(N'2017-01-06T12:36:48.857' AS DateTime), -349, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1090, N'SE', CAST(N'2017-01-06T12:41:48.857' AS DateTime), -7, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1091, N'SE', CAST(N'2017-01-06T12:41:48.857' AS DateTime), -4, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1092, N'CA', CAST(N'2017-01-06T12:41:48.857' AS DateTime), -391, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1093, N'SE', CAST(N'2017-01-06T12:46:48.873' AS DateTime), -7.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1094, N'SE', CAST(N'2017-01-06T12:46:48.873' AS DateTime), -4, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1095, N'CA', CAST(N'2017-01-06T12:46:48.873' AS DateTime), -349, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1096, N'SE', CAST(N'2017-01-06T12:51:48.873' AS DateTime), -7.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1097, N'SE', CAST(N'2017-01-06T12:51:48.873' AS DateTime), -4.0625, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1098, N'CA', CAST(N'2017-01-06T12:51:48.873' AS DateTime), -359, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1099, N'SE', CAST(N'2017-01-06T12:56:48.873' AS DateTime), -7.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1100, N'SE', CAST(N'2017-01-06T12:56:48.873' AS DateTime), -4.0625, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1101, N'CA', CAST(N'2017-01-06T12:56:48.873' AS DateTime), -359, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1102, N'SE', CAST(N'2017-01-06T13:01:48.877' AS DateTime), -7.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1103, N'SE', CAST(N'2017-01-06T13:01:48.877' AS DateTime), -4, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1104, N'CA', CAST(N'2017-01-06T13:01:48.877' AS DateTime), -349, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1105, N'SE', CAST(N'2017-01-06T13:06:48.877' AS DateTime), -8, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1106, N'SE', CAST(N'2017-01-06T13:06:48.877' AS DateTime), -4, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1107, N'CA', CAST(N'2017-01-06T13:06:48.877' AS DateTime), -316, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1108, N'SE', CAST(N'2017-01-06T13:11:48.880' AS DateTime), -7, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1109, N'SE', CAST(N'2017-01-06T13:11:48.880' AS DateTime), -4, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1110, N'CA', CAST(N'2017-01-06T13:11:48.880' AS DateTime), -391, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1111, N'SE', CAST(N'2017-01-06T13:16:48.897' AS DateTime), -7.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1112, N'SE', CAST(N'2017-01-06T13:16:48.897' AS DateTime), -4.75, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1113, N'CA', CAST(N'2017-01-06T13:16:48.897' AS DateTime), -486, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1114, N'SE', CAST(N'2017-01-06T13:21:48.913' AS DateTime), -8, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1115, N'SE', CAST(N'2017-01-06T13:21:48.913' AS DateTime), -4.9375, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1116, N'CA', CAST(N'2017-01-06T13:21:48.913' AS DateTime), -467, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1117, N'SE', CAST(N'2017-01-06T13:26:48.930' AS DateTime), -8, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1118, N'SE', CAST(N'2017-01-06T13:26:48.930' AS DateTime), -5, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1119, N'CA', CAST(N'2017-01-06T13:26:48.930' AS DateTime), -478, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1120, N'SE', CAST(N'2017-01-06T13:31:48.947' AS DateTime), -8, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1121, N'SE', CAST(N'2017-01-06T13:31:48.947' AS DateTime), -5.0625, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1122, N'CA', CAST(N'2017-01-06T13:31:48.947' AS DateTime), -490, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1123, N'SE', CAST(N'2017-01-06T13:36:48.947' AS DateTime), -8, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1124, N'SE', CAST(N'2017-01-06T13:36:48.947' AS DateTime), -5.0625, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1125, N'CA', CAST(N'2017-01-06T13:36:48.947' AS DateTime), -490, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1126, N'SE', CAST(N'2017-01-06T13:41:48.947' AS DateTime), -8, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1127, N'SE', CAST(N'2017-01-06T13:41:48.947' AS DateTime), -5.0625, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1128, N'CA', CAST(N'2017-01-06T13:41:48.947' AS DateTime), -490, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1129, N'SE', CAST(N'2017-01-06T13:46:48.950' AS DateTime), -8, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1130, N'SE', CAST(N'2017-01-06T13:46:48.950' AS DateTime), -5.0625, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1131, N'CA', CAST(N'2017-01-06T13:46:48.950' AS DateTime), -490, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1132, N'SE', CAST(N'2017-01-06T13:51:48.950' AS DateTime), -8, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1133, N'SE', CAST(N'2017-01-06T13:51:48.950' AS DateTime), -5.0625, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1134, N'CA', CAST(N'2017-01-06T13:51:48.950' AS DateTime), -490, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1135, N'SE', CAST(N'2017-01-06T13:56:48.953' AS DateTime), -8, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1136, N'SE', CAST(N'2017-01-06T13:56:48.953' AS DateTime), -5.0625, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1137, N'CA', CAST(N'2017-01-06T13:56:48.953' AS DateTime), -490, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1138, N'SE', CAST(N'2017-01-06T14:01:48.967' AS DateTime), -8, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1139, N'SE', CAST(N'2017-01-06T14:01:48.967' AS DateTime), -5.1875, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1140, N'CA', CAST(N'2017-01-06T14:01:48.967' AS DateTime), -515, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1141, N'SE', CAST(N'2017-01-06T14:06:48.970' AS DateTime), -8, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1142, N'SE', CAST(N'2017-01-06T14:06:48.970' AS DateTime), -5.1875, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1143, N'CA', CAST(N'2017-01-06T14:06:48.970' AS DateTime), -515, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1144, N'SE', CAST(N'2017-01-06T14:11:48.973' AS DateTime), -8, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1145, N'SE', CAST(N'2017-01-06T14:11:48.973' AS DateTime), -5.1875, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1146, N'CA', CAST(N'2017-01-06T14:11:48.973' AS DateTime), -515, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1147, N'SE', CAST(N'2017-01-06T14:16:48.987' AS DateTime), -8.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1148, N'SE', CAST(N'2017-01-06T14:16:48.987' AS DateTime), -5.25, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1149, N'CA', CAST(N'2017-01-06T14:16:48.987' AS DateTime), -472, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1150, N'SE', CAST(N'2017-01-06T14:21:48.987' AS DateTime), -8.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1151, N'SE', CAST(N'2017-01-06T14:21:48.987' AS DateTime), -5.25, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1152, N'CA', CAST(N'2017-01-06T14:21:48.987' AS DateTime), -472, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1153, N'SE', CAST(N'2017-01-06T14:26:48.997' AS DateTime), -8.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1154, N'SE', CAST(N'2017-01-06T14:26:48.997' AS DateTime), -5.25, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1155, N'CA', CAST(N'2017-01-06T14:26:48.997' AS DateTime), -472, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1156, N'SE', CAST(N'2017-01-06T14:31:48.997' AS DateTime), -8, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1157, N'SE', CAST(N'2017-01-06T14:31:48.997' AS DateTime), -5.3125, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1158, N'CA', CAST(N'2017-01-06T14:31:48.997' AS DateTime), -540, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1159, N'SE', CAST(N'2017-01-06T14:36:49.007' AS DateTime), -8, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1160, N'SE', CAST(N'2017-01-06T14:36:49.007' AS DateTime), -5.3125, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1161, N'CA', CAST(N'2017-01-06T14:36:49.007' AS DateTime), -540, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1162, N'SE', CAST(N'2017-01-06T14:41:49.023' AS DateTime), -8, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1163, N'SE', CAST(N'2017-01-06T14:41:49.023' AS DateTime), -5.3125, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1164, N'CA', CAST(N'2017-01-06T14:41:49.023' AS DateTime), -540, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1165, N'SE', CAST(N'2017-01-06T14:46:49.033' AS DateTime), -8.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1166, N'SE', CAST(N'2017-01-06T14:46:49.033' AS DateTime), -5.375, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1167, N'CA', CAST(N'2017-01-06T14:46:49.033' AS DateTime), -494, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1168, N'SE', CAST(N'2017-01-06T14:51:49.050' AS DateTime), -8.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1169, N'SE', CAST(N'2017-01-06T14:51:49.050' AS DateTime), -5.4375, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1170, N'CA', CAST(N'2017-01-06T14:51:49.050' AS DateTime), -506, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1171, N'SE', CAST(N'2017-01-06T14:56:49.060' AS DateTime), -8.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1172, N'SE', CAST(N'2017-01-06T14:56:49.060' AS DateTime), -5.4375, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1173, N'CA', CAST(N'2017-01-06T14:56:49.060' AS DateTime), -506, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1174, N'SE', CAST(N'2017-01-06T15:01:49.060' AS DateTime), -8, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1175, N'SE', CAST(N'2017-01-06T15:01:49.060' AS DateTime), -5.375, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1176, N'CA', CAST(N'2017-01-06T15:01:49.060' AS DateTime), -554, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1177, N'SE', CAST(N'2017-01-06T15:06:49.077' AS DateTime), -8.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1178, N'SE', CAST(N'2017-01-06T15:06:49.077' AS DateTime), -5.3125, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1179, N'CA', CAST(N'2017-01-06T15:06:49.077' AS DateTime), -483, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1180, N'SE', CAST(N'2017-01-06T15:11:49.080' AS DateTime), -8.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1181, N'SE', CAST(N'2017-01-06T15:11:49.080' AS DateTime), -5.25, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1182, N'CA', CAST(N'2017-01-06T15:11:49.080' AS DateTime), -472, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1183, N'SE', CAST(N'2017-01-06T15:16:49.093' AS DateTime), -8.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1184, N'SE', CAST(N'2017-01-06T15:16:49.093' AS DateTime), -5.1875, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1185, N'CA', CAST(N'2017-01-06T15:16:49.093' AS DateTime), -461, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1186, N'SE', CAST(N'2017-01-06T15:21:49.100' AS DateTime), -8, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1187, N'SE', CAST(N'2017-01-06T15:21:49.100' AS DateTime), -5.125, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1188, N'CA', CAST(N'2017-01-06T15:21:49.100' AS DateTime), -502, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1189, N'SE', CAST(N'2017-01-06T15:26:49.103' AS DateTime), -8.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1190, N'SE', CAST(N'2017-01-06T15:26:49.103' AS DateTime), -7.1875, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1191, N'CA', CAST(N'2017-01-06T15:26:49.103' AS DateTime), -984, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1192, N'SE', CAST(N'2017-01-06T15:31:49.103' AS DateTime), -8, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1193, N'SE', CAST(N'2017-01-06T15:31:49.103' AS DateTime), -4.375, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1194, N'CA', CAST(N'2017-01-06T15:31:49.103' AS DateTime), -371, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1195, N'SE', CAST(N'2017-01-06T15:36:49.110' AS DateTime), -8.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1196, N'SE', CAST(N'2017-01-06T15:36:49.110' AS DateTime), -4.0625, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1197, N'CA', CAST(N'2017-01-06T15:36:49.110' AS DateTime), -296, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1198, N'SE', CAST(N'2017-01-06T15:41:49.127' AS DateTime), -8.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1199, N'SE', CAST(N'2017-01-06T15:41:49.127' AS DateTime), -4, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1200, N'CA', CAST(N'2017-01-06T15:41:49.127' AS DateTime), -288, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1201, N'SE', CAST(N'2017-01-06T15:46:49.127' AS DateTime), -8.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1202, N'SE', CAST(N'2017-01-06T15:46:49.127' AS DateTime), -4, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1203, N'CA', CAST(N'2017-01-06T15:46:49.127' AS DateTime), -288, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1204, N'SE', CAST(N'2017-01-06T15:51:49.127' AS DateTime), -9, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1205, N'SE', CAST(N'2017-01-06T15:51:49.127' AS DateTime), -4, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1206, N'CA', CAST(N'2017-01-06T15:51:49.127' AS DateTime), -265, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1207, N'SE', CAST(N'2017-01-06T15:56:49.147' AS DateTime), -9, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1208, N'SE', CAST(N'2017-01-06T15:56:49.147' AS DateTime), -4, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1209, N'CA', CAST(N'2017-01-06T15:56:49.147' AS DateTime), -265, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1210, N'SE', CAST(N'2017-01-06T16:01:49.147' AS DateTime), -9, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1211, N'SE', CAST(N'2017-01-06T16:01:49.147' AS DateTime), -4.0625, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1212, N'CA', CAST(N'2017-01-06T16:01:49.147' AS DateTime), -272, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1213, N'SE', CAST(N'2017-01-06T16:06:49.150' AS DateTime), -9, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1214, N'SE', CAST(N'2017-01-06T16:06:49.150' AS DateTime), -4.0625, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1215, N'CA', CAST(N'2017-01-06T16:06:49.150' AS DateTime), -272, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1216, N'SE', CAST(N'2017-01-06T16:11:49.153' AS DateTime), -9, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1217, N'SE', CAST(N'2017-01-06T16:11:49.153' AS DateTime), -4.0625, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1218, N'CA', CAST(N'2017-01-06T16:11:49.153' AS DateTime), -272, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1219, N'SE', CAST(N'2017-01-06T16:16:49.157' AS DateTime), -9.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1220, N'SE', CAST(N'2017-01-06T16:16:49.157' AS DateTime), -4.0625, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1221, N'CA', CAST(N'2017-01-06T16:16:49.157' AS DateTime), -252, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1222, N'SE', CAST(N'2017-01-06T16:21:49.177' AS DateTime), -9, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1223, N'SE', CAST(N'2017-01-06T16:21:49.177' AS DateTime), -4.0625, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1224, N'CA', CAST(N'2017-01-06T16:21:49.177' AS DateTime), -272, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1225, N'SE', CAST(N'2017-01-06T16:26:49.177' AS DateTime), -9.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1226, N'SE', CAST(N'2017-01-06T16:26:49.177' AS DateTime), -4.0625, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1227, N'CA', CAST(N'2017-01-06T16:26:49.177' AS DateTime), -252, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1228, N'SE', CAST(N'2017-01-06T16:31:49.187' AS DateTime), -9, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1229, N'SE', CAST(N'2017-01-06T16:31:49.187' AS DateTime), -4.0625, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1230, N'CA', CAST(N'2017-01-06T16:31:49.187' AS DateTime), -272, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1231, N'SE', CAST(N'2017-01-06T16:36:49.190' AS DateTime), -9.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1232, N'SE', CAST(N'2017-01-06T16:36:49.190' AS DateTime), -4.0625, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1233, N'CA', CAST(N'2017-01-06T16:36:49.190' AS DateTime), -252, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1234, N'SE', CAST(N'2017-01-06T16:41:49.190' AS DateTime), -9.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1235, N'SE', CAST(N'2017-01-06T16:41:49.190' AS DateTime), -4.0625, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1236, N'CA', CAST(N'2017-01-06T16:41:49.190' AS DateTime), -252, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1237, N'SE', CAST(N'2017-01-06T16:46:49.190' AS DateTime), -9.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1238, N'SE', CAST(N'2017-01-06T16:46:49.190' AS DateTime), -4.0625, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1239, N'CA', CAST(N'2017-01-06T16:46:49.190' AS DateTime), -252, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1240, N'SE', CAST(N'2017-01-06T16:51:49.193' AS DateTime), -10, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1241, N'SE', CAST(N'2017-01-06T16:51:49.193' AS DateTime), -4.0625, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1242, N'CA', CAST(N'2017-01-06T16:51:49.193' AS DateTime), -235, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1243, N'SE', CAST(N'2017-01-06T16:56:49.210' AS DateTime), -10, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1244, N'SE', CAST(N'2017-01-06T16:56:49.210' AS DateTime), -4.0625, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1245, N'CA', CAST(N'2017-01-06T16:56:49.210' AS DateTime), -235, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1246, N'SE', CAST(N'2017-01-06T17:01:49.227' AS DateTime), -10, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1247, N'SE', CAST(N'2017-01-06T17:01:49.227' AS DateTime), -4.0625, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1248, N'CA', CAST(N'2017-01-06T17:01:49.227' AS DateTime), -235, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1249, N'SE', CAST(N'2017-01-06T17:06:49.243' AS DateTime), -10, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1250, N'SE', CAST(N'2017-01-06T17:06:49.243' AS DateTime), -4.0625, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1251, N'CA', CAST(N'2017-01-06T17:06:49.243' AS DateTime), -235, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1252, N'SE', CAST(N'2017-01-06T17:11:49.260' AS DateTime), -10, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1253, N'SE', CAST(N'2017-01-06T17:11:49.260' AS DateTime), -4.125, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1254, N'CA', CAST(N'2017-01-06T17:11:49.260' AS DateTime), -240, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1255, N'SE', CAST(N'2017-01-06T17:16:49.277' AS DateTime), -10, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1256, N'SE', CAST(N'2017-01-06T17:16:49.277' AS DateTime), -4.125, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1257, N'CA', CAST(N'2017-01-06T17:16:49.277' AS DateTime), -240, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1258, N'SE', CAST(N'2017-01-06T17:21:49.293' AS DateTime), -10, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1259, N'SE', CAST(N'2017-01-06T17:21:49.293' AS DateTime), -4.125, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1260, N'CA', CAST(N'2017-01-06T17:21:49.293' AS DateTime), -240, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1261, N'SE', CAST(N'2017-01-06T17:26:49.307' AS DateTime), -10.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1262, N'SE', CAST(N'2017-01-06T17:26:49.307' AS DateTime), -4.125, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1263, N'CA', CAST(N'2017-01-06T17:26:49.307' AS DateTime), -225, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1264, N'SE', CAST(N'2017-01-06T17:31:49.310' AS DateTime), -10.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1265, N'SE', CAST(N'2017-01-06T17:31:49.310' AS DateTime), -4.125, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1266, N'CA', CAST(N'2017-01-06T17:31:49.310' AS DateTime), -225, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1267, N'SE', CAST(N'2017-01-06T17:36:49.327' AS DateTime), -10.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1268, N'SE', CAST(N'2017-01-06T17:36:49.327' AS DateTime), -4.125, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1269, N'CA', CAST(N'2017-01-06T17:36:49.327' AS DateTime), -225, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1270, N'SE', CAST(N'2017-01-06T17:41:49.327' AS DateTime), -10.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1271, N'SE', CAST(N'2017-01-06T17:41:49.327' AS DateTime), -4.125, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1272, N'CA', CAST(N'2017-01-06T17:41:49.327' AS DateTime), -225, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1273, N'SE', CAST(N'2017-01-06T17:46:49.340' AS DateTime), -10.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1274, N'SE', CAST(N'2017-01-06T17:46:49.340' AS DateTime), -4.125, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1275, N'CA', CAST(N'2017-01-06T17:46:49.340' AS DateTime), -225, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1276, N'SE', CAST(N'2017-01-06T17:51:49.357' AS DateTime), -10.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1277, N'SE', CAST(N'2017-01-06T17:51:49.357' AS DateTime), -4.125, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1278, N'CA', CAST(N'2017-01-06T17:51:49.357' AS DateTime), -225, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1279, N'SE', CAST(N'2017-01-06T17:56:49.357' AS DateTime), -10.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1280, N'SE', CAST(N'2017-01-06T17:56:49.357' AS DateTime), -4.125, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1281, N'CA', CAST(N'2017-01-06T17:56:49.357' AS DateTime), -225, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1282, N'SE', CAST(N'2017-01-06T18:01:49.357' AS DateTime), -10.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1283, N'SE', CAST(N'2017-01-06T18:01:49.357' AS DateTime), -4.125, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1284, N'CA', CAST(N'2017-01-06T18:01:49.357' AS DateTime), -225, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1285, N'SE', CAST(N'2017-01-06T18:06:49.360' AS DateTime), -10.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1286, N'SE', CAST(N'2017-01-06T18:06:49.360' AS DateTime), -4.125, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1287, N'CA', CAST(N'2017-01-06T18:06:49.360' AS DateTime), -225, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1288, N'SE', CAST(N'2017-01-06T18:11:49.370' AS DateTime), -10.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1289, N'SE', CAST(N'2017-01-06T18:11:49.370' AS DateTime), -4.125, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1290, N'CA', CAST(N'2017-01-06T18:11:49.370' AS DateTime), -225, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1291, N'SE', CAST(N'2017-01-06T18:16:49.373' AS DateTime), -10.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1292, N'SE', CAST(N'2017-01-06T18:16:49.373' AS DateTime), -4.125, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1293, N'CA', CAST(N'2017-01-06T18:16:49.373' AS DateTime), -225, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1294, N'SE', CAST(N'2017-01-06T18:21:49.387' AS DateTime), -11, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1295, N'SE', CAST(N'2017-01-06T18:21:49.387' AS DateTime), -4.125, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1296, N'CA', CAST(N'2017-01-06T18:21:49.387' AS DateTime), -211, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1297, N'SE', CAST(N'2017-01-06T18:26:49.387' AS DateTime), -11, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1298, N'SE', CAST(N'2017-01-06T18:26:49.387' AS DateTime), -4.125, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1299, N'CA', CAST(N'2017-01-06T18:26:49.387' AS DateTime), -211, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1300, N'SE', CAST(N'2017-01-06T18:31:49.390' AS DateTime), -11, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1301, N'SE', CAST(N'2017-01-06T18:31:49.390' AS DateTime), -4.125, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1302, N'CA', CAST(N'2017-01-06T18:31:49.390' AS DateTime), -211, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1303, N'SE', CAST(N'2017-01-06T18:36:49.400' AS DateTime), -11, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1304, N'SE', CAST(N'2017-01-06T18:36:49.400' AS DateTime), -4.125, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1305, N'CA', CAST(N'2017-01-06T18:36:49.400' AS DateTime), -211, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1306, N'SE', CAST(N'2017-01-06T18:41:49.417' AS DateTime), -11, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1307, N'SE', CAST(N'2017-01-06T18:41:49.417' AS DateTime), -4.125, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1308, N'CA', CAST(N'2017-01-06T18:41:49.417' AS DateTime), -211, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1309, N'SE', CAST(N'2017-01-06T18:46:49.433' AS DateTime), -11.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1310, N'SE', CAST(N'2017-01-06T18:46:49.433' AS DateTime), -4.125, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1311, N'CA', CAST(N'2017-01-06T18:46:49.433' AS DateTime), -199, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1312, N'SE', CAST(N'2017-01-06T18:51:49.437' AS DateTime), -11, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1313, N'SE', CAST(N'2017-01-06T18:51:49.437' AS DateTime), -4.125, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1314, N'CA', CAST(N'2017-01-06T18:51:49.437' AS DateTime), -211, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1315, N'SE', CAST(N'2017-01-06T18:56:49.437' AS DateTime), -11, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1316, N'SE', CAST(N'2017-01-06T18:56:49.437' AS DateTime), -4.125, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1317, N'CA', CAST(N'2017-01-06T18:56:49.437' AS DateTime), -211, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1318, N'SE', CAST(N'2017-01-06T19:01:49.437' AS DateTime), -11, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1319, N'SE', CAST(N'2017-01-06T19:01:49.437' AS DateTime), -4.125, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1320, N'CA', CAST(N'2017-01-06T19:01:49.437' AS DateTime), -211, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1321, N'SE', CAST(N'2017-01-06T19:06:49.453' AS DateTime), -11.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1322, N'SE', CAST(N'2017-01-06T19:06:49.453' AS DateTime), -4.125, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1323, N'CA', CAST(N'2017-01-06T19:06:49.453' AS DateTime), -199, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1324, N'SE', CAST(N'2017-01-06T19:11:49.457' AS DateTime), -11, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1325, N'SE', CAST(N'2017-01-06T19:11:49.457' AS DateTime), -4.1875, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1326, N'CA', CAST(N'2017-01-06T19:11:49.457' AS DateTime), -216, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1327, N'SE', CAST(N'2017-01-06T19:16:49.473' AS DateTime), -11, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1328, N'SE', CAST(N'2017-01-06T19:16:49.473' AS DateTime), -4.125, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1329, N'CA', CAST(N'2017-01-06T19:16:49.473' AS DateTime), -211, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1330, N'SE', CAST(N'2017-01-06T19:21:49.490' AS DateTime), -11.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1331, N'SE', CAST(N'2017-01-06T19:21:49.490' AS DateTime), -4.1875, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1332, N'CA', CAST(N'2017-01-06T19:21:49.490' AS DateTime), -204, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1333, N'SE', CAST(N'2017-01-06T19:26:49.503' AS DateTime), -11.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1334, N'SE', CAST(N'2017-01-06T19:26:49.503' AS DateTime), -4.125, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1335, N'CA', CAST(N'2017-01-06T19:26:49.503' AS DateTime), -199, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1336, N'SE', CAST(N'2017-01-06T19:31:49.517' AS DateTime), -11.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1337, N'SE', CAST(N'2017-01-06T19:31:49.517' AS DateTime), -4.1875, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1338, N'CA', CAST(N'2017-01-06T19:31:49.517' AS DateTime), -204, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1339, N'SE', CAST(N'2017-01-06T19:36:49.517' AS DateTime), -11.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1340, N'SE', CAST(N'2017-01-06T19:36:49.517' AS DateTime), -4.1875, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1341, N'CA', CAST(N'2017-01-06T19:36:49.517' AS DateTime), -204, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1342, N'SE', CAST(N'2017-01-06T19:41:49.520' AS DateTime), -12, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1343, N'SE', CAST(N'2017-01-06T19:41:49.520' AS DateTime), -4.1875, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1344, N'CA', CAST(N'2017-01-06T19:41:49.520' AS DateTime), -193, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1345, N'SE', CAST(N'2017-01-06T19:46:49.520' AS DateTime), -12, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1346, N'SE', CAST(N'2017-01-06T19:46:49.520' AS DateTime), -4.1875, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1347, N'CA', CAST(N'2017-01-06T19:46:49.520' AS DateTime), -193, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1348, N'SE', CAST(N'2017-01-06T19:51:49.537' AS DateTime), -12, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1349, N'SE', CAST(N'2017-01-06T19:51:49.537' AS DateTime), -4.1875, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1350, N'CA', CAST(N'2017-01-06T19:51:49.537' AS DateTime), -193, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1351, N'SE', CAST(N'2017-01-06T19:56:49.553' AS DateTime), -11.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1352, N'SE', CAST(N'2017-01-06T19:56:49.553' AS DateTime), -4.1875, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1353, N'CA', CAST(N'2017-01-06T19:56:49.553' AS DateTime), -204, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1354, N'SE', CAST(N'2017-01-06T20:01:49.553' AS DateTime), -11.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1355, N'SE', CAST(N'2017-01-06T20:01:49.553' AS DateTime), -4.1875, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1356, N'CA', CAST(N'2017-01-06T20:01:49.553' AS DateTime), -204, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1357, N'SE', CAST(N'2017-01-06T20:06:49.560' AS DateTime), -11.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1358, N'SE', CAST(N'2017-01-06T20:06:49.560' AS DateTime), -4.1875, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1359, N'CA', CAST(N'2017-01-06T20:06:49.560' AS DateTime), -204, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1360, N'SE', CAST(N'2017-01-06T20:11:49.560' AS DateTime), -11.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1361, N'SE', CAST(N'2017-01-06T20:11:49.560' AS DateTime), -4.1875, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1362, N'CA', CAST(N'2017-01-06T20:11:49.560' AS DateTime), -204, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1363, N'SE', CAST(N'2017-01-06T20:16:49.567' AS DateTime), -11.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1364, N'SE', CAST(N'2017-01-06T20:16:49.567' AS DateTime), -4.1875, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1365, N'CA', CAST(N'2017-01-06T20:16:49.567' AS DateTime), -204, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1366, N'SE', CAST(N'2017-01-06T20:21:49.583' AS DateTime), -11.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1367, N'SE', CAST(N'2017-01-06T20:21:49.583' AS DateTime), -4.1875, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1368, N'CA', CAST(N'2017-01-06T20:21:49.583' AS DateTime), -204, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1369, N'SE', CAST(N'2017-01-06T20:26:49.583' AS DateTime), -11.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1370, N'SE', CAST(N'2017-01-06T20:26:49.583' AS DateTime), -4.1875, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1371, N'CA', CAST(N'2017-01-06T20:26:49.583' AS DateTime), -204, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1372, N'SE', CAST(N'2017-01-06T20:31:49.603' AS DateTime), -11.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1373, N'SE', CAST(N'2017-01-06T20:31:49.603' AS DateTime), -4.25, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1374, N'CA', CAST(N'2017-01-06T20:31:49.603' AS DateTime), -209, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1375, N'SE', CAST(N'2017-01-06T20:36:49.620' AS DateTime), -12, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1376, N'SE', CAST(N'2017-01-06T20:36:49.620' AS DateTime), -4.1875, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1377, N'CA', CAST(N'2017-01-06T20:36:49.620' AS DateTime), -193, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1378, N'SE', CAST(N'2017-01-06T20:41:49.633' AS DateTime), -12, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1379, N'SE', CAST(N'2017-01-06T20:41:49.633' AS DateTime), -4.25, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1380, N'CA', CAST(N'2017-01-06T20:41:49.633' AS DateTime), -197, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1381, N'SE', CAST(N'2017-01-06T20:46:49.640' AS DateTime), -12, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1382, N'SE', CAST(N'2017-01-06T20:46:49.640' AS DateTime), -4.25, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1383, N'CA', CAST(N'2017-01-06T20:46:49.640' AS DateTime), -197, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1384, N'SE', CAST(N'2017-01-06T20:51:49.643' AS DateTime), -12, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1385, N'SE', CAST(N'2017-01-06T20:51:49.643' AS DateTime), -4.25, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1386, N'CA', CAST(N'2017-01-06T20:51:49.643' AS DateTime), -197, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1387, N'SE', CAST(N'2017-01-06T20:56:49.660' AS DateTime), -12, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1388, N'SE', CAST(N'2017-01-06T20:56:49.660' AS DateTime), -4.25, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1389, N'CA', CAST(N'2017-01-06T20:56:49.660' AS DateTime), -197, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1390, N'SE', CAST(N'2017-01-06T21:01:49.660' AS DateTime), -12, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1391, N'SE', CAST(N'2017-01-06T21:01:49.660' AS DateTime), -4.25, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1392, N'CA', CAST(N'2017-01-06T21:01:49.660' AS DateTime), -197, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1393, N'SE', CAST(N'2017-01-06T21:06:49.670' AS DateTime), -12.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1394, N'SE', CAST(N'2017-01-06T21:06:49.670' AS DateTime), -4.25, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1395, N'CA', CAST(N'2017-01-06T21:06:49.670' AS DateTime), -187, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1396, N'SE', CAST(N'2017-01-06T21:11:49.683' AS DateTime), -12.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1397, N'SE', CAST(N'2017-01-06T21:11:49.683' AS DateTime), -4.25, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1398, N'CA', CAST(N'2017-01-06T21:11:49.683' AS DateTime), -187, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1399, N'SE', CAST(N'2017-01-06T21:16:49.700' AS DateTime), -12.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1400, N'SE', CAST(N'2017-01-06T21:16:49.700' AS DateTime), -4.25, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1401, N'CA', CAST(N'2017-01-06T21:16:49.700' AS DateTime), -187, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1402, N'SE', CAST(N'2017-01-06T21:21:49.700' AS DateTime), -12.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1403, N'SE', CAST(N'2017-01-06T21:21:49.700' AS DateTime), -4.25, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1404, N'CA', CAST(N'2017-01-06T21:21:49.700' AS DateTime), -187, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1405, N'SE', CAST(N'2017-01-06T21:26:49.700' AS DateTime), -12.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1406, N'SE', CAST(N'2017-01-06T21:26:49.700' AS DateTime), -4.25, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1407, N'CA', CAST(N'2017-01-06T21:26:49.700' AS DateTime), -187, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1408, N'SE', CAST(N'2017-01-06T21:31:49.703' AS DateTime), -12.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1409, N'SE', CAST(N'2017-01-06T21:31:49.703' AS DateTime), -4.25, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1410, N'CA', CAST(N'2017-01-06T21:31:49.703' AS DateTime), -187, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1411, N'SE', CAST(N'2017-01-06T21:36:49.703' AS DateTime), -12.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1412, N'SE', CAST(N'2017-01-06T21:36:49.703' AS DateTime), -4.25, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1413, N'CA', CAST(N'2017-01-06T21:36:49.703' AS DateTime), -187, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1414, N'SE', CAST(N'2017-01-06T21:41:49.703' AS DateTime), -12, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1415, N'SE', CAST(N'2017-01-06T21:41:49.703' AS DateTime), -4.25, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1416, N'CA', CAST(N'2017-01-06T21:41:49.703' AS DateTime), -197, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1417, N'SE', CAST(N'2017-01-06T21:46:49.723' AS DateTime), -12.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1418, N'SE', CAST(N'2017-01-06T21:46:49.723' AS DateTime), -4.25, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1419, N'CA', CAST(N'2017-01-06T21:46:49.723' AS DateTime), -187, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1420, N'SE', CAST(N'2017-01-06T21:51:49.740' AS DateTime), -12.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1421, N'SE', CAST(N'2017-01-06T21:51:49.740' AS DateTime), -4.25, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1422, N'CA', CAST(N'2017-01-06T21:51:49.740' AS DateTime), -187, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1423, N'SE', CAST(N'2017-01-06T21:56:49.757' AS DateTime), -12.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1424, N'SE', CAST(N'2017-01-06T21:56:49.757' AS DateTime), -4.25, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1425, N'CA', CAST(N'2017-01-06T21:56:49.757' AS DateTime), -187, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1426, N'SE', CAST(N'2017-01-06T22:01:49.773' AS DateTime), -12.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1427, N'SE', CAST(N'2017-01-06T22:01:49.773' AS DateTime), -4.25, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1428, N'CA', CAST(N'2017-01-06T22:01:49.773' AS DateTime), -187, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1429, N'SE', CAST(N'2017-01-06T22:06:49.777' AS DateTime), -12.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1430, N'SE', CAST(N'2017-01-06T22:06:49.777' AS DateTime), -4.25, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1431, N'CA', CAST(N'2017-01-06T22:06:49.777' AS DateTime), -187, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1432, N'SE', CAST(N'2017-01-06T22:11:49.793' AS DateTime), -12.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1433, N'SE', CAST(N'2017-01-06T22:11:49.793' AS DateTime), -4.25, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1434, N'CA', CAST(N'2017-01-06T22:11:49.793' AS DateTime), -187, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1435, N'SE', CAST(N'2017-01-06T22:16:49.810' AS DateTime), -13, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1436, N'SE', CAST(N'2017-01-06T22:16:49.810' AS DateTime), -4.3125, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1437, N'CA', CAST(N'2017-01-06T22:16:49.810' AS DateTime), -182, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1438, N'SE', CAST(N'2017-01-06T22:21:49.810' AS DateTime), -13, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1439, N'SE', CAST(N'2017-01-06T22:21:49.810' AS DateTime), -4.3125, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1440, N'CA', CAST(N'2017-01-06T22:21:49.810' AS DateTime), -182, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1441, N'SE', CAST(N'2017-01-06T22:26:49.827' AS DateTime), -13, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1442, N'SE', CAST(N'2017-01-06T22:26:49.827' AS DateTime), -4.3125, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1443, N'CA', CAST(N'2017-01-06T22:26:49.827' AS DateTime), -182, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1444, N'SE', CAST(N'2017-01-06T22:31:49.827' AS DateTime), -12.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1445, N'SE', CAST(N'2017-01-06T22:31:49.827' AS DateTime), -4.3125, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1446, N'CA', CAST(N'2017-01-06T22:31:49.827' AS DateTime), -191, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1447, N'SE', CAST(N'2017-01-06T22:36:49.830' AS DateTime), -12.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1448, N'SE', CAST(N'2017-01-06T22:36:49.830' AS DateTime), -4.3125, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1449, N'CA', CAST(N'2017-01-06T22:36:49.830' AS DateTime), -191, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1450, N'SE', CAST(N'2017-01-06T22:41:49.830' AS DateTime), -13, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1451, N'SE', CAST(N'2017-01-06T22:41:49.830' AS DateTime), -4.3125, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1452, N'CA', CAST(N'2017-01-06T22:41:49.830' AS DateTime), -182, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1453, N'SE', CAST(N'2017-01-06T22:46:49.847' AS DateTime), -12.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1454, N'SE', CAST(N'2017-01-06T22:46:49.847' AS DateTime), -4.3125, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1455, N'CA', CAST(N'2017-01-06T22:46:49.847' AS DateTime), -191, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1456, N'SE', CAST(N'2017-01-06T22:51:49.860' AS DateTime), -13, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1457, N'SE', CAST(N'2017-01-06T22:51:49.860' AS DateTime), -4.3125, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1458, N'CA', CAST(N'2017-01-06T22:51:49.860' AS DateTime), -182, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1459, N'SE', CAST(N'2017-01-06T22:56:49.877' AS DateTime), -13, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1460, N'SE', CAST(N'2017-01-06T22:56:49.877' AS DateTime), -4.3125, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1461, N'CA', CAST(N'2017-01-06T22:56:49.877' AS DateTime), -182, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1462, N'SE', CAST(N'2017-01-06T23:01:49.893' AS DateTime), -12.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1463, N'SE', CAST(N'2017-01-06T23:01:49.893' AS DateTime), -4.3125, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1464, N'CA', CAST(N'2017-01-06T23:01:49.893' AS DateTime), -191, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1465, N'SE', CAST(N'2017-01-06T23:06:49.897' AS DateTime), -13, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1466, N'SE', CAST(N'2017-01-06T23:06:49.897' AS DateTime), -4.3125, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1467, N'CA', CAST(N'2017-01-06T23:06:49.897' AS DateTime), -182, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1468, N'SE', CAST(N'2017-01-06T23:11:49.903' AS DateTime), -13, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1469, N'SE', CAST(N'2017-01-06T23:11:49.903' AS DateTime), -4.3125, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1470, N'CA', CAST(N'2017-01-06T23:11:49.903' AS DateTime), -182, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1471, N'SE', CAST(N'2017-01-06T23:16:49.903' AS DateTime), -13, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1472, N'SE', CAST(N'2017-01-06T23:16:49.903' AS DateTime), -4.3125, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1473, N'CA', CAST(N'2017-01-06T23:16:49.903' AS DateTime), -182, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1474, N'SE', CAST(N'2017-01-06T23:21:49.920' AS DateTime), -13, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1475, N'SE', CAST(N'2017-01-06T23:21:49.920' AS DateTime), -4.3125, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1476, N'CA', CAST(N'2017-01-06T23:21:49.920' AS DateTime), -182, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1477, N'SE', CAST(N'2017-01-06T23:26:49.923' AS DateTime), -13, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1478, N'SE', CAST(N'2017-01-06T23:26:49.923' AS DateTime), -4.3125, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1479, N'CA', CAST(N'2017-01-06T23:26:49.923' AS DateTime), -182, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1480, N'SE', CAST(N'2017-01-06T23:31:49.923' AS DateTime), -12.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1481, N'SE', CAST(N'2017-01-06T23:31:49.923' AS DateTime), -4.3125, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1482, N'CA', CAST(N'2017-01-06T23:31:49.923' AS DateTime), -191, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1483, N'SE', CAST(N'2017-01-06T23:36:49.923' AS DateTime), -12.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1484, N'SE', CAST(N'2017-01-06T23:36:49.923' AS DateTime), -4.375, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1485, N'CA', CAST(N'2017-01-06T23:36:49.923' AS DateTime), -196, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1486, N'SE', CAST(N'2017-01-06T23:41:49.940' AS DateTime), -13, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1487, N'SE', CAST(N'2017-01-06T23:41:49.940' AS DateTime), -4.375, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1488, N'CA', CAST(N'2017-01-06T23:41:49.940' AS DateTime), -186, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1489, N'SE', CAST(N'2017-01-06T23:46:49.943' AS DateTime), -13, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1490, N'SE', CAST(N'2017-01-06T23:46:49.943' AS DateTime), -4.375, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1491, N'CA', CAST(N'2017-01-06T23:46:49.943' AS DateTime), -186, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1492, N'SE', CAST(N'2017-01-06T23:51:49.943' AS DateTime), -13, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1493, N'SE', CAST(N'2017-01-06T23:51:49.943' AS DateTime), -4.375, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1494, N'CA', CAST(N'2017-01-06T23:51:49.943' AS DateTime), -186, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1495, N'SE', CAST(N'2017-01-06T23:56:49.947' AS DateTime), -13, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1496, N'SE', CAST(N'2017-01-06T23:56:49.947' AS DateTime), -4.375, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1497, N'CA', CAST(N'2017-01-06T23:56:49.947' AS DateTime), -186, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1498, N'SE', CAST(N'2017-01-07T00:01:49.957' AS DateTime), -13.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1499, N'SE', CAST(N'2017-01-07T00:01:49.957' AS DateTime), -4.375, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1500, N'CA', CAST(N'2017-01-07T00:01:49.957' AS DateTime), -177, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1501, N'SE', CAST(N'2017-01-07T00:06:49.973' AS DateTime), -13.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1502, N'SE', CAST(N'2017-01-07T00:06:49.973' AS DateTime), -4.375, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1503, N'CA', CAST(N'2017-01-07T00:06:49.973' AS DateTime), -177, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1504, N'SE', CAST(N'2017-01-07T00:11:49.990' AS DateTime), -13.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1505, N'SE', CAST(N'2017-01-07T00:11:49.990' AS DateTime), -4.375, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1506, N'CA', CAST(N'2017-01-07T00:11:49.990' AS DateTime), -177, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1507, N'SE', CAST(N'2017-01-07T00:16:49.997' AS DateTime), -13.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1508, N'SE', CAST(N'2017-01-07T00:16:49.997' AS DateTime), -4.375, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1509, N'CA', CAST(N'2017-01-07T00:16:49.997' AS DateTime), -177, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1510, N'SE', CAST(N'2017-01-07T00:21:49.997' AS DateTime), -13.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1511, N'SE', CAST(N'2017-01-07T00:21:49.997' AS DateTime), -4.375, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1512, N'CA', CAST(N'2017-01-07T00:21:49.997' AS DateTime), -177, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1513, N'SE', CAST(N'2017-01-07T00:26:50.017' AS DateTime), -13.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1514, N'SE', CAST(N'2017-01-07T00:26:50.017' AS DateTime), -4.375, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1515, N'CA', CAST(N'2017-01-07T00:26:50.017' AS DateTime), -177, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1516, N'SE', CAST(N'2017-01-07T00:31:50.017' AS DateTime), -13.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1517, N'SE', CAST(N'2017-01-07T00:31:50.017' AS DateTime), -4.375, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1518, N'CA', CAST(N'2017-01-07T00:31:50.017' AS DateTime), -177, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1519, N'SE', CAST(N'2017-01-07T00:36:50.020' AS DateTime), -13.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1520, N'SE', CAST(N'2017-01-07T00:36:50.020' AS DateTime), -4.375, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1521, N'CA', CAST(N'2017-01-07T00:36:50.020' AS DateTime), -177, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1522, N'SE', CAST(N'2017-01-07T00:41:50.037' AS DateTime), -13.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1523, N'SE', CAST(N'2017-01-07T00:41:50.037' AS DateTime), -4.375, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1524, N'CA', CAST(N'2017-01-07T00:41:50.037' AS DateTime), -177, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1525, N'SE', CAST(N'2017-01-07T00:46:50.037' AS DateTime), -13.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1526, N'SE', CAST(N'2017-01-07T00:46:50.037' AS DateTime), -4.4375, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1527, N'CA', CAST(N'2017-01-07T00:46:50.037' AS DateTime), -181, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1528, N'SE', CAST(N'2017-01-07T00:51:50.050' AS DateTime), -13.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1529, N'SE', CAST(N'2017-01-07T00:51:50.050' AS DateTime), -4.4375, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1530, N'CA', CAST(N'2017-01-07T00:51:50.050' AS DateTime), -181, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1531, N'SE', CAST(N'2017-01-07T00:56:50.050' AS DateTime), -13, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1532, N'SE', CAST(N'2017-01-07T00:56:50.050' AS DateTime), -4.4375, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1533, N'CA', CAST(N'2017-01-07T00:56:50.050' AS DateTime), -190, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1534, N'SE', CAST(N'2017-01-07T01:01:50.050' AS DateTime), -13, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1535, N'SE', CAST(N'2017-01-07T01:01:50.050' AS DateTime), -4.4375, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1536, N'CA', CAST(N'2017-01-07T01:01:50.050' AS DateTime), -190, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1537, N'SE', CAST(N'2017-01-07T01:06:50.053' AS DateTime), -13, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1538, N'SE', CAST(N'2017-01-07T01:06:50.053' AS DateTime), -4.4375, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1539, N'CA', CAST(N'2017-01-07T01:06:50.053' AS DateTime), -190, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1540, N'SE', CAST(N'2017-01-07T01:11:50.030' AS DateTime), -13, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1541, N'SE', CAST(N'2017-01-07T01:11:50.030' AS DateTime), -4.4375, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1542, N'CA', CAST(N'2017-01-07T01:11:50.030' AS DateTime), -190, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1543, N'SE', CAST(N'2017-01-07T01:16:50.007' AS DateTime), -13, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1544, N'SE', CAST(N'2017-01-07T01:16:50.007' AS DateTime), -4.4375, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1545, N'CA', CAST(N'2017-01-07T01:16:50.007' AS DateTime), -190, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1546, N'SE', CAST(N'2017-01-07T01:21:49.987' AS DateTime), -13, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1547, N'SE', CAST(N'2017-01-07T01:21:49.987' AS DateTime), -4.4375, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1548, N'CA', CAST(N'2017-01-07T01:21:49.987' AS DateTime), -190, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1549, N'SE', CAST(N'2017-01-07T01:26:49.950' AS DateTime), -13, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1550, N'SE', CAST(N'2017-01-07T01:26:49.950' AS DateTime), -4.4375, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1551, N'CA', CAST(N'2017-01-07T01:26:49.950' AS DateTime), -190, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1552, N'SE', CAST(N'2017-01-07T01:31:49.923' AS DateTime), -13, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1553, N'SE', CAST(N'2017-01-07T01:31:49.923' AS DateTime), -4.4375, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1554, N'CA', CAST(N'2017-01-07T01:31:49.923' AS DateTime), -190, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1555, N'SE', CAST(N'2017-01-07T01:36:49.897' AS DateTime), -13, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1556, N'SE', CAST(N'2017-01-07T01:36:49.897' AS DateTime), -4.4375, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1557, N'CA', CAST(N'2017-01-07T01:36:49.897' AS DateTime), -190, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1558, N'SE', CAST(N'2017-01-07T01:41:49.883' AS DateTime), -13, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1559, N'SE', CAST(N'2017-01-07T01:41:49.883' AS DateTime), -4.4375, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1560, N'CA', CAST(N'2017-01-07T01:41:49.883' AS DateTime), -190, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1561, N'SE', CAST(N'2017-01-07T01:46:49.873' AS DateTime), -13, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1562, N'SE', CAST(N'2017-01-07T01:46:49.873' AS DateTime), -4.4375, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1563, N'CA', CAST(N'2017-01-07T01:46:49.873' AS DateTime), -190, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1564, N'SE', CAST(N'2017-01-07T01:51:49.853' AS DateTime), -13, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1565, N'SE', CAST(N'2017-01-07T01:51:49.853' AS DateTime), -4.4375, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1566, N'CA', CAST(N'2017-01-07T01:51:49.853' AS DateTime), -190, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1567, N'SE', CAST(N'2017-01-07T01:56:49.847' AS DateTime), -13, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1568, N'SE', CAST(N'2017-01-07T01:56:49.847' AS DateTime), -4.4375, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1569, N'CA', CAST(N'2017-01-07T01:56:49.847' AS DateTime), -190, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1570, N'SE', CAST(N'2017-01-07T02:01:49.833' AS DateTime), -13, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1571, N'SE', CAST(N'2017-01-07T02:01:49.833' AS DateTime), -4.5, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1572, N'CA', CAST(N'2017-01-07T02:01:49.833' AS DateTime), -194, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1573, N'SE', CAST(N'2017-01-07T02:06:49.827' AS DateTime), -13, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1574, N'SE', CAST(N'2017-01-07T02:06:49.827' AS DateTime), -4.5, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1575, N'CA', CAST(N'2017-01-07T02:06:49.827' AS DateTime), -194, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1576, N'SE', CAST(N'2017-01-07T02:11:49.817' AS DateTime), -13, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1577, N'SE', CAST(N'2017-01-07T02:11:49.817' AS DateTime), -4.5, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1578, N'CA', CAST(N'2017-01-07T02:11:49.817' AS DateTime), -194, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1579, N'SE', CAST(N'2017-01-07T02:16:49.817' AS DateTime), -13, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1580, N'SE', CAST(N'2017-01-07T02:16:49.817' AS DateTime), -4.5, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1581, N'CA', CAST(N'2017-01-07T02:16:49.817' AS DateTime), -194, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1582, N'SE', CAST(N'2017-01-07T02:21:49.817' AS DateTime), -13, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1583, N'SE', CAST(N'2017-01-07T02:21:49.817' AS DateTime), -4.5, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1584, N'CA', CAST(N'2017-01-07T02:21:49.817' AS DateTime), -194, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1585, N'SE', CAST(N'2017-01-07T02:26:49.803' AS DateTime), -13, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1586, N'SE', CAST(N'2017-01-07T02:26:49.803' AS DateTime), -4.5, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1587, N'CA', CAST(N'2017-01-07T02:26:49.803' AS DateTime), -194, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1588, N'SE', CAST(N'2017-01-07T02:31:49.797' AS DateTime), -13, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1589, N'SE', CAST(N'2017-01-07T02:31:49.797' AS DateTime), -4.5, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1590, N'CA', CAST(N'2017-01-07T02:31:49.797' AS DateTime), -194, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1591, N'SE', CAST(N'2017-01-07T02:36:49.807' AS DateTime), -12.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1592, N'SE', CAST(N'2017-01-07T02:36:49.807' AS DateTime), -4.5, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1593, N'CA', CAST(N'2017-01-07T02:36:49.807' AS DateTime), -205, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1594, N'SE', CAST(N'2017-01-07T02:41:49.810' AS DateTime), -12.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1595, N'SE', CAST(N'2017-01-07T02:41:49.810' AS DateTime), -4.5, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1596, N'CA', CAST(N'2017-01-07T02:41:49.810' AS DateTime), -205, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1597, N'SE', CAST(N'2017-01-07T02:46:49.817' AS DateTime), -12.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1598, N'SE', CAST(N'2017-01-07T02:46:49.817' AS DateTime), -4.5, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1599, N'CA', CAST(N'2017-01-07T02:46:49.817' AS DateTime), -205, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1600, N'SE', CAST(N'2017-01-07T02:51:49.817' AS DateTime), -12.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1601, N'SE', CAST(N'2017-01-07T02:51:49.817' AS DateTime), -4.5, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1602, N'CA', CAST(N'2017-01-07T02:51:49.817' AS DateTime), -205, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1603, N'SE', CAST(N'2017-01-07T02:56:49.823' AS DateTime), -12.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1604, N'SE', CAST(N'2017-01-07T02:56:49.823' AS DateTime), -4.5, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1605, N'CA', CAST(N'2017-01-07T02:56:49.823' AS DateTime), -205, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1606, N'SE', CAST(N'2017-01-07T03:01:49.830' AS DateTime), -12.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1607, N'SE', CAST(N'2017-01-07T03:01:49.830' AS DateTime), -4.5625, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1608, N'CA', CAST(N'2017-01-07T03:01:49.830' AS DateTime), -209, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1609, N'SE', CAST(N'2017-01-07T03:06:49.820' AS DateTime), -12.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1610, N'SE', CAST(N'2017-01-07T03:06:49.820' AS DateTime), -4.5, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1611, N'CA', CAST(N'2017-01-07T03:06:49.820' AS DateTime), -205, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1612, N'SE', CAST(N'2017-01-07T03:11:49.813' AS DateTime), -12.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1613, N'SE', CAST(N'2017-01-07T03:11:49.813' AS DateTime), -4.5625, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1614, N'CA', CAST(N'2017-01-07T03:11:49.813' AS DateTime), -209, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1615, N'SE', CAST(N'2017-01-07T03:16:49.807' AS DateTime), -12.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1616, N'SE', CAST(N'2017-01-07T03:16:49.807' AS DateTime), -4.5625, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1617, N'CA', CAST(N'2017-01-07T03:16:49.807' AS DateTime), -209, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1618, N'SE', CAST(N'2017-01-07T03:21:49.797' AS DateTime), -12.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1619, N'SE', CAST(N'2017-01-07T03:21:49.797' AS DateTime), -4.5625, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1620, N'CA', CAST(N'2017-01-07T03:21:49.797' AS DateTime), -209, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1621, N'SE', CAST(N'2017-01-07T03:26:49.807' AS DateTime), -12.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1622, N'SE', CAST(N'2017-01-07T03:26:49.807' AS DateTime), -4.5625, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1623, N'CA', CAST(N'2017-01-07T03:26:49.807' AS DateTime), -209, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1624, N'SE', CAST(N'2017-01-07T03:31:49.820' AS DateTime), -12.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1625, N'SE', CAST(N'2017-01-07T03:31:49.820' AS DateTime), -4.5625, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1626, N'CA', CAST(N'2017-01-07T03:31:49.820' AS DateTime), -209, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1627, N'SE', CAST(N'2017-01-07T03:36:49.830' AS DateTime), -12.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1628, N'SE', CAST(N'2017-01-07T03:36:49.830' AS DateTime), -4.5625, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1629, N'CA', CAST(N'2017-01-07T03:36:49.830' AS DateTime), -209, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1630, N'SE', CAST(N'2017-01-07T03:41:49.837' AS DateTime), -12.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1631, N'SE', CAST(N'2017-01-07T03:41:49.837' AS DateTime), -4.5625, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1632, N'CA', CAST(N'2017-01-07T03:41:49.837' AS DateTime), -209, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1633, N'SE', CAST(N'2017-01-07T03:46:49.847' AS DateTime), -12.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1634, N'SE', CAST(N'2017-01-07T03:46:49.847' AS DateTime), -4.5625, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1635, N'CA', CAST(N'2017-01-07T03:46:49.847' AS DateTime), -209, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1636, N'SE', CAST(N'2017-01-07T03:51:49.843' AS DateTime), -12, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1637, N'SE', CAST(N'2017-01-07T03:51:49.843' AS DateTime), -4.5625, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1638, N'CA', CAST(N'2017-01-07T03:51:49.843' AS DateTime), -221, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1639, N'SE', CAST(N'2017-01-07T03:56:49.857' AS DateTime), -12, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1640, N'SE', CAST(N'2017-01-07T03:56:49.857' AS DateTime), -4.5625, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1641, N'CA', CAST(N'2017-01-07T03:56:49.857' AS DateTime), -221, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1642, N'SE', CAST(N'2017-01-07T04:01:49.853' AS DateTime), -12, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1643, N'SE', CAST(N'2017-01-07T04:01:49.853' AS DateTime), -4.5625, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1644, N'CA', CAST(N'2017-01-07T04:01:49.853' AS DateTime), -221, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1645, N'SE', CAST(N'2017-01-07T04:06:49.867' AS DateTime), -12, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1646, N'SE', CAST(N'2017-01-07T04:06:49.867' AS DateTime), -4.5625, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1647, N'CA', CAST(N'2017-01-07T04:06:49.867' AS DateTime), -221, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1648, N'SE', CAST(N'2017-01-07T04:11:49.877' AS DateTime), -12, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1649, N'SE', CAST(N'2017-01-07T04:11:49.877' AS DateTime), -4.625, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1650, N'CA', CAST(N'2017-01-07T04:11:49.877' AS DateTime), -225, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1651, N'SE', CAST(N'2017-01-07T04:16:49.877' AS DateTime), -12, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1652, N'SE', CAST(N'2017-01-07T04:16:49.877' AS DateTime), -4.625, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1653, N'CA', CAST(N'2017-01-07T04:16:49.877' AS DateTime), -225, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1654, N'SE', CAST(N'2017-01-07T04:21:49.873' AS DateTime), -12, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1655, N'SE', CAST(N'2017-01-07T04:21:49.873' AS DateTime), -4.625, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1656, N'CA', CAST(N'2017-01-07T04:21:49.873' AS DateTime), -225, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1657, N'SE', CAST(N'2017-01-07T04:26:49.870' AS DateTime), -12.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1658, N'SE', CAST(N'2017-01-07T04:26:49.870' AS DateTime), -4.625, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1659, N'CA', CAST(N'2017-01-07T04:26:49.870' AS DateTime), -213, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1660, N'SE', CAST(N'2017-01-07T04:31:49.867' AS DateTime), -12.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1661, N'SE', CAST(N'2017-01-07T04:31:49.867' AS DateTime), -4.625, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1662, N'CA', CAST(N'2017-01-07T04:31:49.867' AS DateTime), -213, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1663, N'SE', CAST(N'2017-01-07T04:36:49.883' AS DateTime), -12.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1664, N'SE', CAST(N'2017-01-07T04:36:49.883' AS DateTime), -4.625, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1665, N'CA', CAST(N'2017-01-07T04:36:49.883' AS DateTime), -213, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1666, N'SE', CAST(N'2017-01-07T04:41:49.897' AS DateTime), -12.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1667, N'SE', CAST(N'2017-01-07T04:41:49.897' AS DateTime), -4.625, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1668, N'CA', CAST(N'2017-01-07T04:41:49.897' AS DateTime), -213, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1669, N'SE', CAST(N'2017-01-07T04:46:49.910' AS DateTime), -12, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1670, N'SE', CAST(N'2017-01-07T04:46:49.910' AS DateTime), -4.625, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1671, N'CA', CAST(N'2017-01-07T04:46:49.910' AS DateTime), -225, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1672, N'SE', CAST(N'2017-01-07T04:51:49.927' AS DateTime), -12.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1673, N'SE', CAST(N'2017-01-07T04:51:49.927' AS DateTime), -4.625, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1674, N'CA', CAST(N'2017-01-07T04:51:49.927' AS DateTime), -213, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1675, N'SE', CAST(N'2017-01-07T04:56:49.923' AS DateTime), -12, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1676, N'SE', CAST(N'2017-01-07T04:56:49.923' AS DateTime), -4.625, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1677, N'CA', CAST(N'2017-01-07T04:56:49.923' AS DateTime), -225, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1678, N'SE', CAST(N'2017-01-07T05:01:49.940' AS DateTime), -12, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1679, N'SE', CAST(N'2017-01-07T05:01:49.940' AS DateTime), -4.625, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1680, N'CA', CAST(N'2017-01-07T05:01:49.940' AS DateTime), -225, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1681, N'SE', CAST(N'2017-01-07T05:06:49.953' AS DateTime), -12, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1682, N'SE', CAST(N'2017-01-07T05:06:49.953' AS DateTime), -4.625, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1683, N'CA', CAST(N'2017-01-07T05:06:49.953' AS DateTime), -225, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1684, N'SE', CAST(N'2017-01-07T05:11:49.967' AS DateTime), -12, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1685, N'SE', CAST(N'2017-01-07T05:11:49.967' AS DateTime), -4.6875, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1686, N'CA', CAST(N'2017-01-07T05:11:49.967' AS DateTime), -230, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1687, N'SE', CAST(N'2017-01-07T05:16:49.983' AS DateTime), -12, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1688, N'SE', CAST(N'2017-01-07T05:16:49.983' AS DateTime), -4.6875, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1689, N'CA', CAST(N'2017-01-07T05:16:49.983' AS DateTime), -230, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1690, N'SE', CAST(N'2017-01-07T05:21:49.987' AS DateTime), -12, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1691, N'SE', CAST(N'2017-01-07T05:21:49.987' AS DateTime), -4.6875, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1692, N'CA', CAST(N'2017-01-07T05:21:49.987' AS DateTime), -230, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1693, N'SE', CAST(N'2017-01-07T05:26:49.987' AS DateTime), -12, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1694, N'SE', CAST(N'2017-01-07T05:26:49.987' AS DateTime), -4.6875, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1695, N'CA', CAST(N'2017-01-07T05:26:49.987' AS DateTime), -230, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1696, N'SE', CAST(N'2017-01-07T05:31:49.993' AS DateTime), -12, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1697, N'SE', CAST(N'2017-01-07T05:31:49.993' AS DateTime), -4.6875, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1698, N'CA', CAST(N'2017-01-07T05:31:49.993' AS DateTime), -230, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1699, N'SE', CAST(N'2017-01-07T05:36:49.997' AS DateTime), -11.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1700, N'SE', CAST(N'2017-01-07T05:36:49.997' AS DateTime), -4.6875, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1701, N'CA', CAST(N'2017-01-07T05:36:49.997' AS DateTime), -244, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1702, N'SE', CAST(N'2017-01-07T05:41:50.010' AS DateTime), -12.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1703, N'SE', CAST(N'2017-01-07T05:41:50.010' AS DateTime), -4.6875, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1704, N'CA', CAST(N'2017-01-07T05:41:50.010' AS DateTime), -218, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1705, N'SE', CAST(N'2017-01-07T05:46:50.010' AS DateTime), -12, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1706, N'SE', CAST(N'2017-01-07T05:46:50.010' AS DateTime), -4.6875, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1707, N'CA', CAST(N'2017-01-07T05:46:50.010' AS DateTime), -230, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1708, N'SE', CAST(N'2017-01-07T05:51:50.010' AS DateTime), -12, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1709, N'SE', CAST(N'2017-01-07T05:51:50.010' AS DateTime), -4.6875, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1710, N'CA', CAST(N'2017-01-07T05:51:50.010' AS DateTime), -230, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1711, N'SE', CAST(N'2017-01-07T05:56:50.023' AS DateTime), -12, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1712, N'SE', CAST(N'2017-01-07T05:56:50.023' AS DateTime), -4.6875, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1713, N'CA', CAST(N'2017-01-07T05:56:50.023' AS DateTime), -230, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1714, N'SE', CAST(N'2017-01-07T06:01:50.040' AS DateTime), -12, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1715, N'SE', CAST(N'2017-01-07T06:01:50.040' AS DateTime), -4.6875, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1716, N'CA', CAST(N'2017-01-07T06:01:50.040' AS DateTime), -230, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1717, N'SE', CAST(N'2017-01-07T06:06:50.050' AS DateTime), -12, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1718, N'SE', CAST(N'2017-01-07T06:06:50.050' AS DateTime), -4.6875, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1719, N'CA', CAST(N'2017-01-07T06:06:50.050' AS DateTime), -230, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1720, N'SE', CAST(N'2017-01-07T06:11:50.067' AS DateTime), -11.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1721, N'SE', CAST(N'2017-01-07T06:11:50.067' AS DateTime), -4.75, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1722, N'CA', CAST(N'2017-01-07T06:11:50.067' AS DateTime), -249, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1723, N'SE', CAST(N'2017-01-07T06:16:50.067' AS DateTime), -11.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1724, N'SE', CAST(N'2017-01-07T06:16:50.067' AS DateTime), -4.75, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1725, N'CA', CAST(N'2017-01-07T06:16:50.067' AS DateTime), -249, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1726, N'SE', CAST(N'2017-01-07T06:21:50.080' AS DateTime), -11.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1727, N'SE', CAST(N'2017-01-07T06:21:50.080' AS DateTime), -4.75, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1728, N'CA', CAST(N'2017-01-07T06:21:50.080' AS DateTime), -249, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1729, N'SE', CAST(N'2017-01-07T06:26:50.093' AS DateTime), -11, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1730, N'SE', CAST(N'2017-01-07T06:26:50.093' AS DateTime), -4.75, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1731, N'CA', CAST(N'2017-01-07T06:26:50.093' AS DateTime), -265, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1732, N'SE', CAST(N'2017-01-07T06:31:50.107' AS DateTime), -11, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1733, N'SE', CAST(N'2017-01-07T06:31:50.107' AS DateTime), -4.75, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1734, N'CA', CAST(N'2017-01-07T06:31:50.107' AS DateTime), -265, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1735, N'SE', CAST(N'2017-01-07T06:36:50.113' AS DateTime), -10, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1736, N'SE', CAST(N'2017-01-07T06:36:50.113' AS DateTime), -4.75, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1737, N'CA', CAST(N'2017-01-07T06:36:50.113' AS DateTime), -304, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1738, N'SE', CAST(N'2017-01-07T06:41:50.127' AS DateTime), -10.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1739, N'SE', CAST(N'2017-01-07T06:41:50.127' AS DateTime), -4.75, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1740, N'CA', CAST(N'2017-01-07T06:41:50.127' AS DateTime), -283, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1741, N'SE', CAST(N'2017-01-07T06:46:50.137' AS DateTime), -10.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1742, N'SE', CAST(N'2017-01-07T06:46:50.137' AS DateTime), -4.75, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1743, N'CA', CAST(N'2017-01-07T06:46:50.137' AS DateTime), -283, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1744, N'SE', CAST(N'2017-01-07T06:51:50.137' AS DateTime), -10.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1745, N'SE', CAST(N'2017-01-07T06:51:50.137' AS DateTime), -4.75, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1746, N'CA', CAST(N'2017-01-07T06:51:50.137' AS DateTime), -283, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1747, N'SE', CAST(N'2017-01-07T06:56:50.150' AS DateTime), -10, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1748, N'SE', CAST(N'2017-01-07T06:56:50.150' AS DateTime), -4.75, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1749, N'CA', CAST(N'2017-01-07T06:56:50.150' AS DateTime), -304, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1750, N'SE', CAST(N'2017-01-07T07:01:50.150' AS DateTime), -10.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1751, N'SE', CAST(N'2017-01-07T07:01:50.150' AS DateTime), -4.75, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1752, N'CA', CAST(N'2017-01-07T07:01:50.150' AS DateTime), -283, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1753, N'SE', CAST(N'2017-01-07T07:06:50.150' AS DateTime), -10.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1754, N'SE', CAST(N'2017-01-07T07:06:50.150' AS DateTime), -4.75, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1755, N'CA', CAST(N'2017-01-07T07:06:50.150' AS DateTime), -283, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1756, N'SE', CAST(N'2017-01-07T07:11:50.150' AS DateTime), -10.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1757, N'SE', CAST(N'2017-01-07T07:11:50.150' AS DateTime), -4.75, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1758, N'CA', CAST(N'2017-01-07T07:11:50.150' AS DateTime), -283, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1759, N'SE', CAST(N'2017-01-07T07:16:50.150' AS DateTime), -10.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1760, N'SE', CAST(N'2017-01-07T07:16:50.150' AS DateTime), -4.75, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1761, N'CA', CAST(N'2017-01-07T07:16:50.150' AS DateTime), -283, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1762, N'SE', CAST(N'2017-01-07T07:21:50.147' AS DateTime), -10.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1763, N'SE', CAST(N'2017-01-07T07:21:50.147' AS DateTime), -4.8125, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1764, N'CA', CAST(N'2017-01-07T07:21:50.147' AS DateTime), -289, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1765, N'SE', CAST(N'2017-01-07T07:26:50.147' AS DateTime), -10, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1766, N'SE', CAST(N'2017-01-07T07:26:50.147' AS DateTime), -4.8125, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1767, N'CA', CAST(N'2017-01-07T07:26:50.147' AS DateTime), -311, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1768, N'SE', CAST(N'2017-01-07T07:31:50.160' AS DateTime), -10.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1769, N'SE', CAST(N'2017-01-07T07:31:50.160' AS DateTime), -4.8125, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1770, N'CA', CAST(N'2017-01-07T07:31:50.160' AS DateTime), -289, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1771, N'SE', CAST(N'2017-01-07T07:36:50.177' AS DateTime), -10.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1772, N'SE', CAST(N'2017-01-07T07:36:50.177' AS DateTime), -4.8125, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1773, N'CA', CAST(N'2017-01-07T07:36:50.177' AS DateTime), -289, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1774, N'SE', CAST(N'2017-01-07T07:41:50.180' AS DateTime), -10, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1775, N'SE', CAST(N'2017-01-07T07:41:50.180' AS DateTime), -4.8125, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1776, N'CA', CAST(N'2017-01-07T07:41:50.180' AS DateTime), -311, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1777, N'SE', CAST(N'2017-01-07T07:46:50.190' AS DateTime), -10, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1778, N'SE', CAST(N'2017-01-07T07:46:50.190' AS DateTime), -5.4375, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1779, N'CA', CAST(N'2017-01-07T07:46:50.190' AS DateTime), -383, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1780, N'SE', CAST(N'2017-01-07T07:51:50.193' AS DateTime), -10, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1781, N'SE', CAST(N'2017-01-07T07:51:50.193' AS DateTime), -5.375, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1782, N'CA', CAST(N'2017-01-07T07:51:50.193' AS DateTime), -376, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1783, N'SE', CAST(N'2017-01-07T07:56:50.203' AS DateTime), -10, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1784, N'SE', CAST(N'2017-01-07T07:56:50.203' AS DateTime), -5.375, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1785, N'CA', CAST(N'2017-01-07T07:56:50.203' AS DateTime), -376, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1786, N'SE', CAST(N'2017-01-07T08:01:50.220' AS DateTime), -10, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1787, N'SE', CAST(N'2017-01-07T08:01:50.220' AS DateTime), -5.4375, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1788, N'CA', CAST(N'2017-01-07T08:01:50.220' AS DateTime), -383, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1789, N'SE', CAST(N'2017-01-07T08:06:50.240' AS DateTime), -10, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1790, N'SE', CAST(N'2017-01-07T08:06:50.240' AS DateTime), -5.4375, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1791, N'CA', CAST(N'2017-01-07T08:06:50.240' AS DateTime), -383, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1792, N'SE', CAST(N'2017-01-07T08:11:50.257' AS DateTime), -10, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1793, N'SE', CAST(N'2017-01-07T08:11:50.257' AS DateTime), -5.4375, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1794, N'CA', CAST(N'2017-01-07T08:11:50.257' AS DateTime), -383, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1795, N'SE', CAST(N'2017-01-07T08:16:50.260' AS DateTime), -9.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1796, N'SE', CAST(N'2017-01-07T08:16:50.260' AS DateTime), -5.4375, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1797, N'CA', CAST(N'2017-01-07T08:16:50.260' AS DateTime), -417, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1798, N'SE', CAST(N'2017-01-07T08:21:50.277' AS DateTime), -9.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1799, N'SE', CAST(N'2017-01-07T08:21:50.277' AS DateTime), -5.4375, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1800, N'CA', CAST(N'2017-01-07T08:21:50.277' AS DateTime), -417, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1801, N'SE', CAST(N'2017-01-07T08:26:50.297' AS DateTime), -9.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1802, N'SE', CAST(N'2017-01-07T08:26:50.297' AS DateTime), -5.4375, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1803, N'CA', CAST(N'2017-01-07T08:26:50.297' AS DateTime), -417, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1804, N'SE', CAST(N'2017-01-07T08:31:50.303' AS DateTime), -9.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1805, N'SE', CAST(N'2017-01-07T08:31:50.303' AS DateTime), -5.5, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1806, N'CA', CAST(N'2017-01-07T08:31:50.303' AS DateTime), -425, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1807, N'SE', CAST(N'2017-01-07T08:36:50.307' AS DateTime), -9.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1808, N'SE', CAST(N'2017-01-07T08:36:50.307' AS DateTime), -5.5, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1809, N'CA', CAST(N'2017-01-07T08:36:50.307' AS DateTime), -425, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1810, N'SE', CAST(N'2017-01-07T08:41:50.340' AS DateTime), -9.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1811, N'SE', CAST(N'2017-01-07T08:41:50.340' AS DateTime), -5.5, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1812, N'CA', CAST(N'2017-01-07T08:41:50.340' AS DateTime), -425, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1813, N'SE', CAST(N'2017-01-07T08:46:50.367' AS DateTime), -9, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1814, N'SE', CAST(N'2017-01-07T08:46:50.367' AS DateTime), -5.5, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1815, N'CA', CAST(N'2017-01-07T08:46:50.367' AS DateTime), -467, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1816, N'SE', CAST(N'2017-01-07T08:51:50.367' AS DateTime), -9.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1817, N'SE', CAST(N'2017-01-07T08:51:50.367' AS DateTime), -5.5, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1818, N'CA', CAST(N'2017-01-07T08:51:50.367' AS DateTime), -425, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1819, N'SE', CAST(N'2017-01-07T08:56:50.387' AS DateTime), -9.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1820, N'SE', CAST(N'2017-01-07T08:56:50.387' AS DateTime), -5.5, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1821, N'CA', CAST(N'2017-01-07T08:56:50.387' AS DateTime), -425, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1822, N'SE', CAST(N'2017-01-07T09:01:50.397' AS DateTime), -9.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1823, N'SE', CAST(N'2017-01-07T09:01:50.397' AS DateTime), -5.5, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1824, N'CA', CAST(N'2017-01-07T09:01:50.397' AS DateTime), -425, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1825, N'SE', CAST(N'2017-01-07T09:06:50.413' AS DateTime), -9, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1826, N'SE', CAST(N'2017-01-07T09:06:50.413' AS DateTime), -5.5, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1827, N'CA', CAST(N'2017-01-07T09:06:50.413' AS DateTime), -467, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1828, N'SE', CAST(N'2017-01-07T09:11:50.433' AS DateTime), -9, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1829, N'SE', CAST(N'2017-01-07T09:11:50.433' AS DateTime), -5.5625, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1830, N'CA', CAST(N'2017-01-07T09:11:50.433' AS DateTime), -477, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1831, N'SE', CAST(N'2017-01-07T09:16:50.453' AS DateTime), -9, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1832, N'SE', CAST(N'2017-01-07T09:16:50.453' AS DateTime), -5.5625, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1833, N'CA', CAST(N'2017-01-07T09:16:50.453' AS DateTime), -477, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1834, N'SE', CAST(N'2017-01-07T09:21:50.457' AS DateTime), -9, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1835, N'SE', CAST(N'2017-01-07T09:21:50.457' AS DateTime), -5.5625, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1836, N'CA', CAST(N'2017-01-07T09:21:50.457' AS DateTime), -477, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1837, N'SE', CAST(N'2017-01-07T09:26:50.473' AS DateTime), -9, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1838, N'SE', CAST(N'2017-01-07T09:26:50.473' AS DateTime), -5.5625, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1839, N'CA', CAST(N'2017-01-07T09:26:50.473' AS DateTime), -477, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1840, N'SE', CAST(N'2017-01-07T09:31:50.487' AS DateTime), -9, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1841, N'SE', CAST(N'2017-01-07T09:31:50.487' AS DateTime), -5.5625, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1842, N'CA', CAST(N'2017-01-07T09:31:50.487' AS DateTime), -477, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1843, N'SE', CAST(N'2017-01-07T09:36:50.490' AS DateTime), -9, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1844, N'SE', CAST(N'2017-01-07T09:36:50.490' AS DateTime), -5.5625, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1845, N'CA', CAST(N'2017-01-07T09:36:50.490' AS DateTime), -477, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1846, N'SE', CAST(N'2017-01-07T09:41:50.493' AS DateTime), -8.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1847, N'SE', CAST(N'2017-01-07T09:41:50.493' AS DateTime), -4.9375, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1848, N'CA', CAST(N'2017-01-07T09:41:50.493' AS DateTime), -420, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1849, N'SE', CAST(N'2017-01-07T09:46:50.510' AS DateTime), -8.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1850, N'SE', CAST(N'2017-01-07T09:46:50.510' AS DateTime), -5.6875, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1851, N'CA', CAST(N'2017-01-07T09:46:50.510' AS DateTime), -554, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1852, N'SE', CAST(N'2017-01-07T09:51:50.510' AS DateTime), -8.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1853, N'SE', CAST(N'2017-01-07T09:51:50.510' AS DateTime), -5.6875, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1854, N'CA', CAST(N'2017-01-07T09:51:50.510' AS DateTime), -554, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1855, N'SE', CAST(N'2017-01-07T09:56:50.527' AS DateTime), -8.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1856, N'SE', CAST(N'2017-01-07T09:56:50.527' AS DateTime), -5.6875, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1857, N'CA', CAST(N'2017-01-07T09:56:50.527' AS DateTime), -554, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1858, N'SE', CAST(N'2017-01-07T10:01:50.540' AS DateTime), -8.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1859, N'SE', CAST(N'2017-01-07T10:01:50.540' AS DateTime), -5.6875, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1860, N'CA', CAST(N'2017-01-07T10:01:50.540' AS DateTime), -554, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1861, N'SE', CAST(N'2017-01-07T10:06:50.553' AS DateTime), -8.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1862, N'SE', CAST(N'2017-01-07T10:06:50.553' AS DateTime), -5.75, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1863, N'CA', CAST(N'2017-01-07T10:06:50.553' AS DateTime), -566, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1864, N'SE', CAST(N'2017-01-07T10:11:50.557' AS DateTime), -8.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1865, N'SE', CAST(N'2017-01-07T10:11:50.557' AS DateTime), -5.75, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1866, N'CA', CAST(N'2017-01-07T10:11:50.557' AS DateTime), -566, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1867, N'SE', CAST(N'2017-01-07T10:16:50.560' AS DateTime), -8.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1868, N'SE', CAST(N'2017-01-07T10:16:50.560' AS DateTime), -5.75, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1869, N'CA', CAST(N'2017-01-07T10:16:50.560' AS DateTime), -566, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1870, N'SE', CAST(N'2017-01-07T10:21:50.560' AS DateTime), -8, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1871, N'SE', CAST(N'2017-01-07T10:21:50.560' AS DateTime), -5.6875, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1872, N'CA', CAST(N'2017-01-07T10:21:50.560' AS DateTime), -625, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1873, N'SE', CAST(N'2017-01-07T10:26:50.560' AS DateTime), -8, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1874, N'SE', CAST(N'2017-01-07T10:26:50.560' AS DateTime), -5.6875, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1875, N'CA', CAST(N'2017-01-07T10:26:50.560' AS DateTime), -625, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1876, N'SE', CAST(N'2017-01-07T10:31:50.570' AS DateTime), -8, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1877, N'SE', CAST(N'2017-01-07T10:31:50.570' AS DateTime), -5.6875, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1878, N'CA', CAST(N'2017-01-07T10:31:50.570' AS DateTime), -625, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1879, N'SE', CAST(N'2017-01-07T10:36:50.597' AS DateTime), -8, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1880, N'SE', CAST(N'2017-01-07T10:36:50.597' AS DateTime), -5.6875, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1881, N'CA', CAST(N'2017-01-07T10:36:50.597' AS DateTime), -625, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1882, N'SE', CAST(N'2017-01-07T10:41:50.613' AS DateTime), -8, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1883, N'SE', CAST(N'2017-01-07T10:41:50.613' AS DateTime), -5.6875, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1884, N'CA', CAST(N'2017-01-07T10:41:50.613' AS DateTime), -625, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1885, N'SE', CAST(N'2017-01-07T10:46:50.627' AS DateTime), -7.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1886, N'SE', CAST(N'2017-01-07T10:46:50.627' AS DateTime), -5.75, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1887, N'CA', CAST(N'2017-01-07T10:46:50.627' AS DateTime), -741, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1888, N'SE', CAST(N'2017-01-07T10:51:50.643' AS DateTime), -7.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1889, N'SE', CAST(N'2017-01-07T10:51:50.643' AS DateTime), -5.75, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1890, N'CA', CAST(N'2017-01-07T10:51:50.643' AS DateTime), -741, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1891, N'SE', CAST(N'2017-01-07T10:56:50.663' AS DateTime), -7, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1892, N'SE', CAST(N'2017-01-07T10:56:50.663' AS DateTime), -5.75, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1893, N'CA', CAST(N'2017-01-07T10:56:50.663' AS DateTime), -886, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1894, N'SE', CAST(N'2017-01-07T11:01:50.677' AS DateTime), -7.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1895, N'SE', CAST(N'2017-01-07T11:01:50.677' AS DateTime), -5.75, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1896, N'CA', CAST(N'2017-01-07T11:01:50.677' AS DateTime), -741, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1897, N'SE', CAST(N'2017-01-07T11:06:50.687' AS DateTime), -7.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1898, N'SE', CAST(N'2017-01-07T11:06:50.687' AS DateTime), -5.75, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1899, N'CA', CAST(N'2017-01-07T11:06:50.687' AS DateTime), -741, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1900, N'SE', CAST(N'2017-01-07T11:11:50.690' AS DateTime), -7.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1901, N'SE', CAST(N'2017-01-07T11:11:50.690' AS DateTime), -5.75, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1902, N'CA', CAST(N'2017-01-07T11:11:50.690' AS DateTime), -741, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1903, N'SE', CAST(N'2017-01-07T11:16:50.700' AS DateTime), -7.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1904, N'SE', CAST(N'2017-01-07T11:16:50.700' AS DateTime), -5.75, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1905, N'CA', CAST(N'2017-01-07T11:16:50.700' AS DateTime), -741, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1906, N'SE', CAST(N'2017-01-07T11:21:50.717' AS DateTime), -7.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1907, N'SE', CAST(N'2017-01-07T11:21:50.717' AS DateTime), -5.75, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1908, N'CA', CAST(N'2017-01-07T11:21:50.717' AS DateTime), -741, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1909, N'SE', CAST(N'2017-01-07T11:26:50.717' AS DateTime), -7.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1910, N'SE', CAST(N'2017-01-07T11:26:50.717' AS DateTime), -5.75, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1911, N'CA', CAST(N'2017-01-07T11:26:50.717' AS DateTime), -741, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1912, N'SE', CAST(N'2017-01-07T11:31:50.720' AS DateTime), -7.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1913, N'SE', CAST(N'2017-01-07T11:31:50.720' AS DateTime), -5.75, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1914, N'CA', CAST(N'2017-01-07T11:31:50.720' AS DateTime), -741, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1915, N'SE', CAST(N'2017-01-07T11:36:50.720' AS DateTime), -7.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1916, N'SE', CAST(N'2017-01-07T11:36:50.720' AS DateTime), -5.75, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1917, N'CA', CAST(N'2017-01-07T11:36:50.720' AS DateTime), -741, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1918, N'SE', CAST(N'2017-01-07T11:41:50.723' AS DateTime), -7.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1919, N'SE', CAST(N'2017-01-07T11:41:50.723' AS DateTime), -5.8125, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1920, N'CA', CAST(N'2017-01-07T11:41:50.723' AS DateTime), -761, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1921, N'SE', CAST(N'2017-01-07T11:46:50.723' AS DateTime), -7.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1922, N'SE', CAST(N'2017-01-07T11:46:50.723' AS DateTime), -5.8125, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1923, N'CA', CAST(N'2017-01-07T11:46:50.723' AS DateTime), -761, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1924, N'SE', CAST(N'2017-01-07T11:51:50.740' AS DateTime), -7.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1925, N'SE', CAST(N'2017-01-07T11:51:50.740' AS DateTime), -5.8125, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1926, N'CA', CAST(N'2017-01-07T11:51:50.740' AS DateTime), -761, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1927, N'SE', CAST(N'2017-01-07T11:56:50.747' AS DateTime), -7.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1928, N'SE', CAST(N'2017-01-07T11:56:50.747' AS DateTime), -5.8125, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1929, N'CA', CAST(N'2017-01-07T11:56:50.747' AS DateTime), -761, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1930, N'SE', CAST(N'2017-01-07T12:01:50.763' AS DateTime), -7.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1931, N'SE', CAST(N'2017-01-07T12:01:50.763' AS DateTime), -5.8125, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1932, N'CA', CAST(N'2017-01-07T12:01:50.763' AS DateTime), -761, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1933, N'SE', CAST(N'2017-01-07T12:06:50.797' AS DateTime), -7.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1934, N'SE', CAST(N'2017-01-07T12:06:50.797' AS DateTime), -5.8125, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1935, N'CA', CAST(N'2017-01-07T12:06:50.797' AS DateTime), -761, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1936, N'SE', CAST(N'2017-01-07T12:11:50.787' AS DateTime), -7.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1937, N'SE', CAST(N'2017-01-07T12:11:50.787' AS DateTime), -5.8125, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1938, N'CA', CAST(N'2017-01-07T12:11:50.787' AS DateTime), -761, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1939, N'SE', CAST(N'2017-01-07T12:16:50.777' AS DateTime), -7.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1940, N'SE', CAST(N'2017-01-07T12:16:50.777' AS DateTime), -5.8125, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1941, N'CA', CAST(N'2017-01-07T12:16:50.777' AS DateTime), -761, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1942, N'SE', CAST(N'2017-01-07T12:21:50.767' AS DateTime), -6.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1943, N'SE', CAST(N'2017-01-07T12:21:50.767' AS DateTime), -5.8125, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1944, N'CA', CAST(N'2017-01-07T12:21:50.767' AS DateTime), -1174, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1945, N'SE', CAST(N'2017-01-07T12:26:50.773' AS DateTime), -7.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1946, N'SE', CAST(N'2017-01-07T12:26:50.773' AS DateTime), -5.8125, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1947, N'CA', CAST(N'2017-01-07T12:26:50.773' AS DateTime), -761, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1948, N'SE', CAST(N'2017-01-07T12:31:50.763' AS DateTime), -7, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1949, N'SE', CAST(N'2017-01-07T12:31:50.763' AS DateTime), -5.8125, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1950, N'CA', CAST(N'2017-01-07T12:31:50.763' AS DateTime), -915, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1951, N'SE', CAST(N'2017-01-07T12:36:50.770' AS DateTime), -7.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1952, N'SE', CAST(N'2017-01-07T12:36:50.770' AS DateTime), -5.8125, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1953, N'CA', CAST(N'2017-01-07T12:36:50.770' AS DateTime), -761, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1954, N'SE', CAST(N'2017-01-07T12:41:50.767' AS DateTime), -7.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1955, N'SE', CAST(N'2017-01-07T12:41:50.767' AS DateTime), -5.875, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1956, N'CA', CAST(N'2017-01-07T12:41:50.767' AS DateTime), -783, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1957, N'SE', CAST(N'2017-01-07T12:46:50.777' AS DateTime), -7.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1958, N'SE', CAST(N'2017-01-07T12:46:50.777' AS DateTime), -5.875, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1959, N'CA', CAST(N'2017-01-07T12:46:50.777' AS DateTime), -783, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1960, N'SE', CAST(N'2017-01-07T12:51:50.770' AS DateTime), -7.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1961, N'SE', CAST(N'2017-01-07T12:51:50.770' AS DateTime), -5.875, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1962, N'CA', CAST(N'2017-01-07T12:51:50.770' AS DateTime), -783, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1963, N'SE', CAST(N'2017-01-07T12:56:50.760' AS DateTime), -7.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1964, N'SE', CAST(N'2017-01-07T12:56:50.760' AS DateTime), -5.875, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1965, N'CA', CAST(N'2017-01-07T12:56:50.760' AS DateTime), -783, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1966, N'SE', CAST(N'2017-01-07T13:01:50.750' AS DateTime), -7.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1967, N'SE', CAST(N'2017-01-07T13:01:50.750' AS DateTime), -5.875, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1968, N'CA', CAST(N'2017-01-07T13:01:50.750' AS DateTime), -783, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1969, N'SE', CAST(N'2017-01-07T13:06:50.750' AS DateTime), -7.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1970, N'SE', CAST(N'2017-01-07T13:06:50.750' AS DateTime), -5.875, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1971, N'CA', CAST(N'2017-01-07T13:06:50.750' AS DateTime), -783, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1972, N'SE', CAST(N'2017-01-07T13:11:50.760' AS DateTime), -7.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1973, N'SE', CAST(N'2017-01-07T13:11:50.760' AS DateTime), -5.875, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1974, N'CA', CAST(N'2017-01-07T13:11:50.760' AS DateTime), -783, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1975, N'SE', CAST(N'2017-01-07T13:16:50.753' AS DateTime), -7.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1976, N'SE', CAST(N'2017-01-07T13:16:50.753' AS DateTime), -5.875, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1977, N'CA', CAST(N'2017-01-07T13:16:50.753' AS DateTime), -783, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1978, N'SE', CAST(N'2017-01-07T13:21:50.747' AS DateTime), -7.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1979, N'SE', CAST(N'2017-01-07T13:21:50.747' AS DateTime), -5.875, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1980, N'CA', CAST(N'2017-01-07T13:21:50.747' AS DateTime), -783, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1981, N'SE', CAST(N'2017-01-07T13:26:50.747' AS DateTime), -7.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1982, N'SE', CAST(N'2017-01-07T13:26:50.747' AS DateTime), -5.875, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1983, N'CA', CAST(N'2017-01-07T13:26:50.747' AS DateTime), -783, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1984, N'SE', CAST(N'2017-01-07T13:31:50.747' AS DateTime), -7.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1985, N'SE', CAST(N'2017-01-07T13:31:50.747' AS DateTime), -5.875, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1986, N'CA', CAST(N'2017-01-07T13:31:50.747' AS DateTime), -783, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1987, N'SE', CAST(N'2017-01-07T13:36:50.740' AS DateTime), -7.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1988, N'SE', CAST(N'2017-01-07T13:36:50.740' AS DateTime), -5.875, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1989, N'CA', CAST(N'2017-01-07T13:36:50.740' AS DateTime), -783, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1990, N'SE', CAST(N'2017-01-07T13:41:50.737' AS DateTime), -7, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1991, N'SE', CAST(N'2017-01-07T13:41:50.737' AS DateTime), -5.875, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1992, N'CA', CAST(N'2017-01-07T13:41:50.737' AS DateTime), -945, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1993, N'SE', CAST(N'2017-01-07T13:46:50.747' AS DateTime), -7.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1994, N'SE', CAST(N'2017-01-07T13:46:50.747' AS DateTime), -5.875, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1995, N'CA', CAST(N'2017-01-07T13:46:50.747' AS DateTime), -783, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1996, N'SE', CAST(N'2017-01-07T13:51:50.757' AS DateTime), -7.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1997, N'SE', CAST(N'2017-01-07T13:51:50.757' AS DateTime), -5.875, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1998, N'CA', CAST(N'2017-01-07T13:51:50.757' AS DateTime), -783, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (1999, N'SE', CAST(N'2017-01-07T13:56:50.767' AS DateTime), -7.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2000, N'SE', CAST(N'2017-01-07T13:56:50.767' AS DateTime), -5.875, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2001, N'CA', CAST(N'2017-01-07T13:56:50.767' AS DateTime), -783, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2002, N'SE', CAST(N'2017-01-07T14:01:50.777' AS DateTime), -7.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2003, N'SE', CAST(N'2017-01-07T14:01:50.777' AS DateTime), -5.875, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2004, N'CA', CAST(N'2017-01-07T14:01:50.777' AS DateTime), -783, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2005, N'SE', CAST(N'2017-01-07T14:06:50.780' AS DateTime), -7.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2006, N'SE', CAST(N'2017-01-07T14:06:50.780' AS DateTime), -5.9375, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2007, N'CA', CAST(N'2017-01-07T14:06:50.780' AS DateTime), -805, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2008, N'SE', CAST(N'2017-01-07T14:11:50.777' AS DateTime), -7.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2009, N'SE', CAST(N'2017-01-07T14:11:50.777' AS DateTime), -5.9375, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2010, N'CA', CAST(N'2017-01-07T14:11:50.777' AS DateTime), -805, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2011, N'SE', CAST(N'2017-01-07T14:16:50.790' AS DateTime), -7, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2012, N'SE', CAST(N'2017-01-07T14:16:50.790' AS DateTime), -5.9375, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2013, N'CA', CAST(N'2017-01-07T14:16:50.790' AS DateTime), -978, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2014, N'SE', CAST(N'2017-01-07T14:21:50.800' AS DateTime), -7.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2015, N'SE', CAST(N'2017-01-07T14:21:50.800' AS DateTime), -5.9375, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2016, N'CA', CAST(N'2017-01-07T14:21:50.800' AS DateTime), -805, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2017, N'SE', CAST(N'2017-01-07T14:26:50.810' AS DateTime), -7, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2018, N'SE', CAST(N'2017-01-07T14:26:50.810' AS DateTime), -5.9375, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2019, N'CA', CAST(N'2017-01-07T14:26:50.810' AS DateTime), -978, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2020, N'SE', CAST(N'2017-01-07T14:31:50.813' AS DateTime), -7, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2021, N'SE', CAST(N'2017-01-07T14:31:50.813' AS DateTime), -5.9375, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2022, N'CA', CAST(N'2017-01-07T14:31:50.813' AS DateTime), -978, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2023, N'SE', CAST(N'2017-01-07T14:36:50.820' AS DateTime), -7, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2024, N'SE', CAST(N'2017-01-07T14:36:50.820' AS DateTime), -5.9375, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2025, N'CA', CAST(N'2017-01-07T14:36:50.820' AS DateTime), -978, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2026, N'SE', CAST(N'2017-01-07T14:41:50.827' AS DateTime), -7, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2027, N'SE', CAST(N'2017-01-07T14:41:50.827' AS DateTime), -5.9375, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2028, N'CA', CAST(N'2017-01-07T14:41:50.827' AS DateTime), -978, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2029, N'SE', CAST(N'2017-01-07T15:01:56.827' AS DateTime), -7, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2030, N'SE', CAST(N'2017-01-07T15:01:56.827' AS DateTime), -5.9375, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2031, N'CA', CAST(N'2017-01-07T15:01:56.827' AS DateTime), -978, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2032, N'SE', CAST(N'2017-01-07T15:06:56.777' AS DateTime), -7, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2033, N'SE', CAST(N'2017-01-07T15:06:56.777' AS DateTime), -5.9375, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2034, N'CA', CAST(N'2017-01-07T15:06:56.777' AS DateTime), -978, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2035, N'SE', CAST(N'2017-01-07T15:11:56.780' AS DateTime), -7, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2036, N'SE', CAST(N'2017-01-07T15:11:56.780' AS DateTime), -5.9375, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2037, N'CA', CAST(N'2017-01-07T15:11:56.780' AS DateTime), -978, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2038, N'SE', CAST(N'2017-01-07T15:16:56.780' AS DateTime), -7, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2039, N'SE', CAST(N'2017-01-07T15:16:56.780' AS DateTime), -5.9375, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2040, N'CA', CAST(N'2017-01-07T15:16:56.780' AS DateTime), -978, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2041, N'SE', CAST(N'2017-01-07T15:21:56.783' AS DateTime), -7, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2042, N'SE', CAST(N'2017-01-07T15:21:56.783' AS DateTime), -5.9375, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2043, N'CA', CAST(N'2017-01-07T15:21:56.783' AS DateTime), -978, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2044, N'SE', CAST(N'2017-01-07T15:26:56.800' AS DateTime), -6.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2045, N'SE', CAST(N'2017-01-07T15:26:56.800' AS DateTime), -5.9375, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2046, N'CA', CAST(N'2017-01-07T15:26:56.800' AS DateTime), -1288, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2047, N'SE', CAST(N'2017-01-07T15:31:56.817' AS DateTime), -7, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2048, N'SE', CAST(N'2017-01-07T15:31:56.817' AS DateTime), -5.9375, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2049, N'CA', CAST(N'2017-01-07T15:31:56.817' AS DateTime), -978, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2050, N'SE', CAST(N'2017-01-07T15:36:56.823' AS DateTime), -7, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2051, N'SE', CAST(N'2017-01-07T15:36:56.823' AS DateTime), -5.9375, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2052, N'CA', CAST(N'2017-01-07T15:36:56.823' AS DateTime), -978, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2053, N'SE', CAST(N'2017-01-07T15:41:56.827' AS DateTime), -7, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2054, N'SE', CAST(N'2017-01-07T15:41:56.827' AS DateTime), -5.9375, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2055, N'CA', CAST(N'2017-01-07T15:41:56.827' AS DateTime), -978, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2056, N'SE', CAST(N'2017-01-07T15:46:56.830' AS DateTime), -7, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2057, N'SE', CAST(N'2017-01-07T15:46:56.830' AS DateTime), -6, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2058, N'CA', CAST(N'2017-01-07T15:46:56.830' AS DateTime), -1012, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2059, N'SE', CAST(N'2017-01-07T15:51:56.830' AS DateTime), -7, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2060, N'SE', CAST(N'2017-01-07T15:51:56.830' AS DateTime), -5.9375, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2061, N'CA', CAST(N'2017-01-07T15:51:56.830' AS DateTime), -978, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2062, N'SE', CAST(N'2017-01-07T15:56:56.847' AS DateTime), -7, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2063, N'SE', CAST(N'2017-01-07T15:56:56.847' AS DateTime), -6, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2064, N'CA', CAST(N'2017-01-07T15:56:56.847' AS DateTime), -1012, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2065, N'SE', CAST(N'2017-01-07T16:01:56.857' AS DateTime), -7, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2066, N'SE', CAST(N'2017-01-07T16:01:56.857' AS DateTime), -6, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2067, N'CA', CAST(N'2017-01-07T16:01:56.857' AS DateTime), -1012, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2068, N'SE', CAST(N'2017-01-07T16:06:56.857' AS DateTime), -7, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2069, N'SE', CAST(N'2017-01-07T16:06:56.857' AS DateTime), -6, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2070, N'CA', CAST(N'2017-01-07T16:06:56.857' AS DateTime), -1012, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2071, N'SE', CAST(N'2017-01-07T16:11:56.873' AS DateTime), -7, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2072, N'SE', CAST(N'2017-01-07T16:11:56.873' AS DateTime), -6, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2073, N'CA', CAST(N'2017-01-07T16:11:56.873' AS DateTime), -1012, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2074, N'SE', CAST(N'2017-01-07T16:16:56.887' AS DateTime), -6.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2075, N'SE', CAST(N'2017-01-07T16:16:56.887' AS DateTime), -6, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2076, N'CA', CAST(N'2017-01-07T16:16:56.887' AS DateTime), -1354, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2077, N'SE', CAST(N'2017-01-07T16:21:56.903' AS DateTime), -6.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2078, N'SE', CAST(N'2017-01-07T16:21:56.903' AS DateTime), -6, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2079, N'CA', CAST(N'2017-01-07T16:21:56.903' AS DateTime), -1354, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2080, N'SE', CAST(N'2017-01-07T16:26:56.907' AS DateTime), -6.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2081, N'SE', CAST(N'2017-01-07T16:26:56.907' AS DateTime), -6, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2082, N'CA', CAST(N'2017-01-07T16:26:56.907' AS DateTime), -1354, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2083, N'SE', CAST(N'2017-01-07T16:31:56.923' AS DateTime), -6.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2084, N'SE', CAST(N'2017-01-07T16:31:56.923' AS DateTime), -6, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2085, N'CA', CAST(N'2017-01-07T16:31:56.923' AS DateTime), -1354, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2086, N'SE', CAST(N'2017-01-07T16:36:56.937' AS DateTime), -6.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2087, N'SE', CAST(N'2017-01-07T16:36:56.937' AS DateTime), -6, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2088, N'CA', CAST(N'2017-01-07T16:36:56.937' AS DateTime), -1354, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2089, N'SE', CAST(N'2017-01-07T16:41:56.950' AS DateTime), -6.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2090, N'SE', CAST(N'2017-01-07T16:41:56.950' AS DateTime), -6, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2091, N'CA', CAST(N'2017-01-07T16:41:56.950' AS DateTime), -1354, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2092, N'SE', CAST(N'2017-01-07T16:46:56.950' AS DateTime), -6.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2093, N'SE', CAST(N'2017-01-07T16:46:56.950' AS DateTime), -6, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2094, N'CA', CAST(N'2017-01-07T16:46:56.950' AS DateTime), -1354, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2095, N'SE', CAST(N'2017-01-07T16:51:56.950' AS DateTime), -6.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2096, N'SE', CAST(N'2017-01-07T16:51:56.950' AS DateTime), -6, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2097, N'CA', CAST(N'2017-01-07T16:51:56.950' AS DateTime), -1354, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2098, N'SE', CAST(N'2017-01-07T16:56:56.950' AS DateTime), -6.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2099, N'SE', CAST(N'2017-01-07T16:56:56.950' AS DateTime), -6, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2100, N'CA', CAST(N'2017-01-07T16:56:56.950' AS DateTime), -1354, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2101, N'SE', CAST(N'2017-01-07T17:01:56.953' AS DateTime), -6.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2102, N'SE', CAST(N'2017-01-07T17:01:56.953' AS DateTime), -6, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2103, N'CA', CAST(N'2017-01-07T17:01:56.953' AS DateTime), -1354, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2104, N'SE', CAST(N'2017-01-07T17:06:56.967' AS DateTime), -6.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2105, N'SE', CAST(N'2017-01-07T17:06:56.967' AS DateTime), -6, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2106, N'CA', CAST(N'2017-01-07T17:06:56.967' AS DateTime), -1354, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2107, N'SE', CAST(N'2017-01-07T17:11:56.970' AS DateTime), -6, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2108, N'SE', CAST(N'2017-01-07T17:11:56.970' AS DateTime), -6, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2109, N'CA', CAST(N'2017-01-07T17:11:56.970' AS DateTime), -1, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2110, N'SE', CAST(N'2017-01-07T17:16:56.970' AS DateTime), -6, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2111, N'SE', CAST(N'2017-01-07T17:16:56.970' AS DateTime), -6, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2112, N'CA', CAST(N'2017-01-07T17:16:56.970' AS DateTime), -1, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2113, N'SE', CAST(N'2017-01-07T17:21:56.983' AS DateTime), -6, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2114, N'SE', CAST(N'2017-01-07T17:21:56.983' AS DateTime), -6, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2115, N'CA', CAST(N'2017-01-07T17:21:56.983' AS DateTime), -1, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2116, N'SE', CAST(N'2017-01-07T17:26:56.987' AS DateTime), -6, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2117, N'SE', CAST(N'2017-01-07T17:26:56.987' AS DateTime), -6, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2118, N'CA', CAST(N'2017-01-07T17:26:56.987' AS DateTime), -1, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2119, N'SE', CAST(N'2017-01-07T17:31:56.987' AS DateTime), -6, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2120, N'SE', CAST(N'2017-01-07T17:31:56.987' AS DateTime), -6, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2121, N'CA', CAST(N'2017-01-07T17:31:56.987' AS DateTime), -1, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2122, N'SE', CAST(N'2017-01-07T17:36:56.990' AS DateTime), -6, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2123, N'SE', CAST(N'2017-01-07T17:36:56.990' AS DateTime), -6, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2124, N'CA', CAST(N'2017-01-07T17:36:56.990' AS DateTime), -1, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2125, N'SE', CAST(N'2017-01-07T17:41:57.007' AS DateTime), -6, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2126, N'SE', CAST(N'2017-01-07T17:41:57.007' AS DateTime), -6, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2127, N'CA', CAST(N'2017-01-07T17:41:57.007' AS DateTime), -1, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2128, N'SE', CAST(N'2017-01-07T17:46:57.027' AS DateTime), -6, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2129, N'SE', CAST(N'2017-01-07T17:46:57.027' AS DateTime), -6, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2130, N'CA', CAST(N'2017-01-07T17:46:57.027' AS DateTime), -1, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2131, N'SE', CAST(N'2017-01-07T17:51:57.027' AS DateTime), -5.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2132, N'SE', CAST(N'2017-01-07T17:51:57.027' AS DateTime), -6, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2133, N'CA', CAST(N'2017-01-07T17:51:57.027' AS DateTime), -1, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2134, N'SE', CAST(N'2017-01-07T17:56:57.027' AS DateTime), -5.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2135, N'SE', CAST(N'2017-01-07T17:56:57.027' AS DateTime), -6, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2136, N'CA', CAST(N'2017-01-07T17:56:57.027' AS DateTime), -1, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2137, N'SE', CAST(N'2017-01-07T18:01:57.047' AS DateTime), -5.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2138, N'SE', CAST(N'2017-01-07T18:01:57.047' AS DateTime), -6, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2139, N'CA', CAST(N'2017-01-07T18:01:57.047' AS DateTime), -1, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2140, N'SE', CAST(N'2017-01-07T18:06:57.047' AS DateTime), -5.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2141, N'SE', CAST(N'2017-01-07T18:06:57.047' AS DateTime), -6, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2142, N'CA', CAST(N'2017-01-07T18:06:57.047' AS DateTime), -1, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2143, N'SE', CAST(N'2017-01-07T18:11:57.047' AS DateTime), -5.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2144, N'SE', CAST(N'2017-01-07T18:11:57.047' AS DateTime), -6, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2145, N'CA', CAST(N'2017-01-07T18:11:57.047' AS DateTime), -1, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2146, N'SE', CAST(N'2017-01-07T18:16:57.063' AS DateTime), -5.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2147, N'SE', CAST(N'2017-01-07T18:16:57.063' AS DateTime), -6, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2148, N'CA', CAST(N'2017-01-07T18:16:57.063' AS DateTime), -1, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2149, N'SE', CAST(N'2017-01-07T18:21:57.063' AS DateTime), -5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2150, N'SE', CAST(N'2017-01-07T18:21:57.063' AS DateTime), -6, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2151, N'CA', CAST(N'2017-01-07T18:21:57.063' AS DateTime), -1, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2152, N'SE', CAST(N'2017-01-07T18:26:57.067' AS DateTime), -5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2153, N'SE', CAST(N'2017-01-07T18:26:57.067' AS DateTime), -6, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2154, N'CA', CAST(N'2017-01-07T18:26:57.067' AS DateTime), -1, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2155, N'SE', CAST(N'2017-01-07T18:31:57.070' AS DateTime), -5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2156, N'SE', CAST(N'2017-01-07T18:31:57.070' AS DateTime), -6.0625, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2157, N'CA', CAST(N'2017-01-07T18:31:57.070' AS DateTime), -1, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2158, N'SE', CAST(N'2017-01-07T18:36:57.087' AS DateTime), -5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2159, N'SE', CAST(N'2017-01-07T18:36:57.087' AS DateTime), -6.0625, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2160, N'CA', CAST(N'2017-01-07T18:36:57.087' AS DateTime), -1, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2161, N'SE', CAST(N'2017-01-07T18:41:57.090' AS DateTime), -5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2162, N'SE', CAST(N'2017-01-07T18:41:57.090' AS DateTime), -6, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2163, N'CA', CAST(N'2017-01-07T18:41:57.090' AS DateTime), -1, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2164, N'SE', CAST(N'2017-01-07T18:46:57.107' AS DateTime), -5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2165, N'SE', CAST(N'2017-01-07T18:46:57.107' AS DateTime), -6.0625, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2166, N'CA', CAST(N'2017-01-07T18:46:57.107' AS DateTime), -1, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2167, N'SE', CAST(N'2017-01-07T18:51:57.103' AS DateTime), -4.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2168, N'SE', CAST(N'2017-01-07T18:51:57.103' AS DateTime), -6.0625, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2169, N'CA', CAST(N'2017-01-07T18:51:57.103' AS DateTime), -1, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2170, N'SE', CAST(N'2017-01-07T18:56:57.120' AS DateTime), -4.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2171, N'SE', CAST(N'2017-01-07T18:56:57.120' AS DateTime), -6.0625, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2172, N'CA', CAST(N'2017-01-07T18:56:57.120' AS DateTime), -1, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2173, N'SE', CAST(N'2017-01-07T19:01:57.120' AS DateTime), -4.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2174, N'SE', CAST(N'2017-01-07T19:01:57.120' AS DateTime), -6.0625, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2175, N'CA', CAST(N'2017-01-07T19:01:57.120' AS DateTime), -1, 1, NULL, 2)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2176, N'SE', CAST(N'2017-01-07T19:06:57.123' AS DateTime), -4.5, 1, 1, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2177, N'SE', CAST(N'2017-01-07T19:06:57.123' AS DateTime), -6.0625, 1, 2, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (2178, N'CA', CAST(N'2017-01-07T19:06:57.123' AS DateTime), -1, 1, NULL, 2)
GO
SET IDENTITY_INSERT [dbo].[Readings] OFF
GO
SET IDENTITY_INSERT [dbo].[SensorRoles] ON 

GO
INSERT [dbo].[SensorRoles] ([Id], [MeasurementId], [RoleName], [SensorId]) VALUES (1, 1, N'Ambient', N'28-FF-6D-5E-53-15-01-AA')
GO
INSERT [dbo].[SensorRoles] ([Id], [MeasurementId], [RoleName], [SensorId]) VALUES (2, 1, N'Beer', N'28-FF-7D-97-01-15-02-AA')
GO
SET IDENTITY_INSERT [dbo].[SensorRoles] OFF
GO
INSERT [dbo].[Sensors] ([Id], [Name]) VALUES (N'28-FF-6D-5E-53-15-01-AA', N'Yellow')
GO
INSERT [dbo].[Sensors] ([Id], [Name]) VALUES (N'28-FF-7D-97-01-15-02-AA', N'Unmarked')
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 24.01.2017 2:07:45 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF)
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [RoleNameIndex]    Script Date: 24.01.2017 2:07:45 ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF)
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 24.01.2017 2:07:45 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF)
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 24.01.2017 2:07:45 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF)
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 24.01.2017 2:07:45 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF)
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [EmailIndex]    Script Date: 24.01.2017 2:07:45 ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF)
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UserNameIndex]    Script Date: 24.01.2017 2:07:45 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF)
GO
/****** Object:  Index [IX_Calculator_MeasurementId]    Script Date: 24.01.2017 2:07:45 ******/
CREATE NONCLUSTERED INDEX [IX_Calculator_MeasurementId] ON [dbo].[Calculators]
(
	[MeasurementId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF)
GO
/****** Object:  Index [IX_CalculatorSensorInput_Calculator]    Script Date: 24.01.2017 2:07:45 ******/
CREATE NONCLUSTERED INDEX [IX_CalculatorSensorInput_Calculator] ON [dbo].[CalculatorSensorInput]
(
	[CalculatorId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF)
GO
/****** Object:  Index [IX_CalculatorSensorInput_SensorRole]    Script Date: 24.01.2017 2:07:45 ******/
CREATE NONCLUSTERED INDEX [IX_CalculatorSensorInput_SensorRole] ON [dbo].[CalculatorSensorInput]
(
	[SensorRoleId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF)
GO
/****** Object:  Index [IX_Readings_MeasurementId]    Script Date: 24.01.2017 2:07:45 ******/
CREATE NONCLUSTERED INDEX [IX_Readings_MeasurementId] ON [dbo].[Readings]
(
	[MeasurementId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF)
GO
/****** Object:  Index [IX_SensorRoles_MeasurementId]    Script Date: 24.01.2017 2:07:45 ******/
CREATE NONCLUSTERED INDEX [IX_SensorRoles_MeasurementId] ON [dbo].[SensorRoles]
(
	[MeasurementId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF)
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_SensorRoles_SensorId]    Script Date: 24.01.2017 2:07:45 ******/
CREATE NONCLUSTERED INDEX [IX_SensorRoles_SensorId] ON [dbo].[SensorRoles]
(
	[SensorId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF)
GO
ALTER TABLE [dbo].[Readings] ADD  CONSTRAINT [DF__Readings__Measur__05D8E0BE]  DEFAULT ((0)) FOR [MeasurementId]
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Calculators]  WITH CHECK ADD  CONSTRAINT [FK_Calculator_Measurements_MeasurementId] FOREIGN KEY([MeasurementId])
REFERENCES [dbo].[Measurements] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Calculators] CHECK CONSTRAINT [FK_Calculator_Measurements_MeasurementId]
GO
ALTER TABLE [dbo].[CalculatorSensorInput]  WITH CHECK ADD  CONSTRAINT [FK_CalculatorSensorInput_Calculator] FOREIGN KEY([CalculatorId])
REFERENCES [dbo].[Calculators] ([Id])
GO
ALTER TABLE [dbo].[CalculatorSensorInput] CHECK CONSTRAINT [FK_CalculatorSensorInput_Calculator]
GO
ALTER TABLE [dbo].[CalculatorSensorInput]  WITH CHECK ADD  CONSTRAINT [FK_CalculatorSensorInput_SensorRoles] FOREIGN KEY([SensorRoleId])
REFERENCES [dbo].[SensorRoles] ([Id])
GO
ALTER TABLE [dbo].[CalculatorSensorInput] CHECK CONSTRAINT [FK_CalculatorSensorInput_SensorRoles]
GO
ALTER TABLE [dbo].[Readings]  WITH CHECK ADD  CONSTRAINT [FK_Readings_Calculator] FOREIGN KEY([CalculatorId])
REFERENCES [dbo].[Calculators] ([Id])
GO
ALTER TABLE [dbo].[Readings] CHECK CONSTRAINT [FK_Readings_Calculator]
GO
ALTER TABLE [dbo].[Readings]  WITH CHECK ADD  CONSTRAINT [FK_Readings_Measurements_MeasurementId] FOREIGN KEY([MeasurementId])
REFERENCES [dbo].[Measurements] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Readings] CHECK CONSTRAINT [FK_Readings_Measurements_MeasurementId]
GO
ALTER TABLE [dbo].[Readings]  WITH CHECK ADD  CONSTRAINT [FK_Readings_SensorRoles] FOREIGN KEY([SensorRoleId])
REFERENCES [dbo].[SensorRoles] ([Id])
GO
ALTER TABLE [dbo].[Readings] CHECK CONSTRAINT [FK_Readings_SensorRoles]
GO
ALTER TABLE [dbo].[SensorRoles]  WITH CHECK ADD  CONSTRAINT [FK_SensorRoles_Measurements_MeasurementId] FOREIGN KEY([MeasurementId])
REFERENCES [dbo].[Measurements] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SensorRoles] CHECK CONSTRAINT [FK_SensorRoles_Measurements_MeasurementId]
GO
ALTER TABLE [dbo].[SensorRoles]  WITH CHECK ADD  CONSTRAINT [FK_SensorRoles_Sensors_SensorId] FOREIGN KEY([SensorId])
REFERENCES [dbo].[Sensors] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SensorRoles] CHECK CONSTRAINT [FK_SensorRoles_Sensors_SensorId]
GO
