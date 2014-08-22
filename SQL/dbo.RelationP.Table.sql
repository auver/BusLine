USE [Line]
GO
/****** Object:  Table [dbo].[RelationP]    Script Date: 2013/7/7 13:48:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RelationP](
	[RID] [int] IDENTITY(1,1) NOT NULL,
	[SEID] [int] NOT NULL,
	[STID] [int] NOT NULL,
	[rank] [int] NOT NULL,
	[wprice] [money] NOT NULL,
	[sprice] [money] NOT NULL,
 CONSTRAINT [PK_RelationP] PRIMARY KEY CLUSTERED 
(
	[RID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[RelationP]  WITH CHECK ADD  CONSTRAINT [FK_RelationP_Service] FOREIGN KEY([SEID])
REFERENCES [dbo].[Service] ([SEID])
GO
ALTER TABLE [dbo].[RelationP] CHECK CONSTRAINT [FK_RelationP_Service]
GO
ALTER TABLE [dbo].[RelationP]  WITH CHECK ADD  CONSTRAINT [FK_RelationP_Station] FOREIGN KEY([STID])
REFERENCES [dbo].[Station] ([STID])
GO
ALTER TABLE [dbo].[RelationP] CHECK CONSTRAINT [FK_RelationP_Station]
GO
