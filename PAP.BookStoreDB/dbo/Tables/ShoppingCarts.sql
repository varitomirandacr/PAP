CREATE TABLE [dbo].[ShoppingCarts] (
    [Id]         INT           IDENTITY (1, 1) NOT NULL,
    [CustomerId] INT           NOT NULL,
    [CreatedAt]  DATETIME2 (7) DEFAULT (sysutcdatetime()) NOT NULL,
    [UpdatedAt]  DATETIME2 (7) DEFAULT (sysutcdatetime()) NOT NULL,
    CONSTRAINT [PK_ShoppingCarts] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_ShoppingCarts_Customers] FOREIGN KEY ([CustomerId]) REFERENCES [dbo].[Customers] ([Id]) ON DELETE CASCADE
);

