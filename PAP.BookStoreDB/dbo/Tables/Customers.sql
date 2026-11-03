CREATE TABLE [dbo].[Customers] (
    [Id]           INT            IDENTITY (1, 1) NOT NULL,
    [FirstName]    NVARCHAR (100) NOT NULL,
    [LastName]     NVARCHAR (100) NOT NULL,
    [Email]        NVARCHAR (150) NOT NULL,
    [PasswordHash] NVARCHAR (255) NOT NULL,
    [Phone]        NVARCHAR (30)  NULL,
    [BirthDate]    DATE           NULL,
    [IsActive]     BIT            DEFAULT ((1)) NOT NULL,
    [CreatedAt]    DATETIME2 (7)  DEFAULT (sysutcdatetime()) NOT NULL,
    [UpdatedAt]    DATETIME2 (7)  DEFAULT (sysutcdatetime()) NOT NULL,
    CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [UQ_Customers_Email] UNIQUE NONCLUSTERED ([Email] ASC)
);

