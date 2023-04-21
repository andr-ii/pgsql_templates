DROP FUNCTION IF EXISTS main.random_chars;

CREATE OR REPLACE FUNCTION main.random_chars(len INT DEFAULT 10)
RETURNS
  TEXT
AS
$$
BEGIN

  RETURN array_to_string(ARRAY(
    SELECT
      chr((65 + round(random() * 25))::INT) || chr((97 + round(random() * 25))::INT)
    FROM
      generate_series(1, len)
  ), '');

END
$$
LANGUAGE plpgsql;
