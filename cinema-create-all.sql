USE [cinema]
GO
/****** Object:  Table [dbo].[sliders]    Script Date: 09/04/2014 09:06:48 ******/
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
/****** Object:  StoredProcedure [dbo].[SEND_REGISTRATION_MAIL]    Script Date: 09/04/2014 09:06:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SEND_REGISTRATION_MAIL]
AS
BEGIN
	SET NOCOUNT ON;
END
GO
/****** Object:  StoredProcedure [dbo].[SEND_FORGOT_MAIL]    Script Date: 09/04/2014 09:06:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SEND_FORGOT_MAIL]
AS
BEGIN
	SET NOCOUNT ON;
END
GO
/****** Object:  Table [dbo].[seat_patterns]    Script Date: 09/04/2014 09:06:48 ******/
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
/****** Object:  Table [dbo].[seat_types]    Script Date: 09/04/2014 09:06:48 ******/
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
/****** Object:  Table [dbo].[seat_tokens]    Script Date: 09/04/2014 09:06:48 ******/
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
/****** Object:  Table [dbo].[ticket_costs]    Script Date: 09/04/2014 09:06:48 ******/
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
/****** Object:  Table [dbo].[theatres]    Script Date: 09/04/2014 09:06:48 ******/
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
/****** Object:  Table [dbo].[temp_booking]    Script Date: 09/04/2014 09:06:48 ******/
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
/****** Object:  StoredProcedure [dbo].[SEND_BOOKING_MAIL]    Script Date: 09/04/2014 09:06:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SEND_BOOKING_MAIL]
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @BODY VARCHAR(20)
	SET @BODY = '<h1>MAIL SENT AT ' + CONVERT(VARCHAR, GETDATE()) + '</h1><br /><h1>TESTING</h1><br /><h2>TESTING</h2><br /><h3>TESTING</h3><br /><h4>TESTING</h4><br />'
	EXEC msdb..sp_send_dbmail @profile_name='MAIL_PROFILE',
	@recipients='gautam.sunil01@gmail.com',
	@subject='WELCOME MAIL',
	@body=@BODY,
	@body_format='HTML'
END
GO
/****** Object:  Table [dbo].[users]    Script Date: 09/04/2014 09:06:48 ******/
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
/****** Object:  Table [dbo].[transactions]    Script Date: 09/04/2014 09:06:48 ******/
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
/****** Object:  Table [dbo].[transaction_logs]    Script Date: 09/04/2014 09:06:48 ******/
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
/****** Object:  Table [dbo].[trailers]    Script Date: 09/04/2014 09:06:48 ******/
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
/****** Object:  Table [dbo].[posters]    Script Date: 09/04/2014 09:06:48 ******/
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
/****** Object:  Table [dbo].[payment_details]    Script Date: 09/04/2014 09:06:48 ******/
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
/****** Object:  Table [dbo].[schedules]    Script Date: 09/04/2014 09:06:48 ******/
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
/****** Object:  Table [dbo].[screens]    Script Date: 09/04/2014 09:06:48 ******/
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
/****** Object:  Table [dbo].[reviews]    Script Date: 09/04/2014 09:06:48 ******/
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
/****** Object:  Table [dbo].[seat_config]    Script Date: 09/04/2014 09:06:48 ******/
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
/****** Object:  Table [dbo].[movies]    Script Date: 09/04/2014 09:06:48 ******/
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
/****** Object:  Table [dbo].[cities]    Script Date: 09/04/2014 09:06:48 ******/
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
/****** Object:  Table [dbo].[bookings]    Script Date: 09/04/2014 09:06:48 ******/
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
/****** Object:  Table [dbo].[admin]    Script Date: 09/04/2014 09:06:48 ******/
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
/****** Object:  Table [dbo].[a_users]    Script Date: 09/04/2014 09:06:48 ******/
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
/****** Object:  StoredProcedure [dbo].[BOOKINGS_AUD]    Script Date: 09/04/2014 09:06:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BOOKINGS_AUD]
(
	@schedule_id	BIGINT = 0,
	@trans_id		BIGINT = 0,
	@Seat_row		VARCHAR(10),
	@Seat_no		VARCHAR(10),
	@seat_pattern_id INT = 0
)
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @seat_config_id BIGINT = 0
	SELECT @seat_config_id = seat_config_id
	FROM seat_config
	WHERE seat_row = @Seat_row
	AND	seat_no = @Seat_no
	AND seat_pattern_id = @seat_pattern_id
	
	IF @seat_config_id <> 0
	BEGIN
	INSERT INTO bookings
	(schedule_id, trans_id, seat_config_id, booked_flg)
	VALUES
	(@schedule_id, @trans_id, @seat_config_id, 1)
	END
	ELSE
	BEGIN
		RAISERROR('ERROR, SEAT_CONFIG_ID NOT FOUND', 16, 1)
	END
END
GO
/****** Object:  StoredProcedure [dbo].[a_users_proc_aud]    Script Date: 09/04/2014 09:06:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[a_users_proc_aud]
(
	@para VARCHAR(20) = '',
	@user_id BIGINT = 0 OUT,
	@mobile_no VARCHAR(10),
	@email VARCHAR(80) = ''
)
AS
BEGIN
	SET NOCOUNT ON;
	IF @para = 'ADD'
	BEGIN
		INSERT INTO a_users
		(mobile_no, email)
		VALUES
		(@mobile_no, @email)
		
		SET @user_id = SCOPE_IDENTITY()
	END
	ELSE
	BEGIN
		RAISERROR('ERROR OCCURRED WHILE CREATING ANONYMOUS USER', 16, 1)
	END
END
GO
/****** Object:  StoredProcedure [dbo].[check_user_login]    Script Date: 09/04/2014 09:06:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[check_user_login]
(
	@para		VARCHAR(15) = '',
	@u_email	VARCHAR(50) = '',
	@u_password	VARCHAR(50) = ''
)
AS
BEGIN
	IF @para = 'CHECK'
	BEGIN
		IF EXISTS	(SELECT 1
					FROM	[users]
					WHERE	users.active_flg = 1
					AND		CAST(users.email AS VARBINARY(80)) = CAST(@u_email AS VARBINARY(80))
					AND		CAST(users.password AS VARBINARY(80)) = CAST(@u_password AS VARBINARY(80))
					)
		BEGIN
			SELECT 1 AS [IS_USER],			
			users.user_id,
			users.f_name,
			users.l_name,
			users.gender,
			users.mobile_no,
			cities.city_id,
			cities.city,
			users.email			
			FROM	users INNER JOIN cities
			ON		users.city_id = cities.city_id
			WHERE	users.active_flg = 1
			AND		users.email = @u_email
		END
	ELSE
	BEGIN
		SELECT 0 AS [IS_USER];
	END
	END
	ELSE
	BEGIN
		PRINT 'INVALID PARAMETER';
	END
END
GO
/****** Object:  StoredProcedure [dbo].[check_admin_login]    Script Date: 09/04/2014 09:06:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[check_admin_login]
(
	@para		VARCHAR(15) = '',
	@a_username	VARCHAR(50) = '',
	@a_password	VARCHAR(50) = ''
)
AS
BEGIN
	IF @para = 'CHECK'
	BEGIN
		IF EXISTS	(SELECT 1
					FROM	[admin]
					WHERE	admin.active_flg = 1
					AND		CAST(admin.username AS VARBINARY(50)) = CAST(@a_username AS VARBINARY(50))
					AND		CAST(admin.password AS VARBINARY(50)) = CAST(@a_password AS VARBINARY(50))
					)
		BEGIN
			SELECT 1 AS [IS_USER],
			admin.admin_id [USER_ID],
			admin.username AS [USER_NAME],
			admin.email AS [EMAIL]
			FROM	[admin]
			WHERE	admin.active_flg = 1
			AND		admin.username = @a_username
		END
	ELSE
	BEGIN
		SELECT 0 AS [IS_USER];
	END
	END
	ELSE
	BEGIN
		PRINT 'INVALID PARAMETER';
	END
END
GO
/****** Object:  StoredProcedure [dbo].[LOG_TRANSACTION]    Script Date: 09/04/2014 09:06:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LOG_TRANSACTION]
	@status			VARCHAR(10) = '',
	@error			NVARCHAR(MAX) = '',
	@trans_id		BIGINT = 0,
	@user_id		BIGINT = 0,
	@anonymous_flg	BIT = 0,
	@trans_log_on	DATETIME = NULL
AS
BEGIN
	SET NOCOUNT ON;
	
	INSERT INTO transaction_logs
	([status], error, trans_id, [user_id], anonymous_flg, trans_log_on)
	VALUES
	(@status, @error, @trans_id, @user_id, @anonymous_flg, @trans_log_on)
END
GO
/****** Object:  UserDefinedFunction [dbo].[GetFirstAndLast]    Script Date: 09/04/2014 09:06:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[GetFirstAndLast]
(
	@para VARCHAR(20) = '',
	@seat_pattern_id INT = 0,
	@seat_type_id	INT = 0
)
RETURNS VARCHAR(10)
AS
BEGIN
DECLARE @result VARCHAR(10) = ''
IF @para = 'FIRST'
BEGIN
	SELECT DISTINCT @result = MIN(seat_row)
	FROM	seat_config INNER JOIN seat_types
	ON		seat_config.seat_type_id = seat_types.seat_type_id
	WHERE	seat_config.seat_pattern_id = @seat_pattern_id and seat_types.seat_type_id = @seat_type_id
	GROUP BY seat_types.seat_type
END
ELSE
BEGIN
	SELECT DISTINCT @result = MAX(seat_row)
	FROM	seat_config INNER JOIN seat_types
	ON		seat_config.seat_type_id = seat_types.seat_type_id
	WHERE	seat_config.seat_pattern_id = @seat_pattern_id and seat_types.seat_type_id = @seat_type_id
	GROUP BY seat_types.seat_type
END
RETURN @result
END
GO
/****** Object:  StoredProcedure [dbo].[screens_proc_get]    Script Date: 09/04/2014 09:06:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[screens_proc_get]
(
	@para VARCHAR(20) = '',
	@screen_id INT = 0,
	@theatre_id INT = 0
)
AS
BEGIN
	SELECT TOP 1 @theatre_id = ISNULL(theatre_id,0) FROM theatres WHERE theatres.active_flg = 1
	IF @para = 'GETALL'
	BEGIN
		SELECT	screen_id,
				theatre_id,
				screens.seat_pattern_id,
				screen,
				seat_pattern
		FROM	screens INNER JOIN seat_patterns
		ON		screens.seat_pattern_id = seat_patterns.seat_pattern_id
		WHERE	screens.theatre_id = @theatre_id AND screens.active_flg = 1
	END
	ELSE IF @para = 'GETBYID'
	BEGIN
		SELECT	screen_id,
				theatre_id,
				screens.seat_pattern_id,
				screen,
				seat_pattern
		FROM	screens INNER JOIN seat_patterns
		ON		screens.seat_pattern_id = seat_patterns.seat_pattern_id
		WHERE	screens.screen_id = @screen_id AND screens.theatre_id = @theatre_id AND screens.active_flg = 1
	END
	ELSE
	BEGIN
		PRINT 'INVALID PARAMETER'
	END
END
GO
/****** Object:  StoredProcedure [dbo].[screens_proc_aud]    Script Date: 09/04/2014 09:06:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[screens_proc_aud]
(
	@para VARCHAR(20) = '',
	@screen_id INT = 0,
	@theatre_id INT = 0,
	@seat_pattern_id INT = 0,
	@screen VARCHAR(50) = ''
)
AS
BEGIN
	SELECT TOP 1 @theatre_id = ISNULL(theatre_id,0) FROM theatres WHERE theatres.active_flg = 1
	IF @para = 'ADD'
	BEGIN
		IF EXISTS (SELECT 1 FROM screens WHERE screens.screen = @screen AND screens.theatre_id = @theatre_id AND screens.active_flg = 1)
		BEGIN
			SELECT -2;
		END
		ELSE
		BEGIN
			INSERT INTO screens
			VALUES	(
						@theatre_id,
						@seat_pattern_id,
						@screen,
						1
					)
		SELECT SCOPE_IDENTITY();
		END
	END
	ELSE IF @para = 'EDIT'
	BEGIN
		IF EXISTS (SELECT 1 FROM screens WHERE screens.screen = @screen AND screens.theatre_id = @theatre_id AND screens.screen_id <> @screen_id AND screens.active_flg = 1)
		BEGIN
			SELECT -2;
		END
		ELSE
		BEGIN
			UPDATE	screens
			SET		theatre_id = @theatre_id,
					seat_pattern_id = @seat_pattern_id,
					screen = @screen
			WHERE	screens.screen_id = @screen_id
		SELECT @screen_id;
		END
	END
	ELSE IF @para = 'DELETE'
	BEGIN
		UPDATE	screens
		SET		active_flg = 0
		WHERE	screens.screen_id = @screen_id
	END
	ELSE
	BEGIN
		PRINT 'INVALID PARAMETER'
		SELECT -99;
	END
END
GO
/****** Object:  StoredProcedure [dbo].[posters_proc_get]    Script Date: 09/04/2014 09:06:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[posters_proc_get]
(
	@para VARCHAR(20) = '',
	@poster_id BIGINT = 0,
	@movie_id BIGINT = 0
)
AS
BEGIN
	IF @para = 'GETALL'
	BEGIN
		SELECT	poster_id,
				posters.movie_id,
				movies.movie,
				poster_thumb,
				main_flg
		FROM	posters INNER JOIN movies
		ON		posters.movie_id = movies.movie_id
		WHERE	posters.active_flg = 1
		AND		movies.active_flg = 1
		ORDER BY posters.movie_id,posters.main_flg DESC
	END
	ELSE IF @para = 'GETBYID'
	BEGIN
		SELECT	poster_id,
				posters.movie_id,
				movies.movie,
				poster_thumb,
				main_flg
		FROM	posters INNER JOIN movies
		ON		posters.movie_id = movies.movie_id
		WHERE	posters.poster_id = @poster_id
		AND		posters.active_flg = 1
		AND		movies.active_flg = 1
	END
	ELSE IF @para = 'GETBYMOVIEID'
	BEGIN
		SELECT	poster_id,
				posters.movie_id,
				movies.movie,
				poster_thumb,
				main_flg
		FROM	posters INNER JOIN movies
		ON		posters.movie_id = movies.movie_id
		WHERE	posters.movie_id = @movie_id
		AND		posters.active_flg = 1
		AND		movies.active_flg = 1
		ORDER BY posters.main_flg DESC
	END
	ELSE
	BEGIN
		PRINT 'INVALID PARAMETER'
	END
END
GO
/****** Object:  StoredProcedure [dbo].[posters_proc_aud]    Script Date: 09/04/2014 09:06:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[posters_proc_aud]
(
	@para VARCHAR(20) = '',	
	@poster_id BIGINT = 0,
	@movie_id BIGINT = 0,
	@poster_thumb VARCHAR(200) = '',
	@main_flg BIT = 0
)
AS
BEGIN
	IF @para = 'ADD'
	BEGIN
		INSERT INTO posters
		VALUES	(
					@movie_id,
					@poster_thumb,
					@main_flg,
					1
				)
		SELECT @poster_id = SCOPE_IDENTITY();
		IF @main_flg = 1
		BEGIN
			UPDATE	posters
			SET		main_flg = 0
			WHERE	posters.movie_id = @movie_id
			AND		posters.poster_id <> @poster_id
			AND		posters.active_flg = 1
		END
		SELECT @poster_id;
	END
	ELSE IF @para = 'EDIT'
	BEGIN
		IF @main_flg = 1
		BEGIN
			UPDATE	posters
			SET		main_flg = 0
			WHERE	posters.movie_id = @movie_id
			AND		posters.poster_id <> @poster_id
			AND		posters.active_flg = 1
			
			UPDATE	posters
			SET		main_flg = 1
			WHERE	posters.movie_id = @movie_id
			AND		posters.poster_id = @poster_id
			AND		posters.active_flg = 1
			SELECT @poster_id;
		END
		ELSE
		BEGIN
			SELECT -99;
		END
	END
	ELSE IF @para = 'DELETE'
	BEGIN
		SELECT	@main_flg = posters.main_flg,
				@movie_id = posters.movie_id
		FROM	posters
		WHERE	posters.poster_id = @poster_id
		
		UPDATE	posters
		SET		active_flg = 0,
				main_flg = 0
		WHERE	posters.poster_id = @poster_id
		
		IF @main_flg = 1
		BEGIN
			DECLARE @new_main_poster_id BIGINT = 0
			SELECT TOP(1)	@new_main_poster_id = posters.poster_id
			FROM	posters
			WHERE	posters.poster_id <> @poster_id
			AND		active_flg = 1
			AND		movie_id = @movie_id
			ORDER BY posters.movie_id, posters.poster_id
			
			UPDATE	posters
			SET		main_flg = 1
			WHERE	posters.poster_id = @new_main_poster_id
		END
		SELECT @poster_id;
	END
	ELSE
	BEGIN
		PRINT 'INVALID PARAMETER'
		SELECT -99;
	END
END
GO
/****** Object:  StoredProcedure [dbo].[schedules_proc_get]    Script Date: 09/04/2014 09:06:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[schedules_proc_get]
(
	@para VARCHAR(20) = '',
	@schedule_id BIGINT = 0,
	@screen_id INT = 0,
	@movie_id BIGINT = 0,
	@schedule_date DATE = NULL,
	@schedule_time TIME = NULL
)
AS
BEGIN
	IF @para = 'GETTOSCHEDULE'
	BEGIN
		DECLARE @schedule_date1 DATE, @schedule_max_date DATE;
		
		CREATE TABLE #tempSchedule
		(
			screen_id INT,
			screen VARCHAR(50),
			movie_id BIGINT,
			movie VARCHAR(100),
			schedule_id BIGINT,
			schedule_date DATE,
			schedule_time TIME,
			schedule_flg BIT,
			can_schedule_flg BIT
		)
		TRUNCATE TABLE #tempSchedule
		
		DECLARE @screen_id_temp INT, @screen_temp VARCHAR(50), @counter INT, @booking_gap INT
		SET @booking_gap = 3
		SET @schedule_max_date = DATEADD(D, @booking_gap, GETDATE())
		DECLARE @screen_id_cur CURSOR
		SET		@screen_id_cur = CURSOR FOR SELECT screen_id, screen FROM screens WHERE screens.active_flg = 1
		OPEN	@screen_id_cur
		
		FETCH NEXT FROM @screen_id_cur INTO @screen_id_temp, @screen_temp
		WHILE @@FETCH_STATUS = 0
		BEGIN
			SET @counter = 0
			SET @schedule_date1 = GETDATE();
			WHILE @counter < 7
			BEGIN
				IF EXISTS	(
								SELECT	1
								FROM	schedules
								WHERE	schedules.schedule_date = DATEADD(D, @counter ,@schedule_date1)
								AND		schedules.screen_id = @screen_id_temp
								AND		schedules.active_flg = 1
							)
				BEGIN
					INSERT INTO #tempSchedule
					(
						screen_id,
						screen,
						movie_id,
						movie,
						schedule_id,
						schedule_date,
						schedule_time,
						schedule_flg,
						can_schedule_flg
					)
					SELECT	schedules.screen_id,
							screens.screen,
							schedules.movie_id,
							movies.movie,
							schedule_id,
							schedule_date,
							schedule_time,
							1,
							CASE WHEN schedule_date < @schedule_max_date THEN 0 ELSE 1 END
					FROM	schedules INNER JOIN movies
					ON		schedules.movie_id = movies.movie_id
							INNER JOIN screens
					ON		schedules.screen_id = screens.screen_id
					WHERE	schedules.schedule_date = DATEADD(D, @counter ,@schedule_date1)
					AND		schedules.screen_id = @screen_id_temp
					AND		schedules.active_flg = 1
					ORDER BY schedules.schedule_time ASC
				END
				ELSE
				BEGIN
					INSERT INTO #tempSchedule
					(
						screen_id,
						screen,
						movie_id,
						movie,
						schedule_id,
						schedule_date,
						schedule_time,
						schedule_flg,
						can_schedule_flg
					)
					VALUES
					(
						@screen_id_temp,
						@screen_temp,
						NULL,
						NULL,
						NULL,
						DATEADD(D, @counter ,@schedule_date1),
						NULL,
						0,
						CASE WHEN DATEADD(D, @counter ,@schedule_date1) < @schedule_max_date THEN 0 ELSE 1 END
					)
				END
				SET @counter += 1
			END
			FETCH NEXT FROM @screen_id_cur INTO @screen_id_temp, @screen_temp
		END
		CLOSE @screen_id_cur
		DEALLOCATE @screen_id_cur
		
		SELECT	screen_id,
				screen,
				movie_id,
				movie,
				schedule_id,
				schedule_date,
				CONVERT(VARCHAR, schedule_time, 100) AS 'schedule_time',
				schedule_flg,
				can_schedule_flg
		FROM	#tempSchedule
		DROP TABLE #tempSchedule
	END
	ELSE IF @para = 'GETBYDAY'
	BEGIN
		SELECT	schedules.screen_id,
				screens.screen,
				schedules.movie_id,
				movies.movie,
				schedule_id,
				schedule_date,
				CONVERT(VARCHAR, schedule_time, 100) AS 'schedule_time'
		FROM	schedules INNER JOIN movies
		ON		schedules.movie_id = movies.movie_id
				INNER JOIN screens
		ON		schedules.screen_id = screens.screen_id
		WHERE	schedules.schedule_date = @schedule_date
		--WHERE	schedules.schedule_date BETWEEN @schedule_date AND DATEADD(D, 1, @schedule_date)
		AND		schedules.active_flg = 1
		ORDER BY schedules.screen_id, schedules.schedule_time ASC
		--ORDER BY schedules.screen_id, schedules.schedule_date, schedules.schedule_time ASC
	END
	ELSE IF @para = 'GETUSERSCHEDULE'
	BEGIN
		DECLARE @schedule_date1_1 DATE, @booking_max_date_1 DATE;
		
		CREATE TABLE #tempSchedule_1
		(
			screen_id INT,
			screen VARCHAR(50),
			movie_id BIGINT,
			movie VARCHAR(100),
			schedule_id BIGINT,
			schedule_date DATE,
			schedule_time TIME,
			schedule_flg BIT,
			can_book_flg BIT
		)
		TRUNCATE TABLE #tempSchedule_1
		
		DECLARE @screen_id_temp_1 INT, @screen_temp_1 VARCHAR(50), @counter_1 INT, @booking_gap_1 INT
		SET @booking_gap_1 = 3
		SET @booking_max_date_1 = DATEADD(D, @booking_gap_1, GETDATE())
		DECLARE @screen_id_cur_1 CURSOR
		SET		@screen_id_cur_1 = CURSOR FOR SELECT screen_id, screen FROM screens WHERE screens.active_flg = 1
		OPEN	@screen_id_cur_1
		
		FETCH NEXT FROM @screen_id_cur_1 INTO @screen_id_temp_1, @screen_temp_1
		WHILE @@FETCH_STATUS = 0
		BEGIN
			SET @counter_1 = 0
			SET @schedule_date1_1 = GETDATE();
			WHILE @counter_1 < 7
			BEGIN
				IF EXISTS	(
								SELECT	1
								FROM	schedules
								WHERE	schedules.schedule_date = DATEADD(D, @counter_1 ,@schedule_date1_1)
								AND		schedules.screen_id = @screen_id_temp_1
								AND		schedules.active_flg = 1
							)
				BEGIN
					INSERT INTO #tempSchedule_1
					(
						screen_id,
						screen,
						movie_id,
						movie,
						schedule_id,
						schedule_date,
						schedule_time,
						schedule_flg,
						can_book_flg
					)
					SELECT	schedules.screen_id,
							screens.screen,
							schedules.movie_id,
							movies.movie,
							schedule_id,
							schedule_date,
							schedule_time,
							CASE WHEN @counter_1 = 0 THEN
								CASE WHEN schedule_time > CONVERT(TIME(0), DATEADD(MI, 30, GETDATE())) THEN
								1
								ELSE
								0
								END
							ELSE
							1
							END,
							CASE WHEN schedule_date < @booking_max_date_1 THEN 1 ELSE 0 END
					FROM	schedules INNER JOIN movies
					ON		schedules.movie_id = movies.movie_id
							INNER JOIN screens
					ON		schedules.screen_id = screens.screen_id
					WHERE	schedules.schedule_date = DATEADD(D, @counter_1 ,@schedule_date1_1)
					AND		schedules.screen_id = @screen_id_temp_1
					AND		schedules.active_flg = 1
					ORDER BY schedules.schedule_time ASC
				END
				ELSE
				BEGIN
					INSERT INTO #tempSchedule_1
					(
						screen_id,
						screen,
						movie_id,
						movie,
						schedule_id,
						schedule_date,
						schedule_time,
						schedule_flg,
						can_book_flg
					)
					VALUES
					(
						@screen_id_temp_1,
						@screen_temp_1,
						NULL,
						NULL,
						NULL,
						DATEADD(D, @counter_1 ,@schedule_date1_1),
						NULL,
						0,
						0
					)
				END
				SET @counter_1 += 1
			END
			FETCH NEXT FROM @screen_id_cur_1 INTO @screen_id_temp_1, @screen_temp_1
		END
		CLOSE @screen_id_cur_1
		DEALLOCATE @screen_id_cur_1
		
		SELECT	screen_id,
				screen,
				movie_id,
				movie,
				schedule_id,
				schedule_date,
				CONVERT(VARCHAR, schedule_time, 100) AS 'schedule_time',
				schedule_flg,
				can_book_flg
		FROM	#tempSchedule_1
		order by schedule_date, screen_id, schedule_time, movie_id
		DROP TABLE #tempSchedule_1
	END
	ELSE IF @para = 'GETBYID'
	BEGIN
		SELECT	schedules.screen_id, 
				screen,
				schedules.movie_id, 
				movie,
				schedule_id, 
				schedule_date, 
				CONVERT(VARCHAR, schedule_time, 100) AS 'schedule_time', 
				sold_flg,
				0
		FROM	schedules
		INNER JOIN screens
		ON		schedules.screen_id = screens.screen_id
		INNER JOIN movies
		ON		schedules.movie_id = movies.movie_id
		WHERE	schedule_id = @schedule_id
		AND		schedules.active_flg = 1
	END
	ELSE IF @para = 'GETLATESTSCHEDULE'
	BEGIN
		DECLARE @BOOKING_DATETIME DATETIME = GETDATE()
		DECLARE @BOOKING_DATE DATE = CONVERT(DATE,@BOOKING_DATETIME)
		
		IF @BOOKING_DATE = CONVERT(DATE, GETDATE())
		BEGIN
			SELECT	TOP 1 schedules.screen_id, 
					schedule_id, 
					schedule_date, 
					schedules.movie_id,
					CONVERT(VARCHAR, schedule_time, 100) AS 'schedule_time'
			FROM schedules INNER JOIN movies
			ON	 schedules.movie_id = movies.movie_id
			WHERE schedule_date >= @BOOKING_DATE
			AND schedule_time > CONVERT(TIME(0), DATEADD(MI, 30, @BOOKING_DATETIME))
			AND schedules.movie_id = @movie_id
			AND movies.active_flg = 1
			AND schedules.active_flg = 1
		END
		ELSE
		BEGIN
			SELECT	TOP 1 schedules.screen_id, 
					schedule_id, 
					schedule_date, 
					schedules.movie_id,
					CONVERT(VARCHAR, schedule_time, 100) AS 'schedule_time'
			FROM schedules INNER JOIN movies
			ON	 schedules.movie_id = movies.movie_id
			WHERE schedule_date >= @BOOKING_DATE
			AND schedules.movie_id = @movie_id
			AND movies.active_flg = 1
			AND schedules.active_flg = 1
		END
	END
	ELSE
	BEGIN
		PRINT 'INVALID PARAMETER'
	END
END
GO
/****** Object:  StoredProcedure [dbo].[schedules_proc_aud]    Script Date: 09/04/2014 09:06:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[schedules_proc_aud]
(
	@para VARCHAR(20) = '',
	@schedule_id BIGINT = 0,
	@screen_id INT = 0,
	@movie_id BIGINT = 0,
	@schedule_date DATE = NULL,
	@schedule_time TIME = NULL
)
AS
BEGIN
	IF @para = 'ADD'
	BEGIN
		--IF EXISTS	(
		--				SELECT 1
		--				FROM	schedules
		--				WHERE	schedules.screen_id = @screen_id
		--				AND		schedules.movie_id = @movie_id
		--				AND		schedules.schedule_date = @schedule_date
		--				AND		schedules.schedule_time = @schedule_time
		--				AND		schedules.active_flg = 1
		--			)
		--BEGIN
		--	SELECT -2;
		--END
		--ELSE
		--BEGIN
			INSERT INTO schedules
			VALUES	(
						@screen_id,
						@movie_id,
						@schedule_date,
						@schedule_time,
						0,
						1
					)
		--	SELECT SCOPE_IDENTITY();
		--END
	END
	ELSE IF @para = 'DELETE'
	BEGIN
		UPDATE	schedules
		SET		active_flg = 0
		WHERE	schedules.screen_id = @screen_id
		AND		schedules.schedule_date = @schedule_date
	END
	ELSE
	BEGIN
		PRINT 'INVALID PARAMETER'
		SELECT -99;
	END
END
GO
/****** Object:  StoredProcedure [dbo].[reviews_proc_get]    Script Date: 09/04/2014 09:06:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[reviews_proc_get]
(
	@para VARCHAR(20) = '',	
	@review_id BIGINT = 0,
	@movie_id BIGINT = 0
)
AS
BEGIN
	IF @para = 'GETALL'
	BEGIN
		SELECT	review_id,
				reviews.movie_id,
				movies.movie,
				review,
				review_by,
				stars
		FROM	reviews INNER JOIN movies
		ON		reviews.movie_id = movies.movie_id
		WHERE	reviews.active_flg = 1
	END
	ELSE IF @para = 'GETBYID'
	BEGIN
		SELECT	review_id,
				reviews.movie_id,
				movies.movie,
				review,
				review_by,
				stars
		FROM	reviews INNER JOIN movies
		ON		reviews.movie_id = movies.movie_id
		WHERE	reviews.review_id = @review_id
		AND		reviews.active_flg = 1
	END
	ELSE IF @para = 'GETBYMOVIEID'
	BEGIN
		SELECT	review_id,
				reviews.movie_id,
				movies.movie,
				review,
				review_by,
				stars
		FROM	reviews INNER JOIN movies
		ON		reviews.movie_id = movies.movie_id
		WHERE	reviews.movie_id = @movie_id
		AND		reviews.active_flg = 1
	END
	ELSE IF @para = 'GETFORHOME'
	BEGIN
		DECLARE	@BUFFER INT = 5
		SELECT	TOP (@BUFFER) review_id,
				reviews.movie_id,
				movies.movie,
				review,
				review_by,
				stars
		FROM	reviews INNER JOIN movies
		ON		reviews.movie_id = movies.movie_id
		WHERE	reviews.active_flg = 1
		ORDER BY NEWID()
	END
	ELSE
	BEGIN
		PRINT 'INVALID PARAMETER'
	END
END
GO
/****** Object:  StoredProcedure [dbo].[reviews_proc_aud]    Script Date: 09/04/2014 09:06:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[reviews_proc_aud]
(
	@para VARCHAR(20) = '',	
	@review_id BIGINT = 0,
	@movie_id BIGINT = 0,
	@review TEXT = '',
	@review_by VARCHAR(200) = '',
	@stars DECIMAL(4,2) = 0
)
AS
BEGIN
	IF @para = 'ADD'
	BEGIN
		INSERT INTO reviews
		VALUES	(
					@movie_id,
					@review,
					@review_by,
					@stars,
					1
				)
		SELECT SCOPE_IDENTITY();
	END
	ELSE IF @para = 'EDIT'
	BEGIN
		UPDATE	reviews
		SET		movie_id = @movie_id,
				review = @review,
				review_by = @review_by,
				stars = @stars
		WHERE	reviews.review_id = @review_id
		SELECT @review_id;
	END
	ELSE IF @para = 'DELETE'
	BEGIN
		UPDATE	reviews
		SET		active_flg = 0
		WHERE	reviews.review_id = @review_id
	END
	ELSE
	BEGIN
		PRINT 'INVALID PARAMETER'
		SELECT -99;
	END
END
GO
/****** Object:  StoredProcedure [dbo].[movies_proc_aud]    Script Date: 09/04/2014 09:06:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[movies_proc_aud]
(
	@para VARCHAR(20) = '',
	@movie_id BIGINT = 0,
	@movie VARCHAR(100) = '',
	@hours VARCHAR(5) = '',
	@minutes VARCHAR(5) = '',
	@director VARCHAR(200) = '',
	@cast VARCHAR(500) = '',
	@genre VARCHAR(100) = '',
	@lang VARCHAR(20) = '',
	@synopsis TEXT = '',
	@cb_rating VARCHAR(10) = '',
	@release_date DATE = NULL
)
AS
BEGIN
	IF @para = 'ADD'
	BEGIN
		IF EXISTS (SELECT 1 FROM movies WHERE movies.movie = @movie AND movies.active_flg = 1)
		BEGIN
			SELECT -2;
		END
		ELSE
		BEGIN
			INSERT INTO movies
			VALUES	(
						@movie,
						@hours,
						@minutes,
						@director,
						@cast,
						@genre,
						@lang,
						@synopsis,
						@cb_rating,
						@release_date,
						1
					)
			SELECT @movie_id = SCOPE_IDENTITY();
			INSERT INTO ticket_costs
			SELECT	@movie_id,
					seat_type_id,
					base_price,
					1
			FROM	seat_types
			WHERE	seat_types.active_flg = 1
			SELECT @movie_id;
		END
	END
	ELSE IF @para = 'EDIT'
	BEGIN
		IF EXISTS (SELECT 1 FROM movies WHERE movies.movie = @movie AND movies.movie_id <> @movie_id AND movies.active_flg = 1)
		BEGIN
			SELECT -2;
		END
		ELSE
		BEGIN
			UPDATE	movies
			SET		movie = @movie,
					[hours] = @hours,
					[minutes] = @minutes,
					director = @director,
					[cast] = @cast,
					genre = @genre,
					lang = @lang,
					synopsis = @synopsis,
					cb_rating = @cb_rating,
					release_date = @release_date
			WHERE	movies.movie_id = @movie_id
		SELECT @movie_id;
		END
	END
	ELSE IF @para = 'DELETE'
	BEGIN
		-- CHECK IS MOVIE SCHEDULED FOR ANY SHOW
		-- IF YES THEN DO NOT DELETE
		
		DECLARE @DT_NOW DATE = CONVERT(DATE, GETDATE())
		DECLARE @TM_NOW TIME = CONVERT(TIME(0), DATEADD(MI, -60, GETDATE()))
		DECLARE @IS_SCHEDULED BIT

		SELECT TOP 1 @IS_SCHEDULED =
		CASE schedule_date
			WHEN NULL THEN 0
			WHEN @DT_NOW THEN
				CASE
					WHEN schedule_time > @TM_NOW THEN 1
					ELSE 0
				END
			ELSE 1
		END
		FROM schedules
		WHERE	movie_id = @movie_id
		AND		active_flg = 1
		AND		schedule_date >= @DT_NOW
		ORDER BY schedule_date, schedule_time
		
		IF ISNULL(@IS_SCHEDULED, 0) = 0
		BEGIN
			UPDATE	movies
			SET		active_flg = 0
			WHERE	movies.movie_id = @movie_id
			
			SELECT 1;
		END
		ELSE
		BEGIN
			SELECT -2;
		END
	END
	ELSE
	BEGIN
		PRINT 'INVALID PARAMETER'
		SELECT -99;
	END
END
GO
/****** Object:  StoredProcedure [dbo].[users_proc_get]    Script Date: 09/04/2014 09:06:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[users_proc_get]
(
	@para VARCHAR(20) = '',
	@user_id BIGINT = 0,
	@email VARCHAR(80) = ''
)
AS
BEGIN
	IF @para = 'GETALL'
	BEGIN
		SELECT	users.user_id,
				users.f_name,
				users.l_name,
				users.gender,
				users.mobile_no,
				cities.city_id,
				cities.city,
				users.email
		FROM	users INNER JOIN cities
		ON		users.city_id = cities.city_id
		WHERE	users.active_flg = 1
	END
	ELSE IF @para = 'GETBYID'
	BEGIN
		SELECT	users.user_id,
				users.f_name,
				users.l_name,
				users.gender,
				users.mobile_no,
				cities.city_id,
				cities.city,
				users.email
		FROM	users INNER JOIN cities
		ON		users.city_id = cities.city_id
		WHERE	users.user_id = @user_id
		AND		users.active_flg = 1
	END
	ELSE IF @para = 'GETBYEMAIL'
	BEGIN
		SELECT	users.user_id,
				users.f_name,
				users.l_name,
				users.gender,
				users.mobile_no,
				cities.city_id,
				cities.city,
				users.email
		FROM	users INNER JOIN cities
		ON		users.city_id = cities.city_id
		WHERE	users.email = @email
		AND		users.active_flg = 1
	END
	ELSE
	BEGIN
		PRINT 'INVALID PARAMETER'
	END
END
GO
/****** Object:  StoredProcedure [dbo].[users_proc_aud]    Script Date: 09/04/2014 09:06:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[users_proc_aud]
(
	@para VARCHAR(20) = '',
	@user_id BIGINT = 0,
	@f_name VARCHAR(30) = '',
	@l_name VARCHAR(30) = '',
	@gender VARCHAR(10) = '',
	@mobile_no VARCHAR(10),
	@city_id INT = 0,
	@email VARCHAR(80) = '',
	@password VARCHAR(80) = ''
)
AS
BEGIN
	IF @para = 'ADD'
	BEGIN
		IF EXISTS (SELECT 1 FROM users WHERE users.email = @email AND users.active_flg = 1)
		BEGIN
			SELECT -2;
		END
		ELSE
		BEGIN
			INSERT INTO users
			VALUES	(
						@f_name,
						@l_name,
						@gender,
						@mobile_no,
						@city_id,
						@email,
						@password,
						1
					)
			SET @user_id = SCOPE_IDENTITY();
			SELECT	users.user_id,
					users.f_name,
					users.l_name,
					users.gender,
					users.mobile_no,
					cities.city_id,
					cities.city,
					users.email			
			FROM	users INNER JOIN cities
			ON		users.city_id = cities.city_id
			WHERE	users.active_flg = 1
			AND		users.user_id = @user_id
		END
	END
	ELSE IF @para = 'EDIT'
	BEGIN
		IF EXISTS (SELECT 1 FROM users WHERE users.email = @email AND users.user_id <> @user_id AND users.active_flg = 1)
		BEGIN
			SELECT -2;
		END
		ELSE
		BEGIN
			UPDATE	users
			SET		f_name = @f_name,
					l_name = @l_name,
					gender = @gender,
					mobile_no = @mobile_no,
					city_id = @city_id
			WHERE	users.user_id = @user_id
		SELECT	@user_id;
		END
	END
	ELSE IF @para = 'CHANGEPASSWORD'
	BEGIN
		UPDATE	users
		SET		password = @password
		WHERE	users.email = @email
	END
	ELSE IF @para = 'DELETE'
	BEGIN
		UPDATE	users
		SET		active_flg = 0
		WHERE	users.user_id = @user_id
	END
	ELSE
	BEGIN
		PRINT 'INVALID PARAMETER'
		SELECT -99;
	END
END
GO
/****** Object:  UserDefinedFunction [dbo].[concate_movie_poster]    Script Date: 09/04/2014 09:06:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[concate_movie_poster]
(
	@DELM			VARCHAR(5) = '',
	@MOVIE_ID		BIGINT
)
RETURNS VARCHAR(MAX)
AS
BEGIN
	DECLARE @STR VARCHAR(MAX);
	
	SELECT	@STR = COALESCE(@STR + @DELM, '') + POSTER_THUMB 
	FROM POSTERS 
	WHERE POSTERS.ACTIVE_FLG = 1 
	AND MAIN_FLG = 0
	AND MOVIE_ID = @MOVIE_ID;
	
	RETURN @STR;
END
GO
/****** Object:  StoredProcedure [dbo].[cities_proc_get]    Script Date: 09/04/2014 09:06:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[cities_proc_get]
(
	@para VARCHAR(20) = '',
	@city_id BIGINT = 0
)
AS
BEGIN
	IF @para = 'GETALL'
	BEGIN
		SELECT	city_id,
				city
		FROM	cities
		WHERE	cities.active_flg = 1
		ORDER BY city ASC
	END
	ELSE IF @para = 'GETBYID'
	BEGIN
		SELECT	city_id,
				city
		FROM	cities
		WHERE	cities.active_flg = 1
		AND		cities.city_id = @city_id
	END
	ELSE
	BEGIN
		PRINT 'INVALID PARAMETER'
	END
END
GO
/****** Object:  StoredProcedure [dbo].[ticket_costs_proc_get]    Script Date: 09/04/2014 09:06:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ticket_costs_proc_get]
(
	@para VARCHAR(20) = '',
	@ticket_cost_id BIGINT = 0,
	@movie_id BIGINT = 0
)
AS
BEGIN
	IF @para = 'GETALL'
	BEGIN
		SELECT	ticket_cost_id,
				ticket_costs.movie_id,
				movies.movie,
				ticket_costs.seat_type_id,
				seat_types.seat_type,
				ticket_cost
		FROM	ticket_costs INNER JOIN movies
		ON		ticket_costs.movie_id = movies.movie_id
				INNER JOIN seat_types
		ON		ticket_costs.seat_type_id = seat_types.seat_type_id
		WHERE	ticket_costs.active_flg = 1
		AND		movies.active_flg = 1
		ORDER BY ticket_costs.movie_id, ticket_cost DESC
	END
	ELSE IF @para = 'GETBYID'
	BEGIN
		SELECT	ticket_cost_id,
				ticket_costs.movie_id,
				movies.movie,
				ticket_costs.seat_type_id,
				seat_types.seat_type,
				ticket_cost
		FROM	ticket_costs INNER JOIN movies
		ON		ticket_costs.movie_id = movies.movie_id
				INNER JOIN seat_types
		ON		ticket_costs.seat_type_id = seat_types.seat_type_id
		WHERE	ticket_costs.ticket_cost_id = @ticket_cost_id
		AND		ticket_costs.active_flg = 1
		AND		movies.active_flg = 1
	END
	ELSE IF @para = 'GETBYMOVIEID'
	BEGIN
		SELECT	ticket_cost_id,
				ticket_costs.movie_id,
				movies.movie,
				ticket_costs.seat_type_id,
				seat_types.seat_type,
				ticket_cost
		FROM	ticket_costs INNER JOIN movies
		ON		ticket_costs.movie_id = movies.movie_id
				INNER JOIN seat_types
		ON		ticket_costs.seat_type_id = seat_types.seat_type_id
		WHERE	ticket_costs.movie_id = @movie_id
		AND		ticket_costs.active_flg = 1
		AND		movies.active_flg = 1
		ORDER BY ticket_cost DESC
	END
	ELSE
	BEGIN
		PRINT 'INVALID PARAMETER'
	END
END
GO
/****** Object:  StoredProcedure [dbo].[ticket_costs_proc_aud]    Script Date: 09/04/2014 09:06:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ticket_costs_proc_aud]
(
	@para VARCHAR(20) = '',
	@ticket_cost_id BIGINT = 0,
	@movie_id BIGINT = 0,
	@seat_type_id INT = 0,
	@ticket_cost DECIMAL(12,2) = 0
)
AS
BEGIN
	IF @para = 'ADD'
	BEGIN
		IF EXISTS (SELECT 1 FROM ticket_costs WHERE ticket_costs.movie_id = @movie_id AND ticket_costs.seat_type_id = @seat_type_id AND ticket_costs.active_flg = 1)
		BEGIN
			SELECT -2;
		END
		ELSE
		BEGIN
			INSERT INTO ticket_costs
			VALUES	(
						@movie_id,
						@seat_type_id,
						@ticket_cost,
						1
					)
			SELECT SCOPE_IDENTITY();
		END
	END
	ELSE IF @para = 'EDIT'
	BEGIN
		UPDATE	ticket_costs
		SET		ticket_cost = @ticket_cost
		WHERE	ticket_costs.ticket_cost_id = @ticket_cost_id
		SELECT	@ticket_cost_id;
	END
	ELSE IF @para = 'DELETE'
	BEGIN
		UPDATE	ticket_costs
		SET		active_flg = 0
		WHERE	ticket_costs.ticket_cost_id = @ticket_cost_id
	END
	ELSE
	BEGIN
		PRINT 'INVALID PARAMETER'
		SELECT -99;
	END
END
GO
/****** Object:  StoredProcedure [dbo].[trailers_proc_get]    Script Date: 09/04/2014 09:06:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[trailers_proc_get]
(
	@para VARCHAR(20) = '',
	@trailer_id BIGINT = 0,
	@movie_id BIGINT = 0
)
AS
BEGIN
	IF @para = 'GETALL'
	BEGIN
		SELECT	trailer_id,
				trailers.movie_id,
				movies.movie,
				trailer_link
		FROM	trailers INNER JOIN movies
		ON		trailers.movie_id = movies.movie_id
		WHERE	trailers.active_flg = 1
		AND		movies.active_flg = 1
	END
	ELSE IF @para = 'GETBYID'
	BEGIN
		SELECT	trailer_id,
				trailers.movie_id,
				movies.movie,
				trailer_link
		FROM	trailers INNER JOIN movies
		ON		trailers.movie_id = movies.movie_id
		WHERE	trailers.trailer_id = @trailer_id
		AND		trailers.active_flg = 1
		AND		movies.active_flg = 1
	END
	ELSE IF @para = 'GETBYMOVIEID'
	BEGIN
		SELECT	trailer_id,
				trailers.movie_id,
				movies.movie,
				trailer_link
		FROM	trailers INNER JOIN movies
		ON		trailers.movie_id = movies.movie_id
		WHERE	trailers.movie_id = @movie_id
		AND		trailers.active_flg = 1
		AND		movies.active_flg = 1
	END
	ELSE
	BEGIN
		PRINT 'INVALID PARAMETER'
	END
END
GO
/****** Object:  StoredProcedure [dbo].[trailers_proc_aud]    Script Date: 09/04/2014 09:06:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[trailers_proc_aud]
(
	@para VARCHAR(20) = '',
	@trailer_id BIGINT = 0,
	@movie_id BIGINT = 0,
	@trailer_link VARCHAR(150) = ''
)
AS
BEGIN
	IF @para = 'ADD'
	BEGIN
		IF EXISTS (SELECT 1 FROM trailers WHERE trailers.movie_id = @movie_id AND trailers.trailer_link = @trailer_link AND trailers.active_flg = 1)
		BEGIN
			SELECT -2;
		END
		ELSE
		BEGIN
			INSERT INTO trailers
			VALUES	(
						@movie_id,
						@trailer_link,
						0,
						1
					)
		SELECT SCOPE_IDENTITY();
		END
	END
	ELSE IF @para = 'EDIT'
	BEGIN
		IF EXISTS (SELECT 1 FROM trailers WHERE trailers.movie_id = @movie_id AND trailers.trailer_link = @trailer_link AND trailers.trailer_id <> @trailer_id AND trailers.active_flg = 1)
		BEGIN
			SELECT -2;
		END
		ELSE
		BEGIN
			UPDATE	trailers
			SET		movie_id = @movie_id,
					trailer_link = @trailer_link
			WHERE	trailers.trailer_id = @trailer_id
		SELECT @trailer_id;
		END
	END
	ELSE IF @para = 'DELETE'
	BEGIN
		UPDATE	trailers
		SET		active_flg = 0
		WHERE	trailers.trailer_id = @trailer_id
	END
	ELSE
	BEGIN
		PRINT 'INVALID PARAMETER'
		SELECT -99;
	END
END
GO
/****** Object:  StoredProcedure [dbo].[sliders_proc_get]    Script Date: 09/04/2014 09:06:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sliders_proc_get]
(
	@para VARCHAR(20) = '',	
	@slider_id BIGINT = 0,
	@movie_id BIGINT = 0
)
AS
BEGIN
	IF @para = 'GETALL'
	BEGIN
		SELECT	slider_id,
				sliders.movie_id,
				movies.movie,
				slider_pic
		FROM	sliders INNER JOIN movies
		ON		sliders.movie_id = movies.movie_id
		WHERE	sliders.active_flg = 1
		AND		movies.active_flg = 1
	END
	ELSE IF @para = 'GETBYID'
	BEGIN
		SELECT	slider_id,
				sliders.movie_id,
				movies.movie,
				slider_pic
		FROM	sliders INNER JOIN movies
		ON		sliders.movie_id = movies.movie_id
		WHERE	sliders.slider_id = @slider_id
		AND		sliders.active_flg = 1
		AND		movies.active_flg = 1
	END
	ELSE IF @para = 'GETMOVIEWITHOUT'
	BEGIN
		SELECT	movies.movie_id,
				movies.movie
		FROM	movies
		WHERE	movies.movie_id NOT IN (SELECT sliders.movie_id FROM sliders WHERE sliders.active_flg = 1)
		AND		movies.active_flg = 1
	END
	ELSE
	BEGIN
		PRINT 'INVALID PARAMETER'
	END
END
GO
/****** Object:  StoredProcedure [dbo].[sliders_proc_aud]    Script Date: 09/04/2014 09:06:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sliders_proc_aud]
(
	@para VARCHAR(20) = '',	
	@slider_id BIGINT = 0,
	@movie_id BIGINT = 0,
	@slider_pic VARCHAR(200) = ''
)
AS
BEGIN
	IF @para = 'ADD'
	BEGIN
		INSERT INTO sliders
		VALUES	(
					@movie_id,
					@slider_pic,
					1
				)
		SELECT SCOPE_IDENTITY();
	END
	ELSE IF @para = 'DELETE'
	BEGIN
		UPDATE	sliders
		SET		active_flg = 0
		WHERE	sliders.slider_id = @slider_id
	END
	ELSE
	BEGIN
		PRINT 'INVALID PARAMETER'
		SELECT -99;
	END
END
GO
/****** Object:  StoredProcedure [dbo].[seat_patterns_proc_get]    Script Date: 09/04/2014 09:06:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[seat_patterns_proc_get]
(
	@para VARCHAR(20) = ''
)
AS
BEGIN
	IF @para = 'GETALL'
	BEGIN
		SELECT	seat_pattern_id,
				seat_pattern
		FROM	seat_patterns
	END
	ELSE
	BEGIN
		PRINT 'INVALID PARAMETER'
	END
END
GO
/****** Object:  StoredProcedure [dbo].[seat_config_proc_get]    Script Date: 09/04/2014 09:06:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[seat_config_proc_get]
(
	@para VARCHAR(20) = '',
	@seat_pattern_id INT = 0
)
AS
BEGIN
	IF @para = 'GETBYPATTID'
	BEGIN
		SELECT	seat_config_id,
				seat_pattern_id,
				seat_types.seat_type,
				seat_row,
				seat_no,
				seat_token
		FROM	seat_config INNER JOIN seat_types
		ON		seat_config.seat_type_id = seat_types.seat_type_id
		WHERE	seat_config.seat_pattern_id = @seat_pattern_id
	END
	ELSE
	BEGIN
		PRINT 'INVALID PARAMETER'
	END
END
GO
/****** Object:  StoredProcedure [dbo].[seat_types_proc_get]    Script Date: 09/04/2014 09:06:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[seat_types_proc_get]
(
	@para VARCHAR(20) = '',
	@seat_pattern_id INT = 0,
	@seat_type_id INT = 0,
	@movie_id BIGINT = 0
)
AS
BEGIN
	IF @para = 'GETALL'
	BEGIN
		SELECT	seat_type_id,
				seat_type,
				base_price
		FROM	seat_types
		WHERE	seat_types.active_flg = 1
		ORDER BY base_price DESC
	END
	ELSE IF @para = 'GETBYPATTID'
	BEGIN
		--SELECT DISTINCT	seat_row,seat_types.seat_type
		--FROM	seat_config INNER JOIN seat_types
		--ON		seat_config.seat_type_id = seat_types.seat_type_id
		--WHERE	seat_config.seat_pattern_id = @seat_pattern_id
		
		SELECT (SELECT dbo.GetFirstAndLast('FIRST',@seat_pattern_id,seat_type_id)) + '-' + (SELECT dbo.GetFirstAndLast('LAST',@seat_pattern_id,seat_type_id)),seat_type
		FROM	seat_types
	END
	ELSE IF @para = 'GETBYIDFORMOVIE'
	BEGIN
		SELECT	seat_types.seat_type_id,
				seat_type,
				ticket_cost AS base_price
		FROM	seat_types INNER JOIN ticket_costs
		ON		seat_types.seat_type_id = ticket_costs.seat_type_id
		WHERE	movie_id = @movie_id
		AND		seat_types.seat_type_id = @seat_type_id
		AND		seat_types.active_flg = 1
		AND		ticket_costs.active_flg = 1
	END
	ELSE
	BEGIN
		PRINT 'INVALID PARAMETER'
	END
END
GO
/****** Object:  StoredProcedure [dbo].[movies_proc_get]    Script Date: 09/04/2014 09:06:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[movies_proc_get]
(
	@para VARCHAR(20) = '',
	@movie_id BIGINT = 0,
	@movie VARCHAR(100) = '',
	@release_date DATE = NULL
)
AS
BEGIN
	DECLARE @DT_ALLOWED_BOOKING DATE;
	SET @DT_ALLOWED_BOOKING = GETDATE() + 2;

	IF @para = 'GETALL'
	BEGIN
		SELECT	movie_id,
				movie,
				[hours],
				[minutes],
				director,
				[cast],
				genre,
				lang,
				synopsis,
				cb_rating,
				CONVERT(VARCHAR(10),release_date,103)
		FROM	movies
		WHERE	movies.active_flg = 1
	END
	ELSE IF @para = 'GETBYID'
	BEGIN
		SELECT	movie_id,
				movie,
				[hours],
				[minutes],
				director,
				[cast],
				genre,
				lang,
				synopsis,
				cb_rating,
				CONVERT(VARCHAR(10),release_date,103)
		FROM	movies
		WHERE	movies.movie_id = @movie_id AND movies.active_flg = 1
	END
	ELSE IF @para = 'GETBYNAME'
	BEGIN
		SELECT	movie_id,
				movie,
				[hours],
				[minutes],
				director,
				[cast],
				genre,
				lang,
				synopsis,
				cb_rating,
				CONVERT(VARCHAR(10),release_date,103)
		FROM	movies
		WHERE	movies.movie = @movie AND movies.active_flg = 1
	END
	ELSE IF @para = 'SEARCHBYNAME'
	BEGIN
		SELECT	movies.movie_id,
				movie,
				[hours],
				[minutes],
				director,
				[cast],
				genre,
				lang,
				synopsis,
				cb_rating,
				release_date,
				ISNULL((SELECT TOP 1 posters.poster_thumb FROM posters WHERE posters.active_flg = 1 AND posters.main_flg = 1 AND posters.movie_id = movies.movie_id),'/cinema/posters/not.png'),
				CASE WHEN movies.release_date < @DT_ALLOWED_BOOKING THEN 'Y' ELSE 'N' END AS 'BUY_FLAG'
		FROM	movies
		WHERE	movies.active_flg = 1 AND movies.movie LIKE '%' + @movie + '%'
	END
	ELSE IF @para = 'GETREMOVED'
	BEGIN
		SELECT	movie_id,
				movie,
				[hours],
				[minutes],
				director,
				[cast],
				genre,
				lang,
				synopsis,
				cb_rating,
				CONVERT(VARCHAR(10),release_date,103)
		FROM	movies
		WHERE	movies.active_flg = 0
	END
	ELSE IF @para = 'GETFORSCHEDULE'
	BEGIN
		SELECT	movie_id,
				movie,
				[hours],
				[minutes],
				director,
				[cast],
				genre,
				lang,
				synopsis,
				cb_rating,
				CONVERT(VARCHAR(10),release_date,103)
		FROM	movies
		WHERE	movies.release_date <= @release_date
		AND		movies.active_flg = 1
	END
	ELSE IF @para = 'GETFORHOME'
	BEGIN
		SELECT	movies.movie_id,
				movie,
				[hours],
				[minutes],
				director,
				[cast],
				genre,
				lang,
				synopsis,
				cb_rating,
				CONVERT(VARCHAR(10),release_date,103),
				ISNULL((SELECT TOP 1 posters.poster_thumb FROM posters WHERE posters.active_flg = 1 AND posters.main_flg = 1 AND posters.movie_id = movies.movie_id),'/cinema/posters/not.png')
		FROM	movies
		WHERE	movies.active_flg = 1
		AND		movies.release_date < (@DT_ALLOWED_BOOKING)
	END
	ELSE IF @para = 'GETUPCOMING'
	BEGIN
		SELECT	movies.movie_id,
				movie,
				[hours],
				[minutes],
				director,
				[cast],
				genre,
				lang,
				synopsis,
				cb_rating,
				release_date,
				ISNULL((SELECT TOP 1 posters.poster_thumb FROM posters WHERE posters.active_flg = 1 AND posters.main_flg = 1 AND posters.movie_id = movies.movie_id),'/cinema/posters/not.png')
		FROM	movies
		WHERE	movies.active_flg = 1
		AND		movies.release_date >= (@DT_ALLOWED_BOOKING)
	END
	ELSE IF @para = 'GETMOVIEDETAILS'
	BEGIN
		SELECT	movies.movie_id,
				movie,
				[hours],
				[minutes],
				director,
				[cast],
				genre,
				lang,
				synopsis,
				cb_rating,
				CONVERT(VARCHAR(10),release_date,103),
				ISNULL((SELECT TOP 1 posters.poster_thumb FROM posters WHERE posters.active_flg = 1 AND posters.main_flg = 1 AND posters.movie_id = movies.movie_id),'/cinema/posters/not.png'),
				(SELECT dbo.concate_movie_poster(',', movies.movie_id)),
				CASE WHEN movies.release_date < @DT_ALLOWED_BOOKING THEN 'Y' ELSE 'N' END AS 'BUY_FLAG'
		FROM	movies
		WHERE	movies.movie_id = @movie_id AND movies.active_flg = 1
	END
	ELSE
	BEGIN
		PRINT 'INVALID PARAMETER'
	END
END
GO
/****** Object:  StoredProcedure [dbo].[DO_TRANSACTION]    Script Date: 09/04/2014 09:06:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DO_TRANSACTION]
(
	@anonymous_flg	BIT = 0,
	@user_id		BIGINT = 0,
	@mobile_no		VARCHAR(10) = '',
	@email			VARCHAR(80) = '',
	
	@trans_id		BIGINT = 0,
	@trans_code		VARCHAR(30) = '',
	@amount			VARCHAR(12) = '',
	@conv_fee		VARCHAR(12) = '',
	@service_tax	VARCHAR(12) = '',
	@total_amount	VARCHAR(12) = '',
	
	@pay_detail_id	BIGINT = 0,
	@card_type		NVARCHAR(50) = '',
	@card_no		VARCHAR(20) = '',
	@expiry			VARCHAR(10) = '',
	@CVV			VARCHAR(4) = '',
	@card_name		VARCHAR(40) = '',
	
	@schedule_id	BIGINT = 0,
	@SEATS_XML		NVARCHAR(MAX),
	@SESSION_ID		NVARCHAR(30)
)
AS
BEGIN
	PRINT 'START'
	DECLARE @DOC INT
	DECLARE @Seat_row VARCHAR(10)
	DECLARE @Seat_no VARCHAR(10)
	DECLARE @seat_pattern_id INT
	DECLARE @STEP_USER_OK BIT = 0
	DECLARE @CAUSE NVARCHAR(MAX) = ''
	DECLARE @TRANS_ON DATETIME
	SET @TRANS_ON = GETDATE()
	BEGIN TRANSACTION PAY_TRANS
	BEGIN TRY
	
	-- STEP 1 CLEAN ANY PREVIOUS TEMP DATA
	--PRINT 'STEP 1 CLEAN ANY PREVIOUS TEMP DATA'
	DELETE FROM temp_booking WHERE tSessionId = @SESSION_ID
	
	-- STEP 2 PARSE XML
	--PRINT 'STEP 2 PARSE XML'
	EXEC sp_xml_preparedocument @DOC OUTPUT, @SEATS_XML
	INSERT INTO temp_booking
	(tSessionId, tSeat_row, tSeat_no)
	SELECT @SESSION_ID, tSeat_row, tSeat_no FROM OPENXML (@DOC, '/Seats/Seat',1)
	WITH (tSeat_row VARCHAR(10), tSeat_no VARCHAR(10))
	
	SELECT @seat_pattern_id = seat_pattern_id 
	FROM schedules SH INNER JOIN screens SC
	ON SH.screen_id = SC.screen_id
	WHERE SH.schedule_id = @schedule_id
	AND SH.active_flg = 1
	
	-- STEP 3 USER
	--PRINT 'STEP 3 USER'
	IF @anonymous_flg = 0
	BEGIN
		-- ANONYMOUS USER
		--PRINT 'ANONYMOUS USER'
		EXEC a_users_proc_aud 'ADD', @user_id OUT, @mobile_no, @email
		
		IF @user_id < 1
		BEGIN
			RAISERROR('ERROR OCCURRED WHILE CREATING ANONYMOUS USER', 16, 1)
		END
	END
	ELSE
	BEGIN
		-- REGISTERED USER
		--PRINT 'REGISTERED USER'
		IF NOT EXISTS (SELECT 1 FROM [users] WHERE users.[user_id] = @user_id AND users.active_flg = 1)
		BEGIN
			RAISERROR('USER NOT FOUND', 16, 1)
		END
	END
	
	-- STEP 4 PAYMENT DETAILS
	--PRINT 'STEP 4 PAYMENT DETAILS'
	INSERT INTO payment_details
	(card_type, card_no, expiry, CVV, card_name)
	VALUES
	(@card_type, @card_no, @expiry, @CVV, @card_name)
	SET @pay_detail_id = SCOPE_IDENTITY()
	
	-- STEP 5 TRANSACTION
	--PRINT 'STEP 5 TRANSACTION'
	DECLARE @NOWDTSTR VARCHAR(25) = CONVERT(VARCHAR, GETDATE(), 121)
	SET @trans_code = 'T' + CASE WHEN @anonymous_flg = 0 THEN '0' ELSE '1' END + CONVERT(VARCHAR,@user_id) + REPLACE(REPLACE(REPLACE(REPLACE(@NOWDTSTR,'-',''), ' ', ''), ':', ''), '.', '')
	
	INSERT INTO transactions
	(trans_code, pay_detail_id, [user_id], anonymous_flg, amount, conv_fee, service_tax, total_amount, trans_on)
	VALUES
	(@trans_code, @pay_detail_id, @user_id, @anonymous_flg, @amount, @conv_fee, @service_tax, @total_amount, @TRANS_ON)
	SET @trans_id = SCOPE_IDENTITY()
	
	-- STEP 6 UPDATE BOOKINGS
	--PRINT 'STEP 6 UPDATE BOOKINGS'
	DECLARE @booking_cur CURSOR
	SET	@booking_cur = CURSOR FOR SELECT tSeat_row, tSeat_no FROM temp_booking WHERE tSessionId = @SESSION_ID
	OPEN @booking_cur		
	FETCH NEXT FROM @booking_cur INTO @Seat_row, @Seat_no
	WHILE @@FETCH_STATUS = 0
	BEGIN
		EXEC BOOKINGS_AUD @schedule_id, @trans_id, @Seat_row, @Seat_no, @seat_pattern_id
		FETCH NEXT FROM @booking_cur INTO @Seat_row, @Seat_no
	END
	CLOSE @booking_cur
	DEALLOCATE @booking_cur
	
	-- STEP 7 CLEAN TEMP DATA
	--PRINT 'STEP 7 CLEAN TEMP DATA'
	DELETE FROM temp_booking WHERE tSessionId = @SESSION_ID
	
	-- STEP 8 LOG TRANSACTION SUCCESS
	--PRINT 'STEP 8 LOG TRANSACTION SUCCESS'
	EXEC LOG_TRANSACTION 'SUCCESS', '', @trans_id, @user_id, @anonymous_flg, @TRANS_ON;
	
	SELECT @user_id AS [user_id], @trans_id AS trans_id, @trans_code AS trans_code, @pay_detail_id AS pay_detail_id
	
	-- STEP 9 COMMIT
	--PRINT 'STEP 9 COMMIT'
	COMMIT TRANSACTION PAY_TRANS
	END TRY
	BEGIN CATCH
		-- LOG TRANSACTION FAILURE
		SET @CAUSE = ERROR_MESSAGE()
		--PRINT 'LOG TRANSACTION FAILURE ' + @CAUSE
		ROLLBACK TRANSACTION PAY_TRANS
		EXEC LOG_TRANSACTION 'FAIL', @CAUSE, 0, @user_id, @anonymous_flg, @TRANS_ON;
		SELECT 0 [user_id];
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[BOOKINGS_GET]    Script Date: 09/04/2014 09:06:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BOOKINGS_GET]
(
	@PARA			VARCHAR(30) = '',
	@BOOKING_DATETIME DATETIME = NULL,
	@BOOKING_DATE_STR VARCHAR(15) = '',
	@MOVIE_ID		BIGINT = 0,
	@SCREEN_ID		INT = 0,
	@SCHEDULE_ID	BIGINT = 0,
	@CLASS_ID		INT = 0
)
AS
BEGIN
	DECLARE @BOOKING_DATE DATE
	--IF @BOOKING_DATETIME IS NULL
	--BEGIN
		SET @BOOKING_DATETIME = GETDATE();
	--END
	
	SET @BOOKING_DATE = CONVERT(DATE, @BOOKING_DATE_STR)
	--PRINT @BOOKING_DATE
	
	IF @PARA = 'GETSCREENSSHOWS'
	BEGIN
		IF @BOOKING_DATE = CONVERT(DATE, GETDATE())
		BEGIN
			SELECT DISTINCT schedules.screen_id, 
							screens.screen, 
							schedule_id, 
							schedule_date, 
							CONVERT(VARCHAR, schedule_time, 100) AS 'schedule_time'
			FROM schedules INNER JOIN movies
			ON	 schedules.movie_id = movies.movie_id
			INNER JOIN screens
			ON	 schedules.screen_id = screens.screen_id
			WHERE schedule_date = @BOOKING_DATE
			AND schedule_time > CONVERT(TIME(0), DATEADD(MI, 30, @BOOKING_DATETIME))
			AND schedules.movie_id = @MOVIE_ID
			AND movies.active_flg = 1
			AND schedules.active_flg = 1
			ORDER BY schedules.screen_id, schedule_time
		END
		ELSE
		BEGIN
			SELECT DISTINCT schedules.screen_id, 
							screens.screen, 
							schedule_id, 
							schedule_date, 
							CONVERT(VARCHAR, schedule_time, 100) AS 'schedule_time'
			FROM schedules INNER JOIN movies
			ON	 schedules.movie_id = movies.movie_id
			INNER JOIN screens
			ON	 schedules.screen_id = screens.screen_id
			WHERE schedule_date = @BOOKING_DATE
			AND schedules.movie_id = @MOVIE_ID
			AND movies.active_flg = 1
			AND schedules.active_flg = 1
			ORDER BY schedules.screen_id, schedule_time
		END
	END
	ELSE IF @PARA = 'GETCLASS'
	BEGIN
		SELECT seat_type_id, seat_type
		FROM seat_types
		WHERE active_flg = 1
		ORDER BY base_price, seat_type_id
	END
	ELSE IF @PARA = 'GETCURRENTSEATSTATUS'
	BEGIN
		DECLARE @SEAT_PATTERN_ID INT
		
		SET @SCREEN_ID = 0
		SELECT @SEAT_PATTERN_ID = SC.seat_pattern_id
		FROM screens SC INNER JOIN schedules SH
		ON SC.screen_id = SH.screen_id
		WHERE SH.schedule_id = @SCHEDULE_ID 
		AND SH.active_flg = 1
		AND SC.active_flg = 1
		
		IF ISNULL(@SEAT_PATTERN_ID, 0) <> 0
		BEGIN
			SELECT	seat_config_id, 
			seat_pattern_id, 
			seat_type_id, 
			seat_row, 
			seat_no, 
			CASE WHEN seat_type_id = @CLASS_ID 
				THEN seat_token
				ELSE 
				CASE WHEN seat_token <> 1 
					THEN seat_token 
					ELSE 3 
				END 
			END AS seat_token
			FROM seat_config
			WHERE seat_pattern_id = @SEAT_PATTERN_ID
			AND seat_config_id NOT IN 
			(
				SELECT	B.seat_config_id
				FROM seat_config S INNER JOIN bookings B
				ON B.seat_config_id = S.seat_config_id
				WHERE B.booked_flg = 1
				AND   B.schedule_id = @SCHEDULE_ID
			)
			UNION
			SELECT	B1.seat_config_id, 
					seat_pattern_id, 
					seat_type_id, 
					seat_row, 
					seat_no, 
					CASE WHEN B1.booked_flg = 1 THEN 2 ELSE 1 END AS seat_token
			FROM seat_config S INNER JOIN bookings B1
			ON B1.seat_config_id = S.seat_config_id
			WHERE B1.schedule_id = @SCHEDULE_ID
		END
		ELSE
		BEGIN
			PRINT 'SEAT PATTERN NOT FOUND'
		END
	END
	ELSE IF @para = 'GETSEATTYPESBYSCHEDULEID'
	BEGIN
		DECLARE @SEAT_PATTERN_ID_1 INT
		
		SET @SCREEN_ID = 0
		SELECT @SEAT_PATTERN_ID_1 = SC.seat_pattern_id
		FROM screens SC INNER JOIN schedules SH
		ON SC.screen_id = SH.screen_id
		WHERE SH.schedule_id = @SCHEDULE_ID 
		AND SH.active_flg = 1
		AND SC.active_flg = 1
		
		IF ISNULL(@SEAT_PATTERN_ID_1, 0) <> 0
		BEGIN		
			SELECT	(SELECT dbo.GetFirstAndLast('FIRST', @SEAT_PATTERN_ID_1, seat_type_id)) + '-' + (SELECT dbo.GetFirstAndLast('LAST', @SEAT_PATTERN_ID_1, seat_type_id)), 
					seat_type
			FROM	seat_types
		END
		ELSE
		BEGIN
			PRINT 'SEAT PATTERN NOT FOUND'
		END
	END
	ELSE IF @para = 'GETSCHEDULEDATES'
	BEGIN
		DECLARE @DT_NOW DATE = CONVERT(DATE, @BOOKING_DATETIME)
		
		SELECT DISTINCT S.schedule_date FROM schedules S
		INNER JOIN movies M
		ON S.movie_id = M.movie_id
		WHERE S.movie_id = @MOVIE_ID
		AND S.active_flg = 1
		AND M.active_flg = 1
		AND schedule_date >= @DT_NOW
	END
	ELSE
	BEGIN
		PRINT 'INVALID PARAMETER'
	END
END
GO
