USE [Line]
GO
/****** Object:  Table [dbo].[Station]    Script Date: 2013/7/7 13:48:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Station](
	[STID] [int] IDENTITY(1,1) NOT NULL,
	[STname] [nvarchar](15) NOT NULL,
	[STdesc] [nvarchar](200) NULL,
 CONSTRAINT [PK_Station] PRIMARY KEY CLUSTERED 
(
	[STID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_Station] UNIQUE NONCLUSTERED 
(
	[STname] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'站点名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Station', @level2type=N'COLUMN',@level2name=N'STname'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'站点' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Station'
GO
