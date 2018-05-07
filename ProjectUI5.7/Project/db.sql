USE [db_ProjectInfo]
GO
/****** Object:  Table [dbo].[tb_user]    Script Date: 05/03/2018 16:27:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_user](
	[id] [varchar](12) NOT NULL,
	[phone] [varchar](11) NOT NULL,
	[password] [varchar](16) NOT NULL,
	[name] [varchar](16) NULL,
	[email] [nchar](15) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[tb_user] ([id], [phone], [password], [name], [email]) VALUES (N'201408030409', N'15616038416', N'yewanxuan', N'yewanxuan', NULL)
/****** Object:  Table [dbo].[tb_type]    Script Date: 05/03/2018 16:27:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_type](
	[id] [smallint] NOT NULL,
	[type_sign] [smallint] NOT NULL,
	[type_name] [varchar](20) NULL,
	[type_pid] [smallint] NULL,
 CONSTRAINT [PK_tb_type] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[tb_type] ([id], [type_sign], [type_name], [type_pid]) VALUES (1, 1, N'前端开发', 1)
INSERT [dbo].[tb_type] ([id], [type_sign], [type_name], [type_pid]) VALUES (2, 2, N'后台开发', 2)
INSERT [dbo].[tb_type] ([id], [type_sign], [type_name], [type_pid]) VALUES (3, 3, N'移动开发', 3)
INSERT [dbo].[tb_type] ([id], [type_sign], [type_name], [type_pid]) VALUES (4, 4, N'软件测试', 4)
INSERT [dbo].[tb_type] ([id], [type_sign], [type_name], [type_pid]) VALUES (5, 5, N'人工智能', 5)
INSERT [dbo].[tb_type] ([id], [type_sign], [type_name], [type_pid]) VALUES (6, 6, N'数据分析', 6)
INSERT [dbo].[tb_type] ([id], [type_sign], [type_name], [type_pid]) VALUES (7, 7, N'信息安全', 7)
INSERT [dbo].[tb_type] ([id], [type_sign], [type_name], [type_pid]) VALUES (8, 8, N'通信工程', 8)
INSERT [dbo].[tb_type] ([id], [type_sign], [type_name], [type_pid]) VALUES (9, 9, N'硬件开发', 9)
INSERT [dbo].[tb_type] ([id], [type_sign], [type_name], [type_pid]) VALUES (10, 10, N'产品运营', 10)
INSERT [dbo].[tb_type] ([id], [type_sign], [type_name], [type_pid]) VALUES (11, 11, N'竞赛专栏', 11)
INSERT [dbo].[tb_type] ([id], [type_sign], [type_name], [type_pid]) VALUES (12, 12, N'web前端', 1)
INSERT [dbo].[tb_type] ([id], [type_sign], [type_name], [type_pid]) VALUES (13, 13, N'javascript', 1)
INSERT [dbo].[tb_type] ([id], [type_sign], [type_name], [type_pid]) VALUES (14, 14, N'java', 2)
INSERT [dbo].[tb_type] ([id], [type_sign], [type_name], [type_pid]) VALUES (15, 15, N'php', 2)
INSERT [dbo].[tb_type] ([id], [type_sign], [type_name], [type_pid]) VALUES (16, 16, N'.net', 2)
INSERT [dbo].[tb_type] ([id], [type_sign], [type_name], [type_pid]) VALUES (17, 17, N'C++', 2)
INSERT [dbo].[tb_type] ([id], [type_sign], [type_name], [type_pid]) VALUES (18, 18, N'C', 2)
INSERT [dbo].[tb_type] ([id], [type_sign], [type_name], [type_pid]) VALUES (19, 19, N'html5', 1)
INSERT [dbo].[tb_type] ([id], [type_sign], [type_name], [type_pid]) VALUES (20, 20, N'android', 3)
INSERT [dbo].[tb_type] ([id], [type_sign], [type_name], [type_pid]) VALUES (21, 21, N'ios', 3)
INSERT [dbo].[tb_type] ([id], [type_sign], [type_name], [type_pid]) VALUES (22, 22, N'javascript', 3)
INSERT [dbo].[tb_type] ([id], [type_sign], [type_name], [type_pid]) VALUES (23, 23, N'web前端', 3)
INSERT [dbo].[tb_type] ([id], [type_sign], [type_name], [type_pid]) VALUES (24, 24, N'机器学习', 5)
INSERT [dbo].[tb_type] ([id], [type_sign], [type_name], [type_pid]) VALUES (25, 25, N'图像处理', 5)
INSERT [dbo].[tb_type] ([id], [type_sign], [type_name], [type_pid]) VALUES (26, 26, N'深度学习', 5)
INSERT [dbo].[tb_type] ([id], [type_sign], [type_name], [type_pid]) VALUES (27, 27, N'语音识别', 5)
INSERT [dbo].[tb_type] ([id], [type_sign], [type_name], [type_pid]) VALUES (28, 28, N'数据通信', 8)
INSERT [dbo].[tb_type] ([id], [type_sign], [type_name], [type_pid]) VALUES (29, 29, N'光通信', 8)
INSERT [dbo].[tb_type] ([id], [type_sign], [type_name], [type_pid]) VALUES (30, 30, N'移动通信', 8)
INSERT [dbo].[tb_type] ([id], [type_sign], [type_name], [type_pid]) VALUES (31, 31, N'无线射频', 8)
INSERT [dbo].[tb_type] ([id], [type_sign], [type_name], [type_pid]) VALUES (32, 32, N'ACM竞赛', 11)
INSERT [dbo].[tb_type] ([id], [type_sign], [type_name], [type_pid]) VALUES (33, 33, N'美赛', 11)
INSERT [dbo].[tb_type] ([id], [type_sign], [type_name], [type_pid]) VALUES (34, 34, N'数字信号处理', 8)
/****** Object:  Table [dbo].[tb_info]    Script Date: 05/03/2018 16:27:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_info](
	[id] [smallint] IDENTITY(1,1) NOT NULL,
	[info_type] [smallint] NOT NULL,
	[info_title] [varchar](80) NULL,
	[info_content] [varchar](1000) NULL,
	[info_linkman] [varchar](50) NULL,
	[info_phone] [varchar](50) NULL,
	[info_email] [varchar](100) NULL,
	[info_date] [datetime] NULL,
	[info_state] [varchar](1) NULL,
	[info_attention] [varchar](1) NULL,
	[info_typepid] [smallint] NULL,
	[info_userid] [nchar](15) NULL,
 CONSTRAINT [PK_tb_info] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[tb_info] ON
INSERT [dbo].[tb_info] ([id], [info_type], [info_title], [info_content], [info_linkman], [info_phone], [info_email], [info_date], [info_state], [info_attention], [info_typepid], [info_userid]) VALUES (101, 1, N'诚招前端小姐姐', N'购物展示网站', N'叶小姐', N'15616038416', N'HNU_Wendy@163.com', CAST(0x0000A87F01217D60 AS DateTime), N'1', N'0', 1, N'201408030409   ')
INSERT [dbo].[tb_info] ([id], [info_type], [info_title], [info_content], [info_linkman], [info_phone], [info_email], [info_date], [info_state], [info_attention], [info_typepid], [info_userid]) VALUES (102, 2, N'诚招后台小哥哥', N'能打各种代码的', N'叶小姐', N'15616038416', N'HNU_wendy@163.com', CAST(0x0000A88101217D60 AS DateTime), N'1', N'1', 2, N'201408030409   ')
INSERT [dbo].[tb_info] ([id], [info_type], [info_title], [info_content], [info_linkman], [info_phone], [info_email], [info_date], [info_state], [info_attention], [info_typepid], [info_userid]) VALUES (103, 3, N'诚招数据挖掘小哥哥', N'我也不知道这是找来干嘛', N'叶小姐', N'156616038416', N'HNU_Wendy@163.com', CAST(0x0000A88100C5C100 AS DateTime), N'1', N'1', 3, NULL)
INSERT [dbo].[tb_info] ([id], [info_type], [info_title], [info_content], [info_linkman], [info_phone], [info_email], [info_date], [info_state], [info_attention], [info_typepid], [info_userid]) VALUES (104, 4, NULL, NULL, NULL, NULL, NULL, NULL, N'0', N'1', 4, NULL)
INSERT [dbo].[tb_info] ([id], [info_type], [info_title], [info_content], [info_linkman], [info_phone], [info_email], [info_date], [info_state], [info_attention], [info_typepid], [info_userid]) VALUES (105, 5, N'测试很重要', N'到底哪错了', N'叶小姐', N'15616038416', N'3@qq.com', CAST(0x0000A88100C5C100 AS DateTime), N'1', N'0', 5, NULL)
INSERT [dbo].[tb_info] ([id], [info_type], [info_title], [info_content], [info_linkman], [info_phone], [info_email], [info_date], [info_state], [info_attention], [info_typepid], [info_userid]) VALUES (106, 16, N'asdf', N'df', N'???', N'15616038416', N'HNU_Wendy@163.com', CAST(0x0000A883017704B0 AS DateTime), N'1', N'1', 2, NULL)
INSERT [dbo].[tb_info] ([id], [info_type], [info_title], [info_content], [info_linkman], [info_phone], [info_email], [info_date], [info_state], [info_attention], [info_typepid], [info_userid]) VALUES (113, 16, N'to be not check', N'yeyeyeyye', N'ye', N'15616038416', N'HNU_Wendy@163.com', CAST(0x0000A8860156FABC AS DateTime), N'1', N'1', 2, NULL)
INSERT [dbo].[tb_info] ([id], [info_type], [info_title], [info_content], [info_linkman], [info_phone], [info_email], [info_date], [info_state], [info_attention], [info_typepid], [info_userid]) VALUES (114, 17, N'to be check', N'okokokok', N'?????????', N'15616038416', N'HNU_Wendy@163.com', CAST(0x0000A886015C1A10 AS DateTime), N'1', N'1', 2, NULL)
INSERT [dbo].[tb_info] ([id], [info_type], [info_title], [info_content], [info_linkman], [info_phone], [info_email], [info_date], [info_state], [info_attention], [info_typepid], [info_userid]) VALUES (115, 11, N'ACM???èμ?', N'????oo???é??', N'?????????', N'15616038416', N'HNU_Wendy@163.com', CAST(0x0000A8BE00EDC90C AS DateTime), N'1', N'2', 11, NULL)
INSERT [dbo].[tb_info] ([id], [info_type], [info_title], [info_content], [info_linkman], [info_phone], [info_email], [info_date], [info_state], [info_attention], [info_typepid], [info_userid]) VALUES (116, 11, N'FOR ACM', N'THREE&nbsp;', N'ye', N'13700571003', N'HNU_Wendy@163.com', CAST(0x0000A8BE00EFE098 AS DateTime), N'1', N'2', 11, NULL)
INSERT [dbo].[tb_info] ([id], [info_type], [info_title], [info_content], [info_linkman], [info_phone], [info_email], [info_date], [info_state], [info_attention], [info_typepid], [info_userid]) VALUES (117, 15, N'for jdbc ', N'do sql', N'ye', N'15616038416', N'3@qq.com', CAST(0x0000A8C200EFE098 AS DateTime), N'1', N'1', 2, NULL)
INSERT [dbo].[tb_info] ([id], [info_type], [info_title], [info_content], [info_linkman], [info_phone], [info_email], [info_date], [info_state], [info_attention], [info_typepid], [info_userid]) VALUES (120, 16, N'for jdbc ', N'do sql', N'ye', N'15616038416', N'HNU_Wendy@163.com', CAST(0x0000A8C200F026E8 AS DateTime), N'1', N'1', 2, NULL)
INSERT [dbo].[tb_info] ([id], [info_type], [info_title], [info_content], [info_linkman], [info_phone], [info_email], [info_date], [info_state], [info_attention], [info_typepid], [info_userid]) VALUES (121, 16, N'for jdbc ', N'do sql', N'ye', N'15616038416', N'HNU_Wendy@163.com', CAST(0x0000A8C200F0B388 AS DateTime), N'1', N'1', 2, NULL)
INSERT [dbo].[tb_info] ([id], [info_type], [info_title], [info_content], [info_linkman], [info_phone], [info_email], [info_date], [info_state], [info_attention], [info_typepid], [info_userid]) VALUES (122, 16, N'next', N'please', N'ye', N'15616038416', N'HNU_Wendy@163.com', CAST(0x0000A8C200F0F9D8 AS DateTime), N'1', N'1', 2, NULL)
INSERT [dbo].[tb_info] ([id], [info_type], [info_title], [info_content], [info_linkman], [info_phone], [info_email], [info_date], [info_state], [info_attention], [info_typepid], [info_userid]) VALUES (124, 11, N'acm again', N'there', N'ye', N'13', N'21@baidu', CAST(0x0000A8C2012741F0 AS DateTime), N'1', N'2', 11, NULL)
INSERT [dbo].[tb_info] ([id], [info_type], [info_title], [info_content], [info_linkman], [info_phone], [info_email], [info_date], [info_state], [info_attention], [info_typepid], [info_userid]) VALUES (126, 11, N'acm to find', N'there', N'ye ', N'13', N'2', CAST(0x0000A8C20128A180 AS DateTime), N'1', N'2', 11, NULL)
INSERT [dbo].[tb_info] ([id], [info_type], [info_title], [info_content], [info_linkman], [info_phone], [info_email], [info_date], [info_state], [info_attention], [info_typepid], [info_userid]) VALUES (127, 13, N'web', N'web html', N'ye', N'13', N'2', CAST(0x0000A8C700000000 AS DateTime), N'1', N'1', 1, NULL)
INSERT [dbo].[tb_info] ([id], [info_type], [info_title], [info_content], [info_linkman], [info_phone], [info_email], [info_date], [info_state], [info_attention], [info_typepid], [info_userid]) VALUES (130, 22, N'js??????????′ˉ', N'????￥? ????°±??￥?°?èˉ???????', N'?????????', N'15616038416', N'HNU_Wendy@163.com', CAST(0x0000A8D300FF24CC AS DateTime), N'1', N'0', 1, NULL)
INSERT [dbo].[tb_info] ([id], [info_type], [info_title], [info_content], [info_linkman], [info_phone], [info_email], [info_date], [info_state], [info_attention], [info_typepid], [info_userid]) VALUES (131, 1, N'js', N'nihao a ', N'????°??§?', N'15616038416', N'2@baidu.com', CAST(0x0000A8D30102096C AS DateTime), N'1', N'0', 1, NULL)
INSERT [dbo].[tb_info] ([id], [info_type], [info_title], [info_content], [info_linkman], [info_phone], [info_email], [info_date], [info_state], [info_attention], [info_typepid], [info_userid]) VALUES (132, 1, N'l', N'emmmm', N'ye', N'15616038416', N'2@qq.com', CAST(0x0000A8D301078428 AS DateTime), N'1', N'1', 1, NULL)
INSERT [dbo].[tb_info] ([id], [info_type], [info_title], [info_content], [info_linkman], [info_phone], [info_email], [info_date], [info_state], [info_attention], [info_typepid], [info_userid]) VALUES (135, 2, N'em', N'??°??1', N'15616038416', N'13584874066', N'e@baidu.com', CAST(0x0000A8D301143114 AS DateTime), N'1', N'1', 2, NULL)
INSERT [dbo].[tb_info] ([id], [info_type], [info_title], [info_content], [info_linkman], [info_phone], [info_email], [info_date], [info_state], [info_attention], [info_typepid], [info_userid]) VALUES (139, 2, N'l', N'df', N'k', N'13700571003', N'13700571003@baidu.com', CAST(0x0000A8D3011694CC AS DateTime), N'1', N'0', 2, NULL)
INSERT [dbo].[tb_info] ([id], [info_type], [info_title], [info_content], [info_linkman], [info_phone], [info_email], [info_date], [info_state], [info_attention], [info_typepid], [info_userid]) VALUES (140, 1, N'fffffff', N'123', N'ye', N'13700571003', N'df@baidu.com', CAST(0x0000A8D500BC8428 AS DateTime), N'1', N'0', 1, N'201408030409   ')
SET IDENTITY_INSERT [dbo].[tb_info] OFF
/****** Object:  Table [dbo].[tb_admin]    Script Date: 05/03/2018 16:27:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_admin](
	[id] [int] NOT NULL,
	[user_name] [varchar](20) NULL,
	[user_password] [varchar](10) NULL,
 CONSTRAINT [PK_tb_user] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[tb_admin] ([id], [user_name], [user_password]) VALUES (1, N'ye', N'wanxuan')
INSERT [dbo].[tb_admin] ([id], [user_name], [user_password]) VALUES (2, N'feng', N'chenhuan')
INSERT [dbo].[tb_admin] ([id], [user_name], [user_password]) VALUES (3, N'feng', N'chenhuan')
INSERT [dbo].[tb_admin] ([id], [user_name], [user_password]) VALUES (4, N'jiao', N'yin')
/****** Object:  ForeignKey [FK_tb_info_tb_info]    Script Date: 05/03/2018 16:27:02 ******/
ALTER TABLE [dbo].[tb_info]  WITH CHECK ADD  CONSTRAINT [FK_tb_info_tb_info] FOREIGN KEY([id])
REFERENCES [dbo].[tb_info] ([id])
GO
ALTER TABLE [dbo].[tb_info] CHECK CONSTRAINT [FK_tb_info_tb_info]
GO
