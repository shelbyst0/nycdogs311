WITH locations AS (

    SELECT DISTINCT
        borough,
        city,
        incident_zip
    FROM {{ ref('stg_311nyc_service_requests') }}
    WHERE borough IS NOT NULL

)

SELECT
    {{ dbt_utils.generate_surrogate_key([
        'borough',
        'city',
        'incident_zip'
    ]) }} AS location_key,

    borough,
    city,
    incident_zip

FROM locations