WITH dates AS (

    SELECT DISTINCT
        DATE(created_date) AS full_date
    FROM {{ ref('stg_311nyc_service_requests') }}

    UNION DISTINCT

    SELECT DISTINCT
        DATE(license_issued_date) AS full_date
    FROM {{ ref('stg_nyc_dog_licensing') }}

)

SELECT
    {{ dbt_utils.generate_surrogate_key([
        'full_date'
    ]) }} AS date_key,

    full_date,
    EXTRACT(YEAR FROM full_date) AS year,
    EXTRACT(MONTH FROM full_date) AS month,
    EXTRACT(DAY FROM full_date) AS day

FROM dates
WHERE full_date IS NOT NULL