CREATE TABLE [dbo].[Addresses] (
    [Id]          INT            IDENTITY (1, 1) NOT NULL,
    [CustomerId]  INT            NOT NULL,
    [AddressType] NVARCHAR (20)  DEFAULT ('Shipping') NOT NULL,
    [Street]      NVARCHAR (200) NOT NULL,
    [City]        NVARCHAR (100) NOT NULL,
    [State]       NVARCHAR (100) NULL,
    [PostalCode]  NVARCHAR (20)  NOT NULL,
    [Country]     NVARCHAR (100) NOT NULL,
    [IsDefault]   BIT            DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_Addresses] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_Addresses_Customers] FOREIGN KEY ([CustomerId]) REFERENCES [dbo].[Customers] ([Id]) ON DELETE CASCADE
);

