USE [testing.dow.forecast]
GO
/****** Object:  Table [dbo].[audit]    Script Date: 4.11.2015 10:03:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[audit](
	[AuditId] [int] IDENTITY(1,1) NOT NULL,
	[TypeAuditId] [int] NULL,
	[CampaignId] [int] NULL,
	[UserId] [int] NULL,
	[ClientId] [int] NULL,
	[Description] [varchar](255) NULL,
	[Date] [datetime] NULL,
 CONSTRAINT [PK_audit] PRIMARY KEY CLUSTERED 
(
	[AuditId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[auth_assignment]    Script Date: 4.11.2015 10:03:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[auth_assignment](
	[item_name] [nvarchar](64) NOT NULL,
	[user_id] [int] NOT NULL,
	[created_at] [int] NULL DEFAULT (NULL),
 CONSTRAINT [PK_auth_assignment_item_name] PRIMARY KEY CLUSTERED 
(
	[item_name] ASC,
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[auth_item]    Script Date: 4.11.2015 10:03:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[auth_item](
	[name] [nvarchar](64) NOT NULL,
	[type] [int] NOT NULL,
	[description] [nvarchar](max) NULL,
	[rule_name] [nvarchar](64) NULL DEFAULT (NULL),
	[data] [nvarchar](max) NULL,
	[created_at] [int] NULL DEFAULT (NULL),
	[updated_at] [int] NULL DEFAULT (NULL),
 CONSTRAINT [PK_auth_item_name] PRIMARY KEY CLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[auth_item_child]    Script Date: 4.11.2015 10:03:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[auth_item_child](
	[parent] [nvarchar](64) NOT NULL,
	[child] [nvarchar](64) NOT NULL,
 CONSTRAINT [PK_auth_item_child_parent] PRIMARY KEY CLUSTERED 
(
	[parent] ASC,
	[child] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[auth_rule]    Script Date: 4.11.2015 10:03:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[auth_rule](
	[name] [nvarchar](64) NOT NULL,
	[data] [nvarchar](max) NULL,
	[created_at] [int] NULL,
	[updated_at] [int] NULL,
 CONSTRAINT [PK_auth_rule_name] PRIMARY KEY CLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[campaign]    Script Date: 4.11.2015 10:03:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[campaign](
	[CampaignId] [int] IDENTITY(3,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[IsFuture] [bit] NOT NULL CONSTRAINT [DF__user__IsFuture__5535A961]  DEFAULT ((1)),
	[IsActual] [bit] NOT NULL CONSTRAINT [DF__user__IsActual__5535A963]  DEFAULT ((1)),
	[PlanDateTo] [datetime] NULL,
	[PlanDateFrom] [datetime] NULL,
	[PlanSettingDateTo] [datetime2](0) NULL,
	[PlanSettingDateFrom] [datetime] NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF__user__IsActive__5535A964]  DEFAULT ((1)),
 CONSTRAINT [PK_campaign_CampaignId] PRIMARY KEY CLUSTERED 
(
	[CampaignId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[city]    Script Date: 4.11.2015 10:03:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[city](
	[CityId] [int] IDENTITY(22974,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[StateId] [int] NOT NULL,
	[IsActive] [binary](1) NOT NULL,
 CONSTRAINT [PK_city_CityId] PRIMARY KEY CLUSTERED 
(
	[CityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [city$UkNameState] UNIQUE NONCLUSTERED 
(
	[Name] ASC,
	[StateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[client]    Script Date: 4.11.2015 10:03:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[client](
	[ClientId] [int] NOT NULL,
	[ClientTypeId] [int] NULL,
	[GroupId] [int] NULL,
	[CountryId] [int] NULL,
	[Description] [varchar](150) NOT NULL,
	[IsGroup] [bit] NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_client_IsActive]  DEFAULT ((1)),
 CONSTRAINT [PK_client] PRIMARY KEY CLUSTERED 
(
	[ClientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[client_product]    Script Date: 4.11.2015 10:03:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[client_product](
	[ClientProductId] [int] IDENTITY(1,1) NOT NULL,
	[GmidId] [int] NULL,
	[TradeProductId] [int] NULL,
	[ClientId] [int] NULL,
	[IsForecastable] [bit] NULL,
 CONSTRAINT [PK_client_product] PRIMARY KEY CLUSTERED 
(
	[ClientProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[client_seller]    Script Date: 4.11.2015 10:03:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[client_seller](
	[ClientId] [int] NOT NULL,
	[SellerId] [int] NOT NULL,
 CONSTRAINT [PK_client_seller] PRIMARY KEY CLUSTERED 
(
	[ClientId] ASC,
	[SellerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[client_type]    Script Date: 4.11.2015 10:03:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[client_type](
	[ClientTypeId] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](50) NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_client_type_IsActive]  DEFAULT ((1)),
 CONSTRAINT [PK_client_type] PRIMARY KEY CLUSTERED 
(
	[ClientTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[country]    Script Date: 4.11.2015 10:03:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[country](
	[CountryId] [int] IDENTITY(1,1) NOT NULL,
	[Abbreviation] [varchar](5) NULL,
	[Description] [nvarchar](255) NOT NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF__country__IsActiv__35BCFE0A]  DEFAULT ((1)),
 CONSTRAINT [PK_country] PRIMARY KEY CLUSTERED 
(
	[CountryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [country$UkName] UNIQUE NONCLUSTERED 
(
	[Description] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cyo]    Script Date: 4.11.2015 10:03:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cyo](
	[CyoId] [int] IDENTITY(1,1) NOT NULL,
	[ClientId] [int] NULL,
	[GmidId] [int] NULL,
	[CampaignId] [int] NULL,
	[InventoryBalance] [decimal](10, 2) NULL,
 CONSTRAINT [PK_cyo] PRIMARY KEY CLUSTERED 
(
	[CyoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[forecast]    Script Date: 4.11.2015 10:03:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[forecast](
	[ClientProductId] [int] NOT NULL,
	[CampaignId] [int] NOT NULL,
	[January] [int] NULL,
	[February] [int] NULL,
	[March] [int] NULL,
	[Q1] [int] NULL,
	[April] [int] NULL,
	[May] [int] NULL,
	[June] [int] NULL,
	[Q2] [int] NULL,
	[July] [int] NULL,
	[August] [int] NULL,
	[September] [int] NULL,
	[Q3] [int] NULL,
	[October] [int] NULL,
	[November] [int] NULL,
	[December] [int] NULL,
	[Q4] [int] NULL,
	[Total] [int] NULL,
 CONSTRAINT [PK_forecast_1] PRIMARY KEY CLUSTERED 
(
	[ClientProductId] ASC,
	[CampaignId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[gmid]    Script Date: 4.11.2015 10:03:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[gmid](
	[GmidId] [int] NOT NULL,
	[Description] [varchar](150) NULL,
	[TradeProductId] [int] NULL,
	[Price] [decimal](10, 2) NULL,
	[Profit] [decimal](5, 2) NULL,
	[CountryId] [int] NULL,
	[IsForecastable] [bit] NULL CONSTRAINT [DF_gmid_IsForecastable]  DEFAULT ((1)),
	[IsActive] [bit] NULL CONSTRAINT [DF_gmid_IsActive_1]  DEFAULT ((1)),
 CONSTRAINT [PK_gmid_1] PRIMARY KEY CLUSTERED 
(
	[GmidId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[import]    Script Date: 4.11.2015 10:03:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[import](
	[ImportId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](250) NOT NULL,
	[CreatedAt] [datetime] NULL,
	[TypeImportId] [int] NOT NULL,
 CONSTRAINT [PK_import] PRIMARY KEY CLUSTERED 
(
	[ImportId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[lock_forecast]    Script Date: 4.11.2015 10:03:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[lock_forecast](
	[LockId] [int] IDENTITY(1,1) NOT NULL,
	[DateFrom] [datetime] NOT NULL,
	[DateTo] [datetime] NOT NULL,
 CONSTRAINT [PK_lock_forecast] PRIMARY KEY CLUSTERED 
(
	[LockId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[migration]    Script Date: 4.11.2015 10:03:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[migration](
	[version] [varchar](180) NOT NULL,
	[apply_time] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[version] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[month]    Script Date: 4.11.2015 10:03:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[month](
	[Month] [int] NULL,
	[Description] [varchar](255) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[notification]    Script Date: 4.11.2015 10:03:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[notification](
	[NotificationId] [int] IDENTITY(230,1) NOT NULL,
	[FromUserId] [int] NULL,
	[Description] [nvarchar](255) NULL,
	[ToUserId] [int] NULL,
	[ToProfileId] [nvarchar](64) NULL,
	[ObjectId] [int] NULL,
	[CreatedAt] [datetime2](0) NULL,
	[NotificationStatusId] [int] NULL,
 CONSTRAINT [PK_notification_NotificationId] PRIMARY KEY CLUSTERED 
(
	[NotificationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[notification_status]    Script Date: 4.11.2015 10:03:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[notification_status](
	[NotificationStatusId] [int] IDENTITY(3,1) NOT NULL,
	[Name] [nvarchar](50) NULL DEFAULT (NULL),
 CONSTRAINT [PK_notification_status_NotificationStatusId] PRIMARY KEY CLUSTERED 
(
	[NotificationStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[performance_center]    Script Date: 4.11.2015 10:03:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[performance_center](
	[PerformanceCenterId] [varchar](20) NOT NULL,
	[Description] [varchar](50) NULL,
	[ValueCenterId] [int] NULL,
	[IsActive] [bit] NULL CONSTRAINT [DF_performance_center_ISActive]  DEFAULT ((1)),
 CONSTRAINT [PK_performance_center] PRIMARY KEY CLUSTERED 
(
	[PerformanceCenterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[plan]    Script Date: 4.11.2015 10:03:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[plan](
	[ClientProductId] [int] NOT NULL,
	[Price] [decimal](10, 2) NULL,
	[CampaignId] [int] NOT NULL,
	[January] [int] NULL,
	[February] [int] NULL,
	[March] [int] NULL,
	[Q1] [int] NULL,
	[April] [int] NULL,
	[May] [int] NULL,
	[June] [int] NULL,
	[Q2] [int] NULL,
	[July] [int] NULL,
	[August] [int] NULL,
	[September] [int] NULL,
	[Q3] [int] NULL,
	[October] [int] NULL,
	[November] [int] NULL,
	[December] [int] NULL,
	[Q4] [int] NULL,
	[Total] [int] NULL,
 CONSTRAINT [PK_plan_1] PRIMARY KEY CLUSTERED 
(
	[ClientProductId] ASC,
	[CampaignId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[sale]    Script Date: 4.11.2015 10:03:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sale](
	[ClientId] [int] NOT NULL,
	[GmidId] [int] NOT NULL,
	[Month] [int] NOT NULL,
	[Amount] [int] NULL,
	[Total] [int] NULL,
	[CampaignId] [int] NOT NULL,
 CONSTRAINT [PK_sale] PRIMARY KEY CLUSTERED 
(
	[ClientId] ASC,
	[GmidId] ASC,
	[Month] ASC,
	[CampaignId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[setting]    Script Date: 4.11.2015 10:03:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[setting](
	[SettingId] [int] IDENTITY(3,1) NOT NULL,
	[Name] [varchar](150) NOT NULL DEFAULT (N'0'),
	[DisplayName] [varchar](150) NOT NULL DEFAULT (N'0'),
	[Value] [varchar](100) NOT NULL DEFAULT (N'0'),
 CONSTRAINT [PK_setting_SettingId] PRIMARY KEY CLUSTERED 
(
	[SettingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[snapshot_forecast]    Script Date: 4.11.2015 10:03:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[snapshot_forecast](
	[ClientProductId] [int] NOT NULL,
	[CampaignId] [int] NOT NULL,
	[January] [int] NULL,
	[February] [int] NULL,
	[March] [int] NULL,
	[April] [int] NULL,
	[May] [int] NULL,
	[June] [int] NULL,
	[July] [int] NULL,
	[August] [int] NULL,
	[September] [int] NULL,
	[October] [int] NULL,
	[November] [int] NULL,
	[December] [int] NULL,
	[Total] [int] NULL,
 CONSTRAINT [PK_snapshot_forecast_1] PRIMARY KEY CLUSTERED 
(
	[ClientProductId] ASC,
	[CampaignId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[state]    Script Date: 4.11.2015 10:03:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[state](
	[StateId] [int] IDENTITY(35,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[CountryId] [int] NOT NULL,
	[IsActive] [binary](1) NOT NULL,
 CONSTRAINT [PK_state_StateId] PRIMARY KEY CLUSTERED 
(
	[StateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [state$UkName] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TEMP_CUSTOMER]    Script Date: 4.11.2015 10:03:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TEMP_CUSTOMER](
	[Country] [varchar](100) NULL,
	[Liable Customer] [varchar](200) NULL,
	[F3] [varchar](100) NULL,
	[Clasificacion] [varchar](100) NULL,
	[Field Seller] [varchar](100) NULL,
	[F6] [varchar](200) NULL,
	[Mail vendedor] [varchar](200) NULL,
	[DSM] [varchar](100) NULL,
	[F9] [varchar](200) NULL,
	[Mail DSM] [varchar](100) NULL,
	[RSM] [varchar](100) NULL,
	[F12] [varchar](200) NULL,
	[Mail RSM] [varchar](100) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TEMP_CYO]    Script Date: 4.11.2015 10:03:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TEMP_CYO](
	[ClientId] [int] NULL,
	[GmidId] [int] NULL,
	[CampaignId] [int] NULL,
	[InventoryBalance] [decimal](10, 2) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TEMP_FORECAST]    Script Date: 4.11.2015 10:03:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TEMP_FORECAST](
	[ClientProductId] [int] NULL,
	[NameClient] [varchar](150) NULL,
	[ValueCenter] [varchar](150) NULL,
	[PerformanceCenter] [varchar](150) NULL,
	[Description] [varchar](150) NULL,
	[January] [int] NULL,
	[February] [int] NULL,
	[March] [int] NULL,
	[Q1] [int] NULL,
	[April] [int] NULL,
	[May] [int] NULL,
	[June] [int] NULL,
	[Q2] [int] NULL,
	[July] [int] NULL,
	[August] [int] NULL,
	[September] [int] NULL,
	[Q3] [int] NULL,
	[October] [int] NULL,
	[November] [int] NULL,
	[December] [int] NULL,
	[Q4] [int] NULL,
	[Total] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TEMP_PLAN]    Script Date: 4.11.2015 10:03:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TEMP_PLAN](
	[ClientProductId] [int] NULL,
	[NameClient] [varchar](150) NULL,
	[ValueCenter] [varchar](150) NULL,
	[PerformanceCenter] [varchar](150) NULL,
	[Description] [varchar](150) NULL,
	[January] [int] NULL,
	[February] [int] NULL,
	[March] [int] NULL,
	[Q1] [int] NULL,
	[April] [int] NULL,
	[May] [int] NULL,
	[June] [int] NULL,
	[Q2] [int] NULL,
	[July] [int] NULL,
	[August] [int] NULL,
	[September] [int] NULL,
	[Q3] [int] NULL,
	[October] [int] NULL,
	[November] [int] NULL,
	[December] [int] NULL,
	[Q4] [int] NULL,
	[Total] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TEMP_PRODUCT]    Script Date: 4.11.2015 10:03:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TEMP_PRODUCT](
	[Country] [varchar](10) NULL,
	[F2] [varchar](50) NULL,
	[ValueCenter] [varchar](100) NULL,
	[F4] [varchar](50) NULL,
	[Performance Center] [varchar](50) NULL,
	[F7] [varchar](100) NULL,
	[Trade Product] [varchar](50) NULL,
	[F9] [varchar](150) NULL,
	[GMID] [int] NULL,
	[F11] [varchar](200) NULL,
	[Precio] [varchar](50) NULL,
	[Margen] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TEMP_SALE]    Script Date: 4.11.2015 10:03:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TEMP_SALE](
	[Country] [varchar](60) NULL,
	[Liable Customer] [varchar](200) NULL,
	[F3] [varchar](50) NULL,
	[GMID] [int] NULL,
	[F5] [varchar](200) NULL,
	[Field Seller] [varchar](50) NULL,
	[F7] [varchar](100) NULL,
	[Calendar year] [int] NULL,
	[Calendar month] [int] NULL,
	[Actual] [decimal](10, 2) NULL,
	[Total] [decimal](10, 2) NULL,
	[Actual2] [decimal](10, 2) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[trade_product]    Script Date: 4.11.2015 10:03:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[trade_product](
	[TradeProductId] [int] NOT NULL,
	[Description] [varchar](100) NULL,
	[PerformanceCenterId] [varchar](20) NULL,
	[Price] [decimal](10, 2) NULL,
	[Profit] [decimal](10, 2) NULL,
	[IsForecastable] [bit] NULL CONSTRAINT [DF_trade_product_IsForecast]  DEFAULT ((1)),
	[IsActive] [bit] NULL CONSTRAINT [DF_trade_product_IsActive]  DEFAULT ((1)),
 CONSTRAINT [PK_trade_product] PRIMARY KEY CLUSTERED 
(
	[TradeProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[type_audit]    Script Date: 4.11.2015 10:03:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[type_audit](
	[TypeAuditId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](150) NULL,
	[PublicName] [varchar](150) NULL,
 CONSTRAINT [PK_type_audit] PRIMARY KEY CLUSTERED 
(
	[TypeAuditId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[type_import]    Script Date: 4.11.2015 10:03:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[type_import](
	[TypeImportId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_type_import] PRIMARY KEY CLUSTERED 
(
	[TypeImportId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[unit]    Script Date: 4.11.2015 10:03:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[unit](
	[UnitId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](10) NULL,
 CONSTRAINT [PK_unit_UnitId] PRIMARY KEY CLUSTERED 
(
	[UnitId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[user]    Script Date: 4.11.2015 10:03:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[user](
	[UserId] [int] IDENTITY(5,1) NOT NULL,
	[DowUserId] [varchar](10) NULL,
	[Username] [varchar](255) NOT NULL,
	[Fullname] [varchar](255) NULL CONSTRAINT [DF__user__Fullname__4E88ABD4]  DEFAULT (NULL),
	[AuthKey] [varchar](100) NULL CONSTRAINT [DF__user__AuthKey__4F7CD00D]  DEFAULT (NULL),
	[PasswordHash] [varchar](255) NOT NULL,
	[PasswordResetToken] [varchar](255) NULL CONSTRAINT [DF__user__PasswordRe__5070F446]  DEFAULT (NULL),
	[Email] [varchar](255) NOT NULL,
	[ParentId] [int] NULL CONSTRAINT [DF__user__ParentId__5165187F]  DEFAULT (NULL),
	[CreatedAt] [datetime2](0) NULL CONSTRAINT [DF__user__CreatedAt__52593CB8]  DEFAULT (NULL),
	[UpdatedAt] [datetime2](0) NULL CONSTRAINT [DF__user__UpdatedAt__534D60F1]  DEFAULT (NULL),
	[resetPassword] [bit] NOT NULL CONSTRAINT [DF__user__resetPassw__5441852A]  DEFAULT ((0)),
	[IsActive] [bit] NOT NULL CONSTRAINT [DF__user__IsActive__5535A963]  DEFAULT ((1)),
 CONSTRAINT [PK_user_UserId] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[value_center]    Script Date: 4.11.2015 10:03:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[value_center](
	[ValueCenterId] [int] NOT NULL,
	[Description] [varchar](50) NOT NULL,
	[Abbreviation] [varchar](5) NULL,
	[IsActive] [bit] NULL CONSTRAINT [DF_value_center_IsActive]  DEFAULT ((1)),
 CONSTRAINT [PK_value_center] PRIMARY KEY CLUSTERED 
(
	[ValueCenterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[InverseSale]    Script Date: 4.11.2015 10:03:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 


-- VIEW INVERSE TABLE SALE
CREATE VIEW [dbo].[InverseSale] 
AS
 SELECT ClientId,GmidId,CampaignId ,Total,
									 [1] AS 'January',
									 [2] AS 'February',
									 [3] AS 'March',								     
									 [4] AS 'April',
									 [5] AS 'May',
									 [6] AS 'June',									 
									 [7] AS 'July',
									 [8] AS 'August',
									 [9] AS 'September',									 
									 [10] AS 'October',
									 [11] AS 'November',
									 [12]AS 'December'									 
 FROM (
 SELECT ClientId,GmidId,CampaignId,Total,[Month],Amount
 FROM dbo.sale) sal
 PIVOT (SUM(Amount) FOR [Month] IN ("1","2","3","4","5","6","7","8","9","10","11","12")) AS pvt


GO
/****** Object:  View [dbo].[SaleToForecast]    Script Date: 4.11.2015 10:03:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[SaleToForecast]
AS
SELECT		 
			  [ClientId]
			  ,[GmidId]
			  ,[CampaignId]
			  ,sum(isnull([January],0)) AS [January]
			  ,sum(isnull([February],0)) AS [February]
			  ,sum(isnull([March],0)) AS [March] 
			  ,sum(isnull([April],0)) AS [April]
			  ,sum(isnull([May],0)) AS  [May]
			  ,sum(isnull([June],0)) AS [June]
			  ,sum(isnull([July],0)) AS [July]
			  ,sum(isnull([August],0)) AS [August]
			  ,sum(isnull([September],0)) AS [September]
			  ,sum(isnull([October],0)) AS [October]
			  ,sum(isnull([November],0)) AS [November]
			  ,sum(isnull([December],0)) AS [December]
FROM (
	  SELECT 
		     c.[ClientId]
			,[GmidId]
			,[CampaignId]
			,isnull([January],0) AS [January]
			,isnull([February],0) AS [February]
			,isnull([March],0) AS [March]
			,isnull([April],0) AS [April]
			,isnull([May],0) AS [May]
			,isnull([June],0) AS [June]
			,isnull([July],0) AS [July]
			,isnull([August],0) AS [August]
			,isnull([September],0) AS [September]
			,isnull([October],0) AS [October]
			,isnull([November],0) AS [November]
			,isnull([December],0) AS [December]
		FROM  [dbo].[InverseSale] childSale
		INNER JOIN client c
		ON childSale.ClientId = c.ClientId
		WHERE c.GroupId IS NULL
		UNION ALL
		SELECT [GroupId]
			  ,[GmidId]
			  ,[CampaignId]
			  ,sum(isnull([January],0)) AS [January]
			  ,sum(isnull([February],0)) AS [February]
			  ,sum(isnull([March],0)) AS [March] 
			  ,sum(isnull([April],0)) AS [April]
			  ,sum(isnull([May],0)) AS  [May]
			  ,sum(isnull([June],0)) AS [June]
			  ,sum(isnull([July],0)) AS [July]
			  ,sum(isnull([August],0)) AS [August]
			  ,sum(isnull([September],0)) AS [September]
			  ,sum(isnull([October],0)) AS [October]
			  ,sum(isnull([November],0)) AS [November]
			  ,sum(isnull([December],0)) AS [December]
		FROM  [dbo].[InverseSale] childSale
		INNER JOIN client c
		ON childSale.ClientId = c.ClientId
		WHERE c.GroupId IS NOT NULL 
		GROUP BY [GroupId]
		        ,[GmidId]
		        ,[CampaignId]
	   ) e	   
	   GROUP BY ClientId ,CampaignId ,GmidId

GO
/****** Object:  View [dbo].[SaleFormat]    Script Date: 4.11.2015 10:03:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



 

-- VIEW SALE WITH client_product AND trade_product
CREATE VIEW [dbo].[SaleFormat]
AS
SELECT cp.ClientProductId,
	   cp.ClientId,
	   NULL AS GmidId,
	   cp.TradeProductId,
	   cp.IsForecastable,
		invSale.CampaignId,
		SUM(invSale.January) AS January ,SUM(invSale.February) AS February,SUM(invSale.March) AS March,
		'Q1'= isnull(SUM(invSale.January),0)+isnull(SUM(invSale.February),0)+isnull(SUM(invSale.March),0),		
		SUM(invSale.April) AS April,SUM(invSale.May) AS May,SUM(invSale.June) AS June,
		'Q2'= isnull(SUM(invSale.April),0)+isnull(SUM(invSale.May),0)+isnull(SUM(invSale.June),0),		
		SUM(invSale.July) AS July,SUM(invSale.August) AS August,SUM(invSale.September) AS September,
		'Q3'= isnull(SUM(invSale.July),0)+isnull(SUM(invSale.August),0)+isnull(SUM(invSale.September),0),	
		SUM(invSale.October) AS October,SUM(invSale.November) AS November,SUM(invSale.December) AS December,
	    'Q4'= isnull(SUM(invSale.October),0)+isnull(SUM(invSale.November),0)+isnull(SUM(invSale.December),0)	
FROM dbo.SaleToForecast invSale
INNER JOIN dbo.gmid g 
ON g.GmidId = invSale.GmidId
INNER JOIN dbo.trade_product tp 
ON tp.TradeProductId = g.TradeProductId
INNER JOIN dbo.client_product cp 
ON invSale.ClientId = cp.ClientId AND cp.TradeProductId = tp.TradeProductId AND cp.GmidId IS NULL
GROUP BY cp.ClientProductId, cp.ClientId, cp.TradeProductId, cp.IsForecastable,	invSale.CampaignId
UNION
SELECT cp.ClientProductId,
	   cp.ClientId,
	   cp.GmidId,
	   cp.TradeProductId,
	   cp.IsForecastable,
		invSale.CampaignId,
		invSale.January,invSale.February,invSale.March,
		'Q1'= isnull(invSale.January,0)+isnull(invSale.February,0)+isnull(invSale.March,0),		
		invSale.April,invSale.May,invSale.June,
		'Q2'= isnull(invSale.April,0)+isnull(invSale.May,0)+isnull(invSale.June,0),		
		invSale.July,invSale.August,invSale.September,
		'Q3'= isnull(invSale.July,0)+isnull(invSale.August,0)+isnull(invSale.September,0),	
		invSale.October,invSale.November,invSale.December,
	    'Q4'= isnull(invSale.October,0)+isnull(invSale.November,0)+isnull(invSale.December,0)	
FROM dbo.SaleToForecast invSale
INNER JOIN dbo.gmid g 
ON g.GmidId = invSale.GmidId
INNER JOIN dbo.trade_product tp 
ON tp.TradeProductId = g.TradeProductId
INNER JOIN dbo.client_product cp 
ON invSale.ClientId = cp.ClientId AND cp.GmidId = g.GmidId 


GO
/****** Object:  View [dbo].[SaleWithForecast]    Script Date: 4.11.2015 10:03:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


 
CREATE VIEW [dbo].[SaleWithForecast]
AS

SELECT  result.*, 
		'Q1' = (result.January + result.February + result.March),
		'Q2' = (result.April + result.May + result.June),
		'Q3' = (result.July + result.August + result.September),
		'Q4' = (result.October + result.November + result.December),
		'Total' = result.January + result.February + result.March + result.April + result.May + result.June +result.July + result.August + result.September + result.October + result.November + result.December
FROM 
(
 SELECT f.ClientProductId,		   
	   f.CampaignId,	   	
	   cp.ClientId,
	   cp.IsForecastable,   
	   u.UserId AS SellerId,	   
	   u.Fullname AS SellerName,	   
	   tp.TradeProductId,
	   tp.Description AS TradeProduct,	   
	   tp.Price AS TradeProductPrice,
	   tp.profit AS TradeProductProfit,
	   g.GmidId,
	   g.Description AS GmidDescription,
	   g.Price AS GmidPrice,
	   g.Profit AS GmidProfit,
	   pc.PerformanceCenterId,
	   pc.Description AS PerformanceCenter,
	   vc.ValueCenterId,
	   vc.Description AS ValueCenter,
	   f.January AS 'ForecastJanuary' , f.February AS 'ForecastFebruary',f.March AS 'ForecastMarch', 
	   f.April AS 'ForecastApril' ,f.May AS 'ForecastMay' ,f.June AS 'ForecastJune',
	   f.July AS 'ForecastJuly',f.August AS 'ForecastAugust',f.September AS 'ForecastSeptember',
	   f.October AS 'ForecastOctober',f.November AS 'ForecastNovember',f.December AS 'ForecastDecember',
	   f.Q1 AS 'ForecastQ1',f.Q2 AS 'ForecastQ2',f.Q3 AS 'ForecastQ3',f.Q4 AS 'ForecastQ4',
	   f.Total AS 'ForecastTotal',
	   sal.January AS 'SaleJanuary',sal.February AS 'SaleFebruary',sal.March AS 'SaleMarch', 
	   sal.April AS 'SaleApril' ,sal.May AS 'SaleMay',sal.June AS 'SaleJune',
	   sal.July AS 'SaleJuly',sal.August AS 'SaleAugust',sal.September AS 'SaleSeptember',
	   sal.October AS 'SaleOctober',sal.November AS 'SaleNovember',sal.December AS 'SaleDecember',
	   sal.CampaignId AS 'CampaignSale',
	   'January' =  CASE WHEN 1 < (SELECT TOP 1 Value FROM setting where DisplayName = 'FORECAST_ENABLE_FROM') THEN isnull(sal.January,0) ELSE isnull(f.January,0) END,
	   'February' = CASE WHEN 2 < (SELECT TOP 1 Value FROM setting where DisplayName = 'FORECAST_ENABLE_FROM') THEN isnull(sal.February,0) ELSE isnull(f.February,0) END,
	   'March' =  CASE WHEN 3 < (SELECT TOP 1 Value FROM setting where DisplayName = 'FORECAST_ENABLE_FROM') THEN isnull(sal.March,0) ELSE isnull(f.March,0) END,
	   'April' =  CASE WHEN 4 < (SELECT TOP 1 Value FROM setting where DisplayName = 'FORECAST_ENABLE_FROM') THEN isnull(sal.April,0) ELSE isnull(f.April,0) END,
	   'May' =  CASE WHEN 5 < (SELECT TOP 1 Value FROM setting where DisplayName = 'FORECAST_ENABLE_FROM') THEN isnull(sal.May,0) ELSE isnull(f.May,0) END,
	   'June' = CASE WHEN 6 < (SELECT TOP 1 Value FROM setting where DisplayName = 'FORECAST_ENABLE_FROM') THEN isnull(sal.June,0) ELSE isnull(f.June,0) END,
	   'July' = CASE WHEN 7 < (SELECT TOP 1 Value FROM setting where DisplayName = 'FORECAST_ENABLE_FROM') THEN isnull(sal.July,0) ELSE isnull(f.July,0) END,
	   'August' = CASE WHEN 8 < (SELECT TOP 1 Value FROM setting where DisplayName = 'FORECAST_ENABLE_FROM') THEN isnull(sal.August,0) ELSE isnull(f.August,0) END,
	   'September' =CASE WHEN 9 < (SELECT TOP 1 Value FROM setting where DisplayName = 'FORECAST_ENABLE_FROM') THEN isnull(sal.September,0) ELSE isnull(f.September,0) END,
	   'October' = CASE WHEN 10 < (SELECT TOP 1 Value FROM setting where DisplayName = 'FORECAST_ENABLE_FROM') THEN isnull(sal.October,0) ELSE isnull(f.October,0) END,
	   'November' = CASE WHEN 11 < (SELECT TOP 1 Value FROM setting where DisplayName = 'FORECAST_ENABLE_FROM') THEN isnull(sal.November,0) ELSE isnull(f.November,0) END,
	   'December' = CASE WHEN 12 < (SELECT TOP 1 Value FROM setting where DisplayName = 'FORECAST_ENABLE_FROM')THEN isnull(sal.December,0) ELSE isnull(f.December,0) END,
	   ForecastDescription = CASE  vc.ValueCenterId WHEN 10111 THEN tp.Description
							 		ELSE  g.Description
							  END	,
  	   ForecastPrice = CASE  vc.ValueCenterId WHEN 10111 THEN tp.Price
									ELSE  g.Price
							  END	,
		cli.Description AS Client,
		cli.GroupId AS GroupId		

FROM dbo.forecast f
INNER JOIN client_product cp 
ON cp.ClientProductId = f.ClientProductId
INNER JOIN client cli ON cp.ClientId = cli.ClientId
LEFT JOIN dbo.SaleFormat sal
ON f.ClientProductId = sal.ClientProductId
INNER JOIN dbo.client_seller cs 
ON cs.ClientId = cp.ClientId
INNER JOIN dbo.[user] u 
ON u.UserId = cs.SellerId
INNER JOIN dbo.trade_product tp
ON tp.TradeProductId = cp.TradeProductId
LEFT JOIN gmid g 
ON g.GmidId = cp.GmidId
INNER JOIN dbo.performance_center pc 
ON pc.PerformanceCenterId = tp.PerformanceCenterId
INNER JOIN value_center vc 
ON vc.ValueCenterId = pc.ValueCenterId
) AS result




GO
/****** Object:  View [dbo].[ExportConsolid]    Script Date: 4.11.2015 10:03:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE VIEW [dbo].[ExportConsolid]
AS
SELECT fs.CampaignId,
	   coun.Description AS Pais,
	   rsm.UserId AS 'RSMId',
	   rsm.DowUserId AS 'RSM',
	   rsm.Fullname AS 'Nombre RSM',
	   dsm.UserId AS 'DSMId',
	   dsm.DowUserId AS 'DSM',
	   dsm.Fullname AS 'Nombre DSM',
	   seller.UserId AS 'SellerId',
	   seller.DowUserId AS Vendedor,
	   seller.Fullname AS 'Nombre Vendedor',
	   fs.ClientId AS 'Cliente',
	   fs.Client AS 'Nombre Cliente',
	   ct.Description AS 'Clasificacion',
	   fs.ValueCenter AS 'Value Center',
	   fs.TradeProductId AS 'Trade Product',
	   fs.TradeProduct as 'Nombre Trade Product',
	   fs.PerformanceCenterId AS 'Performance',
	   fs.PerformanceCenter AS 'Nombre Performance',
	   fs.GmidId AS 'GMID',
	   fs.GmidDescription AS 'Nombre GMID',
	   'MES' = NULL,
	   'Q' = NULL,
	   fs.ForecastPrice AS 'Precio',
       T.Volume AS 'Volumen',	  
  	   (T.Volume * fs.ForecastPrice ) AS 'USD'
	   
FROM 
(
  SELECT ClientProductId,		
 	 	 Volume
  FROM SaleWithForecast  
  UNPIVOT
  (    
    Volume FOR [Month] IN (January,February,March,April,May,June,July,August,September,October,November,December)
  ) AS p
) AS T 
INNER JOIN SaleWithForecast fs 
ON fs.ClientProductId = T.ClientProductId
INNER JOIN client c 
ON c.ClientId = fs.ClientId
INNER JOIN country coun
ON coun.CountryId = c.CountryId
INNER JOIN client_seller cs 
ON cs.ClientId = c.ClientId
INNER JOIN [user] seller
ON seller.UserId = cs.SellerId
INNER JOIN [user] dsm 
ON dsm.UserId = seller.ParentId
INNER JOIN [user] rsm 
ON rsm.UserId = dsm.ParentId
LEFT JOIN [client_type] ct 
ON ct.ClientTypeId = c.ClientTypeId




GO
/****** Object:  View [dbo].[ExportComparative]    Script Date: 4.11.2015 10:03:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ExportComparative]
AS
  SELECT 
		 cou.Description AS Country ,
		 dsm.DowUserId AS DSM,
		 dsm.Fullname AS NameDSM,
		 seller.DowUserId AS Seller,
		 seller.Fullname NameSeller,
		 cli.ClientId,
		 cli.Description AS Client,
		 t.TradeProductId,
		 t.Description AS TradeProduct,
		 pc.PerformanceCenterId,
		 pc.Description AS PerformanceCenter,
		 g.GmidId,
		 g.Description AS Gmid, 	
		 sf.*
  FROM snapshot_forecast sf
  INNER JOIN client_product cp
  ON cp.ClientProductId = sf.ClientProductId 
  INNER JOIN trade_product t
  ON t.TradeProductId = cp.TradeProductId   
  LEFT JOIN gmid g 
  ON g.TradeProductId = t.TradeProductId AND g.GmidId = cp.GmidId
  INNER JOIN performance_center pc 
  ON pc.PerformanceCenterId = t.PerformanceCenterId
  INNER JOIN value_center vc 
  ON vc.ValueCenterId = pc.ValueCenterId
  INNER JOIN client cli 
  ON cli.ClientId = cp.ClientId
  INNER JOIN country cou
  ON cou.CountryId = cli.CountryId
  INNER JOIN client_seller cs
  ON cs.ClientId = cli.ClientId
  INNER JOIN [user] seller 
  ON seller.UserId = cs.SellerId
  INNER JOIN [user] dsm 
  ON dsm.UserId = seller.ParentId

GO
/****** Object:  View [dbo].[GmidUnionTrade]    Script Date: 4.11.2015 10:03:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 

CREATE VIEW [dbo].[GmidUnionTrade]
AS	
SELECT g.GmidId,	
	   TradeProductId = NULL,		
	   Description = g.Description,
	   tp.Description AS TradeProduct,
	   pc.Description AS PerformanceCenter ,
	   vc.Description AS ValueCenter,
	   tp.Price,
	   tp.Profit,
	   g.CountryId,
	   g.IsActive
FROM gmid g
INNER JOIN trade_product tp
ON g.TradeProductId = tp.TradeProductId
INNER JOIN performance_center pc 
ON pc.PerformanceCenterId = tp.PerformanceCenterId
INNER JOIN value_center vc 
ON vc.ValueCenterId = pc.ValueCenterId
WHERE g.IsForecastable = 1
UNION
SELECT GmidId = NULL,
	   tp.TradeProductId,
	   Description = tp.Description,
	   tp.Description AS TradeProduct,
	   pc.Description AS PerformanceCenter ,
	   vc.Description AS ValueCenter,
	   tp.Price,
	   tp.Profit,
	   NULL AS CountryId,
	   tp.IsActive
FROM trade_product tp
INNER JOIN gmid g 
ON g.TradeProductId = tp.TradeProductId
INNER JOIN performance_center pc 
ON pc.PerformanceCenterId = tp.PerformanceCenterId
INNER JOIN value_center vc 
ON vc.ValueCenterId = pc.ValueCenterId
WHERE tp.IsForecastable = 1
GROUP BY tp.TradeProductId,tp.Description,pc.Description,vc.Description,tp.Price,tp.Profit, tp.IsActive



GO
/****** Object:  View [dbo].[SaleUSD]    Script Date: 4.11.2015 10:03:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[SaleUSD] 
AS
   SELECT Month,SUM(Total) AS Total
   FROM sale
   GROUP BY Month

GO
/****** Object:  View [dbo].[SaleWithPlan]    Script Date: 4.11.2015 10:03:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[SaleWithPlan]
AS

SELECT  result.*, 
		'Q1' = (result.January + result.February + result.March),
		'Q2' = (result.April + result.May + result.June),
		'Q3' = (result.July + result.August + result.September),
		'Q4' = (result.October + result.November + result.December),
		'Total' = result.January + result.February + result.March + result.April + result.May + result.June +result.July + result.August + result.September + result.October + result.November + result.December
FROM 
(
 SELECT p.ClientProductId,		   
	   p.CampaignId,	   	
	   cp.ClientId,
	   cp.IsForecastable,   
	   u.UserId AS SellerId,	   
	   u.Fullname AS SellerName,	   
	   tp.TradeProductId,
	   tp.Description AS TradeProduct,	   
	   tp.Price AS TradeProductPrice,
	   tp.profit AS TradeProductProfit,
	   g.GmidId,
	   g.Description AS GmidDescription,
	   g.Price AS GmidPrice,
	   g.Profit AS GmidProfit,
	   pc.PerformanceCenterId,
	   pc.Description AS PerformanceCenter,
	   vc.ValueCenterId,
	   vc.Description AS ValueCenter,
	   isnull(p.January,0) AS January, isnull(p.February,0) AS February ,isnull(p.March,0) AS March, 
	   isnull(p.April,0) AS April  ,isnull(p.May,0) AS May ,isnull(p.June,0) AS June ,
	   isnull(p.July,0) AS July ,isnull(p.August,0) AS August ,isnull(p.September,0)  AS September,
	   isnull(p.October,0) AS October,isnull(p.November,0) AS November,isnull(p.December,0) AS December ,
	   p.Q1 AS 'PlanQ1',p.Q2 AS 'PlanQ2',p.Q3 AS 'PlanQ3',p.Q4 AS 'PlanQ4',
	   p.Total AS 'PlanTotal',

	   PlanDescription = CASE  vc.ValueCenterId WHEN 10111 THEN tp.Description
							 		ELSE  g.Description
							  END	,
  	   PlanPrice = CASE  vc.ValueCenterId WHEN 10111 THEN tp.Price
									ELSE  g.Price
							  END	,
		cli.Description AS Client,
		cli.GroupId AS GroupId

FROM dbo.[plan] p
INNER JOIN client_product cp 
ON cp.ClientProductId = p.ClientProductId
INNER JOIN client cli 
ON cp.ClientId = cli.ClientId
INNER JOIN dbo.client_seller cs 
ON cs.ClientId = cp.ClientId
INNER JOIN dbo.[user] u 
ON u.UserId = cs.SellerId
INNER JOIN dbo.trade_product tp
ON tp.TradeProductId = cp.TradeProductId
LEFT JOIN gmid g 
ON g.GmidId = cp.GmidId
INNER JOIN dbo.performance_center pc 
ON pc.PerformanceCenterId = tp.PerformanceCenterId
INNER JOIN value_center vc 
ON vc.ValueCenterId = pc.ValueCenterId
) AS result

GO
ALTER TABLE [dbo].[auth_rule] ADD  DEFAULT (NULL) FOR [created_at]
GO
ALTER TABLE [dbo].[auth_rule] ADD  DEFAULT (NULL) FOR [updated_at]
GO
ALTER TABLE [dbo].[city] ADD  DEFAULT (0x01) FOR [IsActive]
GO
ALTER TABLE [dbo].[notification] ADD  DEFAULT (NULL) FOR [FromUserId]
GO
ALTER TABLE [dbo].[notification] ADD  DEFAULT (NULL) FOR [Description]
GO
ALTER TABLE [dbo].[notification] ADD  DEFAULT (NULL) FOR [ToUserId]
GO
ALTER TABLE [dbo].[notification] ADD  DEFAULT (NULL) FOR [ToProfileId]
GO
ALTER TABLE [dbo].[notification] ADD  DEFAULT (NULL) FOR [ObjectId]
GO
ALTER TABLE [dbo].[notification] ADD  DEFAULT (NULL) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[notification] ADD  DEFAULT (NULL) FOR [NotificationStatusId]
GO
ALTER TABLE [dbo].[state] ADD  DEFAULT (0x01) FOR [IsActive]
GO
ALTER TABLE [dbo].[unit] ADD  DEFAULT (NULL) FOR [Name]
GO
ALTER TABLE [dbo].[audit]  WITH CHECK ADD  CONSTRAINT [FK_audit_campaign] FOREIGN KEY([CampaignId])
REFERENCES [dbo].[campaign] ([CampaignId])
GO
ALTER TABLE [dbo].[audit] CHECK CONSTRAINT [FK_audit_campaign]
GO
ALTER TABLE [dbo].[audit]  WITH CHECK ADD  CONSTRAINT [FK_audit_client] FOREIGN KEY([ClientId])
REFERENCES [dbo].[client] ([ClientId])
GO
ALTER TABLE [dbo].[audit] CHECK CONSTRAINT [FK_audit_client]
GO
ALTER TABLE [dbo].[audit]  WITH CHECK ADD  CONSTRAINT [FK_audit_type_audit] FOREIGN KEY([TypeAuditId])
REFERENCES [dbo].[type_audit] ([TypeAuditId])
GO
ALTER TABLE [dbo].[audit] CHECK CONSTRAINT [FK_audit_type_audit]
GO
ALTER TABLE [dbo].[audit]  WITH CHECK ADD  CONSTRAINT [FK_audit_user] FOREIGN KEY([UserId])
REFERENCES [dbo].[user] ([UserId])
GO
ALTER TABLE [dbo].[audit] CHECK CONSTRAINT [FK_audit_user]
GO
ALTER TABLE [dbo].[auth_assignment]  WITH CHECK ADD  CONSTRAINT [auth_assignment$auth_assignment_ibfk_1] FOREIGN KEY([item_name])
REFERENCES [dbo].[auth_item] ([name])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[auth_assignment] CHECK CONSTRAINT [auth_assignment$auth_assignment_ibfk_1]
GO
ALTER TABLE [dbo].[auth_assignment]  WITH CHECK ADD  CONSTRAINT [auth_assignment$FkAuthAssignment_UserId] FOREIGN KEY([user_id])
REFERENCES [dbo].[user] ([UserId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[auth_assignment] CHECK CONSTRAINT [auth_assignment$FkAuthAssignment_UserId]
GO
ALTER TABLE [dbo].[auth_item]  WITH CHECK ADD  CONSTRAINT [auth_item$auth_item_ibfk_1] FOREIGN KEY([rule_name])
REFERENCES [dbo].[auth_rule] ([name])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[auth_item] CHECK CONSTRAINT [auth_item$auth_item_ibfk_1]
GO
ALTER TABLE [dbo].[auth_item_child]  WITH NOCHECK ADD  CONSTRAINT [auth_item_child$auth_item_child_ibfk_1] FOREIGN KEY([parent])
REFERENCES [dbo].[auth_item] ([name])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[auth_item_child] NOCHECK CONSTRAINT [auth_item_child$auth_item_child_ibfk_1]
GO
ALTER TABLE [dbo].[city]  WITH NOCHECK ADD  CONSTRAINT [city$FkCity_StateId] FOREIGN KEY([StateId])
REFERENCES [dbo].[state] ([StateId])
GO
ALTER TABLE [dbo].[city] NOCHECK CONSTRAINT [city$FkCity_StateId]
GO
ALTER TABLE [dbo].[client]  WITH NOCHECK ADD  CONSTRAINT [FK_client_client] FOREIGN KEY([ClientId])
REFERENCES [dbo].[client] ([ClientId])
GO
ALTER TABLE [dbo].[client] NOCHECK CONSTRAINT [FK_client_client]
GO
ALTER TABLE [dbo].[client]  WITH NOCHECK ADD  CONSTRAINT [FK_client_client_type] FOREIGN KEY([ClientTypeId])
REFERENCES [dbo].[client_type] ([ClientTypeId])
GO
ALTER TABLE [dbo].[client] NOCHECK CONSTRAINT [FK_client_client_type]
GO
ALTER TABLE [dbo].[client]  WITH NOCHECK ADD  CONSTRAINT [FK_client_country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[country] ([CountryId])
GO
ALTER TABLE [dbo].[client] NOCHECK CONSTRAINT [FK_client_country]
GO
ALTER TABLE [dbo].[client_product]  WITH NOCHECK ADD  CONSTRAINT [FK_client_product_client] FOREIGN KEY([ClientId])
REFERENCES [dbo].[client] ([ClientId])
GO
ALTER TABLE [dbo].[client_product] NOCHECK CONSTRAINT [FK_client_product_client]
GO
ALTER TABLE [dbo].[client_product]  WITH NOCHECK ADD  CONSTRAINT [FK_client_product_gmid] FOREIGN KEY([GmidId])
REFERENCES [dbo].[gmid] ([GmidId])
GO
ALTER TABLE [dbo].[client_product] NOCHECK CONSTRAINT [FK_client_product_gmid]
GO
ALTER TABLE [dbo].[client_product]  WITH NOCHECK ADD  CONSTRAINT [FK_client_product_trade_product] FOREIGN KEY([TradeProductId])
REFERENCES [dbo].[trade_product] ([TradeProductId])
GO
ALTER TABLE [dbo].[client_product] NOCHECK CONSTRAINT [FK_client_product_trade_product]
GO
ALTER TABLE [dbo].[client_seller]  WITH CHECK ADD  CONSTRAINT [FK_client_seller_client] FOREIGN KEY([ClientId])
REFERENCES [dbo].[client] ([ClientId])
GO
ALTER TABLE [dbo].[client_seller] CHECK CONSTRAINT [FK_client_seller_client]
GO
ALTER TABLE [dbo].[client_seller]  WITH NOCHECK ADD  CONSTRAINT [FK_client_seller_user] FOREIGN KEY([SellerId])
REFERENCES [dbo].[user] ([UserId])
GO
ALTER TABLE [dbo].[client_seller] NOCHECK CONSTRAINT [FK_client_seller_user]
GO
ALTER TABLE [dbo].[country]  WITH NOCHECK ADD  CONSTRAINT [FK_country_country] FOREIGN KEY([Description])
REFERENCES [dbo].[country] ([Description])
GO
ALTER TABLE [dbo].[country] NOCHECK CONSTRAINT [FK_country_country]
GO
ALTER TABLE [dbo].[cyo]  WITH CHECK ADD  CONSTRAINT [FK_cyo_campaign] FOREIGN KEY([CampaignId])
REFERENCES [dbo].[campaign] ([CampaignId])
GO
ALTER TABLE [dbo].[cyo] CHECK CONSTRAINT [FK_cyo_campaign]
GO
ALTER TABLE [dbo].[cyo]  WITH CHECK ADD  CONSTRAINT [FK_cyo_client] FOREIGN KEY([ClientId])
REFERENCES [dbo].[client] ([ClientId])
GO
ALTER TABLE [dbo].[cyo] CHECK CONSTRAINT [FK_cyo_client]
GO
ALTER TABLE [dbo].[cyo]  WITH CHECK ADD  CONSTRAINT [FK_cyo_cyo] FOREIGN KEY([CyoId])
REFERENCES [dbo].[cyo] ([CyoId])
GO
ALTER TABLE [dbo].[cyo] CHECK CONSTRAINT [FK_cyo_cyo]
GO
ALTER TABLE [dbo].[cyo]  WITH CHECK ADD  CONSTRAINT [FK_cyo_gmid] FOREIGN KEY([GmidId])
REFERENCES [dbo].[gmid] ([GmidId])
GO
ALTER TABLE [dbo].[cyo] CHECK CONSTRAINT [FK_cyo_gmid]
GO
ALTER TABLE [dbo].[forecast]  WITH NOCHECK ADD  CONSTRAINT [FK_forecast_campaign] FOREIGN KEY([CampaignId])
REFERENCES [dbo].[campaign] ([CampaignId])
GO
ALTER TABLE [dbo].[forecast] NOCHECK CONSTRAINT [FK_forecast_campaign]
GO
ALTER TABLE [dbo].[forecast]  WITH NOCHECK ADD  CONSTRAINT [FK_forecast_client_product] FOREIGN KEY([ClientProductId])
REFERENCES [dbo].[client_product] ([ClientProductId])
GO
ALTER TABLE [dbo].[forecast] NOCHECK CONSTRAINT [FK_forecast_client_product]
GO
ALTER TABLE [dbo].[gmid]  WITH NOCHECK ADD  CONSTRAINT [FK_gmid_country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[country] ([CountryId])
GO
ALTER TABLE [dbo].[gmid] NOCHECK CONSTRAINT [FK_gmid_country]
GO
ALTER TABLE [dbo].[gmid]  WITH NOCHECK ADD  CONSTRAINT [FK_gmid_trade_product] FOREIGN KEY([TradeProductId])
REFERENCES [dbo].[trade_product] ([TradeProductId])
GO
ALTER TABLE [dbo].[gmid] NOCHECK CONSTRAINT [FK_gmid_trade_product]
GO
ALTER TABLE [dbo].[import]  WITH CHECK ADD  CONSTRAINT [FK_type_import] FOREIGN KEY([TypeImportId])
REFERENCES [dbo].[type_import] ([TypeImportId])
GO
ALTER TABLE [dbo].[import] CHECK CONSTRAINT [FK_type_import]
GO
ALTER TABLE [dbo].[notification]  WITH NOCHECK ADD  CONSTRAINT [notification$FKNotification_FromUserId] FOREIGN KEY([FromUserId])
REFERENCES [dbo].[user] ([UserId])
GO
ALTER TABLE [dbo].[notification] NOCHECK CONSTRAINT [notification$FKNotification_FromUserId]
GO
ALTER TABLE [dbo].[notification]  WITH NOCHECK ADD  CONSTRAINT [notification$FKNotification_NotificationStatusId] FOREIGN KEY([NotificationStatusId])
REFERENCES [dbo].[notification_status] ([NotificationStatusId])
GO
ALTER TABLE [dbo].[notification] NOCHECK CONSTRAINT [notification$FKNotification_NotificationStatusId]
GO
ALTER TABLE [dbo].[notification]  WITH NOCHECK ADD  CONSTRAINT [notification$FKNotification_ToProfileId] FOREIGN KEY([ToProfileId])
REFERENCES [dbo].[auth_item] ([name])
GO
ALTER TABLE [dbo].[notification] NOCHECK CONSTRAINT [notification$FKNotification_ToProfileId]
GO
ALTER TABLE [dbo].[notification]  WITH NOCHECK ADD  CONSTRAINT [notification$FKNotification_ToUserId] FOREIGN KEY([ToUserId])
REFERENCES [dbo].[user] ([UserId])
GO
ALTER TABLE [dbo].[notification] NOCHECK CONSTRAINT [notification$FKNotification_ToUserId]
GO
ALTER TABLE [dbo].[performance_center]  WITH NOCHECK ADD  CONSTRAINT [FK_performance_center_value_center] FOREIGN KEY([ValueCenterId])
REFERENCES [dbo].[value_center] ([ValueCenterId])
GO
ALTER TABLE [dbo].[performance_center] NOCHECK CONSTRAINT [FK_performance_center_value_center]
GO
ALTER TABLE [dbo].[plan]  WITH NOCHECK ADD  CONSTRAINT [FK_plan_campaign] FOREIGN KEY([CampaignId])
REFERENCES [dbo].[campaign] ([CampaignId])
GO
ALTER TABLE [dbo].[plan] NOCHECK CONSTRAINT [FK_plan_campaign]
GO
ALTER TABLE [dbo].[plan]  WITH NOCHECK ADD  CONSTRAINT [FK_plan_client_product] FOREIGN KEY([ClientProductId])
REFERENCES [dbo].[client_product] ([ClientProductId])
GO
ALTER TABLE [dbo].[plan] NOCHECK CONSTRAINT [FK_plan_client_product]
GO
ALTER TABLE [dbo].[sale]  WITH NOCHECK ADD  CONSTRAINT [FK_sale_campaign] FOREIGN KEY([CampaignId])
REFERENCES [dbo].[campaign] ([CampaignId])
GO
ALTER TABLE [dbo].[sale] NOCHECK CONSTRAINT [FK_sale_campaign]
GO
ALTER TABLE [dbo].[sale]  WITH NOCHECK ADD  CONSTRAINT [FK_sale_client] FOREIGN KEY([ClientId])
REFERENCES [dbo].[client] ([ClientId])
GO
ALTER TABLE [dbo].[sale] NOCHECK CONSTRAINT [FK_sale_client]
GO
ALTER TABLE [dbo].[sale]  WITH NOCHECK ADD  CONSTRAINT [FK_sale_gmid] FOREIGN KEY([GmidId])
REFERENCES [dbo].[gmid] ([GmidId])
GO
ALTER TABLE [dbo].[sale] NOCHECK CONSTRAINT [FK_sale_gmid]
GO
ALTER TABLE [dbo].[snapshot_forecast]  WITH NOCHECK ADD  CONSTRAINT [FK_snapshot_forecast_campaign] FOREIGN KEY([CampaignId])
REFERENCES [dbo].[campaign] ([CampaignId])
GO
ALTER TABLE [dbo].[snapshot_forecast] NOCHECK CONSTRAINT [FK_snapshot_forecast_campaign]
GO
ALTER TABLE [dbo].[snapshot_forecast]  WITH NOCHECK ADD  CONSTRAINT [FK_snapshot_forecast_client_product] FOREIGN KEY([ClientProductId])
REFERENCES [dbo].[client_product] ([ClientProductId])
GO
ALTER TABLE [dbo].[snapshot_forecast] NOCHECK CONSTRAINT [FK_snapshot_forecast_client_product]
GO
ALTER TABLE [dbo].[trade_product]  WITH NOCHECK ADD  CONSTRAINT [FK_trade_product_performance_center] FOREIGN KEY([PerformanceCenterId])
REFERENCES [dbo].[performance_center] ([PerformanceCenterId])
GO
ALTER TABLE [dbo].[trade_product] NOCHECK CONSTRAINT [FK_trade_product_performance_center]
GO
ALTER TABLE [dbo].[user]  WITH NOCHECK ADD  CONSTRAINT [user$FkUser_ParentId] FOREIGN KEY([ParentId])
REFERENCES [dbo].[user] ([UserId])
GO
ALTER TABLE [dbo].[user] NOCHECK CONSTRAINT [user$FkUser_ParentId]
GO
/****** Object:  StoredProcedure [dbo].[CreateConfigCampaign]    Script Date: 4.11.2015 10:03:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[CreateConfigCampaign] 
    AS
	DECLARE @CampaignFuture INT = NULL;
	SET @CampaignFuture = (SELECT CampaignId FROM campaign WHERE IsFuture = 1)
	

	INSERT INTO [plan](CampaignId,ClientProductId)
	SELECT @CampaignFuture AS CampaignId,ClientProductId
	FROM client_product

	INSERT INTO [forecast](CampaignId,ClientProductId)
	SELECT @CampaignFuture AS CampaignId,ClientProductId
	FROM client_product
GO
/****** Object:  StoredProcedure [dbo].[CreateSnapshotForecast]    Script Date: 4.11.2015 10:03:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CreateSnapshotForecast]
AS
  BEGIN TRANSACTION 

   -- VARS STATICS
	DECLARE @CampaignId INT = (SELECT CampaignId FROM campaign WHERE IsActual = 1);	
	DECLARE @ActualMonth INT = ( SELECT month(getdate()))
	
	-- INSERT NEWS PRODUCTS FROM CLIENTS WITH SALES AND FORECAST >0
	INSERT INTO snapshot_forecast(ClientProductId,CampaignId)
	SELECT f.ClientProductId , @CampaignId		   
	FROM SaleWithForecast f
	LEFT JOIN snapshot_forecast sf
	ON f.ClientProductId = sf.ClientProductId
	WHERE f.Total >0 AND f.CampaignId = @CampaignId AND sf.ClientProductId IS NULL

	-- UPDATE ACTUAL MONTH TOTALS FROM FORECAST
	UPDATE snapshot_forecast SET [January] = CASE WHEN @ActualMonth = 1 THEN f.Total END
								,[February] = CASE WHEN @ActualMonth = 2 THEN f.Total END
								,[March] = CASE WHEN @ActualMonth = 3 THEN f.Total END
								,[April] = CASE WHEN @ActualMonth = 4 THEN f.Total END
								,[May] = CASE WHEN @ActualMonth = 5 THEN f.Total END
								,[June] = CASE WHEN @ActualMonth = 6 THEN f.Total END
								,[July] = CASE WHEN @ActualMonth = 7 THEN f.Total END
								,[August] = CASE WHEN @ActualMonth = 8 THEN f.Total END
								,[September] = CASE WHEN @ActualMonth = 9 THEN f.Total END
								,[October] = CASE WHEN @ActualMonth = 10 THEN f.Total END
								,[November] = CASE WHEN @ActualMonth = 11 THEN f.Total END
								,[December] = CASE WHEN @ActualMonth = 12 THEN f.Total END
   FROM snapshot_forecast sf
   INNER JOIN SaleWithForecast f 
   ON sf.ClientProductId = f.ClientProductId
   WHERE sf.CampaignId = @CampaignId AND f.Total >0
  
  COMMIT TRANSACTION

GO
/****** Object:  StoredProcedure [dbo].[SP_ImportCustomer]    Script Date: 4.11.2015 10:03:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_ImportCustomer]
AS
  SET NOCOUNT ON;


/********************************************	VALIDATIONS ************************************************************/

	CREATE TABLE #ERRORS
	(
		CLIENT INT,
		DESCRIPTION VARCHAR(150),
		CAUSE VARCHAR(50)
	)
	
	-- VALIDATE DUPLICATE CLIENT

	INSERT INTO #ERRORS(CLIENT,DESCRIPTION,CAUSE)
	SELECT [Liable Customer],F3,'CLIENTE DUPLICADO'
	FROM TEMP_CUSTOMER
	GROUP BY [Liable Customer],F3
	HAVING COUNT(*) > 1;

	IF (SELECT COUNT(1) FROM #ERRORS)> 0 BEGIN 
		SELECT * FROM #ERRORS;
	END	 
	ELSE BEGIN

	SELECT * FROM #ERRORS;


/******************************************** COUNTRY ***************************************************/

-- UPDATE COUNTRY
UPDATE country SET	Description = temp.Country 					
FROM country c
INNER JOIN TEMP_CUSTOMER temp
ON c.Description = temp.Country


-- INSERT COUNTRY
INSERT country(Description)
SELECT DISTINCT temp.Country
FROM TEMP_CUSTOMER temp
LEFT JOIN country c
ON c.Description = temp.Country
WHERE c.CountryId IS NULL

/******************************************	CLIENT_TYPE	******************************************************/

-- UPDATE CLIENTS TYPES EXISTING
 UPDATE client_type SET Description = temp.Clasificacion
 FROM client_type ct 
 INNER JOIN TEMP_CUSTOMER temp 
 ON ct.Description = temp.Clasificacion



-- INSERTS NEWS CLIENTS TYPE
INSERT INTO client_type (Description)
SELECT DISTINCT tc.Clasificacion
FROM TEMP_CUSTOMER tc 
LEFT JOIN client_type ct 
ON ct.Description = tc.Clasificacion
WHERE ct.ClientTypeId IS NULL


/******************************************		USERS		*******************************************************/

-- INSERT RSMs 
INSERT INTO [user](DowUserId,Fullname,Email,Username,PasswordHash)
SELECT DISTINCT temp.RSM,
	   temp.F12,
	   temp.[Mail RSM],	   
	   CONCAT(replace(temp.[Mail RSM],'@dow.com',''),'rsm'),
	   '1c63129ae9db9c60c3e8aa94d3e00495'
FROM TEMP_CUSTOMER temp
LEFT JOIN [user] u 
ON u.DowUserId = temp.RSM
WHERE u.UserId IS NULL
 

-- INSERT DSMs 
INSERT INTO [user](DowUserId,ParentId,Fullname,Email,Username,PasswordHash)
SELECT DISTINCT 
	   temp.DSM,
	   rsm.UserId,
	   temp.F9,
	   temp.[Mail DSM],	   
	   CONCAT(replace(temp.[Mail DSM],'@dow.com',''),'dsm') AS Username,
	   '1c63129ae9db9c60c3e8aa94d3e00495' AS PasswordHash
FROM TEMP_CUSTOMER temp
LEFT JOIN 
( SELECT u.UserId,u.DowUserId
  FROM [user] u 
  WHERE CHARINDEX('dsm',u.Username) > 0 
) u
ON u.DowUserId = temp.DSM
INNER JOIN [user] rsm
ON rsm.DowUserId = temp.RSM
WHERE u.UserId IS NULL  AND CHARINDEX('rsm',rsm.Username) > 0

 
-- INSERT Sellers 
INSERT INTO [user](DowUserId,ParentId,Fullname,Email,Username,PasswordHash)
SELECT DISTINCT 
	   temp.[Field Seller],
	   dsm.UserId,
	   temp.F6,
	   temp.[Mail vendedor],	   
	   replace(temp.[Mail vendedor],'@dow.com','') AS Username,
	   '1c63129ae9db9c60c3e8aa94d3e00495' AS PasswordHash
FROM TEMP_CUSTOMER temp
LEFT JOIN 
( SELECT u.UserId,u.DowUserId
  FROM [user] u 
  WHERE NOT( CHARINDEX('dsm',u.Username) > 0 OR CHARINDEX('rsm',u.Username) > 0)
) u
ON u.DowUserId = temp.[Field Seller]
INNER JOIN [user] dsm
ON dsm.DowUserId = temp.DSM
WHERE u.UserId IS NULL AND CHARINDEX('dsm',dsm.Username) > 0
ORDER BY UserId





-- INSERT ROLES
DELETE FROM auth_assignment WHERE item_name IN ('DSM','RSM','SELLER');


INSERT INTO auth_assignment(user_id,item_name)
SELECT u.UserId, CASE WHEN u.Username like '%rsm%'  THEN 'RSM'
					  WHEN u.Username like '%dsm%'  THEN 'DSM'						  
			     ELSE 
					'SELLER'
			   END AS item_name
FROM [user] u
LEFT JOIN auth_assignment asg
ON asg.user_id = u.UserId
WHERE asg.user_id IS NULL



-- INSERT CLIENTS OTHERS


INSERT INTO client(ClientId,Description,IsGroup,CountryId,IsActive)
SELECT -u.UserId ,'OTROS',1,(SELECT TOP 1 CountryId 
							 FROM client cli
							 INNER JOIN client_seller cs 
							 ON cs.ClientId = cli.ClientId 
							 INNER JOIN [user] s 
							 ON s.UserId = cs.SellerId
							 WHERE u.UserId = s.UserId AND cli.CountryId IS NOT NULL
							 ) AS CountryId
							 ,1
FROM [user] u 
INNER JOIN auth_assignment asg
ON u.UserId = asg.user_id
WHERE asg.item_name = 'SELLER' AND NOT EXISTS(SELECT * FROM client ex WHERE ex.ClientId = -u.UserId )

-- UPDATE RSMs
UPDATE [user] SET Fullname = temp.F12, 
				  Email =  temp.[Mail RSM] , 
				  Username = CONCAT(replace(temp.[Mail RSM],'@dow.com',''),'rsm')
FROM [user] u 
INNER JOIN TEMP_CUSTOMER temp
ON u.DowUserId = temp.RSM
INNER JOIN auth_assignment asg
ON asg.user_id = u.UserId
WHERE asg.item_name = 'RSM'


-- UPDATE DSMs
UPDATE [user] SET Fullname = temp.F9, 
				  Email =  temp.[Mail DSM] , 
				  Username = CONCAT(replace(temp.[Mail DSM],'@dow.com',''),'dsm')
FROM [user] u 
INNER JOIN TEMP_CUSTOMER temp
ON u.DowUserId = temp.DSM
INNER JOIN auth_assignment asg
ON asg.user_id = u.UserId
WHERE asg.item_name = 'DSM'


-- UPDATE SELLERs
UPDATE [user] SET Fullname = temp.F6, 
				  Email = temp.[Mail vendedor] , 
				  Username = replace(temp.[Mail vendedor],'@dow.com','')
FROM [user] u 
INNER JOIN TEMP_CUSTOMER temp
ON u.DowUserId = temp.[Field Seller]
INNER JOIN auth_assignment asg
ON asg.user_id = u.UserId
WHERE asg.item_name = 'SELLER'


/******************************************		CLIENTS		*******************************************************/


-- INSERT NEWS CLIENTS

INSERT INTO client(ClientId, ClientTypeId, IsGroup, CountryId, Description , IsActive)
SELECT temp.[Liable Customer],ct.ClientTypeId, 0 ,cou.CountryId,temp.F3,1
FROM TEMP_CUSTOMER temp
LEFT JOIN client_type ct 
ON ct.Description = temp.Clasificacion
LEFT JOIN country cou 
ON cou.Description = temp.Country
LEFT JOIN client c
ON c.ClientId = temp.[Liable Customer]
WHERE c.ClientId IS NULL



--INSERT INTO client_seller
DELETE FROM client_seller;


-- INSERT RELATIONS CLIENT SELLER
INSERT INTO client_seller(ClientId,SellerId)
SELECT temp.[Liable Customer],
 	   s.UserId
FROM  TEMP_CUSTOMER temp
INNER JOIN [client] c
ON c.ClientId = temp.[Liable Customer]
INNER JOIN [user] s
ON s.DowUserId = temp.[Field Seller]
INNER JOIN auth_assignment asg
ON asg.user_id = s.UserId
WHERE asg.item_name = 'SELLER'

-- INSERT OTHERS in client_seller

INSERT INTO client_seller(ClientId,SellerId)
SELECT -u.UserId,u.UserId 
FROM [user] u 
INNER JOIN auth_assignment asg
ON u.UserId = asg.user_id
WHERE asg.item_name = 'SELLER'

-- UPDATE CLIENTS
UPDATE client SET Description = temp.F3, 
				  ClientTypeId = ct.ClientTypeId,
				  CountryId = cou.CountryId ,
				  IsGroup = 0, 
				  GroupId = CASE WHEN ct.Description = 'OTROS' THEN -cs.SellerId  ELSE NULL END
FROM client c 
INNER JOIN TEMP_CUSTOMER temp 
ON c.ClientId = temp.[Liable Customer]
INNER JOIN client_type ct 
ON ct.Description = temp.Clasificacion
INNER JOIN country cou 
ON cou.Description = temp.Country
INNER JOIN client_seller cs 
ON cs.ClientId = c.ClientId

-- UPDATE COUNTRIES CLIENT OTHERS IS VERY DIFfICULT
UPDATE client  SET CountryId = 
					 ( SELECT TOP 1 c.CountryId
					  FROM client c 
					  INNER JOIN client_seller csi 
					  ON c.ClientId = csi.ClientId 
					  WHERE csi.SellerId = cs.SellerId AND csi.ClientId >0					  
					  ) 
FROM client cli 
INNER JOIN client_seller cs 
ON cli.ClientId = cs.ClientId
WHERE cli.ClientId < 0


-- CLIENTS PRODUCTS

  END;
    DELETE FROM TEMP_CUSTOMER;
GO
/****** Object:  StoredProcedure [dbo].[SP_ImportCyO]    Script Date: 4.11.2015 10:03:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_ImportCyO]

AS
	 SET NOCOUNT ON;
	
	-- VALIDATIONS CyO	
	CREATE TABLE #ERRORS
	(
		GMID VARCHAR(20) NULL,
		CLIENT INT NULL ,
		CAUSE VARCHAR(50) 
	)

	INSERT #ERRORS(GMID,CAUSE)
	SELECT DISTINCT cyo.GmidId,
			'EL GMID NO EXISTE EN NUESTROS REGISTROS'
	FROM TEMP_CYO cyo
	LEFT JOIN gmid g
	ON g.GmidId  = cyo.GmidId
	WHERE g.GmidId IS NULL;
	

	INSERT #ERRORS(CLIENT,CAUSE)
	SELECT DISTINCT cyo.ClientId,
			'EL CLIENTE NO EXISTE EN NUESTROS REGISTROS'
	FROM TEMP_CYO cyo
	LEFT JOIN client c
	ON c.ClientId = cyo.ClientId
	WHERE c.ClientId IS NULL;

	IF (SELECT COUNT(1) FROM #ERRORS)>0 BEGIN 
		SELECT * FROM #ERRORS;
	END	 
	ELSE BEGIN
	
	SELECT * FROM #ERRORS;	
	DECLARE @ActualCampaignId INT
	SET @ActualCampaignId = (SELECT TOP 1 CampaignId FROM campaign WHERE IsActual = 1)
		
	DELETE FROM cyo WHERE CampaignId = @ActualCampaignId;
	
	INSERT INTO cyo(ClientId,GmidId,CampaignId,InventoryBalance)
	SELECT ClientId,GmidId,CampaignId,InventoryBalance
	FROM TEMP_CYO

	
	END;
	
	DELETE FROM TEMP_CYO;



GO
/****** Object:  StoredProcedure [dbo].[SP_ImportProducts]    Script Date: 4.11.2015 10:03:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_ImportProducts]
AS
	SET NOCOUNT ON;


	/****************************************** VALIDATIONS *************************************************/
	
	CREATE TABLE #ERRORS
	(
	    TRADEPRODUCT VARCHAR(20) NULL,
		GMID VARCHAR(20),
		DESCRIPTION VARCHAR(150),
		CAUSE VARCHAR(50)
	)

	-- VALIDATE GMID DUPLICATES (NESTOR SAY THAN THE PERFORMANCE AG MISC IS BAD)
	INSERT #ERRORS(GMID,DESCRIPTION,CAUSE)
 	SELECT GMID ,
		   F11 AS [Description], 
		   'GMID DUPLICADO' AS Cause 
	 FROM TEMP_PRODUCT
	 WHERE F7 <> 'AG MISC'
	 GROUP BY GMID,F11
	 HAVING COUNT(*)>1

	 -- VALIDATE DESCRIPTIONS DUPLICATES 
	 INSERT #ERRORS(GMID,DESCRIPTION,CAUSE)
	 SELECT GMID ,
			F11 AS [Description] ,
			'DESCRIPCION DUPLICADA'  AS Cause
	 FROM TEMP_PRODUCT
	 WHERE F7 <> 'AG MISC' AND GMID NOT IN(SELECT GMID FROM #ERRORS)
	 GROUP BY GMID,F11
	 HAVING COUNT(*)>1

	 -- VALIDATE TRADES DUPLICATED
	   INSERT #ERRORS(TRADEPRODUCT,DESCRIPTION,CAUSE)
	   SELECT  td.[Trade Product] , 
			   td.F9,			 
			   'PERFORMANCE DIFERENTE'  AS Cause
	  FROM 
	  (
	   SELECT DISTINCT temp.[Trade Product] , 
				temp.F9 ,		
				temp.[Performance Center]									
	  FROM TEMP_PRODUCT temp
	  WHERE  temp.F7 <> 'AG MISC'
	  ) td	 
	  GROUP BY td.[Trade Product] , td.F9 
	  HAVING COUNT(*) >1

	IF (SELECT COUNT(1) FROM #ERRORS)> 0 BEGIN 
		SELECT * FROM #ERRORS
	END	 
	ELSE BEGIN

	SELECT * FROM #ERRORS;	

/******************************************** COUNTRY ***************************************************/

-- UPDATE COUNTRY
UPDATE country SET	Description = temp.F2 , 
					Abbreviation = temp.Country
FROM country c
INNER JOIN TEMP_PRODUCT temp
ON c.Description = temp.F2


-- INSERT COUNTRY
INSERT country(Description,Abbreviation)
SELECT DISTINCT temp.F2 ,temp.Country
FROM TEMP_PRODUCT temp
LEFT JOIN country c
ON c.Description = temp.F2
WHERE c.CountryId IS NULL


/******************************************** VALUE_CENTER ***************************************************/

-- UPDATE VALUES CENTERS
UPDATE value_center SET Description = temp.F4 
					
FROM value_center vc
INNER JOIN TEMP_PRODUCT temp
ON vc.ValueCenterId = temp.ValueCenter


-- INSERT NEWS VALUES CENTERS 
INSERT value_center(ValueCenterId,Description)
SELECT DISTINCT temp.ValueCenter ,temp.F4 
FROM TEMP_PRODUCT temp
LEFT JOIN value_center vc
ON vc.ValueCenterId = temp.ValueCenter
WHERE vc.ValueCenterId IS NULL

/******************************************** PERFORMANCE_CENTER ***************************************************/


-- UPDATES PERFORMANCES CENTERS
UPDATE performance_center SET Description = temp.F7 , 
							  ValueCenterId = temp.ValueCenter
FROM performance_center pc
INNER JOIN TEMP_PRODUCT temp
ON pc.PerformanceCenterId = temp.[Performance Center]




-- INSERT NEWS PERFORMANCES CENTERS
INSERT performance_center(PerformanceCenterId,Description,ValueCenterId)
SELECT DISTINCT temp.[Performance Center] ,temp.F7 ,temp.ValueCenter
FROM TEMP_PRODUCT temp
LEFT JOIN performance_center pc
ON pc.PerformanceCenterId = temp.[Performance Center]
WHERE pc.PerformanceCenterId IS NULL

/******************************************** TRADE_PRODUCT ***************************************************/

-- UPDATES TRADES PRODUCTS
UPDATE trade_product SET Description = temp.F9 , 
					     PerformanceCenterId = temp.[Performance Center],
						 Price = (SELECT MIN(tem.Precio) FROM  TEMP_PRODUCT tem WHERE tem.[Trade Product] = temp.[Trade Product]),
						 Profit = (SELECT MIN(tem.Margen) FROM  TEMP_PRODUCT tem WHERE tem.[Trade Product] = temp.[Trade Product])						 

FROM trade_product tp
INNER JOIN TEMP_PRODUCT temp
ON tp.TradeProductId = temp.[Trade Product]
WHERE  temp.F7 <> 'AG MISC'


-- INSERT NEWS TRADES PRODUCTS
INSERT trade_product(TradeProductId,Description,PerformanceCenterId,Price,Profit,IsForecastable)
SELECT DISTINCT temp.[Trade Product] , 
				temp.F9 ,
				temp.[Performance Center],
				Precio = (SELECT MIN(tem.Precio) FROM  TEMP_PRODUCT tem WHERE tem.[Trade Product] = temp.[Trade Product]),
				Margen = (SELECT MIN(tem.Margen) FROM  TEMP_PRODUCT tem WHERE tem.[Trade Product] = temp.[Trade Product]),
				IsForecastable = CASE WHEN temp.F4 = 'SEEDS' THEN 1 ELSE 0 END
FROM TEMP_PRODUCT temp
LEFT JOIN trade_product tp
ON tp.TradeProductId = temp.[Trade Product]
WHERE tp.TradeProductId IS NULL AND temp.F7 <> 'AG MISC';

--INTO #NEW_TRADES 
--INSERT trade_product(TradeProductId,Description,PerformanceCenterId,Price,Profit,IsForecastable)
--SELECT [Trade Product],F9,[Performance Center],Precio,Margen,IsForecastable FROM #NEW_TRADES;


/******************************************** GMID ***************************************************/



-- UPDATES GMIDs
UPDATE gmid SET Description = temp.F11 , 
					     TradeProductId = temp.[Trade Product],
						 Price = temp.Precio,
						 Profit = temp.Margen,
						 CountryId = (SELECT TOP 1 CountryId FROM country WHERE Description = temp.F2)					 

FROM gmid g
INNER JOIN TEMP_PRODUCT temp
ON g.GmidId = temp.GMID
WHERE temp.F7 <> 'AG MISC'



-- INSERT NEWS GMIDs
INSERT gmid(GmidId,Description,TradeProductId,Price,Profit,CountryId,IsForecastable)
SELECT DISTINCT temp.GMID , temp.F11 ,temp.[Trade Product],temp.Precio,temp.Margen,(SELECT TOP 1 CountryId 
																					FROM country 
																					WHERE Description = temp.F2) AS Country,
					IsForecastable = CASE WHEN temp.F4 <> 'SEEDS' THEN 1 ELSE 0 END
FROM TEMP_PRODUCT temp
LEFT JOIN gmid g
ON g.GmidId = temp.GMID
WHERE g.GmidId IS NULL AND temp.F7 <> 'AG MISC'


--INTO #NEW_GMIDS
--SELECT GMID,F11,[Trade Product],Precio,Margen,Country,IsForecastable 
--FROM #NEW_GMIDS




/***************************************** PLAN AND FORECAST OF CAMPAIGN ACTUAL *******************************************/

DECLARE @ActualCampaignId INT
SET @ActualCampaignId = (SELECT TOP 1 CampaignId FROM campaign WHERE IsActual = 1)

-- CLIENTS PRODUCTS


INSERT INTO client_product(GmidId,ClientId,TradeProductId,IsForecastable)
SELECT DISTINCT g.GmidId, cli.ClientId,g.TradeProductId,1
FROM gmid g
INNER JOIN country c
ON c.CountryId = g.CountryId
INNER JOIN client cli
ON cli.CountryId = c.CountryId
INNER JOIN trade_product t
ON t.TradeProductId = g.TradeProductId
INNER JOIN performance_center pc 
ON pc.PerformanceCenterId = t.PerformanceCenterId
LEFT JOIN client_product cp 
ON cp.GmidId = g.GmidId AND cli.ClientId = cp.ClientId
WHERE pc.ValueCenterId <> 10111 AND cp.GmidId IS NULL
;

-- CLIENTS PRODUCTS


INSERT INTO client_product(GmidId,ClientId,TradeProductId,IsForecastable)
SELECT DISTINCT g.GmidId, cli.ClientId,g.TradeProductId,1
FROM gmid g
INNER JOIN country c
ON c.CountryId = g.CountryId
INNER JOIN client cli
ON cli.CountryId = c.CountryId
INNER JOIN trade_product t
ON t.TradeProductId = g.TradeProductId
INNER JOIN performance_center pc 
ON pc.PerformanceCenterId = t.PerformanceCenterId
LEFT JOIN client_product cp 
ON cp.GmidId = g.GmidId AND cli.ClientId = cp.ClientId
WHERE pc.ValueCenterId <> 10111 AND cp.GmidId IS NULL
;


INSERT INTO client_product(ClientId,TradeProductId,IsForecastable)
SELECT DISTINCT cli.ClientId,t.TradeProductId,1
FROM trade_product t
INNER JOIN gmid g 
ON g.TradeProductId = t.TradeProductId
INNER JOIN client cli
ON cli.CountryId = g.CountryId
INNER JOIN performance_center pc 
ON pc.PerformanceCenterId = t.PerformanceCenterId
LEFT JOIN client_product cp 
ON cp.TradeProductId = t.TradeProductId AND cli.ClientId = cp.ClientId
WHERE pc.ValueCenterId = 10111 AND cp.TradeProductId IS NULL
GROUP BY cli.ClientId,t.TradeProductId, g.CountryId;



-- INSERTS NEWS ROWS FROM CLIENT_PRODUCT TO PLAN 

INSERT INTO [plan](ClientProductId,CampaignId)
SELECT cp.ClientProductId,@ActualCampaignId 
FROM
	( SELECT p.ClientProductId,p.CampaignId 
	  FROM [plan] p
	  WHERE p.CampaignId =@ActualCampaignId
    ) planing

RIGHT JOIN client_product cp 
ON cp.ClientProductId = planing.ClientProductId
WHERE planing.ClientProductId IS NULL 


-- INSERTS NEWS ROWS FROM CLIENT_PRODUCT TO FORECAST

INSERT INTO [forecast](ClientProductId,CampaignId)
SELECT cp.ClientProductId,@ActualCampaignId 
FROM
	( SELECT f.ClientProductId,f.CampaignId 
	  FROM [forecast] f
	  WHERE f.CampaignId = @ActualCampaignId
    ) fore

RIGHT JOIN client_product cp 
ON cp.ClientProductId = fore.ClientProductId
WHERE fore.ClientProductId IS NULL 



 END;
	DELETE FROM TEMP_PRODUCT;	
	DROP TABLE  #ERRORS

GO
/****** Object:  StoredProcedure [dbo].[SP_ImportSales]    Script Date: 4.11.2015 10:03:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[SP_ImportSales]
AS
	 SET NOCOUNT ON;
	
	-- VALIDATIONS SALES	
	CREATE TABLE #ERRORS
	(
		GMID VARCHAR(20),
		DESCRIPTION VARCHAR(150),
		[MONTH] INT ,
		CLIENT INT ,
		CAUSE VARCHAR(50)
	)

	INSERT #ERRORS(GMID,DESCRIPTION,[MONTH],CLIENT,CAUSE)
	SELECT  GMID,
			F5, 
			[Calendar month], 
			[Liable Customer],
			'HAY VENTA DUPLICADA'
	FROM TEMP_SALE
	GROUP BY [Liable Customer],F5,GMID,[Calendar year],[Calendar month]
	HAVING COUNT(*) > 1;

	INSERT #ERRORS(GMID,CAUSE)
	SELECT  ts.GMID,			
			'GMID INEXISTENTE'
	FROM TEMP_SALE ts
	WHERE NOT EXISTS(SELECT 1 FROM gmid g WHERE g.GmidId =ts.GMID )
	GROUP BY ts.GMID
	ORDER BY ts.GMID


	IF (SELECT COUNT(1) FROM #ERRORS)>0 BEGIN 
		SELECT * FROM #ERRORS;
	END	 
	ELSE BEGIN
		SELECT * FROM #ERRORS;
	SELECT c.CampaignId,c.Name
	INTO #campaigns
	FROM TEMP_SALE ts
	INNER JOIN campaign c
	ON CAST(c.Name AS INT) = ts.[Calendar year]
	GROUP BY c.CampaignId,c.Name;



	DELETE FROM sale WHERE CampaignId IN (SELECT CampaignId FROM #campaigns);
		
	
	INSERT INTO sale(ClientId,GmidId,Month,Amount,Total,CampaignId)
	SELECT [Liable Customer],GMID,[Calendar month],Actual,Total,c.CampaignId
	FROM TEMP_SALE ts
	INNER JOIN campaign c
	ON CAST(c.Name AS INT) = ts.[Calendar year]
	
	END;
	
	DELETE FROM TEMP_SALE;





GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'`dow.forecast`.auth_assignment' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'auth_assignment'
GO
