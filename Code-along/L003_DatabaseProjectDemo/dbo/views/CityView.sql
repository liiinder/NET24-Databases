CREATE VIEW [dbo].[CityView] AS
select 
	[ci].[Id], 
	[ci].[Name] as 'City', 
	[ci].[CountryId], 
	[co].[Name] as 'Country' 
from 
	[dbo].[Cities] ci
	left join [dbo].[Countries] co on ci.CountryId = co.Id

