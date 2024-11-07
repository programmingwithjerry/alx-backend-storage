-- Select bands with Glam rock as the main style, calculating lifespan and ordering by longevity

SELECT 
    band_name, 
    (IFNULL(split, 2023) - formed) AS lifespan
FROM 
    metal_bands
WHERE 
    FIND_IN_SET('Glam rock', IFNULL(style, '')) > 0
ORDER BY 
    lifespan DESC;
