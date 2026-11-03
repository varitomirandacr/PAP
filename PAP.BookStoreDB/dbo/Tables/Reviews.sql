CREATE TABLE [dbo].[Reviews] (
    [Id]         INT             IDENTITY (1, 1) NOT NULL,
    [BookId]     INT             NOT NULL,
    [CustomerId] INT             NOT NULL,
    [Rating]     TINYINT         NOT NULL,
    [Comment]    NVARCHAR (1000) NULL,
    [CreatedAt]  DATETIME2 (7)   DEFAULT (sysutcdatetime()) NOT NULL,
    CONSTRAINT [PK_Reviews] PRIMARY KEY CLUSTERED ([Id] ASC),
    CHECK ([Rating]>=(1) AND [Rating]<=(5)),
    CONSTRAINT [FK_Reviews_Books] FOREIGN KEY ([BookId]) REFERENCES [dbo].[Books] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_Reviews_Customers] FOREIGN KEY ([CustomerId]) REFERENCES [dbo].[Customers] ([Id]),
    CONSTRAINT [UQ_Reviews_Book_Customer] UNIQUE NONCLUSTERED ([BookId] ASC, [CustomerId] ASC)
);

