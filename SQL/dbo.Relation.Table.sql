USE [Line]
GO
/****** Object:  Table [dbo].[Relation]    Script Date: 2013/7/7 13:48:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Relation](
	[RID] [int] IDENTITY(1,1) NOT NULL,
	[SEID] [int] NOT NULL,
	[STID] [int] NOT NULL,
	[rank] [int] NOT NULL,
 CONSTRAINT [PK_Relation] PRIMARY KEY CLUSTERED 
(
	[RID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Relation]  WITH CHECK ADD  CONSTRAINT [FK_Relation_Service] FOREIGN KEY([SEID])
REFERENCES [dbo].[Service] ([SEID])
GO
ALTER TABLE [dbo].[Relation] CHECK CONSTRAINT [FK_Relation_Service]
GO
ALTER TABLE [dbo].[Relation]  WITH CHECK ADD  CONSTRAINT [FK_Relation_Station] FOREIGN KEY([STID])
REFERENCES [dbo].[Station] ([STID])
GO
ALTER TABLE [dbo].[Relation] CHECK CONSTRAINT [FK_Relation_Station]
GO
ALTER TABLE [dbo].[Relation]  WITH CHECK ADD  CONSTRAINT [CK_Relation] CHECK  (([rank]>=(0)))
GO
ALTER TABLE [dbo].[Relation] CHECK CONSTRAINT [CK_Relation]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'站点在该路线的序号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Relation', @level2type=N'COLUMN',@level2name=N'rank'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'线路与站点关系表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Relation'
GO
