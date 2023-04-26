-- EXPLAIN (ANALYSE)
SELECT
  id,
  name
FROM
  main.user
WHERE
  name ILIKE '%tim%';
