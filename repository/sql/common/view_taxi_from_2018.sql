{{ config(alias='view_taxi_from_2018', materialized='materialized_view') }}

SELECT
    *
FROM {{ ref('table_taxi_from_2018') }}
