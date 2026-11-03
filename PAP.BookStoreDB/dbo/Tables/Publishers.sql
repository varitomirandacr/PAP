CREATE TABLE [dbo].[Publishers] (
    [Id]        INT            IDENTITY (1, 1) NOT NULL,
    [Name]      NVARCHAR (200) NOT NULL,
    [Country]   NVARCHAR (100) NULL,
    [Website]   NVARCHAR (255) NULL,
    [Email]     NVARCHAR (150) NULL,
    [CreatedAt] DATETIME2 (7)  DEFAULT (sysutcdatetime()) NOT NULL,
    CONSTRAINT [PK_Publishers] PRIMARY KEY CLUSTERED ([Id] ASC)
);

