CREATE TABLE [dbo].[Suppliers] (
    [Id]          INT            IDENTITY (1, 1) NOT NULL,
    [Name]        NVARCHAR (200) NOT NULL,
    [ContactName] NVARCHAR (150) NULL,
    [Email]       NVARCHAR (150) NULL,
    [Phone]       NVARCHAR (30)  NULL,
    [Address]     NVARCHAR (300) NULL,
    [IsActive]    BIT            DEFAULT ((1)) NOT NULL,
    CONSTRAINT [PK_Suppliers] PRIMARY KEY CLUSTERED ([Id] ASC)
);

