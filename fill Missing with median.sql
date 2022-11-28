
select country,date, daily_vaccinations  from(select country,date,daily_vaccinations, row_number() over(partition by country order by daily_vaccinations) as      
         MEDIAN,count(*) over(partition by country) as cnt
  from country_vaccination_stats) x where MEDIAN in (FLOOR(cnt/2), cnt/2 + 1);
  UPDATE [country_vaccination_stats]
  SET [daily_vaccinations]=0
  WHERE [daily_vaccinations] IS NULL;


 

