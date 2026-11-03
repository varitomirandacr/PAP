CREATE TABLE [dbo].[Payments] (
    [Id]             INT             IDENTITY (1, 1) NOT NULL,
    [OrderId]        INT             NOT NULL,
    [PaymentMethod]  NVARCHAR (30)   NOT NULL,
    [Amount]         DECIMAL (18, 2) NOT NULL,
    [PaymentDate]    DATETIME2 (7)   DEFAULT (sysutcdatetime()) NOT NULL,
    [Status]         NVARCHAR (30)   DEFAULT ('Completed') NOT NULL,
    [TransactionRef] NVARCHAR (100)  NULL,
    CONSTRAINT [PK_Payments] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_Payments_Orders] FOREIGN KEY ([OrderId]) REFERENCES [dbo].[Orders] ([Id]) ON DELETE CASCADE
);

