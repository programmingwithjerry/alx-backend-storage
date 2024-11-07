-- Select bands with Glam rock as the main style, calculating lifespan and ordering by longevity
SELECT 
    band_name, 
    (IFNULL(split, 2022) - formed) AS lifespan
FROM 
    metal_bands
WHERE 
    style = 'Glam rock'
ORDER BY 
    lifespan DESC;
