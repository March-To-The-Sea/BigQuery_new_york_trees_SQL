 WITH incident AS  
  ((SELECT DISTINCT zip_original AS zip_city, Count(zip_original) AS occurence_value
  FROM bigquery-public-data.new_york_trees.tree_census_1995
  GROUP BY zip_original
  ORDER BY occurence_value DESC)

  UNION DISTINCT
  
  (SELECT DISTINCT zip_city, Count(zip_city) AS occurence_value
  FROM bigquery-public-data.new_york_trees.tree_census_2005
  GROUP BY zip_city
  ORDER BY occurence_value DESC)

  UNION DISTINCT

  (SELECT DISTINCT zip_city, Count(zip_city) AS occurence_value
  FROM bigquery-public-data.new_york_trees.tree_census_2015
  GROUP BY zip_city
  ORDER BY occurence_value DESC))

SELECT *
FROM incident
ORDER BY occurence_value DESC