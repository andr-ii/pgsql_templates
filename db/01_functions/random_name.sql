DROP FUNCTION IF EXISTS main.random_name;

CREATE OR REPLACE FUNCTION main.random_name()
RETURNS
  TEXT
AS
$$
BEGIN

  RETURN (
    WITH names AS (
      SELECT
        rand_name
      FROM
        UNNEST(ARRAY[
          'Mike', 'Abbey', 'Jim', 'Gregory', 'Carl',
          'Lisa', 'Brian', 'Mathew', 'John', 'Ray',
          'Eric', 'Robert', 'Teresa', 'Silvia', 'Megan',
          'Tom', 'Ryan', 'Clara', 'Simon', 'Jenifer',
          'Olivia', 'Emma', 'Hugh', 'James', 'Timothy',
          'Allie', 'Brenda', 'Morgan', 'Jack', 'Margaret'
        ]) AS rand_name
    )
    SELECT
      rand_name
    FROM
      names
    ORDER BY
      RANDOM()
    LIMIT 1
  );

END
$$
LANGUAGE plpgsql;
