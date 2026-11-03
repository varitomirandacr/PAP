CREATE TABLE [dbo].[PurchaseOrders] (
    [Id]           INT             IDENTITY (1, 1) NOT NULL,
    [SupplierId]   INT             NOT NULL,
    [OrderDate]    DATETIME2 (7)   DEFAULT (sysutcdatetime()) NOT NULL,
    [ExpectedDate] DATE            NULL,
    [Status]       NVARCHAR (30)   DEFAULT ('Pending') NOT NULL,
    [TotalCost]    DECIMAL (18, 2) DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_PurchaseOrders] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_PurchaseOrders_Suppliers] FOREIGN KEY ([SupplierId]) REFERENCES [dbo].[Suppliers] ([Id])
);

