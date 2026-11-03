CREATE TABLE [dbo].[Orders] (
    [Id]                INT             IDENTITY (1, 1) NOT NULL,
    [CustomerId]        INT             NOT NULL,
    [ShippingAddressId] INT             NULL,
    [OrderDate]         DATETIME2 (7)   DEFAULT (sysutcdatetime()) NOT NULL,
    [Status]            NVARCHAR (30)   DEFAULT ('Pending') NOT NULL,
    [Subtotal]          DECIMAL (18, 2) NOT NULL,
    [TaxAmount]         DECIMAL (18, 2) DEFAULT ((0)) NOT NULL,
    [ShippingCost]      DECIMAL (18, 2) DEFAULT ((0)) NOT NULL,
    [Total]             DECIMAL (18, 2) NOT NULL,
    [Notes]             NVARCHAR (500)  NULL,
    [UpdatedAt]         DATETIME2 (7)   DEFAULT (sysutcdatetime()) NOT NULL,
    CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_Orders_Addresses] FOREIGN KEY ([ShippingAddressId]) REFERENCES [dbo].[Addresses] ([Id]),
    CONSTRAINT [FK_Orders_Customers] FOREIGN KEY ([CustomerId]) REFERENCES [dbo].[Customers] ([Id])
);

