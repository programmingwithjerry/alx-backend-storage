-- Script to list all bands with Glam rock as their main style, ranked by their longevity

SELECT 
    band_name, 
    COALESCE(
        (2022 - formed),         -- If the band is still active (split is NULL)
        (split - formed)         -- If the band has split up
    ) AS lifespan
FROM 
    metal_bands
WHERE 
    main_style = 'Glam rock'
ORDER BY 
    lifespan DESC;
