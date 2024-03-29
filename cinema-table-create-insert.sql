USE [cinema]
GO
/****** Object:  Table [dbo].[users]    Script Date: 09/04/2014 09:07:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[users](
	[user_id] [bigint] IDENTITY(1,1) NOT NULL,
	[f_name] [varchar](30) NULL,
	[l_name] [varchar](30) NULL,
	[gender] [varchar](10) NULL,
	[mobile_no] [varchar](10) NULL,
	[city_id] [int] NULL,
	[email] [varchar](80) NULL,
	[password] [varchar](80) NULL,
	[active_flg] [bit] NULL,
 CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[users] ON
INSERT [dbo].[users] ([user_id], [f_name], [l_name], [gender], [mobile_no], [city_id], [email], [password], [active_flg]) VALUES (1, NULL, NULL, NULL, NULL, 1, N'demo@gmail.com', N'123', 1)
INSERT [dbo].[users] ([user_id], [f_name], [l_name], [gender], [mobile_no], [city_id], [email], [password], [active_flg]) VALUES (10, N'sunil', N'gautam', N'Male', N'9820850847', 1, N'sunil@gmail.com', N'123456', 1)
INSERT [dbo].[users] ([user_id], [f_name], [l_name], [gender], [mobile_no], [city_id], [email], [password], [active_flg]) VALUES (11, N'sunil', N'gautam', N'Male', N'1234567890', 1, N'gautam.sunil01@gmail.com', N'01091989', 1)
SET IDENTITY_INSERT [dbo].[users] OFF
/****** Object:  Table [dbo].[transactions]    Script Date: 09/04/2014 09:07:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[transactions](
	[trans_id] [bigint] IDENTITY(1,1) NOT NULL,
	[trans_code] [varchar](30) NULL,
	[pay_detail_id] [bigint] NULL,
	[user_id] [bigint] NULL,
	[anonymous_flg] [bit] NULL,
	[amount] [decimal](10, 2) NULL,
	[conv_fee] [decimal](10, 2) NULL,
	[service_tax] [decimal](10, 2) NULL,
	[total_amount] [decimal](10, 2) NULL,
	[trans_on] [datetime] NULL,
 CONSTRAINT [PK_transactions] PRIMARY KEY CLUSTERED 
(
	[trans_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[transactions] ON
INSERT [dbo].[transactions] ([trans_id], [trans_code], [pay_detail_id], [user_id], [anonymous_flg], [amount], [conv_fee], [service_tax], [total_amount], [trans_on]) VALUES (1, N'T0120121129194937163', 1, 1, 0, CAST(500.00 AS Decimal(10, 2)), CAST(20.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(520.00 AS Decimal(10, 2)), CAST(0x0000A1180146BD1D AS DateTime))
INSERT [dbo].[transactions] ([trans_id], [trans_code], [pay_detail_id], [user_id], [anonymous_flg], [amount], [conv_fee], [service_tax], [total_amount], [trans_on]) VALUES (2, N'T0220121129195450027', 2, 2, 0, CAST(250.00 AS Decimal(10, 2)), CAST(20.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(270.00 AS Decimal(10, 2)), CAST(0x0000A11801482BBB AS DateTime))
INSERT [dbo].[transactions] ([trans_id], [trans_code], [pay_detail_id], [user_id], [anonymous_flg], [amount], [conv_fee], [service_tax], [total_amount], [trans_on]) VALUES (3, N'T0320121129200312720', 3, 3, 0, CAST(750.00 AS Decimal(10, 2)), CAST(20.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(770.00 AS Decimal(10, 2)), CAST(0x0000A118014A78D8 AS DateTime))
INSERT [dbo].[transactions] ([trans_id], [trans_code], [pay_detail_id], [user_id], [anonymous_flg], [amount], [conv_fee], [service_tax], [total_amount], [trans_on]) VALUES (4, N'T0420121129200617213', 4, 4, 0, CAST(1000.00 AS Decimal(10, 2)), CAST(20.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(1020.00 AS Decimal(10, 2)), CAST(0x0000A118014B510C AS DateTime))
INSERT [dbo].[transactions] ([trans_id], [trans_code], [pay_detail_id], [user_id], [anonymous_flg], [amount], [conv_fee], [service_tax], [total_amount], [trans_on]) VALUES (5, N'T0520121201001038777', 5, 5, 0, CAST(700.00 AS Decimal(10, 2)), CAST(20.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(720.00 AS Decimal(10, 2)), CAST(0x0000A11A0002EBB7 AS DateTime))
INSERT [dbo].[transactions] ([trans_id], [trans_code], [pay_detail_id], [user_id], [anonymous_flg], [amount], [conv_fee], [service_tax], [total_amount], [trans_on]) VALUES (6, N'T11120121201004725280', 6, 11, 1, CAST(1050.00 AS Decimal(10, 2)), CAST(20.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(1070.00 AS Decimal(10, 2)), CAST(0x0000A11A000D064C AS DateTime))
INSERT [dbo].[transactions] ([trans_id], [trans_code], [pay_detail_id], [user_id], [anonymous_flg], [amount], [conv_fee], [service_tax], [total_amount], [trans_on]) VALUES (7, N'T0620121201005513057', 7, 6, 0, CAST(1400.00 AS Decimal(10, 2)), CAST(20.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(1420.00 AS Decimal(10, 2)), CAST(0x0000A11A000F2A7D AS DateTime))
INSERT [dbo].[transactions] ([trans_id], [trans_code], [pay_detail_id], [user_id], [anonymous_flg], [amount], [conv_fee], [service_tax], [total_amount], [trans_on]) VALUES (8, N'T0720121201010159507', 8, 7, 0, CAST(350.00 AS Decimal(10, 2)), CAST(20.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(370.00 AS Decimal(10, 2)), CAST(0x0000A11A001106CC AS DateTime))
INSERT [dbo].[transactions] ([trans_id], [trans_code], [pay_detail_id], [user_id], [anonymous_flg], [amount], [conv_fee], [service_tax], [total_amount], [trans_on]) VALUES (9, N'T11120121201011440967', 9, 11, 1, CAST(350.00 AS Decimal(10, 2)), CAST(20.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(370.00 AS Decimal(10, 2)), CAST(0x0000A11A0014831D AS DateTime))
INSERT [dbo].[transactions] ([trans_id], [trans_code], [pay_detail_id], [user_id], [anonymous_flg], [amount], [conv_fee], [service_tax], [total_amount], [trans_on]) VALUES (10, N'T0820121201012134590', 10, 8, 0, CAST(400.00 AS Decimal(10, 2)), CAST(20.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(420.00 AS Decimal(10, 2)), CAST(0x0000A11A001667D9 AS DateTime))
INSERT [dbo].[transactions] ([trans_id], [trans_code], [pay_detail_id], [user_id], [anonymous_flg], [amount], [conv_fee], [service_tax], [total_amount], [trans_on]) VALUES (11, N'T0920121201131946433', 11, 9, 0, CAST(500.00 AS Decimal(10, 2)), CAST(20.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(520.00 AS Decimal(10, 2)), CAST(0x0000A11A00DBA89F AS DateTime))
SET IDENTITY_INSERT [dbo].[transactions] OFF
/****** Object:  Table [dbo].[transaction_logs]    Script Date: 09/04/2014 09:07:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[transaction_logs](
	[trans_log_id] [bigint] IDENTITY(1,1) NOT NULL,
	[status] [varchar](10) NULL,
	[error] [nvarchar](max) NULL,
	[trans_id] [bigint] NULL,
	[user_id] [bigint] NULL,
	[anonymous_flg] [bit] NULL,
	[trans_log_on] [datetime] NULL,
 CONSTRAINT [PK_transaction_logs] PRIMARY KEY CLUSTERED 
(
	[trans_log_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[transaction_logs] ON
INSERT [dbo].[transaction_logs] ([trans_log_id], [status], [error], [trans_id], [user_id], [anonymous_flg], [trans_log_on]) VALUES (10, N'SUCCESS', N'', 1, 14, 0, CAST(0x0000A118013F3A3D AS DateTime))
INSERT [dbo].[transaction_logs] ([trans_log_id], [status], [error], [trans_id], [user_id], [anonymous_flg], [trans_log_on]) VALUES (11, N'SUCCESS', N'', 2, 16, 0, CAST(0x0000A1180144B658 AS DateTime))
INSERT [dbo].[transaction_logs] ([trans_log_id], [status], [error], [trans_id], [user_id], [anonymous_flg], [trans_log_on]) VALUES (12, N'FAIL', N'Violation of UNIQUE KEY constraint ''UK_bookings''. Cannot insert duplicate key in object ''dbo.bookings''.', 0, 17, 0, CAST(0x0000A11801456D65 AS DateTime))
INSERT [dbo].[transaction_logs] ([trans_log_id], [status], [error], [trans_id], [user_id], [anonymous_flg], [trans_log_on]) VALUES (14, N'SUCCESS', N'', 2, 2, 0, CAST(0x0000A11801482BBB AS DateTime))
INSERT [dbo].[transaction_logs] ([trans_log_id], [status], [error], [trans_id], [user_id], [anonymous_flg], [trans_log_on]) VALUES (15, N'SUCCESS', N'', 3, 3, 0, CAST(0x0000A118014A78D8 AS DateTime))
INSERT [dbo].[transaction_logs] ([trans_log_id], [status], [error], [trans_id], [user_id], [anonymous_flg], [trans_log_on]) VALUES (16, N'SUCCESS', N'', 4, 4, 0, CAST(0x0000A118014B510C AS DateTime))
INSERT [dbo].[transaction_logs] ([trans_log_id], [status], [error], [trans_id], [user_id], [anonymous_flg], [trans_log_on]) VALUES (17, N'SUCCESS', N'', 5, 5, 0, CAST(0x0000A11A0002EBB7 AS DateTime))
INSERT [dbo].[transaction_logs] ([trans_log_id], [status], [error], [trans_id], [user_id], [anonymous_flg], [trans_log_on]) VALUES (18, N'SUCCESS', N'', 6, 11, 1, CAST(0x0000A11A000D064C AS DateTime))
INSERT [dbo].[transaction_logs] ([trans_log_id], [status], [error], [trans_id], [user_id], [anonymous_flg], [trans_log_on]) VALUES (19, N'SUCCESS', N'', 7, 6, 0, CAST(0x0000A11A000F2A7D AS DateTime))
INSERT [dbo].[transaction_logs] ([trans_log_id], [status], [error], [trans_id], [user_id], [anonymous_flg], [trans_log_on]) VALUES (20, N'SUCCESS', N'', 8, 7, 0, CAST(0x0000A11A001106CC AS DateTime))
INSERT [dbo].[transaction_logs] ([trans_log_id], [status], [error], [trans_id], [user_id], [anonymous_flg], [trans_log_on]) VALUES (21, N'SUCCESS', N'', 9, 11, 1, CAST(0x0000A11A0014831D AS DateTime))
INSERT [dbo].[transaction_logs] ([trans_log_id], [status], [error], [trans_id], [user_id], [anonymous_flg], [trans_log_on]) VALUES (22, N'SUCCESS', N'', 10, 8, 0, CAST(0x0000A11A001667D9 AS DateTime))
INSERT [dbo].[transaction_logs] ([trans_log_id], [status], [error], [trans_id], [user_id], [anonymous_flg], [trans_log_on]) VALUES (23, N'SUCCESS', N'', 11, 9, 0, CAST(0x0000A11A00DBA89F AS DateTime))
SET IDENTITY_INSERT [dbo].[transaction_logs] OFF
/****** Object:  Table [dbo].[trailers]    Script Date: 09/04/2014 09:07:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[trailers](
	[trailer_id] [bigint] IDENTITY(1,1) NOT NULL,
	[movie_id] [bigint] NULL,
	[trailer_link] [varchar](150) NULL,
	[main_flg] [bit] NOT NULL,
	[active_flg] [bit] NULL,
 CONSTRAINT [PK_trailers] PRIMARY KEY CLUSTERED 
(
	[trailer_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[trailers] ON
INSERT [dbo].[trailers] ([trailer_id], [movie_id], [trailer_link], [main_flg], [active_flg]) VALUES (1, 1, N'http://www.youtube.com/embed/EvHQe1fUreA', 0, 1)
INSERT [dbo].[trailers] ([trailer_id], [movie_id], [trailer_link], [main_flg], [active_flg]) VALUES (2, 2, N'http://www.youtube.com/embed/FyDLkB6A_TY', 0, 1)
INSERT [dbo].[trailers] ([trailer_id], [movie_id], [trailer_link], [main_flg], [active_flg]) VALUES (3, 3, N'http://www.youtube.com/embed/RKBMvLl5iac', 0, 1)
INSERT [dbo].[trailers] ([trailer_id], [movie_id], [trailer_link], [main_flg], [active_flg]) VALUES (4, 4, N'http://www.youtube.com/embed/RKBMvLl5iac', 0, 1)
INSERT [dbo].[trailers] ([trailer_id], [movie_id], [trailer_link], [main_flg], [active_flg]) VALUES (5, 5, N'http://www.youtube.com/embed/jqnb1FDWlAA', 0, 1)
INSERT [dbo].[trailers] ([trailer_id], [movie_id], [trailer_link], [main_flg], [active_flg]) VALUES (6, 6, N'http://www.youtube.com/embed/dBfk0MqD67s', 0, 1)
INSERT [dbo].[trailers] ([trailer_id], [movie_id], [trailer_link], [main_flg], [active_flg]) VALUES (7, 7, N'http://www.youtube.com/embed/j-AkWDkXcMY', 0, 1)
INSERT [dbo].[trailers] ([trailer_id], [movie_id], [trailer_link], [main_flg], [active_flg]) VALUES (8, 8, N'http://www.youtube.com/embed/2b5p7sL0YOc', 0, 1)
INSERT [dbo].[trailers] ([trailer_id], [movie_id], [trailer_link], [main_flg], [active_flg]) VALUES (9, 9, N'http://www.youtube.com/embed/PlkWVkpP59U', 0, 1)
SET IDENTITY_INSERT [dbo].[trailers] OFF
/****** Object:  Table [dbo].[ticket_costs]    Script Date: 09/04/2014 09:07:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ticket_costs](
	[ticket_cost_id] [bigint] IDENTITY(1,1) NOT NULL,
	[movie_id] [bigint] NULL,
	[seat_type_id] [int] NULL,
	[ticket_cost] [decimal](12, 2) NULL,
	[active_flg] [bit] NULL,
 CONSTRAINT [PK_ticket_costs] PRIMARY KEY CLUSTERED 
(
	[ticket_cost_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ticket_costs] ON
INSERT [dbo].[ticket_costs] ([ticket_cost_id], [movie_id], [seat_type_id], [ticket_cost], [active_flg]) VALUES (1, 1, 1, CAST(250.00 AS Decimal(12, 2)), 1)
INSERT [dbo].[ticket_costs] ([ticket_cost_id], [movie_id], [seat_type_id], [ticket_cost], [active_flg]) VALUES (2, 1, 2, CAST(200.00 AS Decimal(12, 2)), 1)
INSERT [dbo].[ticket_costs] ([ticket_cost_id], [movie_id], [seat_type_id], [ticket_cost], [active_flg]) VALUES (3, 1, 3, CAST(150.00 AS Decimal(12, 2)), 1)
INSERT [dbo].[ticket_costs] ([ticket_cost_id], [movie_id], [seat_type_id], [ticket_cost], [active_flg]) VALUES (4, 2, 1, CAST(350.00 AS Decimal(12, 2)), 1)
INSERT [dbo].[ticket_costs] ([ticket_cost_id], [movie_id], [seat_type_id], [ticket_cost], [active_flg]) VALUES (5, 2, 2, CAST(200.00 AS Decimal(12, 2)), 1)
INSERT [dbo].[ticket_costs] ([ticket_cost_id], [movie_id], [seat_type_id], [ticket_cost], [active_flg]) VALUES (6, 2, 3, CAST(150.00 AS Decimal(12, 2)), 1)
INSERT [dbo].[ticket_costs] ([ticket_cost_id], [movie_id], [seat_type_id], [ticket_cost], [active_flg]) VALUES (7, 3, 1, CAST(350.00 AS Decimal(12, 2)), 1)
INSERT [dbo].[ticket_costs] ([ticket_cost_id], [movie_id], [seat_type_id], [ticket_cost], [active_flg]) VALUES (8, 3, 2, CAST(300.00 AS Decimal(12, 2)), 1)
INSERT [dbo].[ticket_costs] ([ticket_cost_id], [movie_id], [seat_type_id], [ticket_cost], [active_flg]) VALUES (9, 3, 3, CAST(250.00 AS Decimal(12, 2)), 1)
INSERT [dbo].[ticket_costs] ([ticket_cost_id], [movie_id], [seat_type_id], [ticket_cost], [active_flg]) VALUES (10, 4, 1, CAST(250.00 AS Decimal(12, 2)), 1)
INSERT [dbo].[ticket_costs] ([ticket_cost_id], [movie_id], [seat_type_id], [ticket_cost], [active_flg]) VALUES (11, 4, 2, CAST(200.00 AS Decimal(12, 2)), 1)
INSERT [dbo].[ticket_costs] ([ticket_cost_id], [movie_id], [seat_type_id], [ticket_cost], [active_flg]) VALUES (12, 4, 3, CAST(150.00 AS Decimal(12, 2)), 1)
INSERT [dbo].[ticket_costs] ([ticket_cost_id], [movie_id], [seat_type_id], [ticket_cost], [active_flg]) VALUES (13, 5, 1, CAST(250.00 AS Decimal(12, 2)), 1)
INSERT [dbo].[ticket_costs] ([ticket_cost_id], [movie_id], [seat_type_id], [ticket_cost], [active_flg]) VALUES (14, 5, 2, CAST(200.00 AS Decimal(12, 2)), 1)
INSERT [dbo].[ticket_costs] ([ticket_cost_id], [movie_id], [seat_type_id], [ticket_cost], [active_flg]) VALUES (15, 5, 3, CAST(150.00 AS Decimal(12, 2)), 1)
INSERT [dbo].[ticket_costs] ([ticket_cost_id], [movie_id], [seat_type_id], [ticket_cost], [active_flg]) VALUES (16, 6, 1, CAST(250.00 AS Decimal(12, 2)), 1)
INSERT [dbo].[ticket_costs] ([ticket_cost_id], [movie_id], [seat_type_id], [ticket_cost], [active_flg]) VALUES (17, 6, 2, CAST(200.00 AS Decimal(12, 2)), 1)
INSERT [dbo].[ticket_costs] ([ticket_cost_id], [movie_id], [seat_type_id], [ticket_cost], [active_flg]) VALUES (18, 6, 3, CAST(150.00 AS Decimal(12, 2)), 1)
INSERT [dbo].[ticket_costs] ([ticket_cost_id], [movie_id], [seat_type_id], [ticket_cost], [active_flg]) VALUES (19, 7, 1, CAST(250.00 AS Decimal(12, 2)), 1)
INSERT [dbo].[ticket_costs] ([ticket_cost_id], [movie_id], [seat_type_id], [ticket_cost], [active_flg]) VALUES (20, 7, 2, CAST(200.00 AS Decimal(12, 2)), 1)
INSERT [dbo].[ticket_costs] ([ticket_cost_id], [movie_id], [seat_type_id], [ticket_cost], [active_flg]) VALUES (21, 7, 3, CAST(150.00 AS Decimal(12, 2)), 1)
INSERT [dbo].[ticket_costs] ([ticket_cost_id], [movie_id], [seat_type_id], [ticket_cost], [active_flg]) VALUES (22, 8, 1, CAST(250.00 AS Decimal(12, 2)), 1)
INSERT [dbo].[ticket_costs] ([ticket_cost_id], [movie_id], [seat_type_id], [ticket_cost], [active_flg]) VALUES (23, 8, 2, CAST(200.00 AS Decimal(12, 2)), 1)
INSERT [dbo].[ticket_costs] ([ticket_cost_id], [movie_id], [seat_type_id], [ticket_cost], [active_flg]) VALUES (24, 8, 3, CAST(150.00 AS Decimal(12, 2)), 1)
INSERT [dbo].[ticket_costs] ([ticket_cost_id], [movie_id], [seat_type_id], [ticket_cost], [active_flg]) VALUES (25, 9, 1, CAST(250.00 AS Decimal(12, 2)), 1)
INSERT [dbo].[ticket_costs] ([ticket_cost_id], [movie_id], [seat_type_id], [ticket_cost], [active_flg]) VALUES (26, 9, 2, CAST(200.00 AS Decimal(12, 2)), 1)
INSERT [dbo].[ticket_costs] ([ticket_cost_id], [movie_id], [seat_type_id], [ticket_cost], [active_flg]) VALUES (27, 9, 3, CAST(150.00 AS Decimal(12, 2)), 1)
INSERT [dbo].[ticket_costs] ([ticket_cost_id], [movie_id], [seat_type_id], [ticket_cost], [active_flg]) VALUES (28, 10, 1, CAST(250.00 AS Decimal(12, 2)), 1)
INSERT [dbo].[ticket_costs] ([ticket_cost_id], [movie_id], [seat_type_id], [ticket_cost], [active_flg]) VALUES (29, 10, 2, CAST(200.00 AS Decimal(12, 2)), 1)
INSERT [dbo].[ticket_costs] ([ticket_cost_id], [movie_id], [seat_type_id], [ticket_cost], [active_flg]) VALUES (30, 10, 3, CAST(150.00 AS Decimal(12, 2)), 1)
SET IDENTITY_INSERT [dbo].[ticket_costs] OFF
/****** Object:  Table [dbo].[theatres]    Script Date: 09/04/2014 09:07:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[theatres](
	[theatre_id] [int] IDENTITY(1,1) NOT NULL,
	[city_id] [int] NULL,
	[theatre] [varchar](50) NULL,
	[address] [varchar](500) NULL,
	[active_flg] [bit] NULL,
 CONSTRAINT [PK_theaters] PRIMARY KEY CLUSTERED 
(
	[theatre_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[theatres] ON
INSERT [dbo].[theatres] ([theatre_id], [city_id], [theatre], [address], [active_flg]) VALUES (1, 1, N'Cinema Zone', N'Dombivali', 1)
SET IDENTITY_INSERT [dbo].[theatres] OFF
/****** Object:  Table [dbo].[temp_booking]    Script Date: 09/04/2014 09:07:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[temp_booking](
	[tBookingId] [bigint] IDENTITY(1,1) NOT NULL,
	[tSessionId] [nvarchar](30) NULL,
	[tSeat_row] [varchar](10) NULL,
	[tSeat_no] [varchar](10) NULL,
 CONSTRAINT [PK_temp_booking] PRIMARY KEY CLUSTERED 
(
	[tBookingId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[sliders]    Script Date: 09/04/2014 09:07:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[sliders](
	[slider_id] [bigint] IDENTITY(1,1) NOT NULL,
	[movie_id] [bigint] NULL,
	[slider_pic] [varchar](200) NULL,
	[active_flg] [bit] NULL,
 CONSTRAINT [PK_sliders] PRIMARY KEY CLUSTERED 
(
	[slider_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[sliders] ON
INSERT [dbo].[sliders] ([slider_id], [movie_id], [slider_pic], [active_flg]) VALUES (1, 1, N'/cinema/sliders/slider_44638.jpg', 1)
INSERT [dbo].[sliders] ([slider_id], [movie_id], [slider_pic], [active_flg]) VALUES (2, 2, N'/cinema/sliders/slider_44640.jpg', 0)
INSERT [dbo].[sliders] ([slider_id], [movie_id], [slider_pic], [active_flg]) VALUES (3, 3, N'/cinema/sliders/slider_44642.jpg', 1)
INSERT [dbo].[sliders] ([slider_id], [movie_id], [slider_pic], [active_flg]) VALUES (4, 6, N'/cinema/sliders/slider_44646.jpg', 1)
INSERT [dbo].[sliders] ([slider_id], [movie_id], [slider_pic], [active_flg]) VALUES (5, 7, N'/cinema/sliders/slider_44648.jpg', 1)
INSERT [dbo].[sliders] ([slider_id], [movie_id], [slider_pic], [active_flg]) VALUES (6, 8, N'/cinema/sliders/slider_44650.jpg', 1)
SET IDENTITY_INSERT [dbo].[sliders] OFF
/****** Object:  Table [dbo].[seat_types]    Script Date: 09/04/2014 09:07:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[seat_types](
	[seat_type_id] [int] IDENTITY(1,1) NOT NULL,
	[seat_type] [varchar](30) NULL,
	[base_price] [decimal](12, 2) NULL,
	[active_flg] [bit] NULL,
 CONSTRAINT [PK_seat_types] PRIMARY KEY CLUSTERED 
(
	[seat_type_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[seat_types] ON
INSERT [dbo].[seat_types] ([seat_type_id], [seat_type], [base_price], [active_flg]) VALUES (1, N'Platinum', CAST(250.00 AS Decimal(12, 2)), 1)
INSERT [dbo].[seat_types] ([seat_type_id], [seat_type], [base_price], [active_flg]) VALUES (2, N'Golden', CAST(200.00 AS Decimal(12, 2)), 1)
INSERT [dbo].[seat_types] ([seat_type_id], [seat_type], [base_price], [active_flg]) VALUES (3, N'Silver', CAST(150.00 AS Decimal(12, 2)), 1)
SET IDENTITY_INSERT [dbo].[seat_types] OFF
/****** Object:  Table [dbo].[seat_tokens]    Script Date: 09/04/2014 09:07:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[seat_tokens](
	[seat_token_id] [smallint] IDENTITY(1,1) NOT NULL,
	[seat_token] [smallint] NULL,
	[seat_token_value] [varchar](50) NULL,
 CONSTRAINT [PK_seat_token] PRIMARY KEY CLUSTERED 
(
	[seat_token_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[seat_tokens] ON
INSERT [dbo].[seat_tokens] ([seat_token_id], [seat_token], [seat_token_value]) VALUES (1, 0, N'Not Seat')
INSERT [dbo].[seat_tokens] ([seat_token_id], [seat_token], [seat_token_value]) VALUES (2, 1, N'Available')
INSERT [dbo].[seat_tokens] ([seat_token_id], [seat_token], [seat_token_value]) VALUES (3, 2, N'Not Available')
INSERT [dbo].[seat_tokens] ([seat_token_id], [seat_token], [seat_token_value]) VALUES (4, 3, N'Other Class')
SET IDENTITY_INSERT [dbo].[seat_tokens] OFF
/****** Object:  Table [dbo].[seat_patterns]    Script Date: 09/04/2014 09:07:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[seat_patterns](
	[seat_pattern_id] [int] IDENTITY(1,1) NOT NULL,
	[seat_pattern] [varchar](50) NOT NULL,
 CONSTRAINT [PK_seat_patterns] PRIMARY KEY CLUSTERED 
(
	[seat_pattern_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[seat_patterns] ON
INSERT [dbo].[seat_patterns] ([seat_pattern_id], [seat_pattern]) VALUES (1, N'Pattern1')
INSERT [dbo].[seat_patterns] ([seat_pattern_id], [seat_pattern]) VALUES (2, N'Pattern2')
SET IDENTITY_INSERT [dbo].[seat_patterns] OFF
/****** Object:  Table [dbo].[seat_config]    Script Date: 09/04/2014 09:07:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[seat_config](
	[seat_config_id] [bigint] IDENTITY(1,1) NOT NULL,
	[seat_pattern_id] [int] NOT NULL,
	[seat_type_id] [int] NULL,
	[seat_row] [varchar](10) NULL,
	[seat_no] [varchar](10) NULL,
	[seat_token] [smallint] NULL,
 CONSTRAINT [PK_seat_config] PRIMARY KEY CLUSTERED 
(
	[seat_config_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[seat_config] ON
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (1, 1, 1, N'A', N'1', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (2, 1, 1, N'A', N'2', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (3, 1, 1, N'A', N'3', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (4, 1, 1, N'A', N'4', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (5, 1, 1, N'A', N'5', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (6, 1, 1, N'A', N'6', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (7, 1, 1, N'A', N'7', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (8, 1, 1, N'A', N'8', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (9, 1, 1, N'A', N'9', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (10, 1, 1, N'A', N'10', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (11, 1, 1, N'A', N'11', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (12, 1, 1, N'A', N'12', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (13, 1, 1, N'A', N'13', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (14, 1, 1, N'A', N'14', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (15, 1, 1, N'A', N'15', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (16, 1, 1, N'A', N'16', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (17, 1, 1, N'A', N'17', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (18, 1, 1, N'A', N'18', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (19, 1, 1, N'A', N'19', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (20, 1, 1, N'A', N'20', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (21, 1, 1, N'A', N'21', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (22, 1, 1, N'A', N'22', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (23, 1, 1, N'A', N'23', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (24, 1, 1, N'A', N'24', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (25, 1, 1, N'A', N'25', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (26, 1, 1, N'B', N'1', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (27, 1, 1, N'B', N'2', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (28, 1, 1, N'B', N'3', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (29, 1, 1, N'B', N'4', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (30, 1, 1, N'B', N'5', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (31, 1, 1, N'B', N'6', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (32, 1, 1, N'B', N'7', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (33, 1, 1, N'B', N'8', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (34, 1, 1, N'B', N'9', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (35, 1, 1, N'B', N'10', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (36, 1, 1, N'B', N'11', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (37, 1, 1, N'B', N'12', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (38, 1, 1, N'B', N'13', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (39, 1, 1, N'B', N'14', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (40, 1, 1, N'B', N'15', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (41, 1, 1, N'B', N'16', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (42, 1, 1, N'B', N'17', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (43, 1, 1, N'B', N'18', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (44, 1, 1, N'B', N'19', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (45, 1, 1, N'B', N'20', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (46, 1, 1, N'B', N'21', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (47, 1, 1, N'B', N'22', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (48, 1, 1, N'B', N'23', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (49, 1, 1, N'B', N'24', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (50, 1, 1, N'B', N'25', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (51, 1, 1, N'C', N'1', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (52, 1, 1, N'C', N'2', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (53, 1, 1, N'C', N'3', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (54, 1, 1, N'C', N'4', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (55, 1, 1, N'C', N'5', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (56, 1, 1, N'C', N'6', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (57, 1, 1, N'C', N'7', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (58, 1, 1, N'C', N'8', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (59, 1, 1, N'C', N'9', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (60, 1, 1, N'C', N'10', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (61, 1, 1, N'C', N'11', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (62, 1, 1, N'C', N'12', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (63, 1, 1, N'C', N'13', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (64, 1, 1, N'C', N'14', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (65, 1, 1, N'C', N'15', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (66, 1, 1, N'C', N'16', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (67, 1, 1, N'C', N'17', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (68, 1, 1, N'C', N'18', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (69, 1, 1, N'C', N'19', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (70, 1, 1, N'C', N'20', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (71, 1, 1, N'C', N'21', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (72, 1, 1, N'C', N'22', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (73, 1, 1, N'C', N'23', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (74, 1, 1, N'C', N'24', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (75, 1, 1, N'C', N'25', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (76, 1, 1, N'D', N'1', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (77, 1, 1, N'D', N'2', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (78, 1, 1, N'D', N'3', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (79, 1, 1, N'D', N'4', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (80, 1, 1, N'D', N'5', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (81, 1, 1, N'D', N'6', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (82, 1, 1, N'D', N'7', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (83, 1, 1, N'D', N'8', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (84, 1, 1, N'D', N'9', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (85, 1, 1, N'D', N'10', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (86, 1, 1, N'D', N'11', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (87, 1, 1, N'D', N'12', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (88, 1, 1, N'D', N'13', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (89, 1, 1, N'D', N'14', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (90, 1, 1, N'D', N'15', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (91, 1, 1, N'D', N'16', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (92, 1, 1, N'D', N'17', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (93, 1, 1, N'D', N'18', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (94, 1, 1, N'D', N'19', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (95, 1, 1, N'D', N'20', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (96, 1, 1, N'D', N'21', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (97, 1, 1, N'D', N'22', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (98, 1, 1, N'D', N'23', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (99, 1, 1, N'D', N'24', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (100, 1, 1, N'D', N'25', 0)
GO
print 'Processed 100 total records'
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (101, 1, 1, N'E', N'1', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (102, 1, 1, N'E', N'2', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (103, 1, 1, N'E', N'3', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (104, 1, 1, N'E', N'4', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (105, 1, 1, N'E', N'5', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (106, 1, 1, N'E', N'6', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (107, 1, 1, N'E', N'7', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (108, 1, 1, N'E', N'8', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (109, 1, 1, N'E', N'9', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (110, 1, 1, N'E', N'10', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (111, 1, 1, N'E', N'11', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (112, 1, 1, N'E', N'12', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (113, 1, 1, N'E', N'13', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (114, 1, 1, N'E', N'14', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (115, 1, 1, N'E', N'15', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (116, 1, 1, N'E', N'16', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (117, 1, 1, N'E', N'17', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (118, 1, 1, N'E', N'18', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (119, 1, 1, N'E', N'19', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (120, 1, 1, N'E', N'20', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (121, 1, 1, N'E', N'21', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (122, 1, 1, N'E', N'22', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (123, 1, 1, N'E', N'23', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (124, 1, 1, N'E', N'24', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (125, 1, 1, N'E', N'25', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (126, 1, 1, N'F', N'1', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (127, 1, 1, N'F', N'2', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (128, 1, 1, N'F', N'3', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (129, 1, 1, N'F', N'4', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (130, 1, 1, N'F', N'5', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (131, 1, 1, N'F', N'6', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (132, 1, 1, N'F', N'7', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (133, 1, 1, N'F', N'8', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (134, 1, 1, N'F', N'9', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (135, 1, 1, N'F', N'10', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (136, 1, 1, N'F', N'11', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (137, 1, 1, N'F', N'12', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (138, 1, 1, N'F', N'13', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (139, 1, 1, N'F', N'14', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (140, 1, 1, N'F', N'15', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (141, 1, 1, N'F', N'16', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (142, 1, 1, N'F', N'17', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (143, 1, 1, N'F', N'18', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (144, 1, 1, N'F', N'19', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (145, 1, 1, N'F', N'20', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (146, 1, 1, N'F', N'21', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (147, 1, 1, N'F', N'22', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (148, 1, 1, N'F', N'23', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (149, 1, 1, N'F', N'24', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (150, 1, 1, N'F', N'25', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (151, 1, 1, N'G', N'1', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (152, 1, 1, N'G', N'2', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (153, 1, 1, N'G', N'3', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (154, 1, 1, N'G', N'4', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (155, 1, 1, N'G', N'5', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (156, 1, 1, N'G', N'6', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (157, 1, 1, N'G', N'7', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (158, 1, 1, N'G', N'8', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (159, 1, 1, N'G', N'9', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (160, 1, 1, N'G', N'10', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (161, 1, 1, N'G', N'11', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (162, 1, 1, N'G', N'12', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (163, 1, 1, N'G', N'13', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (164, 1, 1, N'G', N'14', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (165, 1, 1, N'G', N'15', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (166, 1, 1, N'G', N'16', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (167, 1, 1, N'G', N'17', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (168, 1, 1, N'G', N'18', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (169, 1, 1, N'G', N'19', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (170, 1, 1, N'G', N'20', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (171, 1, 1, N'G', N'21', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (172, 1, 1, N'G', N'22', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (173, 1, 1, N'G', N'23', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (174, 1, 1, N'G', N'24', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (175, 1, 1, N'G', N'25', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (176, 1, 2, N'H', N'1', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (177, 1, 2, N'H', N'2', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (178, 1, 2, N'H', N'3', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (179, 1, 2, N'H', N'4', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (180, 1, 2, N'H', N'5', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (181, 1, 2, N'H', N'6', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (182, 1, 2, N'H', N'7', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (183, 1, 2, N'H', N'8', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (184, 1, 2, N'H', N'9', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (185, 1, 2, N'H', N'10', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (186, 1, 2, N'H', N'11', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (187, 1, 2, N'H', N'12', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (188, 1, 2, N'H', N'13', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (189, 1, 2, N'H', N'14', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (190, 1, 2, N'H', N'15', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (191, 1, 2, N'H', N'16', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (192, 1, 2, N'H', N'17', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (193, 1, 2, N'H', N'18', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (194, 1, 2, N'H', N'19', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (195, 1, 2, N'H', N'20', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (196, 1, 2, N'H', N'21', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (197, 1, 2, N'H', N'22', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (198, 1, 2, N'H', N'23', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (199, 1, 2, N'H', N'24', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (200, 1, 2, N'H', N'25', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (201, 1, 2, N'I', N'1', 1)
GO
print 'Processed 200 total records'
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (202, 1, 2, N'I', N'2', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (203, 1, 2, N'I', N'3', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (204, 1, 2, N'I', N'4', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (205, 1, 2, N'I', N'5', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (206, 1, 2, N'I', N'6', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (207, 1, 2, N'I', N'7', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (208, 1, 2, N'I', N'8', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (209, 1, 2, N'I', N'9', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (210, 1, 2, N'I', N'10', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (211, 1, 2, N'I', N'11', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (212, 1, 2, N'I', N'12', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (213, 1, 2, N'I', N'13', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (214, 1, 2, N'I', N'14', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (215, 1, 2, N'I', N'15', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (216, 1, 2, N'I', N'16', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (217, 1, 2, N'I', N'17', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (218, 1, 2, N'I', N'18', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (219, 1, 2, N'I', N'19', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (220, 1, 2, N'I', N'20', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (221, 1, 2, N'I', N'21', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (222, 1, 2, N'I', N'22', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (223, 1, 2, N'I', N'23', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (224, 1, 2, N'I', N'24', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (225, 1, 2, N'I', N'25', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (226, 1, 2, N'J', N'1', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (227, 1, 2, N'J', N'2', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (228, 1, 2, N'J', N'3', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (229, 1, 2, N'J', N'4', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (230, 1, 2, N'J', N'5', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (231, 1, 2, N'J', N'6', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (232, 1, 2, N'J', N'7', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (233, 1, 2, N'J', N'8', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (234, 1, 2, N'J', N'9', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (235, 1, 2, N'J', N'10', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (236, 1, 2, N'J', N'11', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (237, 1, 2, N'J', N'12', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (238, 1, 2, N'J', N'13', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (239, 1, 2, N'J', N'14', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (240, 1, 2, N'J', N'15', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (241, 1, 2, N'J', N'16', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (242, 1, 2, N'J', N'17', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (243, 1, 2, N'J', N'18', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (244, 1, 2, N'J', N'19', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (245, 1, 2, N'J', N'20', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (246, 1, 2, N'J', N'21', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (247, 1, 2, N'J', N'22', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (248, 1, 2, N'J', N'23', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (249, 1, 2, N'J', N'24', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (250, 1, 2, N'J', N'25', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (251, 1, 2, N'K', N'1', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (252, 1, 2, N'K', N'2', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (253, 1, 2, N'K', N'3', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (254, 1, 2, N'K', N'4', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (255, 1, 2, N'K', N'5', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (256, 1, 2, N'K', N'6', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (257, 1, 2, N'K', N'7', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (258, 1, 2, N'K', N'8', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (259, 1, 2, N'K', N'9', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (260, 1, 2, N'K', N'10', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (261, 1, 2, N'K', N'11', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (262, 1, 2, N'K', N'12', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (263, 1, 2, N'K', N'13', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (264, 1, 2, N'K', N'14', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (265, 1, 2, N'K', N'15', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (266, 1, 2, N'K', N'16', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (267, 1, 2, N'K', N'17', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (268, 1, 2, N'K', N'18', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (269, 1, 2, N'K', N'19', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (270, 1, 2, N'K', N'20', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (271, 1, 2, N'K', N'21', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (272, 1, 2, N'K', N'22', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (273, 1, 2, N'K', N'23', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (274, 1, 2, N'K', N'24', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (275, 1, 2, N'K', N'25', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (276, 1, 2, N'L', N'1', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (277, 1, 2, N'L', N'2', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (278, 1, 2, N'L', N'3', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (279, 1, 2, N'L', N'4', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (280, 1, 2, N'L', N'5', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (281, 1, 2, N'L', N'6', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (282, 1, 2, N'L', N'7', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (283, 1, 2, N'L', N'8', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (284, 1, 2, N'L', N'9', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (285, 1, 2, N'L', N'10', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (286, 1, 2, N'L', N'11', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (287, 1, 2, N'L', N'12', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (288, 1, 2, N'L', N'13', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (289, 1, 2, N'L', N'14', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (290, 1, 2, N'L', N'15', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (291, 1, 2, N'L', N'16', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (292, 1, 2, N'L', N'17', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (293, 1, 2, N'L', N'18', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (294, 1, 2, N'L', N'19', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (295, 1, 2, N'L', N'20', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (296, 1, 2, N'L', N'21', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (297, 1, 2, N'L', N'22', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (298, 1, 2, N'L', N'23', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (299, 1, 2, N'L', N'24', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (300, 1, 2, N'L', N'25', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (301, 1, 2, N'M', N'1', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (302, 1, 2, N'M', N'2', 1)
GO
print 'Processed 300 total records'
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (303, 1, 2, N'M', N'3', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (304, 1, 2, N'M', N'4', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (305, 1, 2, N'M', N'5', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (306, 1, 2, N'M', N'6', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (307, 1, 2, N'M', N'7', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (308, 1, 2, N'M', N'8', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (309, 1, 2, N'M', N'9', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (310, 1, 2, N'M', N'10', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (311, 1, 2, N'M', N'11', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (312, 1, 2, N'M', N'12', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (313, 1, 2, N'M', N'13', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (314, 1, 2, N'M', N'14', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (315, 1, 2, N'M', N'15', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (316, 1, 2, N'M', N'16', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (317, 1, 2, N'M', N'17', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (318, 1, 2, N'M', N'18', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (319, 1, 2, N'M', N'19', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (320, 1, 2, N'M', N'20', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (321, 1, 2, N'M', N'21', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (322, 1, 2, N'M', N'22', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (323, 1, 2, N'M', N'23', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (324, 1, 2, N'M', N'24', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (325, 1, 2, N'M', N'25', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (326, 1, 2, N'N', N'1', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (327, 1, 2, N'N', N'2', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (328, 1, 2, N'N', N'3', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (329, 1, 2, N'N', N'4', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (330, 1, 2, N'N', N'5', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (331, 1, 2, N'N', N'6', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (332, 1, 2, N'N', N'7', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (333, 1, 2, N'N', N'8', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (334, 1, 2, N'N', N'9', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (335, 1, 2, N'N', N'10', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (336, 1, 2, N'N', N'11', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (337, 1, 2, N'N', N'12', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (338, 1, 2, N'N', N'13', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (339, 1, 2, N'N', N'14', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (340, 1, 2, N'N', N'15', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (341, 1, 2, N'N', N'16', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (342, 1, 2, N'N', N'17', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (343, 1, 2, N'N', N'18', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (344, 1, 2, N'N', N'19', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (345, 1, 2, N'N', N'20', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (346, 1, 2, N'N', N'21', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (347, 1, 2, N'N', N'22', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (348, 1, 2, N'N', N'23', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (349, 1, 2, N'N', N'24', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (350, 1, 2, N'N', N'25', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (351, 1, 3, N'O', N'1', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (352, 1, 3, N'O', N'2', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (353, 1, 3, N'O', N'3', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (354, 1, 3, N'O', N'4', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (355, 1, 3, N'O', N'5', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (356, 1, 3, N'O', N'6', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (357, 1, 3, N'O', N'7', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (358, 1, 3, N'O', N'8', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (359, 1, 3, N'O', N'9', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (360, 1, 3, N'O', N'10', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (361, 1, 3, N'O', N'11', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (362, 1, 3, N'O', N'12', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (363, 1, 3, N'O', N'13', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (364, 1, 3, N'O', N'14', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (365, 1, 3, N'O', N'15', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (366, 1, 3, N'O', N'16', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (367, 1, 3, N'O', N'17', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (368, 1, 3, N'O', N'18', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (369, 1, 3, N'O', N'19', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (370, 1, 3, N'O', N'20', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (371, 1, 3, N'O', N'21', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (372, 1, 3, N'O', N'22', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (373, 1, 3, N'O', N'23', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (374, 1, 3, N'O', N'24', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (375, 1, 3, N'O', N'25', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (376, 1, 3, N'P', N'1', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (377, 1, 3, N'P', N'2', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (378, 1, 3, N'P', N'3', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (379, 1, 3, N'P', N'4', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (380, 1, 3, N'P', N'5', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (381, 1, 3, N'P', N'6', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (382, 1, 3, N'P', N'7', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (383, 1, 3, N'P', N'8', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (384, 1, 3, N'P', N'9', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (385, 1, 3, N'P', N'10', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (386, 1, 3, N'P', N'11', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (387, 1, 3, N'P', N'12', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (388, 1, 3, N'P', N'13', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (389, 1, 3, N'P', N'14', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (390, 1, 3, N'P', N'15', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (391, 1, 3, N'P', N'16', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (392, 1, 3, N'P', N'17', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (393, 1, 3, N'P', N'18', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (394, 1, 3, N'P', N'19', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (395, 1, 3, N'P', N'20', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (396, 1, 3, N'P', N'21', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (397, 1, 3, N'P', N'22', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (398, 1, 3, N'P', N'23', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (399, 1, 3, N'P', N'24', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (400, 1, 3, N'P', N'25', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (401, 1, 3, N'Q', N'1', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (402, 1, 3, N'Q', N'2', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (403, 1, 3, N'Q', N'3', 1)
GO
print 'Processed 400 total records'
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (404, 1, 3, N'Q', N'4', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (405, 1, 3, N'Q', N'5', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (406, 1, 3, N'Q', N'6', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (407, 1, 3, N'Q', N'7', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (408, 1, 3, N'Q', N'8', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (409, 1, 3, N'Q', N'9', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (410, 1, 3, N'Q', N'10', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (411, 1, 3, N'Q', N'11', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (412, 1, 3, N'Q', N'12', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (413, 1, 3, N'Q', N'13', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (414, 1, 3, N'Q', N'14', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (415, 1, 3, N'Q', N'15', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (416, 1, 3, N'Q', N'16', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (417, 1, 3, N'Q', N'17', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (418, 1, 3, N'Q', N'18', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (419, 1, 3, N'Q', N'19', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (420, 1, 3, N'Q', N'20', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (421, 1, 3, N'Q', N'21', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (422, 1, 3, N'Q', N'22', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (423, 1, 3, N'Q', N'23', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (424, 1, 3, N'Q', N'24', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (425, 1, 3, N'Q', N'25', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (426, 1, 3, N'R', N'1', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (427, 1, 3, N'R', N'2', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (428, 1, 3, N'R', N'3', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (429, 1, 3, N'R', N'4', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (430, 1, 3, N'R', N'5', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (431, 1, 3, N'R', N'6', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (432, 1, 3, N'R', N'7', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (433, 1, 3, N'R', N'8', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (434, 1, 3, N'R', N'9', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (435, 1, 3, N'R', N'10', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (436, 1, 3, N'R', N'11', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (437, 1, 3, N'R', N'12', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (438, 1, 3, N'R', N'13', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (439, 1, 3, N'R', N'14', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (440, 1, 3, N'R', N'15', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (441, 1, 3, N'R', N'16', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (442, 1, 3, N'R', N'17', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (443, 1, 3, N'R', N'18', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (444, 1, 3, N'R', N'19', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (445, 1, 3, N'R', N'20', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (446, 1, 3, N'R', N'21', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (447, 1, 3, N'R', N'22', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (448, 1, 3, N'R', N'23', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (449, 1, 3, N'R', N'24', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (450, 1, 3, N'R', N'25', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (451, 1, 3, N'S', N'1', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (452, 1, 3, N'S', N'2', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (453, 1, 3, N'S', N'3', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (454, 1, 3, N'S', N'4', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (455, 1, 3, N'S', N'5', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (456, 1, 3, N'S', N'6', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (457, 1, 3, N'S', N'7', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (458, 1, 3, N'S', N'8', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (459, 1, 3, N'S', N'9', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (460, 1, 3, N'S', N'10', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (461, 1, 3, N'S', N'11', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (462, 1, 3, N'S', N'12', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (463, 1, 3, N'S', N'13', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (464, 1, 3, N'S', N'14', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (465, 1, 3, N'S', N'15', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (466, 1, 3, N'S', N'16', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (467, 1, 3, N'S', N'17', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (468, 1, 3, N'S', N'18', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (469, 1, 3, N'S', N'19', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (470, 1, 3, N'S', N'20', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (471, 1, 3, N'S', N'21', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (472, 1, 3, N'S', N'22', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (473, 1, 3, N'S', N'23', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (474, 1, 3, N'S', N'24', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (475, 1, 3, N'S', N'25', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (476, 1, 3, N'T', N'1', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (477, 1, 3, N'T', N'2', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (478, 1, 3, N'T', N'3', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (479, 1, 3, N'T', N'4', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (480, 1, 3, N'T', N'5', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (481, 1, 3, N'T', N'6', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (482, 1, 3, N'T', N'7', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (483, 1, 3, N'T', N'8', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (484, 1, 3, N'T', N'9', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (485, 1, 3, N'T', N'10', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (486, 1, 3, N'T', N'11', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (487, 1, 3, N'T', N'12', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (488, 1, 3, N'T', N'13', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (489, 1, 3, N'T', N'14', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (490, 1, 3, N'T', N'15', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (491, 1, 3, N'T', N'16', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (492, 1, 3, N'T', N'17', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (493, 1, 3, N'T', N'18', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (494, 1, 3, N'T', N'19', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (495, 1, 3, N'T', N'20', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (496, 1, 3, N'T', N'21', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (497, 1, 3, N'T', N'22', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (498, 1, 3, N'T', N'23', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (499, 1, 3, N'T', N'24', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (500, 1, 3, N'T', N'25', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (501, 1, 3, N'U', N'1', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (502, 1, 3, N'U', N'2', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (503, 1, 3, N'U', N'3', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (504, 1, 3, N'U', N'4', 1)
GO
print 'Processed 500 total records'
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (505, 1, 3, N'U', N'5', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (506, 1, 3, N'U', N'6', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (507, 1, 3, N'U', N'7', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (508, 1, 3, N'U', N'8', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (509, 1, 3, N'U', N'9', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (510, 1, 3, N'U', N'10', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (511, 1, 3, N'U', N'11', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (512, 1, 3, N'U', N'12', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (513, 1, 3, N'U', N'13', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (514, 1, 3, N'U', N'14', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (515, 1, 3, N'U', N'15', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (516, 1, 3, N'U', N'16', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (517, 1, 3, N'U', N'17', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (518, 1, 3, N'U', N'18', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (519, 1, 3, N'U', N'19', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (520, 1, 3, N'U', N'20', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (521, 1, 3, N'U', N'21', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (522, 1, 3, N'U', N'22', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (523, 1, 3, N'U', N'23', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (524, 1, 3, N'U', N'24', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (525, 1, 3, N'U', N'25', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (526, 2, 1, N'A', N'1', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (527, 2, 1, N'A', N'2', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (528, 2, 1, N'A', N'3', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (529, 2, 1, N'A', N'4', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (530, 2, 1, N'A', N'5', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (531, 2, 1, N'A', N'6', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (532, 2, 1, N'A', N'7', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (533, 2, 1, N'A', N'8', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (534, 2, 1, N'A', N'9', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (535, 2, 1, N'A', N'10', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (536, 2, 1, N'A', N'11', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (537, 2, 1, N'A', N'12', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (538, 2, 1, N'A', N'13', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (539, 2, 1, N'A', N'14', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (540, 2, 1, N'A', N'15', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (541, 2, 1, N'A', N'16', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (542, 2, 1, N'A', N'17', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (543, 2, 1, N'A', N'18', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (544, 2, 1, N'A', N'19', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (545, 2, 1, N'A', N'20', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (546, 2, 1, N'A', N'21', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (547, 2, 1, N'A', N'22', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (548, 2, 1, N'A', N'23', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (549, 2, 1, N'A', N'24', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (550, 2, 1, N'A', N'25', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (551, 2, 1, N'B', N'1', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (552, 2, 1, N'B', N'2', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (553, 2, 1, N'B', N'3', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (554, 2, 1, N'B', N'4', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (555, 2, 1, N'B', N'5', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (556, 2, 1, N'B', N'6', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (557, 2, 1, N'B', N'7', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (558, 2, 1, N'B', N'8', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (559, 2, 1, N'B', N'9', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (560, 2, 1, N'B', N'10', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (561, 2, 1, N'B', N'11', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (562, 2, 1, N'B', N'12', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (563, 2, 1, N'B', N'13', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (564, 2, 1, N'B', N'14', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (565, 2, 1, N'B', N'15', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (566, 2, 1, N'B', N'16', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (567, 2, 1, N'B', N'17', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (568, 2, 1, N'B', N'18', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (569, 2, 1, N'B', N'19', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (570, 2, 1, N'B', N'20', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (571, 2, 1, N'B', N'21', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (572, 2, 1, N'B', N'22', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (573, 2, 1, N'B', N'23', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (574, 2, 1, N'B', N'24', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (575, 2, 1, N'B', N'25', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (576, 2, 1, N'C', N'1', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (577, 2, 1, N'C', N'2', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (578, 2, 1, N'C', N'3', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (579, 2, 1, N'C', N'4', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (580, 2, 1, N'C', N'5', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (581, 2, 1, N'C', N'6', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (582, 2, 1, N'C', N'7', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (583, 2, 1, N'C', N'8', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (584, 2, 1, N'C', N'9', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (585, 2, 1, N'C', N'10', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (586, 2, 1, N'C', N'11', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (587, 2, 1, N'C', N'12', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (588, 2, 1, N'C', N'13', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (589, 2, 1, N'C', N'14', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (590, 2, 1, N'C', N'15', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (591, 2, 1, N'C', N'16', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (592, 2, 1, N'C', N'17', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (593, 2, 1, N'C', N'18', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (594, 2, 1, N'C', N'19', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (595, 2, 1, N'C', N'20', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (596, 2, 1, N'C', N'21', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (597, 2, 1, N'C', N'22', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (598, 2, 1, N'C', N'23', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (599, 2, 1, N'C', N'24', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (600, 2, 1, N'C', N'25', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (601, 2, 1, N'D', N'1', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (602, 2, 1, N'D', N'2', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (603, 2, 1, N'D', N'3', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (604, 2, 1, N'D', N'4', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (605, 2, 1, N'D', N'5', 1)
GO
print 'Processed 600 total records'
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (606, 2, 1, N'D', N'6', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (607, 2, 1, N'D', N'7', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (608, 2, 1, N'D', N'8', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (609, 2, 1, N'D', N'9', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (610, 2, 1, N'D', N'10', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (611, 2, 1, N'D', N'11', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (612, 2, 1, N'D', N'12', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (613, 2, 1, N'D', N'13', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (614, 2, 1, N'D', N'14', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (615, 2, 1, N'D', N'15', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (616, 2, 1, N'D', N'16', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (617, 2, 1, N'D', N'17', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (618, 2, 1, N'D', N'18', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (619, 2, 1, N'D', N'19', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (620, 2, 1, N'D', N'20', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (621, 2, 1, N'D', N'21', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (622, 2, 1, N'D', N'22', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (623, 2, 1, N'D', N'23', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (624, 2, 1, N'D', N'24', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (625, 2, 1, N'D', N'25', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (626, 2, 1, N'E', N'1', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (627, 2, 1, N'E', N'2', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (628, 2, 1, N'E', N'3', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (629, 2, 1, N'E', N'4', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (630, 2, 1, N'E', N'5', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (631, 2, 1, N'E', N'6', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (632, 2, 1, N'E', N'7', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (633, 2, 1, N'E', N'8', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (634, 2, 1, N'E', N'9', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (635, 2, 1, N'E', N'10', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (636, 2, 1, N'E', N'11', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (637, 2, 1, N'E', N'12', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (638, 2, 1, N'E', N'13', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (639, 2, 1, N'E', N'14', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (640, 2, 1, N'E', N'15', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (641, 2, 1, N'E', N'16', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (642, 2, 1, N'E', N'17', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (643, 2, 1, N'E', N'18', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (644, 2, 1, N'E', N'19', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (645, 2, 1, N'E', N'20', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (646, 2, 1, N'E', N'21', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (647, 2, 1, N'E', N'22', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (648, 2, 1, N'E', N'23', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (649, 2, 1, N'E', N'24', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (650, 2, 1, N'E', N'25', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (651, 2, 1, N'F', N'1', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (652, 2, 1, N'F', N'2', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (653, 2, 1, N'F', N'3', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (654, 2, 1, N'F', N'4', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (655, 2, 1, N'F', N'5', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (656, 2, 1, N'F', N'6', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (657, 2, 1, N'F', N'7', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (658, 2, 1, N'F', N'8', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (659, 2, 1, N'F', N'9', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (660, 2, 1, N'F', N'10', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (661, 2, 1, N'F', N'11', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (662, 2, 1, N'F', N'12', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (663, 2, 1, N'F', N'13', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (664, 2, 1, N'F', N'14', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (665, 2, 1, N'F', N'15', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (666, 2, 1, N'F', N'16', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (667, 2, 1, N'F', N'17', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (668, 2, 1, N'F', N'18', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (669, 2, 1, N'F', N'19', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (670, 2, 1, N'F', N'20', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (671, 2, 1, N'F', N'21', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (672, 2, 1, N'F', N'22', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (673, 2, 1, N'F', N'23', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (674, 2, 1, N'F', N'24', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (675, 2, 1, N'F', N'25', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (676, 2, 1, N'G', N'1', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (677, 2, 1, N'G', N'2', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (678, 2, 1, N'G', N'3', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (679, 2, 1, N'G', N'4', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (680, 2, 1, N'G', N'5', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (681, 2, 1, N'G', N'6', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (682, 2, 1, N'G', N'7', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (683, 2, 1, N'G', N'8', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (684, 2, 1, N'G', N'9', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (685, 2, 1, N'G', N'10', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (686, 2, 1, N'G', N'11', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (687, 2, 1, N'G', N'12', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (688, 2, 1, N'G', N'13', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (689, 2, 1, N'G', N'14', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (690, 2, 1, N'G', N'15', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (691, 2, 1, N'G', N'16', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (692, 2, 1, N'G', N'17', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (693, 2, 1, N'G', N'18', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (694, 2, 1, N'G', N'19', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (695, 2, 1, N'G', N'20', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (696, 2, 1, N'G', N'21', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (697, 2, 1, N'G', N'22', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (698, 2, 1, N'G', N'23', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (699, 2, 1, N'G', N'24', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (700, 2, 1, N'G', N'25', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (701, 2, 2, N'H', N'1', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (702, 2, 2, N'H', N'2', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (703, 2, 2, N'H', N'3', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (704, 2, 2, N'H', N'4', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (705, 2, 2, N'H', N'5', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (706, 2, 2, N'H', N'6', 1)
GO
print 'Processed 700 total records'
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (707, 2, 2, N'H', N'7', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (708, 2, 2, N'H', N'8', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (709, 2, 2, N'H', N'9', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (710, 2, 2, N'H', N'10', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (711, 2, 2, N'H', N'11', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (712, 2, 2, N'H', N'12', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (713, 2, 2, N'H', N'13', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (714, 2, 2, N'H', N'14', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (715, 2, 2, N'H', N'15', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (716, 2, 2, N'H', N'16', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (717, 2, 2, N'H', N'17', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (718, 2, 2, N'H', N'18', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (719, 2, 2, N'H', N'19', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (720, 2, 2, N'H', N'20', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (721, 2, 2, N'H', N'21', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (722, 2, 2, N'H', N'22', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (723, 2, 2, N'H', N'23', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (724, 2, 2, N'H', N'24', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (725, 2, 2, N'H', N'25', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (726, 2, 2, N'I', N'1', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (727, 2, 2, N'I', N'2', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (728, 2, 2, N'I', N'3', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (729, 2, 2, N'I', N'4', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (730, 2, 2, N'I', N'5', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (731, 2, 2, N'I', N'6', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (732, 2, 2, N'I', N'7', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (733, 2, 2, N'I', N'8', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (734, 2, 2, N'I', N'9', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (735, 2, 2, N'I', N'10', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (736, 2, 2, N'I', N'11', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (737, 2, 2, N'I', N'12', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (738, 2, 2, N'I', N'13', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (739, 2, 2, N'I', N'14', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (740, 2, 2, N'I', N'15', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (741, 2, 2, N'I', N'16', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (742, 2, 2, N'I', N'17', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (743, 2, 2, N'I', N'18', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (744, 2, 2, N'I', N'19', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (745, 2, 2, N'I', N'20', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (746, 2, 2, N'I', N'21', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (747, 2, 2, N'I', N'22', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (748, 2, 2, N'I', N'23', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (749, 2, 2, N'I', N'24', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (750, 2, 2, N'I', N'25', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (751, 2, 2, N'J', N'1', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (752, 2, 2, N'J', N'2', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (753, 2, 2, N'J', N'3', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (754, 2, 2, N'J', N'4', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (755, 2, 2, N'J', N'5', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (756, 2, 2, N'J', N'6', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (757, 2, 2, N'J', N'7', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (758, 2, 2, N'J', N'8', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (759, 2, 2, N'J', N'9', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (760, 2, 2, N'J', N'10', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (761, 2, 2, N'J', N'11', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (762, 2, 2, N'J', N'12', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (763, 2, 2, N'J', N'13', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (764, 2, 2, N'J', N'14', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (765, 2, 2, N'J', N'15', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (766, 2, 2, N'J', N'16', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (767, 2, 2, N'J', N'17', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (768, 2, 2, N'J', N'18', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (769, 2, 2, N'J', N'19', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (770, 2, 2, N'J', N'20', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (771, 2, 2, N'J', N'21', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (772, 2, 2, N'J', N'22', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (773, 2, 2, N'J', N'23', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (774, 2, 2, N'J', N'24', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (775, 2, 2, N'J', N'25', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (776, 2, 2, N'K', N'1', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (777, 2, 2, N'K', N'2', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (778, 2, 2, N'K', N'3', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (779, 2, 2, N'K', N'4', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (780, 2, 2, N'K', N'5', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (781, 2, 2, N'K', N'6', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (782, 2, 2, N'K', N'7', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (783, 2, 2, N'K', N'8', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (784, 2, 2, N'K', N'9', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (785, 2, 2, N'K', N'10', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (786, 2, 2, N'K', N'11', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (787, 2, 2, N'K', N'12', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (788, 2, 2, N'K', N'13', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (789, 2, 2, N'K', N'14', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (790, 2, 2, N'K', N'15', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (791, 2, 2, N'K', N'16', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (792, 2, 2, N'K', N'17', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (793, 2, 2, N'K', N'18', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (794, 2, 2, N'K', N'19', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (795, 2, 2, N'K', N'20', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (796, 2, 2, N'K', N'21', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (797, 2, 2, N'K', N'22', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (798, 2, 2, N'K', N'23', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (799, 2, 2, N'K', N'24', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (800, 2, 2, N'K', N'25', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (801, 2, 2, N'L', N'1', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (802, 2, 2, N'L', N'2', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (803, 2, 2, N'L', N'3', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (804, 2, 2, N'L', N'4', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (805, 2, 2, N'L', N'5', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (806, 2, 2, N'L', N'6', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (807, 2, 2, N'L', N'7', 1)
GO
print 'Processed 800 total records'
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (808, 2, 2, N'L', N'8', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (809, 2, 2, N'L', N'9', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (810, 2, 2, N'L', N'10', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (811, 2, 2, N'L', N'11', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (812, 2, 2, N'L', N'12', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (813, 2, 2, N'L', N'13', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (814, 2, 2, N'L', N'14', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (815, 2, 2, N'L', N'15', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (816, 2, 2, N'L', N'16', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (817, 2, 2, N'L', N'17', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (818, 2, 2, N'L', N'18', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (819, 2, 2, N'L', N'19', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (820, 2, 2, N'L', N'20', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (821, 2, 2, N'L', N'21', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (822, 2, 2, N'L', N'22', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (823, 2, 2, N'L', N'23', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (824, 2, 2, N'L', N'24', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (825, 2, 2, N'L', N'25', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (826, 2, 2, N'M', N'1', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (827, 2, 2, N'M', N'2', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (828, 2, 2, N'M', N'3', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (829, 2, 2, N'M', N'4', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (830, 2, 2, N'M', N'5', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (831, 2, 2, N'M', N'6', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (832, 2, 2, N'M', N'7', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (833, 2, 2, N'M', N'8', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (834, 2, 2, N'M', N'9', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (835, 2, 2, N'M', N'10', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (836, 2, 2, N'M', N'11', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (837, 2, 2, N'M', N'12', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (838, 2, 2, N'M', N'13', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (839, 2, 2, N'M', N'14', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (840, 2, 2, N'M', N'15', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (841, 2, 2, N'M', N'16', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (842, 2, 2, N'M', N'17', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (843, 2, 2, N'M', N'18', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (844, 2, 2, N'M', N'19', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (845, 2, 2, N'M', N'20', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (846, 2, 2, N'M', N'21', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (847, 2, 2, N'M', N'22', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (848, 2, 2, N'M', N'23', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (849, 2, 2, N'M', N'24', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (850, 2, 2, N'M', N'25', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (851, 2, 2, N'N', N'1', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (852, 2, 2, N'N', N'2', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (853, 2, 2, N'N', N'3', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (854, 2, 2, N'N', N'4', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (855, 2, 2, N'N', N'5', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (856, 2, 2, N'N', N'6', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (857, 2, 2, N'N', N'7', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (858, 2, 2, N'N', N'8', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (859, 2, 2, N'N', N'9', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (860, 2, 2, N'N', N'10', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (861, 2, 2, N'N', N'11', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (862, 2, 2, N'N', N'12', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (863, 2, 2, N'N', N'13', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (864, 2, 2, N'N', N'14', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (865, 2, 2, N'N', N'15', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (866, 2, 2, N'N', N'16', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (867, 2, 2, N'N', N'17', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (868, 2, 2, N'N', N'18', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (869, 2, 2, N'N', N'19', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (870, 2, 2, N'N', N'20', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (871, 2, 2, N'N', N'21', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (872, 2, 2, N'N', N'22', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (873, 2, 2, N'N', N'23', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (874, 2, 2, N'N', N'24', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (875, 2, 2, N'N', N'25', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (876, 2, 3, N'O', N'1', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (877, 2, 3, N'O', N'2', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (878, 2, 3, N'O', N'3', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (879, 2, 3, N'O', N'4', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (880, 2, 3, N'O', N'5', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (881, 2, 3, N'O', N'6', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (882, 2, 3, N'O', N'7', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (883, 2, 3, N'O', N'8', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (884, 2, 3, N'O', N'9', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (885, 2, 3, N'O', N'10', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (886, 2, 3, N'O', N'11', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (887, 2, 3, N'O', N'12', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (888, 2, 3, N'O', N'13', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (889, 2, 3, N'O', N'14', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (890, 2, 3, N'O', N'15', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (891, 2, 3, N'O', N'16', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (892, 2, 3, N'O', N'17', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (893, 2, 3, N'O', N'18', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (894, 2, 3, N'O', N'19', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (895, 2, 3, N'O', N'20', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (896, 2, 3, N'O', N'21', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (897, 2, 3, N'O', N'22', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (898, 2, 3, N'O', N'23', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (899, 2, 3, N'O', N'24', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (900, 2, 3, N'O', N'25', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (901, 2, 3, N'P', N'1', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (902, 2, 3, N'P', N'2', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (903, 2, 3, N'P', N'3', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (904, 2, 3, N'P', N'4', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (905, 2, 3, N'P', N'5', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (906, 2, 3, N'P', N'6', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (907, 2, 3, N'P', N'7', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (908, 2, 3, N'P', N'8', 1)
GO
print 'Processed 900 total records'
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (909, 2, 3, N'P', N'9', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (910, 2, 3, N'P', N'10', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (911, 2, 3, N'P', N'11', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (912, 2, 3, N'P', N'12', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (913, 2, 3, N'P', N'13', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (914, 2, 3, N'P', N'14', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (915, 2, 3, N'P', N'15', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (916, 2, 3, N'P', N'16', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (917, 2, 3, N'P', N'17', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (918, 2, 3, N'P', N'18', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (919, 2, 3, N'P', N'19', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (920, 2, 3, N'P', N'20', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (921, 2, 3, N'P', N'21', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (922, 2, 3, N'P', N'22', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (923, 2, 3, N'P', N'23', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (924, 2, 3, N'P', N'24', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (925, 2, 3, N'P', N'25', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (926, 2, 3, N'Q', N'1', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (927, 2, 3, N'Q', N'2', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (928, 2, 3, N'Q', N'3', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (929, 2, 3, N'Q', N'4', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (930, 2, 3, N'Q', N'5', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (931, 2, 3, N'Q', N'6', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (932, 2, 3, N'Q', N'7', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (933, 2, 3, N'Q', N'8', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (934, 2, 3, N'Q', N'9', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (935, 2, 3, N'Q', N'10', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (936, 2, 3, N'Q', N'11', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (937, 2, 3, N'Q', N'12', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (938, 2, 3, N'Q', N'13', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (939, 2, 3, N'Q', N'14', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (940, 2, 3, N'Q', N'15', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (941, 2, 3, N'Q', N'16', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (942, 2, 3, N'Q', N'17', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (943, 2, 3, N'Q', N'18', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (944, 2, 3, N'Q', N'19', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (945, 2, 3, N'Q', N'20', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (946, 2, 3, N'Q', N'21', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (947, 2, 3, N'Q', N'22', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (948, 2, 3, N'Q', N'23', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (949, 2, 3, N'Q', N'24', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (950, 2, 3, N'Q', N'25', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (951, 2, 3, N'R', N'1', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (952, 2, 3, N'R', N'2', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (953, 2, 3, N'R', N'3', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (954, 2, 3, N'R', N'4', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (955, 2, 3, N'R', N'5', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (956, 2, 3, N'R', N'6', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (957, 2, 3, N'R', N'7', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (958, 2, 3, N'R', N'8', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (959, 2, 3, N'R', N'9', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (960, 2, 3, N'R', N'10', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (961, 2, 3, N'R', N'11', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (962, 2, 3, N'R', N'12', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (963, 2, 3, N'R', N'13', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (964, 2, 3, N'R', N'14', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (965, 2, 3, N'R', N'15', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (966, 2, 3, N'R', N'16', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (967, 2, 3, N'R', N'17', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (968, 2, 3, N'R', N'18', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (969, 2, 3, N'R', N'19', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (970, 2, 3, N'R', N'20', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (971, 2, 3, N'R', N'21', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (972, 2, 3, N'R', N'22', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (973, 2, 3, N'R', N'23', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (974, 2, 3, N'R', N'24', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (975, 2, 3, N'R', N'25', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (976, 2, 3, N'S', N'1', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (977, 2, 3, N'S', N'2', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (978, 2, 3, N'S', N'3', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (979, 2, 3, N'S', N'4', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (980, 2, 3, N'S', N'5', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (981, 2, 3, N'S', N'6', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (982, 2, 3, N'S', N'7', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (983, 2, 3, N'S', N'8', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (984, 2, 3, N'S', N'9', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (985, 2, 3, N'S', N'10', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (986, 2, 3, N'S', N'11', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (987, 2, 3, N'S', N'12', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (988, 2, 3, N'S', N'13', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (989, 2, 3, N'S', N'14', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (990, 2, 3, N'S', N'15', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (991, 2, 3, N'S', N'16', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (992, 2, 3, N'S', N'17', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (993, 2, 3, N'S', N'18', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (994, 2, 3, N'S', N'19', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (995, 2, 3, N'S', N'20', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (996, 2, 3, N'S', N'21', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (997, 2, 3, N'S', N'22', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (998, 2, 3, N'S', N'23', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (999, 2, 3, N'S', N'24', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (1000, 2, 3, N'S', N'25', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (1001, 2, 3, N'T', N'1', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (1002, 2, 3, N'T', N'2', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (1003, 2, 3, N'T', N'3', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (1004, 2, 3, N'T', N'4', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (1005, 2, 3, N'T', N'5', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (1006, 2, 3, N'T', N'6', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (1007, 2, 3, N'T', N'7', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (1008, 2, 3, N'T', N'8', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (1009, 2, 3, N'T', N'9', 1)
GO
print 'Processed 1000 total records'
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (1010, 2, 3, N'T', N'10', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (1011, 2, 3, N'T', N'11', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (1012, 2, 3, N'T', N'12', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (1013, 2, 3, N'T', N'13', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (1014, 2, 3, N'T', N'14', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (1015, 2, 3, N'T', N'15', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (1016, 2, 3, N'T', N'16', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (1017, 2, 3, N'T', N'17', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (1018, 2, 3, N'T', N'18', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (1019, 2, 3, N'T', N'19', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (1020, 2, 3, N'T', N'20', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (1021, 2, 3, N'T', N'21', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (1022, 2, 3, N'T', N'22', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (1023, 2, 3, N'T', N'23', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (1024, 2, 3, N'T', N'24', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (1025, 2, 3, N'T', N'25', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (1026, 2, 3, N'U', N'1', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (1027, 2, 3, N'U', N'2', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (1028, 2, 3, N'U', N'3', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (1029, 2, 3, N'U', N'4', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (1030, 2, 3, N'U', N'5', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (1031, 2, 3, N'U', N'6', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (1032, 2, 3, N'U', N'7', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (1033, 2, 3, N'U', N'8', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (1034, 2, 3, N'U', N'9', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (1035, 2, 3, N'U', N'10', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (1036, 2, 3, N'U', N'11', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (1037, 2, 3, N'U', N'12', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (1038, 2, 3, N'U', N'13', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (1039, 2, 3, N'U', N'14', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (1040, 2, 3, N'U', N'15', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (1041, 2, 3, N'U', N'16', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (1042, 2, 3, N'U', N'17', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (1043, 2, 3, N'U', N'18', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (1044, 2, 3, N'U', N'19', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (1045, 2, 3, N'U', N'20', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (1046, 2, 3, N'U', N'21', 1)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (1047, 2, 3, N'U', N'22', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (1048, 2, 3, N'U', N'23', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (1049, 2, 3, N'U', N'24', 0)
INSERT [dbo].[seat_config] ([seat_config_id], [seat_pattern_id], [seat_type_id], [seat_row], [seat_no], [seat_token]) VALUES (1050, 2, 3, N'U', N'25', 0)
SET IDENTITY_INSERT [dbo].[seat_config] OFF
/****** Object:  Table [dbo].[screens]    Script Date: 09/04/2014 09:07:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[screens](
	[screen_id] [int] IDENTITY(1,1) NOT NULL,
	[theatre_id] [int] NULL,
	[seat_pattern_id] [int] NULL,
	[screen] [varchar](50) NULL,
	[active_flg] [bit] NULL,
 CONSTRAINT [PK_screens] PRIMARY KEY CLUSTERED 
(
	[screen_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[screens] ON
INSERT [dbo].[screens] ([screen_id], [theatre_id], [seat_pattern_id], [screen], [active_flg]) VALUES (1, 1, 1, N'Screen1', 1)
INSERT [dbo].[screens] ([screen_id], [theatre_id], [seat_pattern_id], [screen], [active_flg]) VALUES (2, 1, 2, N'Screen2', 1)
SET IDENTITY_INSERT [dbo].[screens] OFF
/****** Object:  Table [dbo].[schedules]    Script Date: 09/04/2014 09:07:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[schedules](
	[schedule_id] [bigint] IDENTITY(1,1) NOT NULL,
	[screen_id] [int] NULL,
	[movie_id] [bigint] NULL,
	[schedule_date] [date] NULL,
	[schedule_time] [time](0) NULL,
	[sold_flg] [bit] NULL,
	[active_flg] [bit] NULL,
 CONSTRAINT [PK_schedules] PRIMARY KEY CLUSTERED 
(
	[schedule_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[schedules] ON
INSERT [dbo].[schedules] ([schedule_id], [screen_id], [movie_id], [schedule_date], [schedule_time], [sold_flg], [active_flg]) VALUES (1, 1, 1, CAST(0x96360B00 AS Date), CAST(0x0044AC0000000000 AS Time), 0, 1)
INSERT [dbo].[schedules] ([schedule_id], [screen_id], [movie_id], [schedule_date], [schedule_time], [sold_flg], [active_flg]) VALUES (3, 1, 2, CAST(0x96360B00 AS Date), CAST(0x0044AC0000000000 AS Time), 0, 1)
INSERT [dbo].[schedules] ([schedule_id], [screen_id], [movie_id], [schedule_date], [schedule_time], [sold_flg], [active_flg]) VALUES (4, 1, 4, CAST(0x97360B00 AS Date), CAST(0x0074D60000000000 AS Time), 0, 1)
INSERT [dbo].[schedules] ([schedule_id], [screen_id], [movie_id], [schedule_date], [schedule_time], [sold_flg], [active_flg]) VALUES (5, 1, 4, CAST(0x97360B00 AS Date), CAST(0x00A4000100000000 AS Time), 0, 1)
INSERT [dbo].[schedules] ([schedule_id], [screen_id], [movie_id], [schedule_date], [schedule_time], [sold_flg], [active_flg]) VALUES (6, 1, 7, CAST(0x97360B00 AS Date), CAST(0x0050270100000000 AS Time), 0, 1)
INSERT [dbo].[schedules] ([schedule_id], [screen_id], [movie_id], [schedule_date], [schedule_time], [sold_flg], [active_flg]) VALUES (8, 1, 2, CAST(0x98360B00 AS Date), CAST(0x0044AC0000000000 AS Time), 0, 1)
INSERT [dbo].[schedules] ([schedule_id], [screen_id], [movie_id], [schedule_date], [schedule_time], [sold_flg], [active_flg]) VALUES (9, 1, 4, CAST(0x98360B00 AS Date), CAST(0x0074D60000000000 AS Time), 0, 1)
INSERT [dbo].[schedules] ([schedule_id], [screen_id], [movie_id], [schedule_date], [schedule_time], [sold_flg], [active_flg]) VALUES (10, 1, 4, CAST(0x98360B00 AS Date), CAST(0x00A4000100000000 AS Time), 0, 1)
INSERT [dbo].[schedules] ([schedule_id], [screen_id], [movie_id], [schedule_date], [schedule_time], [sold_flg], [active_flg]) VALUES (11, 1, 7, CAST(0x98360B00 AS Date), CAST(0x0050270100000000 AS Time), 0, 1)
INSERT [dbo].[schedules] ([schedule_id], [screen_id], [movie_id], [schedule_date], [schedule_time], [sold_flg], [active_flg]) VALUES (13, 1, 2, CAST(0x99360B00 AS Date), CAST(0x0044AC0000000000 AS Time), 0, 1)
INSERT [dbo].[schedules] ([schedule_id], [screen_id], [movie_id], [schedule_date], [schedule_time], [sold_flg], [active_flg]) VALUES (14, 1, 4, CAST(0x99360B00 AS Date), CAST(0x0074D60000000000 AS Time), 0, 1)
INSERT [dbo].[schedules] ([schedule_id], [screen_id], [movie_id], [schedule_date], [schedule_time], [sold_flg], [active_flg]) VALUES (15, 1, 4, CAST(0x99360B00 AS Date), CAST(0x00A4000100000000 AS Time), 0, 1)
INSERT [dbo].[schedules] ([schedule_id], [screen_id], [movie_id], [schedule_date], [schedule_time], [sold_flg], [active_flg]) VALUES (16, 1, 7, CAST(0x99360B00 AS Date), CAST(0x0050270100000000 AS Time), 0, 1)
INSERT [dbo].[schedules] ([schedule_id], [screen_id], [movie_id], [schedule_date], [schedule_time], [sold_flg], [active_flg]) VALUES (18, 1, 2, CAST(0x9A360B00 AS Date), CAST(0x0044AC0000000000 AS Time), 0, 0)
INSERT [dbo].[schedules] ([schedule_id], [screen_id], [movie_id], [schedule_date], [schedule_time], [sold_flg], [active_flg]) VALUES (19, 1, 4, CAST(0x9A360B00 AS Date), CAST(0x0074D60000000000 AS Time), 0, 0)
INSERT [dbo].[schedules] ([schedule_id], [screen_id], [movie_id], [schedule_date], [schedule_time], [sold_flg], [active_flg]) VALUES (20, 1, 4, CAST(0x9A360B00 AS Date), CAST(0x00A4000100000000 AS Time), 0, 0)
SET IDENTITY_INSERT [dbo].[schedules] OFF
/****** Object:  Table [dbo].[reviews]    Script Date: 09/04/2014 09:07:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[reviews](
	[review_id] [bigint] IDENTITY(1,1) NOT NULL,
	[movie_id] [bigint] NULL,
	[review] [text] NULL,
	[review_by] [varchar](60) NULL,
	[stars] [decimal](4, 2) NULL,
	[active_flg] [bit] NULL,
 CONSTRAINT [PK_reviews] PRIMARY KEY CLUSTERED 
(
	[review_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[reviews] ON
INSERT [dbo].[reviews] ([review_id], [movie_id], [review], [review_by], [stars], [active_flg]) VALUES (1, 1, N'Here at long last is a Hindi film that dares to defy the conventions of its chosen genre. Shanghai is a no-frills but searing political thriller that is under-wired with intelligence and nerve, both cinematic and ideological.', N'Saibal Chatterjee, Ndtv', CAST(4.00 AS Decimal(4, 2)), 1)
INSERT [dbo].[reviews] ([review_id], [movie_id], [review], [review_by], [stars], [active_flg]) VALUES (2, 2, N'With Bol Bachchan, the idea clearly is to quickly mop up Rs 100 crore at the box office before the audience can cotton on to the ploy.', N'Saibal Chatterjee, Ndtv', CAST(1.50 AS Decimal(4, 2)), 1)
INSERT [dbo].[reviews] ([review_id], [movie_id], [review], [review_by], [stars], [active_flg]) VALUES (3, 5, N'Maximum isn?t a washout ? not by a long chalk. It is well crafted and superbly acted. Sonu Sood in particular leaves a lasting impression as the police officer under fire for excesses committed in the line of duty.', N'Saibal Chatterjee, Ndtv', CAST(2.50 AS Decimal(4, 2)), 1)
INSERT [dbo].[reviews] ([review_id], [movie_id], [review], [review_by], [stars], [active_flg]) VALUES (4, 6, N'Whose story, make that stories, and to what real end? That is the question that Teri Meri Kahaani leaves the audience with. The answer isn?t even worth looking for.', N'Saibal Chatterjee, Ndtv', CAST(2.00 AS Decimal(4, 2)), 1)
INSERT [dbo].[reviews] ([review_id], [movie_id], [review], [review_by], [stars], [active_flg]) VALUES (5, 7, N'Rollicking and riotous aren?t adjectives one normally associates with a gangster film. But that is precisely what Anurag Kashyap?s Gangs of Wasseypur is.', N'Saibal Chatterjee, Ndtv', CAST(3.50 AS Decimal(4, 2)), 1)
SET IDENTITY_INSERT [dbo].[reviews] OFF
/****** Object:  Table [dbo].[posters]    Script Date: 09/04/2014 09:07:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[posters](
	[poster_id] [bigint] IDENTITY(1,1) NOT NULL,
	[movie_id] [bigint] NULL,
	[poster_thumb] [varchar](200) NULL,
	[main_flg] [bit] NULL,
	[active_flg] [bit] NULL,
 CONSTRAINT [PK_posters] PRIMARY KEY CLUSTERED 
(
	[poster_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[posters] ON
INSERT [dbo].[posters] ([poster_id], [movie_id], [poster_thumb], [main_flg], [active_flg]) VALUES (1, 1, N'/cinema/posters/poster_44637.jpg', 1, 1)
INSERT [dbo].[posters] ([poster_id], [movie_id], [poster_thumb], [main_flg], [active_flg]) VALUES (2, 2, N'/cinema/posters/poster_44639.jpg', 1, 1)
INSERT [dbo].[posters] ([poster_id], [movie_id], [poster_thumb], [main_flg], [active_flg]) VALUES (3, 3, N'/cinema/posters/poster_44641.jpg', 1, 1)
INSERT [dbo].[posters] ([poster_id], [movie_id], [poster_thumb], [main_flg], [active_flg]) VALUES (4, 4, N'/cinema/posters/poster_44643.jpg', 1, 1)
INSERT [dbo].[posters] ([poster_id], [movie_id], [poster_thumb], [main_flg], [active_flg]) VALUES (5, 5, N'/cinema/posters/poster_44644.jpg', 1, 1)
INSERT [dbo].[posters] ([poster_id], [movie_id], [poster_thumb], [main_flg], [active_flg]) VALUES (6, 6, N'/cinema/posters/poster_44645.jpg', 1, 1)
INSERT [dbo].[posters] ([poster_id], [movie_id], [poster_thumb], [main_flg], [active_flg]) VALUES (7, 7, N'/cinema/posters/poster_44647.jpg', 1, 1)
INSERT [dbo].[posters] ([poster_id], [movie_id], [poster_thumb], [main_flg], [active_flg]) VALUES (8, 8, N'/cinema/posters/poster_44649.jpg', 1, 1)
INSERT [dbo].[posters] ([poster_id], [movie_id], [poster_thumb], [main_flg], [active_flg]) VALUES (9, 9, N'/cinema/posters/poster_44651.jpg', 1, 1)
INSERT [dbo].[posters] ([poster_id], [movie_id], [poster_thumb], [main_flg], [active_flg]) VALUES (10, 4, N'/cinema/posters/poster_55867.jpg', 0, 1)
INSERT [dbo].[posters] ([poster_id], [movie_id], [poster_thumb], [main_flg], [active_flg]) VALUES (11, 1, N'/cinema/posters/poster_19852.jpg', 0, 1)
INSERT [dbo].[posters] ([poster_id], [movie_id], [poster_thumb], [main_flg], [active_flg]) VALUES (12, 1, N'/cinema/posters/poster_19853.jpg', 0, 1)
INSERT [dbo].[posters] ([poster_id], [movie_id], [poster_thumb], [main_flg], [active_flg]) VALUES (13, 2, N'/cinema/posters/poster_4707.jpg', 0, 0)
INSERT [dbo].[posters] ([poster_id], [movie_id], [poster_thumb], [main_flg], [active_flg]) VALUES (14, 2, N'/cinema/posters/poster_4708.jpg', 0, 1)
SET IDENTITY_INSERT [dbo].[posters] OFF
/****** Object:  Table [dbo].[payment_details]    Script Date: 09/04/2014 09:07:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[payment_details](
	[pay_detail_id] [bigint] IDENTITY(1,1) NOT NULL,
	[card_type] [nvarchar](50) NULL,
	[card_no] [varchar](20) NULL,
	[expiry] [varchar](10) NULL,
	[CVV] [varchar](4) NULL,
	[card_name] [varchar](40) NULL,
 CONSTRAINT [PK_payment_details] PRIMARY KEY CLUSTERED 
(
	[pay_detail_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[payment_details] ON
INSERT [dbo].[payment_details] ([pay_detail_id], [card_type], [card_no], [expiry], [CVV], [card_name]) VALUES (1, N'American Express', N'Sunil gautam', N'12-12', N'133', N'Sunil gautam')
INSERT [dbo].[payment_details] ([pay_detail_id], [card_type], [card_no], [expiry], [CVV], [card_name]) VALUES (2, N'American Express', N'Sunil gautam', N'1-18', N'133', N'Sunil gautam')
INSERT [dbo].[payment_details] ([pay_detail_id], [card_type], [card_no], [expiry], [CVV], [card_name]) VALUES (3, N'American Express', N'Sunil gautam', N'12-13', N'133', N'Sunil gautam')
INSERT [dbo].[payment_details] ([pay_detail_id], [card_type], [card_no], [expiry], [CVV], [card_name]) VALUES (4, N'American Express', N'Sunil gautam', N'12-29', N'133', N'Sunil gautam')
INSERT [dbo].[payment_details] ([pay_detail_id], [card_type], [card_no], [expiry], [CVV], [card_name]) VALUES (5, N'American Express', N'Sunil gautam', N'12-13', N'133', N'Sunil gautam')
INSERT [dbo].[payment_details] ([pay_detail_id], [card_type], [card_no], [expiry], [CVV], [card_name]) VALUES (6, N'American Express', N'Sunil gautam', N'3-15', N'145', N'Sunil gautam')
INSERT [dbo].[payment_details] ([pay_detail_id], [card_type], [card_no], [expiry], [CVV], [card_name]) VALUES (7, N'American Express', N'Sunil gautam', N'11-14', N'145', N'Sunil gautam')
INSERT [dbo].[payment_details] ([pay_detail_id], [card_type], [card_no], [expiry], [CVV], [card_name]) VALUES (8, N'American Express', N'Sunil gautam', N'2-24', N'145', N'Sunil gautam')
INSERT [dbo].[payment_details] ([pay_detail_id], [card_type], [card_no], [expiry], [CVV], [card_name]) VALUES (9, N'American Express', N'Sunil gautam', N'1-16', N'145', N'Sunil gautam')
INSERT [dbo].[payment_details] ([pay_detail_id], [card_type], [card_no], [expiry], [CVV], [card_name]) VALUES (10, N'American Express', N'SUNIL', N'3-23', N'145', N'SUNIL')
INSERT [dbo].[payment_details] ([pay_detail_id], [card_type], [card_no], [expiry], [CVV], [card_name]) VALUES (11, N'American Express', N'Sunil', N'2-14', N'154', N'Sunil')
SET IDENTITY_INSERT [dbo].[payment_details] OFF
/****** Object:  Table [dbo].[movies]    Script Date: 09/04/2014 09:07:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[movies](
	[movie_id] [bigint] IDENTITY(1,1) NOT NULL,
	[movie] [varchar](100) NULL,
	[hours] [varchar](5) NULL,
	[minutes] [varchar](5) NULL,
	[director] [varchar](200) NULL,
	[cast] [varchar](500) NULL,
	[genre] [varchar](100) NULL,
	[lang] [varchar](20) NULL,
	[synopsis] [text] NULL,
	[cb_rating] [varchar](10) NULL,
	[release_date] [date] NULL,
	[active_flg] [bit] NULL,
 CONSTRAINT [PK_movies] PRIMARY KEY CLUSTERED 
(
	[movie_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[movies] ON
INSERT [dbo].[movies] ([movie_id], [movie], [hours], [minutes], [director], [cast], [genre], [lang], [synopsis], [cb_rating], [release_date], [active_flg]) VALUES (1, N'Shanghai', N'02', N'00', N'Dibakar Banarjee', N'Abhay Deol, 
Emraan Hashmi, 
Kalki Koechlin, 
Prosenjit Chatterjee', N'Thriller', N'Hindi', N'The bustling Indian city of Bharat Nagar has an upcoming infrastructure project backed by the ruling political party. Meanwhile, four individuals find themselves tied up into a gruesome game of crime and politics. A shocking and disturbing road accident leaves a socialist professor/political activist Dr. Ahmedi (Prosenjit Chatterjee) in critical condition . Ahmedi''s adherent Shalini (Kalki Koechlin) believes it to be a premeditated murder. A videographer/pornographer Joginder Parmar(Emraan Hashmi) claims to have documented proof on the mishap that will bring the government down. A high-ranking bureaucrat T.A Krishnan (Abhay Deol) is brought in by the government for damage control and investigation. As days go by, those involved discover a hidden secret in the governments sector: a vision of a new metropolis, a pipe dream, a dream called "Shanghai".', N'U/A', CAST(0xE1350B00 AS Date), 0)
INSERT [dbo].[movies] ([movie_id], [movie], [hours], [minutes], [director], [cast], [genre], [lang], [synopsis], [cb_rating], [release_date], [active_flg]) VALUES (2, N'Bol Bachchan', N'02', N'34', N'Rohit Shetty', N'Abhishek Bachchan, Kareena Kapoor, Asin, Prachi Desai, Ajay Devgan, Asrani, Archana Puran Singh', N'Crime/Romance', N'Hindi', N'Bol Bachchan is an upcoming Bollywood romantic comedy film directed by Rohit Shetty and featuring Ajay Devgn, Abhishek Bachchan, Asin Thottumkal and Prachi Desai in lead roles. It is inspired by the 1979 comic flick, Gol Maal.', N'U/A', CAST(0xE1350B00 AS Date), 1)
INSERT [dbo].[movies] ([movie_id], [movie], [hours], [minutes], [director], [cast], [genre], [lang], [synopsis], [cb_rating], [release_date], [active_flg]) VALUES (3, N'The Amazing Spider-Man (3D)', N'02', N'12', N'Marc Webb, Dibakar Banarjee. Rohit Shetty', N'Andrew Garfield, Irrfan Khan, Denis Leary, C. Thomas Howell, Campbell Scott, Chris Zylka, Miles Elliot, Emma Stone, Rhys Ifans', N'Action/Adventure', N'English', N'The Amazing Spider-Man is the story of Peter Parker (Garfield), an outcast high schooler who was abandoned by his parents as a boy, leaving him to be raised by his Uncle Ben (Sheen) and Aunt May (Field). Like most teenagers, Peter is trying to figure out who he is and how he got to be the person he is today. Peter is also finding his way with his first high school crush, Gwen Stacy (Stone), and together, they struggle with love, commitment, and secrets. As Peter discovers a mysterious briefcase that belonged to his father, he begins a quest to understand his parents disappearance leading him directly to Oscorp and the lab of Dr. Curt Connors (Ifans), his father`s former partner. As Spider-Man is set on a collision course with Connors alter-ego, The Lizard, Peter will make life-altering choices to use his powers and shape his destiny to become a hero.', N'U/A', CAST(0xE8350B00 AS Date), 0)
INSERT [dbo].[movies] ([movie_id], [movie], [hours], [minutes], [director], [cast], [genre], [lang], [synopsis], [cb_rating], [release_date], [active_flg]) VALUES (4, N'The Amazing Spider-Man (2D)', N'02', N'12', N'Marc Webb', N'Andrew Garfield, Irrfan Khan, Denis Leary, C. Thomas Howell, Campbell Scott, Chris Zylka, Miles Elliot, Emma Stone, Rhys Ifans', N'Action/Adventure', N'English', N'The Amazing Spider-Man is the story of Peter Parker (Garfield), an outcast high schooler who was abandoned by his parents as a boy, leaving him to be raised by his Uncle Ben (Sheen) and Aunt May (Field). Like most teenagers, Peter is trying to figure out who he is and how he got to be the person he is today. Peter is also finding his way with his first high school crush, Gwen Stacy (Stone), and together, they struggle with love, commitment, and secrets. As Peter discovers a mysterious briefcase that belonged to his father, he begins a quest to understand his parents disappearance leading him directly to Oscorp and the lab of Dr. Curt Connors (Ifans), his father`s former partner. As Spider-Man is set on a collision course with Connors alter-ego, The Lizard, Peter will make life-altering choices to use his powers and shape his destiny to become a hero.', N'U/A', CAST(0xE8350B00 AS Date), 1)
INSERT [dbo].[movies] ([movie_id], [movie], [hours], [minutes], [director], [cast], [genre], [lang], [synopsis], [cb_rating], [release_date], [active_flg]) VALUES (5, N'Maximum', N'01', N'45', N'Kabeer Kaushik', N'Sonu Sood, Naseeruddin Shah, Neha Dhupia, Vinay Pathak, Aarya Babbar, Anjana Sukhani, Swanand Kirkire , Mohan Agashe', N'Crime/Drama', N'Hindi', N'Mumbai 2003, a maze of local trains, throbbing crowds, big land deals and intense politics. And in the center of it all, a volatile story. Two cops, one journey and a struggle for power, maximum power. But they are not alone in this game, there are other players. The conspirators moving at every level. Taking the dream through layers of emotions and betrayals to an unpredictable climax.', N'A', CAST(0xE8350B00 AS Date), 1)
INSERT [dbo].[movies] ([movie_id], [movie], [hours], [minutes], [director], [cast], [genre], [lang], [synopsis], [cb_rating], [release_date], [active_flg]) VALUES (6, N'Teri Meri Kahani', N'01', N'59', N'Kunal Kohli', N'Shahid Kapoor, Priyanka Chopra, Prachi Desai', N'Romance/Drama', N'Hindi', N'This story takes us through a journey of eternal love between a couple who have vowed to love each other not only in this life but in every life to follow. Their love is so strong that even destiny wants to bring them together. The story starts in 1960 Bombay with Govind and Ruksar, then moves ahead to present times, 2012 England with Radha and Krish and then goes back in time to Punjab, 1910 with Aradhana and Javed. Can Javed and Aradhana still be together? Will Ruksar realize that Govind`s feeling for her were genuine? Will Krish be able to clear the misunderstandings? Will true love prevail? Or will destiny take its course!!!', N'U/A', CAST(0xEF350B00 AS Date), 1)
INSERT [dbo].[movies] ([movie_id], [movie], [hours], [minutes], [director], [cast], [genre], [lang], [synopsis], [cb_rating], [release_date], [active_flg]) VALUES (7, N'Gangs Of Wasseypur', N'02', N'40', N'Anurag Kashyap', N'Manoj Bajpayee, Nawazuddin Siddiqui, Piyush Mishra, Shabana Azmi, Reema Sen', N'Crime', N'Hindi', N'Towards the end of colonial India, Shahid Khan loots the British trains, impersonating the legendary Sultana Daku. Now outcast, Shahid becomes a worker at Ramadhir Singh?s colliery, only to spur a revenge battle that passes on to generations. At the turn of the decade, Shahid?s son, the philandering Sardar Khan vows to get his father?s honor back, becoming the most feared man of Wasseypur.', N'A', CAST(0xEF350B00 AS Date), 1)
INSERT [dbo].[movies] ([movie_id], [movie], [hours], [minutes], [director], [cast], [genre], [lang], [synopsis], [cb_rating], [release_date], [active_flg]) VALUES (8, N'Ferrari Ki Swaari', N'02', N'20', N'Rajesh Mapuskar', N'Sharman Joshi, Boman Irani, Nilesh Divekar', N'Drama', N'Hindi', N'A little boy thinks of nothing but cricket. His father, Rusy thinks of nothing but his little boy. To fulfill his son`s dream of playing at the Lord`s cricket ground, the honest and upright Rusy performs the first act of dishonesty in his life. He borrows a gleaming red Ferrari - Just for one hour. The only problem - he doesn`t inform its legendary owner. A wild, breathless, bumpy ride begins.', N'U', CAST(0xF6350B00 AS Date), 1)
INSERT [dbo].[movies] ([movie_id], [movie], [hours], [minutes], [director], [cast], [genre], [lang], [synopsis], [cb_rating], [release_date], [active_flg]) VALUES (9, N'Madgascar 3: Europes Most Wanted (3D)', N'01', N'23', N'Eric Darnell', N'Ben Stiller, Chris Rock, David Schwimmer, Jada Pinkett Smith, Frances McDormand, Sacha Baron Cohen, Cedric the Entertainer', N'Animation', N'English', N'Alex the Lion, Marty the Zebra, Gloria the Hippo and Melman the Giraffe are still fighting to get home to their beloved Big Apple and of course, King Julien, Maurice and the Penguins are all along for the comedic adventure. Their journey takes them through Europe where they find the perfect cover- a travelling circus, which they reinvent - Madagascar style.', N'U', CAST(0xF6350B00 AS Date), 1)
INSERT [dbo].[movies] ([movie_id], [movie], [hours], [minutes], [director], [cast], [genre], [lang], [synopsis], [cb_rating], [release_date], [active_flg]) VALUES (10, N'Ice Age : Continental Drift (3D)', N'01', N'50', N'Steve MartinoMike Thurmeier', N'Ray Romano,Denis Leary', N'Animation', N'English', N'Manny, Diego, and Sid embark upon another adventure after their continent is set adrift. Using an iceberg as a ship, they encounter sea creatures and battle pirates as they explore a new world.', N'U/A', CAST(0x71360B00 AS Date), 1)
SET IDENTITY_INSERT [dbo].[movies] OFF
/****** Object:  Table [dbo].[cities]    Script Date: 09/04/2014 09:07:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cities](
	[city_id] [int] IDENTITY(1,1) NOT NULL,
	[city] [varchar](50) NULL,
	[active_flg] [bit] NULL,
 CONSTRAINT [PK_city] PRIMARY KEY CLUSTERED 
(
	[city_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[cities] ON
INSERT [dbo].[cities] ([city_id], [city], [active_flg]) VALUES (1, N'Mumbai', 1)
INSERT [dbo].[cities] ([city_id], [city], [active_flg]) VALUES (2, N'Ahmedabad', 1)
INSERT [dbo].[cities] ([city_id], [city], [active_flg]) VALUES (3, N'Allahabad', 1)
INSERT [dbo].[cities] ([city_id], [city], [active_flg]) VALUES (4, N'Aurangabad', 1)
INSERT [dbo].[cities] ([city_id], [city], [active_flg]) VALUES (5, N'Bengaluru', 1)
INSERT [dbo].[cities] ([city_id], [city], [active_flg]) VALUES (6, N'Chandigarh', 1)
INSERT [dbo].[cities] ([city_id], [city], [active_flg]) VALUES (7, N'Chennai', 1)
INSERT [dbo].[cities] ([city_id], [city], [active_flg]) VALUES (8, N'Delhi', 1)
INSERT [dbo].[cities] ([city_id], [city], [active_flg]) VALUES (9, N'Faridabad', 1)
INSERT [dbo].[cities] ([city_id], [city], [active_flg]) VALUES (10, N'Ghaziabad', 1)
INSERT [dbo].[cities] ([city_id], [city], [active_flg]) VALUES (11, N'Gurgaon', 1)
INSERT [dbo].[cities] ([city_id], [city], [active_flg]) VALUES (12, N'Hyderabad', 1)
INSERT [dbo].[cities] ([city_id], [city], [active_flg]) VALUES (13, N'Indore', 1)
INSERT [dbo].[cities] ([city_id], [city], [active_flg]) VALUES (14, N'Jalandhar', 1)
INSERT [dbo].[cities] ([city_id], [city], [active_flg]) VALUES (15, N'Kolkata', 1)
INSERT [dbo].[cities] ([city_id], [city], [active_flg]) VALUES (16, N'Latur', 1)
INSERT [dbo].[cities] ([city_id], [city], [active_flg]) VALUES (17, N'Lucknow', 1)
INSERT [dbo].[cities] ([city_id], [city], [active_flg]) VALUES (18, N'Ludhiana', 1)
INSERT [dbo].[cities] ([city_id], [city], [active_flg]) VALUES (19, N'Nanded', 1)
INSERT [dbo].[cities] ([city_id], [city], [active_flg]) VALUES (20, N'Raipur', 1)
INSERT [dbo].[cities] ([city_id], [city], [active_flg]) VALUES (21, N'Surat', 1)
INSERT [dbo].[cities] ([city_id], [city], [active_flg]) VALUES (22, N'Udaipur', 1)
INSERT [dbo].[cities] ([city_id], [city], [active_flg]) VALUES (23, N'Ujjain', 1)
INSERT [dbo].[cities] ([city_id], [city], [active_flg]) VALUES (24, N'Vadodara', 1)
SET IDENTITY_INSERT [dbo].[cities] OFF
/****** Object:  Table [dbo].[bookings]    Script Date: 09/04/2014 09:07:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bookings](
	[booking_id] [bigint] IDENTITY(1,1) NOT NULL,
	[schedule_id] [bigint] NULL,
	[trans_id] [bigint] NULL,
	[seat_config_id] [bigint] NULL,
	[booked_flg] [bit] NULL,
 CONSTRAINT [PK_bookings] PRIMARY KEY CLUSTERED 
(
	[booking_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [UK_bookings] UNIQUE NONCLUSTERED 
(
	[schedule_id] ASC,
	[seat_config_id] ASC,
	[booked_flg] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[bookings] ON
INSERT [dbo].[bookings] ([booking_id], [schedule_id], [trans_id], [seat_config_id], [booked_flg]) VALUES (1, 11, 1, 22, 1)
INSERT [dbo].[bookings] ([booking_id], [schedule_id], [trans_id], [seat_config_id], [booked_flg]) VALUES (2, 11, 1, 23, 1)
INSERT [dbo].[bookings] ([booking_id], [schedule_id], [trans_id], [seat_config_id], [booked_flg]) VALUES (3, 11, 2, 151, 1)
INSERT [dbo].[bookings] ([booking_id], [schedule_id], [trans_id], [seat_config_id], [booked_flg]) VALUES (4, 11, 3, 125, 1)
INSERT [dbo].[bookings] ([booking_id], [schedule_id], [trans_id], [seat_config_id], [booked_flg]) VALUES (5, 11, 3, 150, 1)
INSERT [dbo].[bookings] ([booking_id], [schedule_id], [trans_id], [seat_config_id], [booked_flg]) VALUES (6, 11, 3, 175, 1)
INSERT [dbo].[bookings] ([booking_id], [schedule_id], [trans_id], [seat_config_id], [booked_flg]) VALUES (7, 11, 4, 157, 1)
INSERT [dbo].[bookings] ([booking_id], [schedule_id], [trans_id], [seat_config_id], [booked_flg]) VALUES (8, 11, 4, 158, 1)
INSERT [dbo].[bookings] ([booking_id], [schedule_id], [trans_id], [seat_config_id], [booked_flg]) VALUES (9, 11, 4, 159, 1)
INSERT [dbo].[bookings] ([booking_id], [schedule_id], [trans_id], [seat_config_id], [booked_flg]) VALUES (10, 11, 4, 160, 1)
INSERT [dbo].[bookings] ([booking_id], [schedule_id], [trans_id], [seat_config_id], [booked_flg]) VALUES (11, 18, 5, 22, 1)
INSERT [dbo].[bookings] ([booking_id], [schedule_id], [trans_id], [seat_config_id], [booked_flg]) VALUES (12, 18, 5, 23, 1)
INSERT [dbo].[bookings] ([booking_id], [schedule_id], [trans_id], [seat_config_id], [booked_flg]) VALUES (13, 18, 6, 10, 1)
INSERT [dbo].[bookings] ([booking_id], [schedule_id], [trans_id], [seat_config_id], [booked_flg]) VALUES (14, 18, 6, 11, 1)
INSERT [dbo].[bookings] ([booking_id], [schedule_id], [trans_id], [seat_config_id], [booked_flg]) VALUES (15, 18, 6, 12, 1)
INSERT [dbo].[bookings] ([booking_id], [schedule_id], [trans_id], [seat_config_id], [booked_flg]) VALUES (16, 18, 7, 151, 1)
INSERT [dbo].[bookings] ([booking_id], [schedule_id], [trans_id], [seat_config_id], [booked_flg]) VALUES (17, 18, 7, 152, 1)
INSERT [dbo].[bookings] ([booking_id], [schedule_id], [trans_id], [seat_config_id], [booked_flg]) VALUES (18, 18, 7, 126, 1)
INSERT [dbo].[bookings] ([booking_id], [schedule_id], [trans_id], [seat_config_id], [booked_flg]) VALUES (19, 18, 7, 127, 1)
INSERT [dbo].[bookings] ([booking_id], [schedule_id], [trans_id], [seat_config_id], [booked_flg]) VALUES (20, 18, 8, 153, 1)
INSERT [dbo].[bookings] ([booking_id], [schedule_id], [trans_id], [seat_config_id], [booked_flg]) VALUES (21, 18, 9, 150, 1)
INSERT [dbo].[bookings] ([booking_id], [schedule_id], [trans_id], [seat_config_id], [booked_flg]) VALUES (22, 18, 10, 335, 1)
INSERT [dbo].[bookings] ([booking_id], [schedule_id], [trans_id], [seat_config_id], [booked_flg]) VALUES (23, 18, 10, 336, 1)
INSERT [dbo].[bookings] ([booking_id], [schedule_id], [trans_id], [seat_config_id], [booked_flg]) VALUES (24, 19, 11, 110, 1)
INSERT [dbo].[bookings] ([booking_id], [schedule_id], [trans_id], [seat_config_id], [booked_flg]) VALUES (25, 19, 11, 112, 1)
SET IDENTITY_INSERT [dbo].[bookings] OFF
/****** Object:  Table [dbo].[admin]    Script Date: 09/04/2014 09:07:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[admin](
	[admin_id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](50) NULL,
	[password] [varchar](50) NULL,
	[email] [varchar](80) NULL,
	[active_flg] [bit] NULL,
 CONSTRAINT [PK_admin] PRIMARY KEY CLUSTERED 
(
	[admin_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[admin] ON
INSERT [dbo].[admin] ([admin_id], [username], [password], [email], [active_flg]) VALUES (1, N'admin', N'admin', N'admin@gmail.com', 1)
SET IDENTITY_INSERT [dbo].[admin] OFF
/****** Object:  Table [dbo].[a_users]    Script Date: 09/04/2014 09:07:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[a_users](
	[a_user_id] [bigint] IDENTITY(1,1) NOT NULL,
	[mobile_no] [varchar](10) NULL,
	[email] [varchar](80) NULL,
 CONSTRAINT [PK_a_users] PRIMARY KEY CLUSTERED 
(
	[a_user_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[a_users] ON
INSERT [dbo].[a_users] ([a_user_id], [mobile_no], [email]) VALUES (1, N'1234567890', N'demo@gmail.com')
INSERT [dbo].[a_users] ([a_user_id], [mobile_no], [email]) VALUES (2, N'1234567890', N'demo@gmail.com')
INSERT [dbo].[a_users] ([a_user_id], [mobile_no], [email]) VALUES (3, N'1234567890', N'demo@gmail.com')
INSERT [dbo].[a_users] ([a_user_id], [mobile_no], [email]) VALUES (4, N'1234567890', N'gautam.sunil01@gmail.com')
INSERT [dbo].[a_users] ([a_user_id], [mobile_no], [email]) VALUES (5, N'1234567890', N'gautam.sunil01@gmail.com')
INSERT [dbo].[a_users] ([a_user_id], [mobile_no], [email]) VALUES (6, NULL, NULL)
INSERT [dbo].[a_users] ([a_user_id], [mobile_no], [email]) VALUES (7, NULL, NULL)
INSERT [dbo].[a_users] ([a_user_id], [mobile_no], [email]) VALUES (8, N'0123456789', N'gautam.sunil01@gmail.com')
INSERT [dbo].[a_users] ([a_user_id], [mobile_no], [email]) VALUES (9, N'1234567900', N'gautam.sunil01@gmail.com')
SET IDENTITY_INSERT [dbo].[a_users] OFF
