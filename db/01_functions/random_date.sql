DROP FUNCTION IF EXISTS main.random_date;

CREATE OR REPLACE FUNCTION main.random_date (
  in_range INTERVAL DEFAULT '-10 days'
)
RETURNS
  TIMESTAMP WITHOUT TIME ZONE
AS
$$
BEGIN

  RETURN NOW() + (random() * in_range);

END
$$
LANGUAGE plpgsql;
