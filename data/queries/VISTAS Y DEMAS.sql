USE [dow.forecast]
GO
/****** Object:  Table [dbo].[auth_assignment]    Script Date: 7.8.2015 15:28:23 ******/
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
/****** Object:  Table [dbo].[auth_item]    Script Date: 7.8.2015 15:28:23 ******/
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
/****** Object:  Table [dbo].[auth_item_child]    Script Date: 7.8.2015 15:28:23 ******/
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
/****** Object:  Table [dbo].[auth_rule]    Script Date: 7.8.2015 15:28:23 ******/
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
/****** Object:  Table [dbo].[campaign]    Script Date: 7.8.2015 15:28:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[campaign](
	[CampaignId] [int] IDENTITY(3,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[IsActual] [bit] NOT NULL CONSTRAINT [DF__campaign__IsActu__2F10007B]  DEFAULT (0x00),
	[PlanificationDateTo] [datetime2](0) NOT NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF__campaign__IsActi__300424B4]  DEFAULT ((1)),
 CONSTRAINT [PK_campaign_CampaignId] PRIMARY KEY CLUSTERED 
(
	[CampaignId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[city]    Script Date: 7.8.2015 15:28:23 ******/
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
/****** Object:  Table [dbo].[client]    Script Date: 7.8.2015 15:28:23 ******/
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
/****** Object:  Table [dbo].[client_product]    Script Date: 7.8.2015 15:28:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[client_product](
	[ClientProductId] [int] IDENTITY(1,1) NOT NULL,
	[GmidId] [varchar](20) NULL,
	[TradeProductId] [varchar](20) NULL,
	[ClientId] [int] NULL,
	[IsForecastable] [bit] NULL,
 CONSTRAINT [PK_client_product] PRIMARY KEY CLUSTERED 
(
	[ClientProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[client_seller]    Script Date: 7.8.2015 15:28:23 ******/
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
/****** Object:  Table [dbo].[client_type]    Script Date: 7.8.2015 15:28:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[client_type](
	[ClientTypeId] [int] NOT NULL,
	[Description] [varchar](50) NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_client_type] PRIMARY KEY CLUSTERED 
(
	[ClientTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[country]    Script Date: 7.8.2015 15:28:23 ******/
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
/****** Object:  Table [dbo].[forecast]    Script Date: 7.8.2015 15:28:23 ******/
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
/****** Object:  Table [dbo].[gmid]    Script Date: 7.8.2015 15:28:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[gmid](
	[GmidId] [varchar](20) NOT NULL,
	[Description] [varchar](150) NULL,
	[TradeProductId] [varchar](20) NULL,
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
/****** Object:  Table [dbo].[migration]    Script Date: 7.8.2015 15:28:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[migration](
	[version] [nvarchar](180) NOT NULL,
	[apply_time] [int] NULL DEFAULT (NULL),
 CONSTRAINT [PK_migration_version] PRIMARY KEY CLUSTERED 
(
	[version] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[notification]    Script Date: 7.8.2015 15:28:23 ******/
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
/****** Object:  Table [dbo].[notification_status]    Script Date: 7.8.2015 15:28:23 ******/
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
/****** Object:  Table [dbo].[performance_center]    Script Date: 7.8.2015 15:28:23 ******/
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
/****** Object:  Table [dbo].[plan]    Script Date: 7.8.2015 15:28:23 ******/
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
/****** Object:  Table [dbo].[sale]    Script Date: 7.8.2015 15:28:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[sale](
	[ClientId] [int] NOT NULL,
	[GmidId] [varchar](20) NOT NULL,
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[setting]    Script Date: 7.8.2015 15:28:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[setting](
	[SettingId] [int] IDENTITY(3,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL DEFAULT (N'0'),
	[DisplayName] [nvarchar](50) NOT NULL DEFAULT (N'0'),
	[Value] [nvarchar](100) NOT NULL DEFAULT (N'0'),
 CONSTRAINT [PK_setting_SettingId] PRIMARY KEY CLUSTERED 
(
	[SettingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[state]    Script Date: 7.8.2015 15:28:23 ******/
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
	[IsActive] [binary](1) NOT NULL DEFAULT (0x01),
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
/****** Object:  Table [dbo].[trade_product]    Script Date: 7.8.2015 15:28:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[trade_product](
	[TradeProductId] [varchar](20) NOT NULL,
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
/****** Object:  Table [dbo].[unit]    Script Date: 7.8.2015 15:28:23 ******/
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
/****** Object:  Table [dbo].[user]    Script Date: 7.8.2015 15:28:23 ******/
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
/****** Object:  Table [dbo].[value_center]    Script Date: 7.8.2015 15:28:23 ******/
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
/****** Object:  View [dbo].[InverseSale]    Script Date: 7.8.2015 15:28:23 ******/
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
/****** Object:  View [dbo].[SaleFormat]    Script Date: 7.8.2015 15:28:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- VIEW SALE WITH client_product AND trade_product
CREATE VIEW [dbo].[SaleFormat]
AS
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
FROM dbo.InverseSale invSale
LEFT JOIN dbo.gmid g 
ON g.GmidId = invSale.GmidId
LEFT JOIN dbo.client_product cp
ON invSale.ClientId = cp.ClientId AND cp.GmidId = invSale.GmidId    
LEFT JOIN dbo.trade_product tp 
ON tp.TradeProductId = cp.TradeProductId


GO
/****** Object:  View [dbo].[SaleWithForecast]    Script Date: 7.8.2015 15:28:23 ******/
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

	   'January' =  CASE WHEN 1 < DATEPART(mm,GETDATE()) THEN isnull(sal.January,0) ELSE isnull(f.January,0) END,
	   'February' = CASE WHEN 2 < DATEPART(mm,GETDATE()) THEN isnull(sal.February,0) ELSE isnull(f.February,0) END,
	   'March' =  CASE WHEN 3 < DATEPART(mm,GETDATE()) THEN isnull(sal.March,0) ELSE isnull(f.March,0) END,
	   'April' =  CASE WHEN 4 < DATEPART(mm,GETDATE()) THEN isnull(sal.April,0) ELSE isnull(f.April,0) END,
	   'May' =  CASE WHEN 5 < DATEPART(mm,GETDATE()) THEN isnull(sal.May,0) ELSE isnull(f.May,0) END,
	   'June' = CASE WHEN 6 < DATEPART(mm,GETDATE()) THEN isnull(sal.June,0) ELSE isnull(f.June,0) END,
	   'July' = CASE WHEN 7 < DATEPART(mm,GETDATE()) THEN isnull(sal.July,0) ELSE isnull(f.July,0) END,
	   'August' = CASE WHEN 8 < DATEPART(mm,GETDATE()) THEN isnull(sal.August,0) ELSE isnull(f.August,0) END,
	   'September' =CASE WHEN 9 < DATEPART(mm,GETDATE()) THEN isnull(sal.September,0) ELSE isnull(f.September,0) END,
	   'October' = CASE WHEN 10 < DATEPART(mm,GETDATE()) THEN isnull(sal.October,0) ELSE isnull(f.October,0) END,
	   'November' = CASE WHEN 11 < DATEPART(mm,GETDATE()) THEN isnull(sal.November,0) ELSE isnull(f.November,0) END,
	   'December' = CASE WHEN 12 < DATEPART(mm,GETDATE()) THEN isnull(sal.December,0) ELSE isnull(f.December,0) END,
	   ForecastDescription = CASE  vc.ValueCenterId WHEN 10111 THEN tp.Description
							 		ELSE  g.Description
							  END	,
  	   ForecastPrice = CASE  vc.ValueCenterId WHEN 10111 THEN tp.Price
									ELSE  g.Price
							  END	

FROM dbo.forecast f
INNER JOIN client_product cp 
ON cp.ClientProductId = f.ClientProductId
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
/****** Object:  View [dbo].[GmidUnionTrade]    Script Date: 7.8.2015 15:28:23 ******/
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
	   tp.Profit
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
	   tp.Profit
FROM trade_product tp
INNER JOIN performance_center pc 
ON pc.PerformanceCenterId = tp.PerformanceCenterId
INNER JOIN value_center vc 
ON vc.ValueCenterId = pc.ValueCenterId
WHERE tp.IsForecastable = 1


GO
ALTER TABLE [dbo].[auth_rule] ADD  DEFAULT (NULL) FOR [created_at]
GO
ALTER TABLE [dbo].[auth_rule] ADD  DEFAULT (NULL) FOR [updated_at]
GO
ALTER TABLE [dbo].[city] ADD  DEFAULT (0x01) FOR [IsActive]
GO
ALTER TABLE [dbo].[client_type] ADD  CONSTRAINT [DF_client_type_IsActive]  DEFAULT ((1)) FOR [IsActive]
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
ALTER TABLE [dbo].[unit] ADD  DEFAULT (NULL) FOR [Name]
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
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'`dow.forecast`.auth_assignment' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'auth_assignment'
GO
