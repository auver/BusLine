USE [Line]
GO
/****** Object:  Table [dbo].[Service]    Script Date: 2013/7/7 13:48:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Service](
	[SEID] [int] IDENTITY(1,1) NOT NULL,
	[SEnum] [nchar](4) NOT NULL,
	[isUpLine] [bit] NOT NULL,
	[headway] [time](0) NOT NULL,
	[wbeginTime] [time](0) NOT NULL,
	[wendTime] [time](0) NOT NULL,
	[sbeginTime] [time](0) NOT NULL,
	[sendTime] [time](0) NOT NULL,
	[price] [money] NULL,
	[airprice] [money] NULL,
	[CID] [int] NOT NULL,
	[SEdesc] [nvarchar](200) NULL,
 CONSTRAINT [PK_Service] PRIMARY KEY CLUSTERED 
(
	[SEID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Service]  WITH CHECK ADD  CONSTRAINT [FK_Service_company] FOREIGN KEY([CID])
REFERENCES [dbo].[Company] ([CID])
GO
ALTER TABLE [dbo].[Service] CHECK CONSTRAINT [FK_Service_company]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'线路名称，如“快1”' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Service', @level2type=N'COLUMN',@level2name=N'SEnum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否是上行路线？' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Service', @level2type=N'COLUMN',@level2name=N'isUpLine'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'发车间隔' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Service', @level2type=N'COLUMN',@level2name=N'headway'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'冬天上行始班车时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Service', @level2type=N'COLUMN',@level2name=N'wbeginTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'冬天上行末班车时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Service', @level2type=N'COLUMN',@level2name=N'wendTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'夏天上行始班车时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Service', @level2type=N'COLUMN',@level2name=N'sbeginTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'末班车时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Service', @level2type=N'COLUMN',@level2name=N'sendTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'冬季价格。若分段计价，可为空' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Service', @level2type=N'COLUMN',@level2name=N'price'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'夏季价格' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Service', @level2type=N'COLUMN',@level2name=N'airprice'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'公司代码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Service', @level2type=N'COLUMN',@level2name=N'CID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'线路的信息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Service'
GO
