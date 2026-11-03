CREATE TABLE [dbo].[Employees] (
    [Id]           INT            IDENTITY (1, 1) NOT NULL,
    [RoleId]       INT            NOT NULL,
    [FirstName]    NVARCHAR (100) NOT NULL,
    [LastName]     NVARCHAR (100) NOT NULL,
    [Email]        NVARCHAR (150) NOT NULL,
    [PasswordHash] NVARCHAR (255) NOT NULL,
    [IsActive]     BIT            DEFAULT ((1)) NOT NULL,
    [CreatedAt]    DATETIME2 (7)  DEFAULT (sysutcdatetime()) NOT NULL,
    CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_Employees_Roles] FOREIGN KEY ([RoleId]) REFERENCES [dbo].[Roles] ([Id]),
    CONSTRAINT [UQ_Employees_Email] UNIQUE NONCLUSTERED ([Email] ASC)
);

