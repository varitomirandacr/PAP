CREATE TABLE [dbo].[Authors] (
    [Id]        INT            IDENTITY (1, 1) NOT NULL,
    [FirstName] NVARCHAR (100) NOT NULL,
    [LastName]  NVARCHAR (100) NOT NULL,
    [Biography] NVARCHAR (MAX) NULL,
    [BirthDate] DATE           NULL,
    [Country]   NVARCHAR (100) NULL,
    [CreatedAt] DATETIME2 (7)  DEFAULT (sysutcdatetime()) NOT NULL,
    CONSTRAINT [PK_Authors] PRIMARY KEY CLUSTERED ([Id] ASC)
);

