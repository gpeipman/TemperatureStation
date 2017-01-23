/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 24.01.2017 1:15:53 ******/
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
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 24.01.2017 1:15:53 ******/
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
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 24.01.2017 1:15:53 ******/
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
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 24.01.2017 1:15:53 ******/
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
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 24.01.2017 1:15:53 ******/
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
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 24.01.2017 1:15:53 ******/
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
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 24.01.2017 1:15:53 ******/
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
/****** Object:  Table [dbo].[Calculators]    Script Date: 24.01.2017 1:15:53 ******/
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
/****** Object:  Table [dbo].[Measurements]    Script Date: 24.01.2017 1:15:53 ******/
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
/****** Object:  Table [dbo].[Readings]    Script Date: 24.01.2017 1:15:53 ******/
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
/****** Object:  Table [dbo].[SensorRoles]    Script Date: 24.01.2017 1:15:53 ******/
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
/****** Object:  Table [dbo].[Sensors]    Script Date: 24.01.2017 1:15:53 ******/
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
INSERT [dbo].[AspNetRoles] ([Id], [ConcurrencyStamp], [Name], [NormalizedName]) VALUES (N'Administrator', NULL, N'Administrator', N'Administrator')
GO
INSERT [dbo].[AspNetRoles] ([Id], [ConcurrencyStamp], [Name], [NormalizedName]) VALUES (N'PowerUser', NULL, N'PowerUser', N'PowerUser')
GO
SET IDENTITY_INSERT [dbo].[Calculators] ON 

GO
INSERT [dbo].[Calculators] ([Id], [MeasurementId], [Name], [Parameters]) VALUES (2, 1, N'Heat Exchange Rate', N'Ambient;Liquid')
GO
INSERT [dbo].[Calculators] ([Id], [MeasurementId], [Name], [Parameters]) VALUES (3, 1, N'Alcohol volume calculator', NULL)
GO
INSERT [dbo].[Calculators] ([Id], [MeasurementId], [Name], [Parameters]) VALUES (4, 1, N'Freezing estimate calculator', N'Ambient;Liquid')
GO
SET IDENTITY_INSERT [dbo].[Calculators] OFF
GO
SET IDENTITY_INSERT [dbo].[Measurements] ON 

GO
INSERT [dbo].[Measurements] ([Id], [IsActive], [Name], [FreezingPoint], [CoolingRate], [OriginalGravity], [FinalGravity], [AlcoholByVolume], [AlcoholByWeight]) VALUES (1, 1, N'Cooling beer', -1, -0.210295468568802, 1.078, 1.024, 7, 5.5)
GO
SET IDENTITY_INSERT [dbo].[Measurements] OFF
GO
SET IDENTITY_INSERT [dbo].[Readings] ON 

GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (13, N'SE', CAST(N'2016-12-25T14:58:12.630' AS DateTime), 32.5, 1, 3, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (14, N'SE', CAST(N'2016-12-25T14:58:12.630' AS DateTime), 31.9375, 1, 4, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (16, N'SE', CAST(N'2016-12-25T15:28:12.630' AS DateTime), 37.5, 1, 3, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (17, N'SE', CAST(N'2016-12-25T15:28:12.630' AS DateTime), 21.9375, 1, 4, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (19, N'SE', CAST(N'2016-12-25T15:38:12.630' AS DateTime), 37.5, 1, 3, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (20, N'SE', CAST(N'2016-12-25T15:38:12.630' AS DateTime), 24.2, 1, 4, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (22, N'SE', CAST(N'2016-12-25T15:48:12.630' AS DateTime), 37.5, 1, 3, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (23, N'SE', CAST(N'2016-12-25T15:48:12.630' AS DateTime), 25.2, 1, 4, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (25, N'SE', CAST(N'2016-12-25T15:58:12.630' AS DateTime), 37.5, 1, 3, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (26, N'SE', CAST(N'2016-12-25T15:58:12.630' AS DateTime), 26.2, 1, 4, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (28, N'SE', CAST(N'2016-12-25T15:59:12.630' AS DateTime), 38.5, 1, 3, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (29, N'SE', CAST(N'2016-12-25T15:59:12.630' AS DateTime), 27.2, 1, 4, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (31, N'SE', CAST(N'2016-12-25T16:05:12.630' AS DateTime), 38.5, 1, 3, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (32, N'SE', CAST(N'2016-12-25T16:05:12.630' AS DateTime), 27.2, 1, 4, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (34, N'SE', CAST(N'2016-12-25T16:08:12.630' AS DateTime), 38.5, 1, 3, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (35, N'SE', CAST(N'2016-12-25T16:08:12.630' AS DateTime), 27.2, 1, 4, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (37, N'SE', CAST(N'2016-12-25T16:10:12.630' AS DateTime), 35.5, 1, 3, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (38, N'SE', CAST(N'2016-12-25T16:10:12.630' AS DateTime), 20.2, 1, 4, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (40, N'CA', CAST(N'2016-12-25T16:10:12.630' AS DateTime), -102.535, 1, NULL, 4)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (41, N'SE', CAST(N'2016-12-25T16:12:12.630' AS DateTime), 35.5, 1, 3, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (42, N'SE', CAST(N'2016-12-25T16:12:12.630' AS DateTime), 20.2, 1, 4, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (44, N'CA', CAST(N'2016-12-25T16:12:12.630' AS DateTime), -102, 1, NULL, 4)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (45, N'SE', CAST(N'2016-12-25T16:15:12.630' AS DateTime), -8, 1, 3, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (46, N'SE', CAST(N'2016-12-25T16:15:12.630' AS DateTime), 20.2, 1, 4, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (48, N'CA', CAST(N'2016-12-25T16:15:12.630' AS DateTime), 165, 1, NULL, 4)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (49, N'SE', CAST(N'2016-12-25T16:25:12.630' AS DateTime), -11, 1, 3, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (50, N'SE', CAST(N'2016-12-25T16:25:12.630' AS DateTime), 10.2, 1, 4, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (52, N'CA', CAST(N'2016-12-25T16:25:12.630' AS DateTime), 89, 1, NULL, 4)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (53, N'SE', CAST(N'2016-12-25T16:27:12.630' AS DateTime), -11, 1, 3, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (54, N'SE', CAST(N'2016-12-25T16:27:12.630' AS DateTime), 9, 1, 4, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (56, N'CA', CAST(N'2016-12-25T16:27:12.630' AS DateTime), 82, 1, NULL, 4)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (57, N'SE', CAST(N'2016-12-25T16:29:12.630' AS DateTime), -11, 1, 3, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (58, N'SE', CAST(N'2016-12-25T16:29:12.630' AS DateTime), 8.6, 1, 4, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (60, N'CA', CAST(N'2016-12-25T16:29:12.630' AS DateTime), 80, 1, NULL, 4)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (61, N'SE', CAST(N'2016-12-25T16:32:12.630' AS DateTime), -11, 1, 3, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (62, N'SE', CAST(N'2016-12-25T16:32:12.630' AS DateTime), 7.6, 1, 4, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (63, N'CA', CAST(N'2016-12-25T16:32:12.630' AS DateTime), 74, 1, NULL, 4)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (64, N'CA', CAST(N'2017-01-05T01:37:16.153' AS DateTime), -1, 1, NULL, 4)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (65, N'CA', CAST(N'2017-01-05T01:37:16.153' AS DateTime), -1, 1, NULL, 4)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (66, N'CA', CAST(N'2017-01-05T01:37:16.153' AS DateTime), -1, 1, NULL, 4)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (67, N'CA', CAST(N'2017-01-05T01:37:16.153' AS DateTime), -1, 1, NULL, 4)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (68, N'CA', CAST(N'2017-01-05T01:37:16.153' AS DateTime), -1, 1, NULL, 4)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (69, N'CA', CAST(N'2017-01-05T01:37:16.153' AS DateTime), -1, 1, NULL, 4)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (70, N'CA', CAST(N'2017-01-05T01:37:16.153' AS DateTime), -1, 1, NULL, 4)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (71, N'CA', CAST(N'2017-01-05T01:37:16.153' AS DateTime), -1, 1, NULL, 4)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (72, N'CA', CAST(N'2017-01-05T01:37:16.153' AS DateTime), -1, 1, NULL, 4)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (73, N'CA', CAST(N'2017-01-05T01:37:16.153' AS DateTime), -1, 1, NULL, 4)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (74, N'CA', CAST(N'2017-01-05T01:37:16.153' AS DateTime), -1, 1, NULL, 4)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (75, N'CA', CAST(N'2017-01-05T01:37:16.153' AS DateTime), -1, 1, NULL, 4)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (76, N'SE', CAST(N'2017-01-05T07:21:17.693' AS DateTime), -9, 1, 3, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (77, N'SE', CAST(N'2017-01-05T07:21:17.693' AS DateTime), -9.4375, 1, 4, NULL)
GO
INSERT [dbo].[Readings] ([Id], [ReadingType], [ReadingTime], [Value], [MeasurementId], [SensorRoleId], [CalculatorId]) VALUES (78, N'CA', CAST(N'2017-01-05T07:21:17.693' AS DateTime), -1, 1, NULL, 4)
GO
SET IDENTITY_INSERT [dbo].[Readings] OFF
GO
SET IDENTITY_INSERT [dbo].[SensorRoles] ON 

GO
INSERT [dbo].[SensorRoles] ([Id], [MeasurementId], [RoleName], [SensorId]) VALUES (3, 1, N'Ambient', N'28-FF-6D-5E-53-15-01-AA')
GO
INSERT [dbo].[SensorRoles] ([Id], [MeasurementId], [RoleName], [SensorId]) VALUES (4, 1, N'Liquid', N'28-FF-7D-97-01-15-02-AA')
GO
SET IDENTITY_INSERT [dbo].[SensorRoles] OFF
GO
INSERT [dbo].[Sensors] ([Id], [Name]) VALUES (N'28-FF-6D-5E-53-15-01-AA', N'Yellow ring')
GO
INSERT [dbo].[Sensors] ([Id], [Name]) VALUES (N'28-FF-7D-97-01-15-02-AA', N'Blue ring')
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 24.01.2017 1:15:53 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF)
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [RoleNameIndex]    Script Date: 24.01.2017 1:15:53 ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF)
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 24.01.2017 1:15:53 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF)
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 24.01.2017 1:15:53 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF)
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 24.01.2017 1:15:53 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF)
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [EmailIndex]    Script Date: 24.01.2017 1:15:53 ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF)
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UserNameIndex]    Script Date: 24.01.2017 1:15:53 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF)
GO
/****** Object:  Index [IX_Calculator_MeasurementId]    Script Date: 24.01.2017 1:15:53 ******/
CREATE NONCLUSTERED INDEX [IX_Calculator_MeasurementId] ON [dbo].[Calculators]
(
	[MeasurementId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF)
GO
/****** Object:  Index [IX_Readings_MeasurementId]    Script Date: 24.01.2017 1:15:53 ******/
CREATE NONCLUSTERED INDEX [IX_Readings_MeasurementId] ON [dbo].[Readings]
(
	[MeasurementId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF)
GO
/****** Object:  Index [IX_SensorRoles_MeasurementId]    Script Date: 24.01.2017 1:15:53 ******/
CREATE NONCLUSTERED INDEX [IX_SensorRoles_MeasurementId] ON [dbo].[SensorRoles]
(
	[MeasurementId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF)
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_SensorRoles_SensorId]    Script Date: 24.01.2017 1:15:53 ******/
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
