CREATE TABLE [dbo].[Cities] (
    [Id]        INT           NOT NULL,
    [CityName]  NVARCHAR (50) NULL,
    [CountryId] INT           NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_Cities_Countries] FOREIGN KEY ([CountryId]) REFERENCES [dbo].[Countries] ([Id])
);

