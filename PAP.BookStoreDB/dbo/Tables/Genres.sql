CREATE TABLE [dbo].[Genres] (
    [Id]          INT            IDENTITY (1, 1) NOT NULL,
    [Name]        NVARCHAR (100) NOT NULL,
    [Description] NVARCHAR (500) NULL,
    CONSTRAINT [PK_Genres] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [UQ_Genres_Name] UNIQUE NONCLUSTERED ([Name] ASC)
);

