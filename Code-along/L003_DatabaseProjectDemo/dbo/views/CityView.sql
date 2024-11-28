CREATE VIEW [dbo].[CityView] AS
select 
	[ci].[Id], 
	[ci].[CityName] as 'City', 
	[ci].[CountryId], 
	[co].[CountryName] as 'Country' 
from 
	[dbo].[Cities] ci
	left join [dbo].[Countries] co on ci.CountryId = co.Id