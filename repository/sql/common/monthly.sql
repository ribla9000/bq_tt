{{config(alias='monthly')}}


WITH top_3 AS (
  SELECT
      taxi_id,
      SUM(tips) AS total_tips
  FROM {{ ref('view_taxi_from_2018') }}
  WHERE EXTRACT(YEAR FROM trip_start_timestamp) = 2018 AND EXTRACT(MONTH FROM trip_start_timestamp) = 4
  GROUP BY taxi_id
  ORDER BY total_tips DESC
  LIMIT 3
)


SELECT
    tt.taxi_id,
    SUM(tt.tips) AS total_tips,
    EXTRACT(YEAR FROM tt.trip_start_timestamp) AS year,
    EXTRACT(MONTH FROM tt.trip_start_timestamp) AS month,
FROM {{ ref('view_taxi_from_2018') }} AS tt
WHERE tt.taxi_id IN (SELECT taxi_id FROM top_3)
GROUP BY tt.taxi_id, year, month
ORDER BY month ASC
