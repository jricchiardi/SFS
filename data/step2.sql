USE [testing.dow.forecast]
GO
INSERT [dbo].[auth_item] ([name], [type], [description], [rule_name], [data], [created_at], [updated_at]) VALUES (N'admin', 4, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[auth_item] ([name], [type], [description], [rule_name], [data], [created_at], [updated_at]) VALUES (N'Director Comercial', 5, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[auth_item] ([name], [type], [description], [rule_name], [data], [created_at], [updated_at]) VALUES (N'DSM', 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[auth_item] ([name], [type], [description], [rule_name], [data], [created_at], [updated_at]) VALUES (N'RSM', 2, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[auth_item] ([name], [type], [description], [rule_name], [data], [created_at], [updated_at]) VALUES (N'SELLER', 3, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[campaign] ON 

INSERT [dbo].[campaign] ([CampaignId], [Name], [IsFuture], [IsActual], [PlanDateTo], [PlanDateFrom], [PlanSettingDateTo], [PlanSettingDateFrom], [IsActive]) VALUES (3, N'2015', 0, 1, CAST(N'2015-12-31 00:00:00.000' AS DateTime), CAST(N'2015-10-10 00:00:00.000' AS DateTime), CAST(N'2015-10-02 00:00:00.0000000' AS DateTime2), CAST(N'2015-10-01 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[campaign] ([CampaignId], [Name], [IsFuture], [IsActual], [PlanDateTo], [PlanDateFrom], [PlanSettingDateTo], [PlanSettingDateFrom], [IsActive]) VALUES (4, N'2014', 0, 0, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[campaign] ([CampaignId], [Name], [IsFuture], [IsActual], [PlanDateTo], [PlanDateFrom], [PlanSettingDateTo], [PlanSettingDateFrom], [IsActive]) VALUES (6, N'2013', 0, 0, NULL, NULL, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[campaign] OFF
SET IDENTITY_INSERT [dbo].[client_type] ON 

INSERT [dbo].[client_type] ([ClientTypeId], [Description], [IsActive]) VALUES (1, N'ALL', 1)
INSERT [dbo].[client_type] ([ClientTypeId], [Description], [IsActive]) VALUES (2, N'DIAMOND GOLD', 1)
INSERT [dbo].[client_type] ([ClientTypeId], [Description], [IsActive]) VALUES (3, N'DIAMOND PLATINUM', 1)
INSERT [dbo].[client_type] ([ClientTypeId], [Description], [IsActive]) VALUES (4, N'DIAMOND SILVER', 1)
INSERT [dbo].[client_type] ([ClientTypeId], [Description], [IsActive]) VALUES (5, N'KEY ACCOUNTS', 1)
INSERT [dbo].[client_type] ([ClientTypeId], [Description], [IsActive]) VALUES (6, N'MEGAGROWER', 1)
INSERT [dbo].[client_type] ([ClientTypeId], [Description], [IsActive]) VALUES (7, N'OTROS', 1)
SET IDENTITY_INSERT [dbo].[client_type] OFF
SET IDENTITY_INSERT [dbo].[notification_status] ON 

INSERT [dbo].[notification_status] ([NotificationStatusId], [Name]) VALUES (3, N'Pendiente')
INSERT [dbo].[notification_status] ([NotificationStatusId], [Name]) VALUES (4, N'Finalizado')
SET IDENTITY_INSERT [dbo].[notification_status] OFF
SET IDENTITY_INSERT [dbo].[setting] ON 

INSERT [dbo].[setting] ([SettingId], [Name], [DisplayName], [Value]) VALUES (5, N'Indica el mes a partir del cual el forecast estará disponible', N'FORECAST_ENABLE_FROM', N'8')
SET IDENTITY_INSERT [dbo].[setting] OFF
SET IDENTITY_INSERT [dbo].[type_audit] ON 

INSERT [dbo].[type_audit] ([TypeAuditId], [Name], [PublicName]) VALUES (1, N'Login', N'TYPE_LOGIN')
INSERT [dbo].[type_audit] ([TypeAuditId], [Name], [PublicName]) VALUES (2, N'Guardado de datos de forecast', N'TYPE_SAVE_FORECAST')
INSERT [dbo].[type_audit] ([TypeAuditId], [Name], [PublicName]) VALUES (3, N'Guardado de datos de plan', N'TYPE_SAVE_PLAN')
SET IDENTITY_INSERT [dbo].[type_audit] OFF
SET IDENTITY_INSERT [dbo].[type_import] ON 

INSERT [dbo].[type_import] ([TypeImportId], [Name]) VALUES (1, N'PRODUCT')
INSERT [dbo].[type_import] ([TypeImportId], [Name]) VALUES (2, N'CLIENT')
INSERT [dbo].[type_import] ([TypeImportId], [Name]) VALUES (3, N'SALE')
INSERT [dbo].[type_import] ([TypeImportId], [Name]) VALUES (4, N'FORECAST')
INSERT [dbo].[type_import] ([TypeImportId], [Name]) VALUES (5, N'SETTING')
INSERT [dbo].[type_import] ([TypeImportId], [Name]) VALUES (6, N'CyO')
INSERT [dbo].[type_import] ([TypeImportId], [Name]) VALUES (7, N'PLAN')
SET IDENTITY_INSERT [dbo].[type_import] OFF
INSERT INTO [dbo].[user]
           (
            [DowUserId]
           ,[Username]
           ,[Fullname]
           ,[AuthKey]
           ,[PasswordHash]
           ,[PasswordResetToken]
           ,[Email]
           ,[ParentId]
           ,[CreatedAt]
           ,[UpdatedAt]
           ,[resetPassword]
           ,[IsActive])
     VALUES
           (NULL
           ,'admin'
           ,'Administrador'
           ,NULL
           ,'1c63129ae9db9c60c3e8aa94d3e00495'
           ,NULL
           ,'admin@dow.com'
           ,NULL
           ,NULL
           ,NULL
           ,0
           ,1)