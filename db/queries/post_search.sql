-- EXPLAIN (ANALYSE)
WITH user_posts AS (
  -- EXPLAIN (ANALYSE)
  SELECT
    u.id,
    p.title
  FROM
    main.user AS u
    JOIN main.post AS p
      ON u.id = p.user_id
      AND p.title ILIKE '%qky%'
)
SELECT
  u.name,
  u.id,
  p.title
FROM
  user_posts AS p
  JOIN main.user AS u
    ON u.id = p.id;
