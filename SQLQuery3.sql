drop table sba_naics_sector_codes_description 
select *
into sba_naics_sector_codes_description 
from(

	SELECT 
		  [NAICS_Industry_Description],
		  iif([NAICS_Industry_Description] like '%–%', substring([NAICS_Industry_Description], 8, 2 ), '') LookupCodes,
		  iif([NAICS_Industry_Description] like '%–%', ltrim(Trim('%–%' FROM substring([NAICS_Industry_Description], CHARINDEX('–', [NAICS_Industry_Description]) + 1, LEN([NAICS_Industry_Description]) ))), '') Sector
	  FROM [usba].[dbo].[sba_industry_standards]
	  where [NAICS_Codes] = ''
) main
where 
	LookupCodes != ''
	