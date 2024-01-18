USE [gravity_books_DWH]
GO

/****** Object:  Table [dbo].[Dim_order]    Script Date: 1/10/2024 9:50:35 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Dim_order](
	[order_id_SK] [int] IDENTITY(1,1) NOT NULL,
	[order_id_BK] [int] NULL,
	[order_date] [date] NULL,
	[method_name] [varchar](100) NULL,
	[shipping_id_BK] [int] NULL,
	[history_id_BK] [int] NULL,
	[status_id_BK] [int] NULL,
	[status_date] [datetime] NULL,
	[status_value] [varchar](20) NULL,
	[start_date] [datetime] NULL,
	[end_date] [datetime] NULL,
	[is_current] [tinyint] NULL,
	[source_system_code] [tinyint] NULL,
 CONSTRAINT [pk_dim_shipping] PRIMARY KEY CLUSTERED 
(
	[order_id_SK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Dim_order] ADD  CONSTRAINT [DF__dim_shipp__start__49C3F6B7]  DEFAULT (getdate()) FOR [start_date]
GO

ALTER TABLE [dbo].[Dim_order] ADD  CONSTRAINT [DF__dim_shipp__is_cu__4AB81AF0]  DEFAULT ((1)) FOR [is_current]
GO


