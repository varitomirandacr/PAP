CREATE TABLE [dbo].[CartItems] (
    [Id]       INT           IDENTITY (1, 1) NOT NULL,
    [CartId]   INT           NOT NULL,
    [BookId]   INT           NOT NULL,
    [Quantity] INT           DEFAULT ((1)) NOT NULL,
    [AddedAt]  DATETIME2 (7) DEFAULT (sysutcdatetime()) NOT NULL,
    CONSTRAINT [PK_CartItems] PRIMARY KEY CLUSTERED ([Id] ASC),
    CHECK ([Quantity]>(0)),
    CONSTRAINT [FK_CartItems_Books] FOREIGN KEY ([BookId]) REFERENCES [dbo].[Books] ([Id]),
    CONSTRAINT [FK_CartItems_Carts] FOREIGN KEY ([CartId]) REFERENCES [dbo].[ShoppingCarts] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [UQ_CartItems_Cart_Book] UNIQUE NONCLUSTERED ([CartId] ASC, [BookId] ASC)
);

