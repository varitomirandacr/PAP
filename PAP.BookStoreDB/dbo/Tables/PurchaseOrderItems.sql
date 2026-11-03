CREATE TABLE [dbo].[PurchaseOrderItems] (
    [Id]              INT             IDENTITY (1, 1) NOT NULL,
    [PurchaseOrderId] INT             NOT NULL,
    [BookId]          INT             NOT NULL,
    [Quantity]        INT             NOT NULL,
    [UnitCost]        DECIMAL (18, 2) NOT NULL,
    CONSTRAINT [PK_PurchaseOrderItems] PRIMARY KEY CLUSTERED ([Id] ASC),
    CHECK ([Quantity]>(0)),
    CONSTRAINT [FK_POItems_Books] FOREIGN KEY ([BookId]) REFERENCES [dbo].[Books] ([Id]),
    CONSTRAINT [FK_POItems_PurchaseOrders] FOREIGN KEY ([PurchaseOrderId]) REFERENCES [dbo].[PurchaseOrders] ([Id]) ON DELETE CASCADE
);

