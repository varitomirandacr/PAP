CREATE TABLE [dbo].[Inventory] (
    [Id]              INT           IDENTITY (1, 1) NOT NULL,
    [BookId]          INT           NOT NULL,
    [QuantityInStock] INT           DEFAULT ((0)) NOT NULL,
    [ReorderLevel]    INT           DEFAULT ((5)) NOT NULL,
    [LastRestockedAt] DATETIME2 (7) NULL,
    CONSTRAINT [PK_Inventory] PRIMARY KEY CLUSTERED ([Id] ASC),
    CHECK ([QuantityInStock]>=(0)),
    CONSTRAINT [FK_Inventory_Books] FOREIGN KEY ([BookId]) REFERENCES [dbo].[Books] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [UQ_Inventory_Book] UNIQUE NONCLUSTERED ([BookId] ASC)
);

