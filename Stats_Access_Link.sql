
DECLARE @WebAddress varchar(300) = '<url>https://xcd32112.smart_meter.com</url>'
SELECT 
    /* Get just the host name from a URL */
    SUBSTRING(@WebAddress,
        /* Starting Position (After any '//') */
        (CASE WHEN CHARINDEX('//', @WebAddress)= 0 THEN 1 ELSE CHARINDEX('//', @WebAddress) + 2 END),
        /* Length (ending on first '/' or on a '?') */
        CASE
            WHEN CHARINDEX('<', @WebAddress, CHARINDEX('//', @WebAddress) + 2) > 0 THEN CHARINDEX('<', @WebAddress, CHARINDEX('//', @WebAddress) + 2) - (CASE WHEN CHARINDEX('//', @WebAddress)= 0 THEN 1 ELSE CHARINDEX('//', @WebAddress) + 2 END)
            WHEN CHARINDEX('<', @WebAddress, CHARINDEX('//', @WebAddress) + 2) > 0 THEN CHARINDEX('<', @WebAddress, CHARINDEX('//', @WebAddress) + 2) - (CASE WHEN CHARINDEX('//', @WebAddress)= 0 THEN 1 ELSE CHARINDEX('//', @WebAddress) + 2 END)
            ELSE LEN(@WebAddress)
        END
    ) AS  'Stats_Access_Link'