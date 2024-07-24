{{ config(alias='tips_change_month_by_month', materialized='incremental') }}

WITH change_data AS (
    SELECT
        m.taxi_id,
        FORMAT('%d-%02d', m.year, m.month) AS year_month,
        m.total_tips as tips_sum,
        MAX(m.year) OVER (PARTITION BY m.taxi_id) AS last_year,
        MAX(m.month) OVER (PARTITION BY m.taxi_id) AS last_month,
        CASE
            WHEN LAG(m.total_tips, 1) OVER (PARTITION BY m.taxi_id ORDER BY m.year, m.month) = 0
                THEN NULL
            ELSE
                ROUND((m.total_tips - LAG(m.total_tips, 1) OVER (PARTITION BY m.taxi_id ORDER BY m.year, m.month)) / LAG(m.total_tips, 1) OVER (PARTITION BY m.taxi_id ORDER BY m.year, m.month) * 100, 5)
            END AS tips_change,
    FROM {{ ref('monthly') }} m
),

{% set source_relation = adapter.get_relation(database=this.database, schema=this.schema, identifier=this.name) %}
{% set table_exists=source_relation is not none %}

{% if table_exists%}

    new_rows AS (
        SELECT * FROM change_data
        WHERE NOT EXISTS (
            SELECT 1 FROM {{ this }} t
            WHERE t.taxi_id = change_data.taxi_id
                AND t.year_month = change_data.year_month
    )
)

    SELECT nr.taxi_id, nr.year_month, nr.tips_sum, nr.tips_change FROM new_rows nr
    ORDER BY nr.taxi_id, nr.year_month

{% else %}

    new_table AS (SELECT * FROM change_data)
    SELECT nt.taxi_id, nt.year_month, nt.tips_sum, nt.tips_change FROM new_table nt
    ORDER BY nt.taxi_id, nt.year_month

{% endif %}
