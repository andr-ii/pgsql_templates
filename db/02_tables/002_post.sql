CREATE TABLE
  IF NOT EXISTS main.post (
    id UUID DEFAULT uuid_generate_v4 () PRIMARY KEY,
    user_id UUID REFERENCES main.user (id),
    title VARCHAR(120) NOT NULL
  );

CREATE INDEX IF NOT EXISTS post_id_user_id_inx ON main.post (user_id);

CREATE INDEX IF NOT EXISTS post_title_inx ON main.post USING gin (title gin_trgm_ops);

INSERT INTO
  main.post (user_id, title)
SELECT
  u.id,
  main.random_chars (6) || ' ' || main.random_chars () || ' ' || main.random_chars (14)
FROM
  main.user AS u,
  generate_series (1, 2);
