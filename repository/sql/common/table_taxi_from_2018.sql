{{ config(alias='table_taxi_from_2018', materialized='table') }}



SELECT
    taxi_id,
    trip_start_timestamp,
    tips
FROM `bigquery-public-data.chicago_taxi_trips.taxi_trips`
WHERE trip_start_timestamp BETWEEN TIMESTAMP("2018-04-01", "UTC") AND CURRENT_TIMESTAMP()


