-- EXPLAIN (ANALYSE)
WITH user_posts AS (
  -- EXPLAIN (ANALYSE)
  SELECT
    p.user_id,
    p.title
  FROM
    main.post AS p
  WHERE
    p.title ILIKE '%yps%'
)
SELECT
  u.name,
  u.id,
  array_agg(p.title)
FROM
  user_posts AS p
  JOIN main.user AS u
    ON u.id = p.user_id
GROUP BY
  u.id;
