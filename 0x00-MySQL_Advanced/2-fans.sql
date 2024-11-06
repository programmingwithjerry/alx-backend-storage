-- Script to rank the country origins of bands by the total number of fans

SELECT 
    origin, 
    SUM(fans) AS nb_fans
FROM 
    metal_bands
GROUP BY 
    origin
ORDER BY 
    nb_fans DESC;
