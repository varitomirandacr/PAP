CREATE TABLE [dbo].[Books] (
    [Id]              INT             IDENTITY (17, 1) NOT NULL,
    [Name]            NVARCHAR (200)  NOT NULL,
    [Title]           NVARCHAR (200)  NOT NULL,
    [Category]        NVARCHAR (100)  NULL,
    [Publisher]       NVARCHAR (200)  NULL,
    [Author]          NVARCHAR (200)  NULL,
    [Description]     NVARCHAR (MAX)  NULL,
    [PublicationDate] DATE            NULL,
    [Height]          DECIMAL (10, 2) NULL,
    [Width]           DECIMAL (10, 2) NULL,
    [Price]           DECIMAL (18, 2) NOT NULL,
    [IsBestSeller]    BIT             CONSTRAINT [DF__Books__IsBestSel__24927208] DEFAULT ((0)) NOT NULL,
    [Genre]           NVARCHAR (100)  NULL,
    [IsInStock]       BIT             CONSTRAINT [DF__Books__IsInStock__25869641] DEFAULT ((1)) NOT NULL,
    [CreatedAt]       DATETIME2 (7)   NOT NULL,
    [UpdatedAt]       DATETIME2 (7)   NOT NULL,
    [PublisherId]     INT             NULL,
    [CategoryId]      INT             NULL,
    [GenreId]         INT             NULL,
    [ISBN]            NVARCHAR (20)   NULL,
    [Pages]           INT             NULL,
    [Language]        NVARCHAR (50)   NULL,
    [CoverImageUrl]   NVARCHAR (500)  NULL,
    CONSTRAINT [PK_Books] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_Books_Categories] FOREIGN KEY ([CategoryId]) REFERENCES [dbo].[Categories] ([Id]),
    CONSTRAINT [FK_Books_Genres] FOREIGN KEY ([GenreId]) REFERENCES [dbo].[Genres] ([Id]),
    CONSTRAINT [FK_Books_Publishers] FOREIGN KEY ([PublisherId]) REFERENCES [dbo].[Publishers] ([Id])
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [UX_Books_ISBN]
    ON [dbo].[Books]([ISBN] ASC) WHERE ([ISBN] IS NOT NULL);

