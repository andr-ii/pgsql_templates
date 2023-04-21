-- EXPLAIN (ANALYSE)
SELECT
  u.id,
  u.name,
  to_jsonb (array_agg (p.title))
FROM
  main.user AS u
  JOIN main.post AS p ON p.user_id = u.id
  AND u.name ILIKE '%tim%'
GROUP BY
  u.id;
