CREATE TABLE
  IF NOT EXISTS main.user (
    id UUID DEFAULT uuid_generate_v4 () PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    last_name VARCHAR(70) NOT NULL,
    updated_at TIMESTAMP WITHOUT TIME ZONE NOT NULL
  );

CREATE INDEX IF NOT EXISTS user_name_inx ON main.user USING gin (name gin_trgm_ops);

CREATE INDEX IF NOT EXISTS user_last_name_inx ON main.user USING gin (last_name gin_trgm_ops);

INSERT INTO
  main.user (name, last_name, updated_at)
SELECT
  main.random_name(),
  main.random_chars((5 + RANDOM() * 15)::INT),
  main.random_date()
FROM
  generate_series (1, 10000);
